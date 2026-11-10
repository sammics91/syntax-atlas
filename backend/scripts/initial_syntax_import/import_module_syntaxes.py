import json
import sys
from datetime import datetime, timezone
from pathlib import Path

# 固定使用 backend 內的連線工具與資料檔，不受執行位置影響
BACKEND_DIR = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(BACKEND_DIR))

from database import get_db_connection


def main():
    json_path = (
        BACKEND_DIR
        / "data"
        / "python-3.13"
        / "all-sections.json"
    )

    data = json.loads(json_path.read_text(encoding="utf-8"))

    sections = {
        section["section_id"]: section
        for section in data["sections"]
    }

    source = sections["the-import-statement"]

    items = [
        {
            "section_id": "the-import-statement",
            "slug": "import",
            "name": "import",
            "summary": "匯入模組，或搭配 from 匯入指定名稱。",
            "description": source["description"],
            "example_code": (
                "import math\n"
                "from math import sqrt"
            ),
            "example_description": (
                "第一行匯入 math 模組；"
                "第二行從 math 匯入 sqrt。"
            ),
        },
        {
            "section_id": "the-import-statement",
            "slug": "from",
            "name": "from",
            "summary": (
                "需搭配其他語法使用，可指定匯入來源、"
                "委派產生值，或指定例外原因。"
            ),
            "description": (
                "from 不能單獨構成敘述，主要有三種搭配：\n\n"
                "1. from ... import ...：從指定模組匯入名稱。\n"
                "2. yield from ...：將產生值的工作委派給"
                "另一個可迭代物件。\n"
                "3. raise ... from ...：指定例外的原因。\n\n"
                "以下為官方文件的匯入語法說明：\n\n"
                + source["description"]
            ),
            "example_code": "from math import sqrt",
            "example_description": (
                "從 math 模組匯入 sqrt，之後可直接呼叫 sqrt。"
            ),
        },
        {
            "section_id": "yield-expressions",
            "slug": "yield",
            "name": "yield",
            "summary": "產生一個值並暫停產生器，下次取值時繼續執行。",
            "description": sections["yield-expressions"]["description"],
            "example_code": (
                "def numbers():\n"
                "    yield 1\n"
                "    yield 2\n\n"
                "for number in numbers():\n"
                "    print(number)"
            ),
            "example_description": "產生器依序產生 1 和 2。",
        },
        {
            "section_id": "the-raise-statement",
            "slug": "raise",
            "name": "raise",
            "summary": "主動拋出例外，也可搭配 from 指定例外原因。",
            "description": sections["the-raise-statement"]["description"],
            "example_code": (
                "def check_age(age):\n"
                "    if age < 0:\n"
                '        raise ValueError("年齡不能小於零")'
            ),
            "example_description": "收到負數年齡時，拋出 ValueError。",
        },
    ]


    connection = get_db_connection()

    try:
        cursor = connection.cursor()

        try:
            # 分類使用較廣的「關鍵字」，容納 from 的不同用途
            cursor.execute(
                """
                INSERT INTO syntax_categories (
                    language, slug, name, display_order
                )
                VALUES (%s, %s, %s, %s)
                ON DUPLICATE KEY UPDATE name = %s
                """,
                ("python", "keywords", "關鍵字", 30, "關鍵字"),
            )

            cursor.execute(
                """
                SELECT id
                FROM syntax_categories
                WHERE language = %s AND slug = %s
                """,
                ("python", "keywords"),
            )

            category_id = cursor.fetchone()[0]

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
                        item["description"],
                        item["example_code"],
                        item["example_description"],
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
                        "python_tokenize",
                        "keyword",
                        item["slug"],
                        True,
                        True,
                    ),
                )

            connection.commit()
            print("已匯入 import、from 與關鍵字規則")

        finally:
            cursor.close()

    except Exception:
        connection.rollback()
        raise

    finally:
        connection.close()


if __name__ == "__main__":
    main()