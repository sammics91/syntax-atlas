from typing import Literal

from fastapi import FastAPI, HTTPException
from pydantic import BaseModel, Field

from analyzer import analyze_python, SYNTAX_TYPES, SYNTAX_DETAILS


app = FastAPI()


# 分析請求的資料格式，目前先支援 Python
class AnalysisRequest(BaseModel):
    language: Literal["python"]
    code: str = Field(min_length=1, max_length=20000)


# 依程式語言選擇分析器
ANALYZERS = {
    "python": analyze_python,
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
        syntaxes = analyzer(request.code)

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

    return {
        "language": request.language,
        "valid": True,
        "syntaxes": syntaxes,
        "errors": [],
    }


# GET /api/syntaxes：取得語法辭典
@app.get("/api/syntaxes")
def get_syntaxes():
    syntaxes = [
        {
            "slug": slug,
            "name": name,
            **SYNTAX_DETAILS[slug],
        }
        for slug, name in SYNTAX_TYPES.values()
    ]

    return {
        "language": "python",
        "syntaxes": syntaxes,
    }