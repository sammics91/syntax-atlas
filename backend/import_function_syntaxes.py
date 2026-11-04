import json
from datetime import datetime, timezone
from pathlib import Path

from database import get_db_connection


def main():
    json_path = (
        Path(__file__).resolve().parent
        / "data"
        / "python-3.13"
        / "all-sections.json"
    )

    data = json.loads(json_path.read_text(encoding="utf-8"))

    sections = {
        section["section_id"]: section
        for section in data["sections"]
    }

    items = [
        {
            "section_id": "function-definitions",
            "slug": "function-definition",
            "name": "def",
            "summary": "定義可重複呼叫的函式。",
            "example_code": (
                "def add(a, b):\n"
                "    return a + b"
            ),
            "example_description": "定義接收兩個參數的 add 函式。",
            "sort_key": "def",
            "node_type": "FunctionDef",
        },
        {
            "section_id": "the-return-statement",
            "slug": "return",
            "name": "return",
            "summary": "結束目前的函式呼叫，並可將值回傳給呼叫端。",
            "example_code": (
                "def add(a, b):\n"
                "    return a + b"
            ),
            "example_description": "將 a 與 b 相加的結果回傳。",
            "sort_key": "return",
            "node_type": "Return",
        },
        {
            "section_id": "calls",
            "slug": "function-call",
            "name": "函式呼叫()",
            "summary": "使用括號呼叫函式或其他可呼叫物件。",
            "example_code": (
                "def add(a, b):\n"
                "    return a + b\n\n"
                "result = add(1, 2)"
            ),
            "example_description": "呼叫 add，傳入兩個參數並取得回傳值。",
            "sort_key": "call",
            "node_type": "Call",
        },
    ]

    # 先確認來源都有取得，再開始連線寫入
    for item in items:
        if item["section_id"] not in sections:
            raise RuntimeError(
                f"找不到官方章節：{item['section_id']}"
            )

    connection = get_db_connection()

    try:
        cursor = connection.cursor()

        try:
            # 建立函式分類
            cursor.execute(
                """
                INSERT INTO syntax_categories (
                    language, slug, name, display_order
                )
                VALUES (%s, %s, %s, %s)
                ON DUPLICATE KEY UPDATE name = %s
                """,
                ("python", "functions", "函式", 20, "函式"),
            )

            cursor.execute(
                """
                SELECT id
                FROM syntax_categories
                WHERE language = %s AND slug = %s
                """,
                ("python", "functions"),
            )

            category_id = cursor.fetchone()[0]

            for item in items:
                source = sections[item["section_id"]]

                fetched_at = (
                    datetime.fromisoformat(
                        source["source_fetched_at"]
                    )
                    .astimezone(timezone.utc)
                    .replace(tzinfo=None)
                )

                # 寫入辭典內容
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
                        source_url = %s,
                        source_version = %s,
                        source_fetched_at = %s
                    """,
                    (
                        category_id,
                        item["slug"],
                        item["name"],
                        item["summary"],
                        source["description"],
                        item["example_code"],
                        item["example_description"],
                        item["sort_key"],
                        source["source_url"],
                        source["source_version"],
                        fetched_at,
                        False,
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
                    (category_id, item["slug"]),
                )

                syntax_id = cursor.fetchone()[0]

                # 寫入 AST 規則
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
                        item["node_type"],
                        True,
                        True,
                    ),
                )

            connection.commit()
            print("已匯入函式定義、return 與辨識規則")

        finally:
            cursor.close()

    except Exception:
        connection.rollback()
        raise

    finally:
        connection.close()


if __name__ == "__main__":
    main()