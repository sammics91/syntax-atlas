from typing import Literal

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

# 掛載 API
app.include_router(auth_router)
app.include_router(bookmarks_router)
app.include_router(password_reset_router)
app.include_router(records_router)
app.include_router(statistics_router)

# 分析請求的資料格式，目前先支援 Python / HTML
class AnalysisRequest(BaseModel):
    language: Literal["python", "html"]
    code: str = Field(min_length=1, max_length=20000)

    # 僅供 HTML 使用；預設分析一般內容片段。
    html_mode: Literal["document", "fragment"] = "fragment"
    html_context: Literal[
        "div", "ul", "ol", "table", "tbody", "tr", "select"
    ] = "div"


# 依程式語言選擇分析器
ANALYZERS = {
    "python": analyze_python,
    "html": analyze_html,
}


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

    analyzer = ANALYZERS[request.language]

    try:
        if request.language == "html":
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
            "language": request.language,
            "valid": False,
            "syntaxes": [],
            "errors": error.errors,
        }

    except SyntaxError as error:
        return {
            "language": request.language,
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

    return {
        "language": request.language,
        "valid": True,
        "syntaxes": syntaxes,
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
