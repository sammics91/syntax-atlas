import json
import sys
from datetime import datetime, timezone
from pathlib import Path

# 固定使用 backend 內的連線工具與資料檔，不受執行位置影響
BACKEND_DIR = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(BACKEND_DIR))

from database import get_db_connection


# 讀取已抓取的官方內容
json_path = (
    BACKEND_DIR
    / "data"
    / "python-3.13"
    / "all-sections.json"
)

data = json.loads(json_path.read_text(encoding="utf-8"))

source = next(
    (
        section
        for section in data["sections"]
        if section["section_id"] == "the-if-statement"
    ),
    None,
)

if source is None:
    raise RuntimeError("JSON 中找不到第 8.1 節")


# 將官方的一個章節，整理成三筆辭典項目
items = [
    {
        "slug": "if",
        "name": "if",
        "summary": "條件成立時執行指定區塊。",
        "example_code": 'if score >= 60:\n    print("及格")',
    },
    {
        "slug": "elif",
        "name": "elif",
        "summary": "前面的條件不成立時，檢查另一個條件。",
        "example_code": (
            'if score >= 90:\n'
            '    print("優等")\n'
            'elif score >= 60:\n'
            '    print("及格")'
        ),
    },
    {
        "slug": "else",
        "name": "else",
        "summary": (
            "搭配 if、for、while、try 使用，"
            "依所在結構決定執行時機。"
        ),
        "example_code": (
            'if score >= 60:\n'
            '    print("及格")\n'
            'else:\n'
            '    print("未及格")'
        ),
    },
]

# MySQL DATETIME 不保存時區，此專案統一以 UTC 寫入
fetched_at = (
    datetime.fromisoformat(source["source_fetched_at"])
    .astimezone(timezone.utc)
    .replace(tzinfo=None)
)


def main():
    connection = get_db_connection()
    cursor = connection.cursor()

    try:
        # 建立分類；已存在時更新名稱，不重複新增
        cursor.execute(
            """
            INSERT INTO syntax_categories
                (language, slug, name, display_order)
            VALUES (%s, %s, %s, %s)
            ON DUPLICATE KEY UPDATE name = %s
            """,
            (
                "python",
                "control-flow",
                "流程控制",
                10,
                "流程控制",
            ),
        )

        cursor.execute(
            """
            SELECT id
            FROM syntax_categories
            WHERE language = %s AND slug = %s
            """,
            ("python", "control-flow"),
        )

        category_id = cursor.fetchone()[0]

        for item in items:
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
                    "python_tokenize",
                    "keyword",
                    item["slug"],
                    True,
                    True,
                ),
            )

        # 三筆資料與規則都成功後，才一起儲存
        connection.commit()
        print("已匯入 if、elif、else，以及三筆辨識規則")

    except Exception:
        connection.rollback()
        raise

    finally:
        cursor.close()
        connection.close()


if __name__ == "__main__":
    main()