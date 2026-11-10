import os
from collections import Counter
from html.parser import HTMLParser

import html5lib
import requests

from database import get_db_connection


# 片段所在的父元素，以及驗證時需要補上的外框。
FRAGMENT_CONTEXTS = {
    "div": ("<div>", "</div>"),
    "ul": ("<ul>", "</ul>"),
    "ol": ("<ol>", "</ol>"),
    "table": ("<table>", "</table>"),
    "tbody": ("<table><tbody>", "</tbody></table>"),
    "tr": ("<table><tbody><tr>", "</tr></tbody></table>"),
    "select": (
        '<select aria-label="驗證用選單">',
        "</select>",
    ),
}


class HTMLValidationServiceError(RuntimeError):
    """驗證服務無法使用，不代表使用者的 HTML 有錯。"""


class HTMLValidationError(SyntaxError):
    """HTML 驗證失敗，保留全部錯誤供 API 回傳。"""

    def __init__(self, errors):
        self.errors = errors
        first_error = errors[0]
        super().__init__(first_error["message"])
        self.lineno = first_error["line"]
        self.offset = first_error["column"]


class HTMLSyntaxParser(HTMLParser):
    # 這些元素內的文字不當作 HTML 子標籤計數。
    # noscript 以「瀏覽器啟用 JavaScript」的情境處理。
    CDATA_CONTENT_ELEMENTS = (
        "script",
        "style",
        "textarea",
        "title",
        "noscript",
    )

    def __init__(self):
        super().__init__(convert_charrefs=True)
        self.tag_counts = Counter()

    # 一般開始標籤，例如 <div>、<img>
    def handle_starttag(self, tag, attrs):
        self.tag_counts[tag] += 1

    # 例如 <br />；仍只計一次。
    def handle_startendtag(self, tag, attrs):
        self.handle_starttag(tag, attrs)


def count_html_tags(code: str) -> dict[str, int]:
    """只計原始碼中的標籤，不使用驗證時補上的文件外框。"""
    parser = HTMLSyntaxParser()
    parser.feed(code)
    parser.close()

    return dict(parser.tag_counts)


def validate_html(
    code: str,
    *,
    mode: str = "fragment",
    context: str = "div",
) -> list[dict]:
    """回傳 HTML 錯誤；空清單代表本次檢查沒有發現錯誤。"""

    if not code.strip():
        return [
            {
                "message": "請輸入 HTML 內容。",
                "line": None,
                "column": None,
            }
        ]

    if "\x00" in code:
        return [
            {
                "message": "HTML 不能包含空字元。",
                "line": None,
                "column": None,
            }
        ]

    if mode not in {"document", "fragment"}:
        raise ValueError("HTML 模式必須是 document 或 fragment。")

    line_offset = 0

    if mode == "document":
        document = code

    else:
        if context not in FRAGMENT_CONTEXTS:
            raise ValueError(f"尚未支援此片段情境：{context}")

        # 先以真正的片段模式檢查解析錯誤。
        # 避免片段中的多餘結束標籤意外關閉我們補上的外框。
        parser = html5lib.HTMLParser(strict=True)

        try:
            parser.parseFragment(
                code,
                container=context,
                scripting=True,
            )
        except html5lib.html5parser.ParseError as error:
            position = parser.errors[-1][0] if parser.errors else None

            return [
                {
                    "message": str(error),
                    "line": position[0] if position else None,
                    "column": position[1] if position else None,
                }
            ]

        opening, closing = FRAGMENT_CONTEXTS[context]

        prefix = (
            "<!doctype html>\n"
            '<html lang="zh-Hant">\n'
            "<head>\n"
            '<meta charset="utf-8">\n'
            "<title>HTML 驗證</title>\n"
            "</head>\n"
            "<body>\n"
            f"{opening}\n"
        )

        suffix = (
            f"\n{closing}\n"
            "</body>\n"
            "</html>"
        )

        document = prefix + code + suffix
        line_offset = prefix.count("\n")

    # 本機使用 localhost；部署時由環境變數指定容器服務網址。
    validator_url = os.environ.get(
        "HTML_VALIDATOR_URL",
        "http://127.0.0.1:8888/",
    )

    try:
        response = requests.post(
            validator_url,
            params={"out": "json"},
            headers={
                "Content-Type": "text/html; charset=utf-8",
            },
            data=document.encode("utf-8"),
            timeout=(5, 30),
        )
        response.raise_for_status()
        data = response.json()

    except (requests.RequestException, ValueError) as error:
        raise HTMLValidationServiceError(
            "HTML 驗證服務無法使用，請稍後再試。"
        ) from error

    if (
        not isinstance(data, dict)
        or not isinstance(data.get("messages"), list)
    ):
        raise HTMLValidationServiceError(
            "HTML 驗證服務回傳格式異常。"
        )

    errors = []
    source_line_count = len(code.split("\n"))

    for message in data["messages"]:
        if (
            not isinstance(message, dict)
            or message.get("type")
            not in {"info", "error", "non-document-error"}
        ):
            raise HTMLValidationServiceError(
                "HTML 驗證服務回傳無法辨識的訊息。"
            )

        if message["type"] == "non-document-error":
            raise HTMLValidationServiceError(
                "HTML 驗證服務未能完成檢查，請稍後再試。"
            )

        # 警告與一般資訊不視為拒絕分析的錯誤。
        if message["type"] != "error":
            continue

        line = message.get("lastLine")
        column = message.get("lastColumn")

        if isinstance(line, int):
            line -= line_offset

            # 錯誤可能落在驗證外框，不冒充為使用者原始碼的位置。
            if not 1 <= line <= source_line_count:
                line = None
                column = None
        else:
            line = None
            column = None

        errors.append(
            {
                "message": message.get(
                    "message",
                    "HTML 不符合目前情境的規則。",
                ),
                "line": line,
                "column": column,
            }
        )

    return errors


