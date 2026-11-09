import ast
import io
import tokenize
from collections import Counter

from database import get_db_connection


# 從資料庫讀取 Python 語法與辨識規則
def get_detection_rules():
    connection = get_db_connection()

    try:
        cursor = connection.cursor(dictionary=True)

        try:
            cursor.execute(
                """
                SELECT
                    s.id AS syntax_id,
                    s.slug,
                    s.name,
                    s.display_label,
                    COALESCE(s.summary, '') AS summary,
                    COALESCE(s.example_code, '') AS example_code,
                    r.analyzer,
                    r.rule_type,
                    r.match_value
                FROM syntax_detection_rules AS r
                JOIN syntaxes AS s
                    ON r.syntax_id = s.id
                JOIN syntax_categories AS c
                    ON s.category_id = c.id
                WHERE c.language = %s
                  AND s.is_active = TRUE
                  AND r.is_active = TRUE
                ORDER BY s.id, r.id
                """,
                ("python",),
            )

            return cursor.fetchall()

        finally:
            cursor.close()

    finally:
        connection.close()


# 依照舊專案定義，區分索引、運算子、常值與解包
def count_subscript_kinds(tree):
    counts = Counter()

    for node in ast.walk(tree):
        if not isinstance(node, ast.Subscript):
            continue

        # 多維索引，例如 data[0, 1:3]
        parts = (
            node.slice.elts
            if isinstance(node.slice, ast.Tuple)
            else [node.slice]
        )

        has_slice = any(
            isinstance(part, ast.Slice)
            for part in parts
        )

        kind = "slice" if has_slice else "index"
        counts[kind] += 1

    return counts


def count_binary_operators(tree):
    return Counter(
        type(node.op).__name__
        for node in ast.walk(tree)
        if isinstance(node, ast.BinOp)
    )


def count_boolean_operators(tree):
    counts = Counter()

    for node in ast.walk(tree):
        if isinstance(node, ast.BoolOp):
            operator = type(node.op).__name__

            # 三個運算對象之間，有兩個運算子
            counts[operator] += len(node.values) - 1

    return counts


def count_literal_types(tree):
    counts = Counter()

    type_names = {
        int: "int",
        float: "float",
        str: "str",
        bytes: "bytes",
        complex: "imaginary",
        bool: "bool",
        type(None): "none",
        type(Ellipsis): "ellipsis",
    }

    # 格式規格也可能使用 JoinedStr，但不是另一個 f-string。
    # 例如 f"{price:.2f}" 裡面的 .2f。
    format_specs = {
        id(node.format_spec)
        for node in ast.walk(tree)
        if isinstance(node, ast.FormattedValue)
        and node.format_spec is not None
    }

    # f-string 裡的純文字片段，不另計為普通字串
    string_parts = {
        id(part)
        for node in ast.walk(tree)
        if isinstance(node, ast.JoinedStr)
        for part in node.values
        if isinstance(part, ast.Constant)
    }

    for node in ast.walk(tree):
        if isinstance(node, ast.JoinedStr):
            if id(node) not in format_specs:
                counts["fstring"] += 1
            continue

        if not isinstance(node, ast.Constant):
            continue

        if id(node) in string_parts:
            continue

        # 精確比對型別，避免 True／False 被算成整數
        kind = type_names.get(type(node.value))

        if kind is not None:
            counts[kind] += 1

    return counts


def count_unpacking(tree):
    counts = Counter()

    for node in ast.walk(tree):
        # *items：只計算展開內容，不計算賦值左側的星號目標
        if isinstance(node, ast.Starred):
            if isinstance(node.ctx, ast.Load):
                counts["iterable"] += 1

        # {**mapping}：解包項目在 AST 中沒有一般的 key 節點
        elif isinstance(node, ast.Dict):
            counts["mapping"] += sum(
                key is None
                for key in node.keys
            )

        # func(**mapping)：解包的關鍵字引數沒有個別 arg 名稱
        elif isinstance(node, ast.Call):
            counts["mapping"] += sum(
                keyword.arg is None
                for keyword in node.keywords
            )

    return counts


def count_augmented_operators(tree):
    # += 等依 AugAssign 辨識，與一般指派及二元運算分開。
    return Counter(
        type(node.op).__name__
        for node in ast.walk(tree)
        if isinstance(node, ast.AugAssign)
    )


# 依資料庫規則分析 Python 程式碼
def analyze_python(code: str):
    # 語法錯誤會交給 main.py 處理
    tree = ast.parse(code)

    # 統計 AST 節點
    node_counts = Counter(
        type(node).__name__
        for node in ast.walk(tree)
    )

    # 排除 [a, b] = values 等賦值目標，只統計讀取情境的容器節點
    load_node_counts = Counter(
        type(node).__name__
        for node in ast.walk(tree)
        if isinstance(getattr(node, "ctx", None), ast.Load)
    )

    subscript_counts = count_subscript_kinds(tree)
    binary_counts = count_binary_operators(tree)
    boolean_counts = count_boolean_operators(tree)
    literal_counts = count_literal_types(tree)
    unpacking_counts = count_unpacking(tree)
    augmented_counts = count_augmented_operators(tree)

    # 統計關鍵字，排除字串與註解
    tokens = tokenize.generate_tokens(io.StringIO(code).readline)

    keyword_counts = Counter(
        token.string
        for token in tokens
        if token.type == tokenize.NAME
    )

    rules = get_detection_rules()
    syntax_counts = Counter()
    syntax_details = {}

    for rule in rules:
        if (
            rule["analyzer"] == "python_ast"
            and rule["rule_type"] == "node_type"
        ):
            count = node_counts[rule["match_value"]]

        elif (
            rule["analyzer"] == "python_tokenize"
            and rule["rule_type"] == "keyword"
        ):
            count = keyword_counts[rule["match_value"]]

        elif (
            rule["analyzer"] == "python_ast"
            and rule["rule_type"] == "node_type_load"
        ):
            count = load_node_counts[rule["match_value"]]

        elif (
            rule["analyzer"] == "python_ast"
            and rule["rule_type"] == "subscript_kind"
        ):
            count = subscript_counts[rule["match_value"]]

        elif (
            rule["analyzer"] == "python_ast"
            and rule["rule_type"] == "binary_operator"
        ):
            count = binary_counts[rule["match_value"]]

        elif (
            rule["analyzer"] == "python_ast"
            and rule["rule_type"] == "boolean_operator"
        ):
            count = boolean_counts[rule["match_value"]]

        elif (
            rule["analyzer"] == "python_ast"
            and rule["rule_type"] == "constant_type"
        ):
            count = literal_counts[rule["match_value"]]

        elif (
            rule["analyzer"] == "python_ast"
            and rule["rule_type"] == "unpacking"
        ):
            count = unpacking_counts[rule["match_value"]]

        elif (
            rule["analyzer"] == "python_ast"
            and rule["rule_type"] == "augmented_operator"
        ):
            count = augmented_counts[rule["match_value"]]

        else:
            # 略過未支援的規則
            continue

        if count == 0:
            continue

        syntax_id = rule["syntax_id"]
        syntax_counts[syntax_id] += count
        syntax_details[syntax_id] = rule

    return [
        {
            "syntax_id": syntax_id,
            "slug": syntax_details[syntax_id]["slug"],
            "name": syntax_details[syntax_id]["name"],
            "display_label": syntax_details[syntax_id]["display_label"],
            "count": count,
            "summary": syntax_details[syntax_id]["summary"],
            "example_code": syntax_details[syntax_id]["example_code"],
        }
        for syntax_id, count in sorted(syntax_counts.items())
    ]
