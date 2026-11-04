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


# 依資料庫規則分析 Python 程式碼
def analyze_python(code: str):
    # 語法錯誤會交給 main.py 處理
    tree = ast.parse(code)

    # 統計 AST 節點
    node_counts = Counter(
        type(node).__name__
        for node in ast.walk(tree)
    )

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

        else:
            # 本版尚未支援的規則先略過
            continue

        if count == 0:
            continue

        syntax_id = rule["syntax_id"]
        syntax_counts[syntax_id] += count
        syntax_details[syntax_id] = rule

    return [
        {
            "slug": syntax_details[syntax_id]["slug"],
            "name": syntax_details[syntax_id]["name"],
            "count": count,
            "summary": syntax_details[syntax_id]["summary"],
            "example_code": syntax_details[syntax_id]["example_code"],
        }
        for syntax_id, count in sorted(syntax_counts.items())
    ]