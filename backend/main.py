import ast
import re
from collections import Counter
from typing import Literal

from fastapi.responses import JSONResponse
from mysql.connector.errors import PoolError
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel, Field

from analyzer import analyze_python
from analyzer_html import (
    HTMLValidationError,
    HTMLValidationServiceError,
    analyze_html,
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

# 分析請求的資料格式，目前先支援 Python / HTML
class AnalysisRequest(BaseModel):
    language: Literal["python", "html"] | None = None
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
            syntaxes = analyzer(
                request.code,
                mode=request.html_mode,
                context=request.html_context,
            )
        else:
            syntaxes = analyzer(request.code)

    # HTMLValidationError 繼承 SyntaxError，
    # 必須放在一般 SyntaxError 前面，才能保留全部錯誤。
    except HTMLValidationError as error:
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
    except HTMLValidationServiceError as error:
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
    language: Literal["python", "html"] | None = None,
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
