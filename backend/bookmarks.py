from fastapi import APIRouter, Depends, HTTPException

from auth import get_current_user
from database import get_db_connection


router = APIRouter(prefix="/api", tags=["語法收藏"])


# 取得目前會員的收藏
@router.get("/bookmarks")
def get_bookmarks(user: dict = Depends(get_current_user)):
    connection = get_db_connection()

    try:
        cursor = connection.cursor(dictionary=True)

        try:
            cursor.execute(
                """
                SELECT
                    b.syntax_id,
                    b.created_at
                FROM syntax_bookmarks AS b
                JOIN syntaxes AS s
                    ON s.id = b.syntax_id
                WHERE b.user_id = %s
                  AND s.is_active = TRUE
                ORDER BY b.created_at DESC, b.syntax_id DESC
                """,
                (user["id"],),
            )

            return {"bookmarks": cursor.fetchall()}

        finally:
            cursor.close()

    finally:
        connection.close()


# 收藏指定語法
@router.put("/bookmarks/{syntax_id}")
def add_bookmark(
    syntax_id: int,
    user: dict = Depends(get_current_user),
):
    connection = get_db_connection()

    try:
        cursor = connection.cursor()

        try:
            # 確認語法存在且已啟用
            cursor.execute(
                """
                SELECT id
                FROM syntaxes
                WHERE id = %s
                  AND is_active = TRUE
                FOR SHARE
                """,
                (syntax_id,),
            )

            if cursor.fetchone() is None:
                raise HTTPException(
                    status_code=404,
                    detail="找不到這個語法。",
                )

            # 已收藏時保留原時間，不重複新增
            cursor.execute(
                """
                INSERT INTO syntax_bookmarks (
                    user_id,
                    syntax_id
                )
                VALUES (%s, %s)
                ON DUPLICATE KEY UPDATE
                    created_at = created_at
                """,
                (user["id"], syntax_id),
            )

            connection.commit()

            return {
                "syntax_id": syntax_id,
                "bookmarked": True,
            }

        finally:
            cursor.close()

    except Exception:
        connection.rollback()
        raise

    finally:
        connection.close()


# 取消收藏指定語法
@router.delete("/bookmarks/{syntax_id}")
def remove_bookmark(
    syntax_id: int,
    user: dict = Depends(get_current_user),
):
    connection = get_db_connection()

    try:
        cursor = connection.cursor()

        try:
            cursor.execute(
                """
                DELETE FROM syntax_bookmarks
                WHERE user_id = %s
                  AND syntax_id = %s
                """,
                (user["id"], syntax_id),
            )

            connection.commit()

            return {
                "syntax_id": syntax_id,
                "bookmarked": False,
            }

        finally:
            cursor.close()

    except Exception:
        connection.rollback()
        raise

    finally:
        connection.close()