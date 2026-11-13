"""擷取 CSS 官方語法索引，覆寫 JSON，不修改資料庫。"""

import hashlib
import json
from datetime import datetime, timezone
from pathlib import Path
from urllib.parse import urljoin

import requests
from bs4 import BeautifulSoup
from requests.adapters import HTTPAdapter
from urllib3.util.retry import Retry


SOURCE_URL = "https://drafts.csswg.org/indexes/"

OUTPUT_PATH = (
    Path(__file__).resolve().parent
    / "data"
    / "css"
    / "syntaxes.json"
)

SECTIONS = {
    "properties": "property",
    "selectors": "selector",
    "at-rules": "at-rule",
}


def create_session():
    session = requests.Session()
    session.headers.update(
        {
            "User-Agent": "SyntaxAtlas-CSSFetcher/1.0",
        }
    )

    # 網路暫時失敗時，最多重試三次。
    retry = Retry(
        total=3,
        backoff_factor=1,
        status_forcelist=[429, 500, 502, 503, 504],
        allowed_methods=["GET"],
        respect_retry_after_header=True,
    )

    session.mount(
        "https://",
        HTTPAdapter(max_retries=retry),
    )

    return session


def extract_section(soup, section_id, category):
    heading = soup.find("h2", id=section_id)

    if heading is None:
        raise RuntimeError(
            f"找不到官方索引章節：{section_id}"
        )

    index = heading.find_next("ul", class_="index")

    if index is None:
        raise RuntimeError(
            f"找不到語法索引清單：{section_id}"
        )

    # 確認清單仍屬於目前章節，避免抓到下一章。
    if index.find_previous("h2") != heading:
        raise RuntimeError(
            f"官方索引結構已改變：{section_id}"
        )

    entries = {}

    for item in index.find_all("li", recursive=False):
        # 名稱可能是直接文字，也可能放在連結裡。
        # 排除下一層列出的不同規範來源。
        name_parts = []

        for child in item.contents:
            if getattr(child, "name", None) in {"ul", "ol"}:
                continue

            if isinstance(child, str):
                name_parts.append(child)
            else:
                name_parts.append(
                    child.get_text(" ", strip=True)
                )

        name = " ".join(" ".join(name_parts).split())

        if not name:
            continue

        source_urls = sorted(
            {
                urljoin(SOURCE_URL, link["href"])
                for link in item.find_all("a", href=True)
                if urljoin(
                    SOURCE_URL, link["href"]
                ).startswith("https://")
            }
        )

        if not source_urls:
            raise RuntimeError(
                f"語法缺少官方連結：{name}"
            )

        key = (category, name)

        if key not in entries:
            entries[key] = {
                "language": "css",
                "category": category,
                "name": name,
                "source_urls": source_urls,
            }
        else:
            entries[key]["source_urls"] = sorted(
                set(entries[key]["source_urls"])
                | set(source_urls)
            )

    if not entries:
        raise RuntimeError(
            f"沒有擷取到任何項目：{section_id}"
        )

    return sorted(
        entries.values(),
        key=lambda entry: entry["name"].casefold(),
    )


def main():
    with create_session() as session:
        response = session.get(
            SOURCE_URL,
            timeout=(10, 60),
        )
        response.raise_for_status()

    # 使用現有的 html5lib，處理官方清單省略結束標籤的寫法。
    soup = BeautifulSoup(response.content, "html5lib")

    entries = []
    counts = {}

    for section_id, category in SECTIONS.items():
        section_entries = extract_section(
            soup,
            section_id,
            category,
        )

        entries.extend(section_entries)
        counts[category] = len(section_entries)

    document = {
        "language": "css",
        "source_title": "CSS Indexes",
        "source_url": SOURCE_URL,
        "source_status": "Editor’s Draft",
        "source_fetched_at": datetime.now(
            timezone.utc
        ).isoformat(),
        "source_sha256": hashlib.sha256(
            response.content
        ).hexdigest(),
        "counts": counts,
        "syntaxes": entries,
    }

    OUTPUT_PATH.parent.mkdir(
        parents=True,
        exist_ok=True,
    )

    # 全部擷取成功後才覆寫；失敗時保留原本的 JSON。
    temporary_path = OUTPUT_PATH.with_suffix(".json.tmp")

    try:
        temporary_path.write_text(
            json.dumps(
                document,
                ensure_ascii=False,
                indent=2,
            )
            + "\n",
            encoding="utf-8",
        )
        temporary_path.replace(OUTPUT_PATH)
    finally:
        if temporary_path.exists():
            temporary_path.unlink()

    print(f"屬性：{counts['property']} 項")
    print(f"選擇器：{counts['selector']} 項")
    print(f"At-rules：{counts['at-rule']} 項")
    print(f"已更新：{OUTPUT_PATH}")
    print("尚未修改資料庫。")


if __name__ == "__main__":
    main()