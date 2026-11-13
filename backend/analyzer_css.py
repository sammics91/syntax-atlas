"""以 Nu 驗證 CSS，再以 tinycss2 解析、計次並對應資料庫規則。

只計原始碼實際出現的語法，不展開簡寫、不扣除被覆蓋的宣告。
選擇器逐個組成計次，包含選擇器函式內的內容；不計條件查詢的測試語法。
count_* 與 get_css_declarations 供本機檢查計次使用，不代表已通過屬性值驗證。
網站及儲存流程應呼叫 analyze_css，確保先通過 Nu 驗證。
"""

import os
import re
from collections import Counter
from xml.sax.saxutils import escape

import requests
import tinycss2


MAX_DEPTH = 128
URL_START = re.compile(r"url\(", re.I)
GROUP_RULES = {
    "media", "supports", "container", "layer", "scope", "starting-style",
    "document", "-moz-document",
}
DESCRIPTOR_RULES = {
    "font-face", "property", "counter-style", "font-feature-values",
    "font-palette-values", "color-profile",
}
SELECTOR_FUNCTIONS = {"is", "where", "not", "has", "host", "host-context"}
SELECTOR_PSEUDO_ELEMENTS = {"slotted", "cue", "cue-region"}
LEGACY_PSEUDO_ELEMENTS = {"before", "after", "first-line", "first-letter"}
PAGE_MARGIN_RULES = {
    f"{side}-{part}"
    for side in ("top", "bottom")
    for part in ("left-corner", "left", "center", "right", "right-corner")
} | {
    f"{side}-{part}"
    for side in ("left", "right")
    for part in ("top", "middle", "bottom")
}


class CSSValidationError(SyntaxError):
    """CSS 不符合驗證規則，保留原始碼位置供 API 顯示。"""

    def __init__(self, errors):
        self.errors = errors
        first = errors[0]
        super().__init__(first["message"])
        self.lineno = first.get("line")
        self.offset = first.get("column")


class CSSValidationServiceError(RuntimeError):
    """驗證服務失敗，不代表使用者的 CSS 寫錯。"""


class CSSValidationUnsupportedError(CSSValidationServiceError):
    """驗證器版本尚未支援該語法，不能冒稱完整驗證通過。"""


def _fail(message, token=None, *, line=None, column=None):
    raise CSSValidationError([{
        "message": message,
        "line": getattr(token, "source_line", line),
        "column": getattr(token, "source_column", column),
    }])


def _check_delimiters(code):
    """拒絕自動補上結束符號的錯誤，略過字串、註解及網址中的符號。"""
    stack = []
    pairs = {"}": "{", "]": "[", ")": "("}
    index = 0

    def error(message, position):
        line = code.count("\n", 0, position) + 1
        column = position - code.rfind("\n", 0, position)
        _fail(message, line=line, column=column)

    while index < len(code):
        char = code[index]
        if code.startswith("/*", index):
            end = code.find("*/", index + 2)
            if end == -1:
                error("CSS 註解缺少結束符號 */。", index)
            index = end + 2
            continue
        if char in {"'", '"'}:
            start, quote = index, char
            index += 1
            while index < len(code) and code[index] != quote:
                if code[index] in "\r\n\f":
                    error("CSS 字串不能直接換行。", index)
                if code[index] == "\\":
                    index += 1
                    if code[index:index + 2] == "\r\n":
                        index += 1
                index += 1
            if index >= len(code):
                error("CSS 字串缺少結束引號。", start)
            index += 1
            continue
        if char == "\\":
            index += 2
            continue
        # 未加引號的 url() 中，方括號可以是網址的一部分。
        url = URL_START.match(code, index) if char in "uU" else None
        if url and (index == 0 or not re.match(r"[\w-]", code[index - 1])):
            start = index
            content = url.end()
            first = content
            while first < len(code) and code[first].isspace():
                first += 1
            if code[first:first + 1] not in {"'", '"'}:
                index = content
                while index < len(code) and code[index] != ")":
                    index += 2 if code[index] == "\\" else 1
                if index >= len(code):
                    error("CSS 網址缺少結束括號。", start)
                index += 1
                continue
        if char in "{[(":
            stack.append((char, index))
            if len(stack) > MAX_DEPTH:
                error("CSS 巢狀層數過多。", index)
        elif char in pairs:
            if not stack or stack[-1][0] != pairs[char]:
                error(f"CSS 出現不成對的 {char}。", index)
            stack.pop()
        index += 1
    if stack:
        char, position = stack[-1]
        error(f"CSS 的 {char} 缺少對應結束符號。", position)


def _check_tokens(tokens, depth=0):
    if depth > MAX_DEPTH:
        _fail("CSS 巢狀層數過多。")
    for token in tokens:
        if token.type == "error":
            _fail(token.message, token)
        children = getattr(token, "content", None)
        if children is None:
            children = getattr(token, "arguments", None)
        if children is not None:
            _check_tokens(children, depth + 1)


