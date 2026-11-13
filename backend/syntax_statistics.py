from typing import Literal

from fastapi import APIRouter, Depends

from auth import get_current_user
from database import get_db_connection


router = APIRouter(prefix="/api", tags=["常用語法"])


# 取得目前會員已儲存的語法累積使用次數。
@router.get("/statistics")
def get_statistics(
    language: Literal["python", "html", "css", "all"] = "python",
    user: dict = Depends(get_current_user),
):
    connection = get_db_connection()

    try:
        cursor = connection.cursor(dictionary=True)

        try:
            cursor.execute(
                """
                SELECT
                    s.id,
                    s.name,
                    s.display_label,
                    COALESCE(s.summary, '') AS summary,
                    COALESCE(s.example_code, '') AS example_code,
                    c.language,
                    SUM(rsu.usage_count) AS usage_count
                FROM record_syntax_usage AS rsu
                JOIN records AS r
                    ON rsu.record_id = r.id
                JOIN syntaxes AS s
                    ON rsu.syntax_id = s.id
                JOIN syntax_categories AS c
                    ON s.category_id = c.id
                WHERE r.user_id = %s
                  AND (
                      %s = 'all'
                      OR c.language = %s
                  )
                GROUP BY
                    s.id, s.name, c.language, s.sort_key
                HAVING SUM(rsu.usage_count) > 0
                ORDER BY
                    usage_count DESC,
                    s.sort_key ASC,
                    s.id ASC
                """,
                (user["id"], language, language),
            )

            rows = cursor.fetchall()

            # 紀錄筆數包含「已刪除程式碼、保留統計」的紀錄。
            # 指定語言時，也包含 HTML 紀錄中實際使用該語言的內嵌樣式。
            cursor.execute(
                """
                SELECT COUNT(*) AS record_count
                FROM records AS r
                WHERE r.user_id = %s
                  AND (
                      %s = 'all'
                      OR r.language = %s
                      OR EXISTS (
                          SELECT 1
                          FROM record_syntax_usage AS rsu
                          JOIN syntaxes AS s ON s.id = rsu.syntax_id
                          JOIN syntax_categories AS c ON c.id = s.category_id
                          WHERE rsu.record_id = r.id
                            AND c.language = %s
                            AND rsu.usage_count > 0
                      )
                  )
                """,
                (user["id"], language, language, language),
            )

            record_count = cursor.fetchone()["record_count"]

        finally:
            cursor.close()

    finally:
        connection.close()

    return {
        "language": language,
        "record_count": int(record_count),
        "usages": [
            {
                "id": row["id"],
                "name": row["name"],
                "display_label": row["display_label"],
                "summary": row["summary"],
                "example_code": row["example_code"],
                "language": row["language"],
                "count": int(row["usage_count"]),
            }
            for row in rows
        ],
    }