def get_html_detection_rules():
    """只讀取公開且啟用的 HTML 標籤辨識規則。"""
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
                    s.sort_key,
                    COALESCE(s.summary, '') AS summary,
                    COALESCE(s.example_code, '') AS example_code,
                    r.match_value
                FROM syntax_detection_rules AS r
                JOIN syntaxes AS s
                    ON s.id = r.syntax_id
                JOIN syntax_categories AS c
                    ON c.id = s.category_id
                WHERE c.language = 'html'
                  AND s.is_active = TRUE
                  AND r.is_active = TRUE
                  AND r.analyzer = 'html_parser'
                  AND r.rule_type = 'tag_name'
                ORDER BY s.id, r.id
                """
            )

            return cursor.fetchall()

        finally:
            cursor.close()

    finally:
        connection.close()


def analyze_html(
    code: str,
    *,
    mode: str = "fragment",
    context: str = "div",
):
    """先驗證 HTML，再依資料庫規則回傳各語法的出現次數。"""
    errors = validate_html(code, mode=mode, context=context)

    # 驗證失敗就停止，不計數，也不查詢資料庫。
    if errors:
        raise HTMLValidationError(errors)

    # 只解析原始碼，不計驗證時補上的外框或瀏覽器補上的元素。
    tag_counts = count_html_tags(code)
    rules = get_html_detection_rules()

    if not rules:
        raise RuntimeError("尚未設定可用的 HTML 語法辨識規則。")

    syntax_counts = Counter()
    syntax_details = {}

    for rule in rules:
        count = tag_counts.get(rule["match_value"], 0)

        if count == 0:
            continue

        syntax_id = rule["syntax_id"]
        syntax_counts[syntax_id] += count
        syntax_details[syntax_id] = rule

    # 次數由多至少；相同次數依排序名稱與 ID 排列。
    ordered_ids = sorted(
        syntax_counts,
        key=lambda syntax_id: (
            -syntax_counts[syntax_id],
            syntax_details[syntax_id]["sort_key"],
            syntax_id,
        ),
    )

    return [
        {
            "syntax_id": syntax_id,
            "slug": syntax_details[syntax_id]["slug"],
            "name": syntax_details[syntax_id]["name"],
            "display_label": syntax_details[syntax_id]["display_label"],
            "count": syntax_counts[syntax_id],
            "summary": syntax_details[syntax_id]["summary"],
            "example_code": syntax_details[syntax_id]["example_code"],
        }
        for syntax_id in ordered_ids
    ]
