"""擷取 WHATWG HTML 元素索引，覆寫 JSON，不修改資料庫。"""

import hashlib
import json
import re
import time
from datetime import datetime, timezone
from pathlib import Path
from urllib.parse import unquote, urldefrag, urljoin, urlsplit

import requests
from bs4 import BeautifulSoup

SOURCE_URL = "https://html.spec.whatwg.org/multipage/indices.html"
OUTPUT_PATH = Path(__file__).resolve().parent / "data" / "html" / "elements.json"


def extract_source_version(soup):
    # HTML 是持續更新的標準，以頁面標示的更新日期辨識文件版本。
    page_text = soup.get_text(" ", strip=True)

    match = re.search(
        r"Last Updated\s+(\d{1,2}\s+[A-Za-z]+\s+\d{4})",
        page_text,
    )

    if match is None:
        raise RuntimeError("找不到官方文件更新日期，請確認頁面結構。")

    updated_at = (
        datetime.strptime(
            match.group(1),
            "%d %B %Y",
        )
        .date()
        .isoformat()
    )

    return updated_at


def extract_elements(soup):

    # 依官方 Elements 章節的定位點尋找索引表。
    heading = soup.find(id="elements-3")

    if heading is None:
        raise RuntimeError("找不到官方 Elements 章節。")

    element_table = heading if heading.name == "table" else heading.find_next("table")

    if element_table is None:
        raise RuntimeError("找不到官方元素索引表。")

    elements = {}

    for row in element_table.find_all("tr"):
        cells = row.find_all(["th", "td"], recursive=False)

        if len(cells) < 2:
            continue

        # 同一列可能包含多個元素，例如 h1～h6，分別建立項目。
        for link in cells[0].find_all("a", href=True):
            tag = link.get_text(strip=True).lower()

            if not re.fullmatch(r"[a-z][a-z0-9]*", tag):
                continue

            # SVG、MathML 屬於其他標準，這次只擷取 WHATWG HTML 文件。
            source_url = urljoin(SOURCE_URL, link["href"])
            parsed_url = urlsplit(source_url)

            if (
                parsed_url.hostname != "html.spec.whatwg.org"
                or not parsed_url.path.startswith("/multipage/")
            ):
                continue

            if tag in elements:
                raise RuntimeError(f"元素重複：{tag}，請確認擷取結果。")

            elements[tag] = {
                "tag": tag,
                "name": f"<{tag}>",
                "official_summary": cells[1].get_text(
                    " ",
                    strip=True,
                ),
                "source_url": source_url,
            }

    if not elements:
        raise RuntimeError("沒有取得任何 HTML 元素。")

    return list(elements.values())


def fetch_element_details(session, elements, expected_version):
    page_cache = {}

    for index, element in enumerate(elements, 1):
        page_url, fragment = urldefrag(element["source_url"])
        fragment = unquote(fragment)

        if not fragment:
            raise RuntimeError(f"元素缺少官方章節定位：{element['tag']}")

        # 同一頁只下載一次。
        if page_url not in page_cache:
            time.sleep(0.5)

            response = session.get(page_url, timeout=30)
            response.raise_for_status()

            page_soup = BeautifulSoup(
                response.content,
                "html5lib",
            )

            # 避免索引與詳細內容來自不同更新日期。
            if extract_source_version(page_soup) != expected_version:
                raise RuntimeError("官方文件更新日期不一致，請稍後重新擷取。")

            page_cache[page_url] = page_soup

        page_soup = page_cache[page_url]
        target = page_soup.find(id=fragment)

        if target is None:
            raise RuntimeError(f"找不到元素的官方章節：{element['source_url']}")

        heading_pattern = re.compile(r"^h[1-6]$")

        if heading_pattern.fullmatch(target.name):
            heading = target
        else:
            heading = target.find_parent(heading_pattern)

        if heading is None:
            raise RuntimeError(f"找不到元素章節標題：{element['tag']}")

        level = int(heading.name[1])
        blocks = []

        # 讀取到下一個同層或更高層的章節為止。
        for sibling in heading.find_next_siblings():
            if (
                heading_pattern.fullmatch(sibling.name)
                and int(sibling.name[1]) <= level
            ):
                break

            blocks.append(str(sibling))

        if not blocks:
            raise RuntimeError(f"元素章節沒有內容：{element['tag']}")

        content = BeautifulSoup(
            "".join(blocks),
            "html5lib",
        )

        # 官方章節可能同時含 HTML、JavaScript、介面定義等區塊，
        # 先完整保留，之後再挑選適合辭典呈現的範例。
        code_blocks = [
            block.get_text().strip()
            for block in content.find_all("pre")
            if block.get_text().strip()
        ]

        element["official_title"] = heading.get_text(
            " ",
            strip=True,
        )
        element["official_description"] = content.get_text(
            "\n",
            strip=True,
        )
        element["code_blocks"] = code_blocks

        print(f"[{index}/{len(elements)}] " f"已取得 <{element['tag']}>")


def main():
    with requests.Session() as session:
        response = session.get(
            SOURCE_URL,
            timeout=30,
        )
        response.raise_for_status()

        soup = BeautifulSoup(response.content, "html5lib")

        source_updated_at = extract_source_version(soup)
        elements = extract_elements(soup)

        fetch_element_details(
            session,
            elements,
            source_updated_at,
        )

    fetched_at = datetime.now(timezone.utc).isoformat()

    snapshot = {
        "source": "WHATWG HTML Living Standard",
        "source_url": SOURCE_URL,
        "source_version": (f"HTML Living Standard — {source_updated_at}"),
        "source_updated_at": source_updated_at,
        "source_fetched_at": fetched_at,
        "source_sha256": hashlib.sha256(
            response.content,
        ).hexdigest(),
        "element_count": len(elements),
        "elements": elements,
    }

    OUTPUT_PATH.parent.mkdir(parents=True, exist_ok=True)

    # 完整擷取、檢查成功後才替換原檔，避免失敗時留下不完整資料。
    temporary_path = OUTPUT_PATH.with_suffix(".json.tmp")

    try:
        with temporary_path.open(
            "w",
            encoding="utf-8",
            newline="\n",
        ) as file:
            json.dump(
                snapshot,
                file,
                ensure_ascii=False,
                indent=2,
            )
            file.write("\n")

        temporary_path.replace(OUTPUT_PATH)

    finally:
        temporary_path.unlink(missing_ok=True)

    print(f"官方文件版本：{snapshot['source_version']}")
    print(f"已擷取 {len(elements)} 個 HTML 元素。")
    print(f"已更新：{OUTPUT_PATH}")
    print("尚未修改資料庫。")


if __name__ == "__main__":
    main()