def _parse(code, mode):
    if not isinstance(code, str):
        raise TypeError("CSS 內容必須是字串。")
    if mode not in {"stylesheet", "declarations"}:
        raise ValueError("CSS 模式必須是 stylesheet 或 declarations。")
    if not code.strip():
        _fail("請輸入 CSS 內容。")
    if any(ord(char) < 32 and char not in "\t\n\r\f" for char in code):
        _fail("CSS 不能包含空字元或不支援的控制字元。")
    _check_delimiters(code)
    _check_tokens(tinycss2.parse_component_value_list(code))
    parser = (
        tinycss2.parse_stylesheet
        if mode == "stylesheet" else tinycss2.parse_blocks_contents
    )
    items = parser(code, skip_comments=True, skip_whitespace=True)
    for item in items:
        if item.type == "error":
            _fail(item.message, item)
    return items


def _count_selectors(tokens, counts, depth=0):
    """依來源 token 計次，不計 CSS 隱含的全稱或父層選擇器。"""
    if depth > MAX_DEPTH:
        _fail("選擇器巢狀層數過多。")
    tokens = [token for token in tokens if token.type != "comment"]
    index = 0
    has_compound = False
    spaced = False

    while index < len(tokens):
        token = tokens[index]
        value = getattr(token, "value", None)
        if token.type == "whitespace":
            spaced = has_compound
            index += 1
            continue
        if token.type == "literal" and value == ",":
            has_compound, spaced = False, False
            index += 1
            continue
        if token.type == "literal" and value in {">", "+", "~", "||"}:
            kind = {">": "child", "+": "adjacent-sibling",
                    "~": "general-sibling", "||": "column"}[value]
            counts[("selector_kind", kind)] += 1
            has_compound, spaced = False, False
            index += 1
            continue
        if value == "|" and index + 1 < len(tokens) and getattr(tokens[index + 1], "value", None) == "|":
            counts[("selector_kind", "column")] += 1
            has_compound, spaced = False, False
            index += 2
            continue
        if spaced and has_compound:
            counts[("selector_kind", "descendant")] += 1
        spaced = False

        # svg|a、*|a 的前綴不是另一個元素或全稱選擇器。
        if (token.type == "ident" or value == "*") and index + 1 < len(tokens):
            if getattr(tokens[index + 1], "value", None) == "|":
                index += 2
                continue
        if value == "|":
            index += 1
            continue
        if token.type == "ident":
            counts[("selector_kind", "type")] += 1
        elif token.type == "hash" and token.is_identifier:
            counts[("selector_kind", "id")] += 1
        elif token.type == "[] block":
            counts[("selector_kind", "attribute")] += 1
        elif value == "*":
            counts[("selector_kind", "universal")] += 1
        elif value == "&":
            counts[("selector_kind", "nesting")] += 1
        elif value == ".":
            index += 1
            if index >= len(tokens) or tokens[index].type != "ident":
                _fail("類別選擇器的點號後方缺少名稱。", token)
            counts[("selector_kind", "class")] += 1
        elif value == ":":
            index += 1
            is_element = False
            if index < len(tokens) and getattr(tokens[index], "value", None) == ":":
                is_element = True
                index += 1
            if index >= len(tokens) or tokens[index].type not in {"ident", "function"}:
                _fail("冒號後方缺少偽類別或偽元素名稱。", token)
            pseudo = tokens[index]
            name = pseudo.lower_name if pseudo.type == "function" else pseudo.lower_value
            is_element = is_element or name in LEGACY_PSEUDO_ELEMENTS
            kind = "pseudo_element_name" if is_element else "pseudo_class_name"
            counts[(kind, name)] += 1
            if pseudo.type == "function":
                if (not is_element and name in SELECTOR_FUNCTIONS) or (
                    is_element and name in SELECTOR_PSEUDO_ELEMENTS
                ):
                    _count_selectors(pseudo.arguments, counts, depth + 1)
                elif not is_element and name in {"nth-child", "nth-last-child"}:
                    # An+B 是位置公式；只有 of 後面的部分是選擇器。
                    for position, argument in enumerate(pseudo.arguments):
                        if argument.type == "ident" and argument.lower_value == "of":
                            _count_selectors(pseudo.arguments[position + 1:], counts, depth + 1)
                            break
        else:
            _fail("無法解析此選擇器寫法。", token)
        has_compound = True
        index += 1


def _count_value_functions(tokens, counts, depth=0):
    """只檢查實際宣告值，不把字串、註解或條件測試當成呼叫。"""
    if depth > MAX_DEPTH:
        _fail("CSS 函式巢狀層數過多。")
    for token in tokens:
        if token.type == "function":
            if token.lower_name == "var":
                counts[("function_name", "var")] += 1
            _count_value_functions(token.arguments, counts, depth + 1)
        elif getattr(token, "content", None) is not None:
            _count_value_functions(token.content, counts, depth + 1)


