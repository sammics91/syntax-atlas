from fastapi import APIRouter, Depends

from auth import get_current_user
from database import get_db_connection


router = APIRouter(prefix="/api", tags=["常用語法"])


# 取得目前會員的 Python 語法累積使用次數
@router.get("/statistics")
def get_statistics(user: dict = Depends(get_current_user)):
    connection = get_db_connection()

    try:
        cursor = connection.cursor(dictionary=True)

        try:
            cursor.execute(
                """
                SELECT
                    s.id,
                    s.name,
                    SUM(rsu.usage_count) AS usage_count
                FROM record_syntax_usage AS rsu
                JOIN records AS r
                    ON rsu.record_id = r.id
                JOIN syntaxes AS s
                    ON rsu.syntax_id = s.id
                JOIN syntax_categories AS c
                    ON s.category_id = c.id
                WHERE r.user_id = %s
                  AND r.language = %s
                  AND c.language = %s
                GROUP BY s.id, s.name, s.sort_key
                HAVING SUM(rsu.usage_count) > 0
                ORDER BY
                    usage_count DESC,
                    s.sort_key ASC,
                    s.id ASC
                """,
                (user["id"], "python", "python"),
            )

            rows = cursor.fetchall()

                        # 計算會員的 Python 紀錄筆數，包含保留統計的紀錄
            cursor.execute(
                """
                SELECT COUNT(*) AS record_count
                FROM records
                WHERE user_id = %s
                  AND language = %s
                """,
                (user["id"], "python"),
            )

            record_count = cursor.fetchone()["record_count"]

        finally:
            cursor.close()

    finally:
        connection.close()

        return {
        "language": "python",
        "record_count": int(record_count),
        "usages": [
            {
                "id": row["id"],
                "name": row["name"],
                "count": int(row["usage_count"]),
            }
            for row in rows
        ],
    }