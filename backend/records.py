from typing import Literal

from fastapi import APIRouter, Depends, HTTPException
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
    analyze_html_with_css,
)
from auth import get_current_user
from database import get_db_connection


router = APIRouter(prefix="/api", tags=["程式碼紀錄"])


# 儲存紀錄時接收的資料，支援 Python、HTML 與 CSS。
class RecordCreateRequest(BaseModel):
    title: str | None = Field(default=None, max_length=100)
    language: Literal["python", "html", "css"]
    code: str = Field(min_length=1, max_length=20000)

# 新增與更新紀錄時，都由後端重新驗證並計算語法次數；HTML 包含內嵌 CSS。
def analyze_record_code(request: RecordCreateRequest):
    try:
        if request.language == "html":
            return analyze_html_with_css(request.code)

        if request.language == "css":
            return analyze_css(request.code)

        return analyze_python(request.code)

    except (HTMLValidationError, CSSValidationError) as error:
        raise HTTPException(
            status_code=400,
            detail={
                "message": (
                    "CSS 語法有誤，無法儲存。"
                    if isinstance(error, CSSValidationError)
                    else "HTML 語法有誤，無法儲存。"
                ),
                "errors": error.errors,
            },
        ) from error

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

    except (HTMLValidationServiceError, CSSValidationServiceError) as error:
        raise HTTPException(
            status_code=503,
            detail=str(error),
        ) from error

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
    syntaxes = analyze_record_code(request)

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


# 取得目前會員的紀錄，新紀錄排在前面
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


# 取得要開啟編輯的單筆紀錄
@router.get("/records/{record_id}")
def get_record(
    record_id: int,
    user: dict = Depends(get_current_user),
):
    connection = get_db_connection()

    try:
        cursor = connection.cursor(dictionary=True)

        try:
            cursor.execute(
                """
                SELECT
                    id,
                    record_number,
                    title,
                    language,
                    code,
                    code_deleted_at
                FROM records
                WHERE id = %s AND user_id = %s
                """,
                (record_id, user["id"]),
            )

            record = cursor.fetchone()

            if record is None:
                raise HTTPException(
                    status_code=404,
                    detail="找不到這筆紀錄。",
                )

            if (
                record["code"] is None
                or record["code_deleted_at"] is not None
            ):
                raise HTTPException(
                    status_code=409,
                    detail="這筆紀錄的程式碼已移除，無法編輯。",
                )

            return record

        finally:
            cursor.close()

    finally:
        connection.close()


# 更新紀錄，並重新計算語法使用次數
@router.put("/records/{record_id}")
def update_record(
    record_id: int,
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
            detail="程式碼不能包含空字元。",
        )

    # 使用更新後的程式碼重新分析
    syntaxes = analyze_record_code(request)

    connection = get_db_connection()

    try:
        cursor = connection.cursor(dictionary=True)

        try:
            # 確認紀錄屬於目前會員，並鎖定至這次更新結束
            cursor.execute(
                """
                SELECT id, record_number, code, code_deleted_at
                FROM records
                WHERE id = %s AND user_id = %s
                FOR UPDATE
                """,
                (record_id, user["id"]),
            )

            record = cursor.fetchone()

            if record is None:
                raise HTTPException(
                    status_code=404,
                    detail="找不到這筆紀錄。",
                )

            if (
                record["code"] is None
                or record["code_deleted_at"] is not None
            ):
                raise HTTPException(
                    status_code=409,
                    detail="這筆紀錄的程式碼已移除，無法編輯。",
                )

            # 更新內容，不修改紀錄編號與建立時間
            cursor.execute(
                """
                UPDATE records
                SET title = %s, language = %s, code = %s
                WHERE id = %s AND user_id = %s
                """,
                (
                    title,
                    request.language,
                    request.code,
                    record_id,
                    user["id"],
                ),
            )

            # 移除這筆紀錄原本的統計，改存重新分析的結果
            cursor.execute(
                """
                DELETE FROM record_syntax_usage
                WHERE record_id = %s
                """,
                (record_id,),
            )

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

            # 內容與統計全部成功，才一起儲存
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
        "record_number": record["record_number"],
        "title": title,
        "language": request.language,
        "syntax_count": len(syntaxes),
        "message": "程式碼已更新。",
    }


# 刪除程式碼，或完全刪除紀錄
@router.delete("/records/{record_id}")
def delete_record(
    record_id: int,
    mode: Literal["code-only", "all"],
    user: dict = Depends(get_current_user),
):
    connection = get_db_connection()

    try:
        cursor = connection.cursor(dictionary=True)

        try:
            # 確認擁有權，並避免與編輯操作同時修改
            cursor.execute(
                """
                SELECT id
                FROM records
                WHERE id = %s AND user_id = %s
                FOR UPDATE
                """,
                (record_id, user["id"]),
            )

            record = cursor.fetchone()

            if record is None:
                raise HTTPException(
                    status_code=404,
                    detail="找不到這筆紀錄。",
                )

            if mode == "code-only":
                # 保留紀錄與語法次數，只移除程式碼
                cursor.execute(
                    """
                    UPDATE records
                    SET
                        code = NULL,
                        code_deleted_at = COALESCE(
                            code_deleted_at,
                            UTC_TIMESTAMP()
                        )
                    WHERE id = %s AND user_id = %s
                    """,
                    (record_id, user["id"]),
                )

                message = "程式碼已移除，語法使用次數已保留。"

            else:
                # 外鍵會連帶刪除這筆紀錄的語法次數
                cursor.execute(
                    """
                    DELETE FROM records
                    WHERE id = %s AND user_id = %s
                    """,
                    (record_id, user["id"]),
                )

                message = "紀錄與語法使用次數已刪除。"

            connection.commit()

        finally:
            cursor.close()

    except Exception:
        connection.rollback()
        raise

    finally:
        connection.close()

    return {"message": message}