def _collect(code, mode="stylesheet"):
    counts = Counter()
    declarations = []

    def block(content):
        return tinycss2.parse_blocks_contents(
            content, skip_comments=True, skip_whitespace=True
        )

    def visit(items, context, depth=0):
        if depth > MAX_DEPTH:
            _fail("CSS 規則巢狀層數過多。")
        for item in items:
            if item.type == "error":
                _fail(item.message, item)
            if item.type == "declaration":
                if context in {"rules", "keyframes"}:
                    _fail("屬性宣告必須放在適用的樣式區塊內。", item)
                _check_tokens(item.value)
                if context == "descriptors":
                    continue
                _count_value_functions(item.value, counts)
                name = item.name if item.name.startswith("--") else item.lower_name
                declarations.append({
                    "name": name,
                    "value": tinycss2.serialize(item.value).strip(),
                    "important": item.important,
                })
                if name.startswith("--"):
                    counts[("property_kind", "custom")] += 1
                else:
                    counts[("property_name", name)] += 1
            elif item.type == "qualified-rule":
                if mode == "declarations" and depth == 0:
                    _fail("行內樣式只能包含屬性宣告。", item)
                if context == "descriptors":
                    _fail("描述符區塊不能包含元素樣式規則。", item)
                if context != "keyframes":
                    _count_selectors(item.prelude, counts)
                # from、to 與百分比是關鍵影格位置，不是元素選擇器。
                visit(block(item.content), "style", depth + 1)
            elif item.type == "at-rule":
                if mode == "declarations" and depth == 0:
                    _fail("行內樣式不能包含 At-rules。", item)
                name = item.lower_at_keyword
                counts[("at_rule_name", name)] += 1
                _check_tokens(item.prelude)
                if item.content is None:
                    if name in GROUP_RULES - {"layer"} or name in DESCRIPTOR_RULES or name in {"keyframes", "-webkit-keyframes", "page"}:
                        _fail(f"@{name} 缺少必要的樣式區塊。", item)
                    continue
                _check_tokens(item.content)
                if name in {"import", "charset", "namespace"}:
                    _fail(f"@{name} 不應使用大括號區塊。", item)
                if name in {"keyframes", "-webkit-keyframes"}:
                    visit(block(item.content), "keyframes", depth + 1)
                elif name in DESCRIPTOR_RULES or context == "descriptors":
                    # src、syntax 等描述符不能混算成元素屬性。
                    visit(block(item.content), "descriptors", depth + 1)
                elif name == "page" or name in PAGE_MARGIN_RULES:
                    visit(block(item.content), "page", depth + 1)
                elif name in GROUP_RULES:
                    if name == "scope":
                        for token in item.prelude:
                            if token.type == "() block":
                                _count_selectors(token.content, counts)
                    # 不計 @supports、@container 等條件中的測試語法。
                    visit(block(item.content), context, depth + 1)
                # 未收錄的 at-rule 不猜測區塊內容，也不下載外部資源。
    visit(_parse(code, mode), "rules" if mode == "stylesheet" else "style")
    return declarations, counts


def get_css_declarations(code, *, mode="stylesheet"):
    return _collect(code, mode)[0]


def count_css_syntaxes(code, *, mode="stylesheet"):
    """回傳以 (rule_type, match_value) 為鍵的次數，對應匯入工具。"""
    return _collect(code, mode)[1]


def count_css_properties(code, *, mode="stylesheet"):
    counts = count_css_syntaxes(code, mode=mode)
    result = {name: count for (kind, name), count in counts.items() if kind == "property_name"}
    if counts[("property_kind", "custom")]:
        result["--*"] = counts[("property_kind", "custom")]
    return result


def count_css_at_rules(code, *, mode="stylesheet"):
    return {name: count for (kind, name), count in count_css_syntaxes(code, mode=mode).items()
            if kind == "at_rule_name"}


def count_css_selectors(code, *, mode="stylesheet"):
    result = {}
    for (kind, name), count in count_css_syntaxes(code, mode=mode).items():
        if kind == "selector_kind":
            result[name] = count
        elif kind == "pseudo_class_name":
            result[f":{name}"] = count
        elif kind == "pseudo_element_name":
            result[f"::{name}"] = count
    return result


