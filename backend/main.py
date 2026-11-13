import ast
import re
from collections import Counter
from typing import Literal

from fastapi.responses import JSONResponse
from mysql.connector.errors import PoolError
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel, Field

from analyzer import analyze_python
from analyzer_css import (
    CSSValidationError,
    CSSValidationServiceError,
    analyze_css,
)
from analyzer_html import (
    HTMLValidationError,
    HTMLValidationServiceError,
    analyze_html,
    extract_embedded_code,
)
from auth import router as auth_router
from bookmarks import router as bookmarks_router
from database import get_db_connection
from password_reset import router as password_reset_router
from records import router as records_router
from syntax_statistics import router as statistics_router



app = FastAPI()

# 連線池暫時沒有可用連線時，提示使用者稍後再試。
@app.exception_handler(PoolError)
async def handle_pool_error(_request, _error):
    return JSONResponse(
        status_code=503,
        content={"detail": "目前服務忙碌中，請稍後再試。"},
    )

# 掛載 API
app.include_router(auth_router)
app.include_router(bookmarks_router)
app.include_router(password_reset_router)
app.include_router(records_router)
app.include_router(statistics_router)

# 分析請求的資料格式，支援 Python、HTML 與 CSS。
class AnalysisRequest(BaseModel):
    language: Literal["python", "html", "css"] | None = None
    code: str = Field(min_length=1, max_length=20000)

    # 自動判斷完整 HTML 文件或片段，也允許明確指定模式。
    html_mode: Literal["auto", "document", "fragment"] = "auto"
    html_context: Literal[
        "div", "ul", "ol", "table", "tbody", "tr", "select"
    ] = "div"


# 依程式語言選擇分析器
ANALYZERS = {
    "python": analyze_python,
    "html": analyze_html,
    "css": analyze_css,
}

# 未指定語言時，先判斷程式碼適合交給哪個分析器。
def detect_language(code: str) -> str:
    # 能完整解析成 Python，就交給 Python 分析器。
    # Python 字串裡即使出現 HTML，也不另外拆開分析。
    try:
        ast.parse(code)
    except SyntaxError:
        pass
    else:
        return "python"

    # 開頭具有 HTML 標籤、註解或文件宣告時，
    # 交給 HTML 分析器進一步驗證，並非直接認定語法正確。
    if re.match(
        r"\s*(?:<!--|<!doctype\b|</?[a-z][a-z0-9:-]*(?=[\s/>]))",
        code,
        flags=re.IGNORECASE,
    ):
        return "html"

    # 樣式區塊或 At-rule 交給 CSS 分析器驗證，不直接認定合法。
    css_candidate = re.sub(r"/\*.*?\*/", "", code, flags=re.DOTALL).lstrip()
    if "{" in css_candidate or re.match(r"@[a-z-]+", css_candidate, re.IGNORECASE):
        return "css"

    raise HTTPException(
        status_code=400,
        detail="無法自動辨識程式語言，請選擇語言後再試。",
    )

# 計算本次分析中各語言的語法使用次數與占比
def build_language_stats(syntaxes):
    # 加總語法出現次數，不是語法種類數。
    usage_counts = Counter()

    for syntax in syntaxes:
        usage_counts[syntax["language"]] += syntax["count"]

    total_usage_count = sum(usage_counts.values())

    language_stats = [
        {
            "language": language,
            "usage_count": count,
            "percentage": round(
                count / total_usage_count * 100,
                1,
            ),
        }
        for language, count in sorted(
            usage_counts.items(),
            key=lambda item: (-item[1], item[0]),
        )
        if count > 0
    ]

    return language_stats, total_usage_count


def analyze_html_with_css(code, *, mode="auto", context="div"):
    """HTML 驗證通過後，分析實際寫出的樣式；相同語法合併次數。"""
    syntaxes = analyze_html(code, mode=mode, context=context)
    for block in extract_embedded_code(code):
        if block["language"] != "css":
            continue
        try:
            syntaxes.extend(analyze_css(block["code"], mode=block["mode"]))
        except CSSValidationError as error:
            errors = []
            for detail in error.errors:
                local_line = detail.get("line")
                column = detail.get("column")
                if block["mode"] == "declarations":
                    # 屬性值經 HTML 字元解碼，不能假裝欄位仍精準對應原文。
                    line, column = block["line"], None
                else:
                    line = block["line"] + local_line - 1 if local_line else None
                    if local_line == 1 and column is not None:
                        column += block["column"]
                errors.append({**detail, "language": "css", "line": line, "column": column})
            raise CSSValidationError(errors) from error

    merged = {}
    for syntax in syntaxes:
        key = (syntax["language"], syntax["syntax_id"])
        if key not in merged:
            merged[key] = dict(syntax)
        else:
            merged[key]["count"] += syntax["count"]
    return sorted(merged.values(), key=lambda item: (-item["count"], item["name"], item["syntax_id"]))

# POST /api/analyses：分析程式碼
@app.post("/api/analyses")
def create_analysis(request: AnalysisRequest):
    if not request.code.strip():
        raise HTTPException(
            status_code=400,
            detail="請輸入程式碼內容。",
        )

    if "\x00" in request.code:
        raise HTTPException(
            status_code=400,
            detail="程式碼不能包含空字元。",
        )

    language = request.language or detect_language(request.code)
    analyzer = ANALYZERS[language]

    try:
        if language == "html":
            syntaxes = analyze_html_with_css(
                request.code,
                mode=request.html_mode,
                context=request.html_context,
            )
        else:
            syntaxes = analyzer(request.code)

    # HTML、CSS 驗證錯誤先處理，保留完整錯誤清單。
    except (HTMLValidationError, CSSValidationError) as error:
        return {
            "language": language,
            "valid": False,
            "syntaxes": [],
            "errors": error.errors,
        }

    except SyntaxError as error:
        return {
            "language": language,
            "valid": False,
            "syntaxes": [],
            "errors": [
                {
                    "message": error.msg,
                    "line": error.lineno,
                    "column": error.offset,
                }
            ],
        }

    # 驗證器無法連線屬於服務問題，不當成使用者的語法錯誤。
    except (HTMLValidationServiceError, CSSValidationServiceError) as error:
        raise HTTPException(
            status_code=503,
            detail=str(error),
        ) from error

    language_stats, total_usage_count = build_language_stats(syntaxes)

    return {
        "language": language,
        "valid": True,
        "syntaxes": syntaxes,
        "language_stats": language_stats,
        "total_usage_count": total_usage_count,
        "errors": [],
    }


# GET /api/syntaxes：取得語法辭典
@app.get("/api/syntaxes")
def get_syntaxes(
    language: Literal["python", "html", "css"] | None = None,
):
    connection = get_db_connection()

    try:
        cursor = connection.cursor(dictionary=True)

        try:
            cursor.execute(
                """
                SELECT
                    s.id,
                    s.slug,
                    s.name,
                    s.display_label,
                    s.source_url,
                    c.language,
                    c.name AS category_name,
                    COALESCE(s.summary, '') AS summary,
                    COALESCE(s.example_description, '') AS example_description,
                    COALESCE(s.example_code, '') AS example_code
                FROM syntaxes AS s
                JOIN syntax_categories AS c
                    ON s.category_id = c.id
                WHERE (%s IS NULL OR c.language = %s)
                AND s.is_active = TRUE
                ORDER BY s.sort_key, s.id
                """,
                (language, language),
            )

            syntaxes = cursor.fetchall()

        finally:
            cursor.close()

    finally:
        connection.close()

    return {
        "language": language,
        "syntaxes": syntaxes,
    }
