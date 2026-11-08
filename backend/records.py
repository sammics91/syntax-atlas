from typing import Literal

from fastapi import APIRouter, Depends, HTTPException
from pydantic import BaseModel, Field

from analyzer import analyze_python
from auth import get_current_user
from database import get_db_connection


router = APIRouter(prefix="/api", tags=["程式碼紀錄"])


# 儲存紀錄時接收的資料
class RecordCreateRequest(BaseModel):
    title: str | None = Field(default=None, max_length=100)
    language: Literal["python"]
    code: str = Field(min_length=1, max_length=20000)


# 儲存程式碼與分析次數
@router.post("/records", status_code=201)
def create_record(
    request: RecordCreateRequest,
    user: dict = Depends(get_current_user),
):
    title = (request.title or "").strip() or None

    if not request.code.strip():
        raise HTTPException(
            status_code=400,
            detail="程式碼不能只有空白。",
        )

    if "\x00" in request.code:
        raise HTTPException(
            status_code=400,
            detail="程式碼包含不支援的控制字元，請檢查後再試。",
        )

    # 由後端重新分析，不信任前端傳入的統計次數
    try:
        syntaxes = analyze_python(request.code)
    except SyntaxError as error:
        raise HTTPException(
            status_code=400,
            detail={
                "message": "程式碼語法有誤，無法儲存。",
                "errors": [
                    {
                        "message": error.msg,
                        "line": error.lineno,
                        "column": error.offset,
                    }
                ],
            },
        ) from error

    connection = get_db_connection()

    try:
        cursor = connection.cursor()

        try:
            # 鎖定此會員，避免同時儲存取得相同編號
            cursor.execute(
                """
                SELECT next_record_number
                FROM users
                WHERE id = %s
                FOR UPDATE
                """,
                (user["id"],),
            )

            member = cursor.fetchone()

            if member is None:
                raise HTTPException(
                    status_code=401,
                    detail="找不到會員資料，請重新登入。",
                )

            record_number = int(member[0])

            cursor.execute(
                """
                UPDATE users
                SET next_record_number = next_record_number + 1
                WHERE id = %s
                """,
                (user["id"],),
            )

            cursor.execute(
                """
                INSERT INTO records (
                    user_id, record_number, title, language, code
                )
                VALUES (%s, %s, %s, %s, %s)
                """,
                (
                    user["id"],
                    record_number,
                    title,
                    request.language,
                    request.code,
                ),
            )

            record_id = cursor.lastrowid

            usage_rows = [
                (
                    record_id,
                    syntax["syntax_id"],
                    syntax["count"],
                )
                for syntax in syntaxes
            ]

            if usage_rows:
                cursor.executemany(
                    """
                    INSERT INTO record_syntax_usage (
                        record_id, syntax_id, usage_count
                    )
                    VALUES (%s, %s, %s)
                    """,
                    usage_rows,
                )

            # 編號、紀錄與語法次數一起儲存
            connection.commit()

        finally:
            cursor.close()

    except Exception:
        connection.rollback()
        raise

    finally:
        connection.close()

    return {
        "id": record_id,
        "record_number": record_number,
        "title": title,
        "language": request.language,
        "syntax_count": len(syntaxes),
        "message": "程式碼已儲存。",
    }


# 取得目前會員的紀錄，新的排在前面
@router.get("/records")
def get_records(user: dict = Depends(get_current_user)):
    connection = get_db_connection()

    try:
        cursor = connection.cursor(dictionary=True)

        try:
            cursor.execute(
                """
                SELECT
                    r.id,
                    r.record_number,
                    r.title,
                    r.language,
                    r.code,
                    r.code_deleted_at,
                    r.created_at,
                    r.updated_at,
                    (
                        SELECT COUNT(*)
                        FROM record_syntax_usage AS rsu
                        WHERE rsu.record_id = r.id
                    ) AS syntax_count
                FROM records AS r
                WHERE r.user_id = %s
                ORDER BY r.created_at DESC, r.id DESC
                """,
                (user["id"],),
            )

            records = cursor.fetchall()

        finally:
            cursor.close()

    finally:
        connection.close()

    return {"records": records}