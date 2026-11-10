import json
import sys
from datetime import datetime, timezone
from pathlib import Path

# 固定使用 backend 內的連線工具與資料檔，不受執行位置影響
BACKEND_DIR = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(BACKEND_DIR))

from database import get_db_connection


json_path = (
    BACKEND_DIR
    / "data"
    / "python-3.13"
    / "all-sections.json"
)

data = json.loads(json_path.read_text(encoding="utf-8"))

# 依章節 ID 整理，方便找到官方內容
sections = {
    section["section_id"]: section
    for section in data["sections"]
}

items = [
    {
        "section_id": "the-for-statement",
        "slug": "for",
        "name": "for",
        "summary": "逐一取出可迭代物件中的項目並執行區塊。",
        "example_code": (
            'for item in ["牛奶", "雞蛋"]:\n'
            '    print(item)'
        ),
        "node_type": "For",
    },
    {
        "section_id": "the-while-statement",
        "slug": "while",
        "name": "while",
        "summary": "條件成立時重複執行區塊。",
        "example_code": (
            "count = 0\n"
            "while count < 3:\n"
            "    print(count)\n"
            "    count += 1"
        ),
        "node_type": "While",
    },
]


def main():
    connection = get_db_connection()

    try:
        cursor = connection.cursor()

        try:
            cursor.execute(
                """
                SELECT id
                FROM syntax_categories
                WHERE language = %s AND slug = %s
                """,
                ("python", "control-flow"),
            )

            category = cursor.fetchone()

            if category is None:
                raise RuntimeError("找不到流程控制分類")

            category_id = category[0]

            for item in items:
                source = sections[item["section_id"]]

                fetched_at = (
                    datetime.fromisoformat(source["source_fetched_at"])
                    .astimezone(timezone.utc)
                    .replace(tzinfo=None)
                )

                cursor.execute(
                    """
                    INSERT INTO syntaxes (
                        category_id, slug, name, summary,
                        description, example_code, sort_key,
                        source_url, source_version,
                        source_fetched_at, is_active
                    )
                    VALUES (
                        %s, %s, %s, %s,
                        %s, %s, %s,
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
                        item["slug"],
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
            print("已匯入 for、while 與 AST 辨識規則")

        finally:
            cursor.close()

    except Exception:
        connection.rollback()
        raise

    finally:
        connection.close()


if __name__ == "__main__":
    main()