def validate_css(code, *, mode="stylesheet"):
    """先檢查結構，再由既有 Nu 服務檢查屬性值與選擇器等規則。"""
    try:
        _collect(code, mode)
    except CSSValidationError as error:
        return error.errors

    # XHTML 文字可安全承載 </style>、& 等 CSS 字串，不誤關閉驗證外框。
    css = code if mode == "stylesheet" else ":root {\n" + code + "\n}"
    prefix = (
        '<html xmlns="http://www.w3.org/1999/xhtml" lang="en">\n'
        "<head>\n<title>CSS validation</title>\n<style>\n"
    )
    document = prefix + escape(css) + "\n</style>\n</head><body></body></html>"
    line_offset = prefix.count("\n") + (1 if mode == "declarations" else 0)
    validator_url = os.environ.get("CSS_VALIDATOR_URL") or os.environ.get(
        "HTML_VALIDATOR_URL", "http://127.0.0.1:8888/"
    )
    try:
        response = requests.post(
            validator_url,
            params={"out": "json"},
            headers={"Content-Type": "application/xhtml+xml; charset=utf-8"},
            data=document.encode("utf-8"),
            timeout=(5, 30),
        )
        response.raise_for_status()
        data = response.json()
    except (requests.RequestException, ValueError) as error:
        raise CSSValidationServiceError("CSS 驗證服務無法使用，請稍後再試。") from error
    if not isinstance(data, dict) or not isinstance(data.get("messages"), list):
        raise CSSValidationServiceError("CSS 驗證服務回傳格式異常。")

    errors = []
    lines = code.split("\n")
    for message in data["messages"]:
        if not isinstance(message, dict) or message.get("type") not in {"info", "error", "non-document-error"}:
            raise CSSValidationServiceError("CSS 驗證服務回傳無法辨識的訊息。")
        if message["type"] == "non-document-error":
            raise CSSValidationServiceError("CSS 驗證服務未能完成檢查。")
        if message["type"] != "error":
            continue
        text = message.get("message")
        if not isinstance(text, str) or not text:
            raise CSSValidationServiceError("CSS 驗證服務缺少錯誤說明。")
        if re.search(r"unrecognized at-rule|unknown pseudo|unknown pseudo-element|not supported", text, re.I):
            raise CSSValidationUnsupportedError(
                "目前的 CSS 驗證器尚無法確認這個語法，未進行分析：" + text
            )
        line, column = message.get("lastLine"), message.get("lastColumn")
        if type(line) is int:
            line -= line_offset
        if type(line) is not int or not 1 <= line <= len(lines):
            line, column = None, None
        elif any(char in lines[line - 1] for char in "<&>"):
            # XML 轉義後的欄位位置可能不同，不冒充成原始 CSS 的欄位。
            column = None
        errors.append({"message": text, "line": line, "column": column})
    return errors


def get_css_detection_rules():
    # 計次工具本身不需資料庫；只有正式分析時才載入連線工具。
    if __package__:
        from .database import get_db_connection
    else:
        from database import get_db_connection

    connection = get_db_connection()
    try:
        cursor = connection.cursor(dictionary=True)
        try:
            cursor.execute("""
                SELECT s.id AS syntax_id, s.slug, s.name, s.display_label,
                       s.sort_key, COALESCE(s.summary, '') AS summary,
                       COALESCE(s.example_code, '') AS example_code,
                       r.rule_type, r.match_value
                FROM syntax_detection_rules AS r
                JOIN syntaxes AS s ON s.id = r.syntax_id
                JOIN syntax_categories AS c ON c.id = s.category_id
                WHERE c.language = 'css' AND s.is_active = TRUE
                  AND r.is_active = TRUE AND r.analyzer = 'css_parser'
                ORDER BY s.id, r.id
            """)
            return cursor.fetchall()
        finally:
            cursor.close()
    finally:
        connection.close()


def analyze_css(code, *, mode="stylesheet"):
    """驗證通過後才查詢 CSS 規則，回傳與 Python、HTML 一致的結果格式。"""
    errors = validate_css(code, mode=mode)
    if errors:
        raise CSSValidationError(errors)
    counts = count_css_syntaxes(code, mode=mode)
    rules = get_css_detection_rules()
    if not rules:
        raise RuntimeError("尚未設定可用的 CSS 語法辨識規則。")
    syntax_counts, details, seen = Counter(), {}, set()
    for rule in rules:
        key = (rule["rule_type"], rule["match_value"])
        identity = (rule["syntax_id"], key)
        if identity in seen:
            continue
        seen.add(identity)
        if counts[key]:
            syntax_counts[rule["syntax_id"]] += counts[key]
            details[rule["syntax_id"]] = rule
    ordered = sorted(syntax_counts, key=lambda sid: (
        -syntax_counts[sid], details[sid]["sort_key"], sid,
    ))
    return [{
        "syntax_id": sid,
        "language": "css",
        "slug": details[sid]["slug"],
        "name": details[sid]["name"],
        "display_label": details[sid]["display_label"],
        "count": syntax_counts[sid],
        "summary": details[sid]["summary"],
        "example_code": details[sid]["example_code"],
    } for sid in ordered]
