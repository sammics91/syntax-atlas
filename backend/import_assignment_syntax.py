import json
from datetime import datetime, timezone
from pathlib import Path

from database import get_db_connection


def main():
    # 讀取已抓取的官方文件
    json_path = (
        Path(__file__).resolve().parent
        / "data"
        / "python-3.13"
        / "all-sections.json"
    )

    data = json.loads(json_path.read_text(encoding="utf-8"))

    source = next(
        (
            section
            for section in data["sections"]
            if section["section_id"] == "assignment-statements"
        ),
        None,
    )

    if source is None:
        raise RuntimeError("找不到第 7.2 節：Assignment statements")

    fetched_at = (
        datetime.fromisoformat(source["source_fetched_at"])
        .astimezone(timezone.utc)
        .replace(tzinfo=None)
    )

    connection = get_db_connection()

    try:
        cursor = connection.cursor()

        try:
            # 建立「變數與資料」分類
            cursor.execute(
                """
                INSERT INTO syntax_categories (
                    language, slug, name, display_order
                )
                VALUES (%s, %s, %s, %s)
                ON DUPLICATE KEY UPDATE name = %s
                """,
                (
                    "python",
                    "variables-and-data",
                    "變數與資料",
                    5,
                    "變數與資料",
                ),
            )

            cursor.execute(
                """
                SELECT id
                FROM syntax_categories
                WHERE language = %s AND slug = %s
                """,
                ("python", "variables-and-data"),
            )

            category_id = cursor.fetchone()[0]

            # 建立辭典項目
            cursor.execute(
                """
                INSERT INTO syntaxes (
                    category_id, slug, name, summary,
                    description, example_code,
                    example_description, sort_key,
                    source_url, source_version,
                    source_fetched_at, is_active
                )
                VALUES (
                    %s, %s, %s, %s,
                    %s, %s,
                    %s, %s,
                    %s, %s,
                    %s, %s
                )
                ON DUPLICATE KEY UPDATE
                    name = %s,
                    source_url = %s,
                    source_version = %s,
                    source_fetched_at = %s
                """,
                (
                    category_id,
                    "assignment",
                    "=",
                    "將值指定給變數，也可以指定給物件屬性或容器項目。",
                    source["description"],
                    'score = 90\nname = "Riley"',
                    "將數字與字串分別指定給 score 和 name。",
                    "assignment",
                    source["source_url"],
                    source["source_version"],
                    fetched_at,
                    False,
                    "指派 =",
                    source["source_url"],
                    source["source_version"],
                    fetched_at,
                ),
            )

            cursor.execute(
                """
                SELECT id
                FROM syntaxes
                WHERE category_id = %s AND slug = %s
                """,
                (category_id, "assignment"),
            )

            syntax_id = cursor.fetchone()[0]

            # 建立 AST 辨識規則
            cursor.execute(
                """
                INSERT INTO syntax_detection_rules (
                    syntax_id, analyzer,
                    rule_type, match_value, is_active
                )
                VALUES (%s, %s, %s, %s, %s)
                ON DUPLICATE KEY UPDATE is_active = %s
                """,
                (
                    syntax_id,
                    "python_ast",
                    "node_type",
                    "Assign",
                    True,
                    True,
                ),
            )

            connection.commit()
            print(f"已匯入指派語法，syntax_id = {syntax_id}")

        finally:
            cursor.close()

    except Exception:
        connection.rollback()
        raise

    finally:
        connection.close()


if __name__ == "__main__":
    main()
