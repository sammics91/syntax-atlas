from typing import Literal

from fastapi import FastAPI, HTTPException
from pydantic import BaseModel, Field

from analyzer import analyze_python


app = FastAPI()


class AnalysisRequest(BaseModel):
    language: Literal["python"]
    code: str = Field(min_length=1, max_length=20000)


#--- POST /api/analyses 分析程式碼 ---
@app.post("/api/analyses")
def create_analysis(request: AnalysisRequest):
    if not request.code.strip():
        raise HTTPException(
            status_code=400,
            detail="請輸入程式碼",
        )

    if "\x00" in request.code:
        raise HTTPException(
            status_code=400,
            detail="程式碼不能包含空字元",
        )

    try:
        syntaxes = analyze_python(request.code)
    except SyntaxError as error:
        raise HTTPException(
            status_code=400,
            detail={
                "message": "Python 程式碼語法錯誤",
                "line": error.lineno,
                "description": error.msg,
            },
        ) from error

    return {
        "language": request.language,
        "syntaxes": syntaxes,
    }