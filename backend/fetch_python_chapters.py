"""下載 Python 3.13 第 6～8 章，只輸出 all-sections.json。

在 CMD 執行：python fetch_python_chapters.py
此程式不寫入資料庫，也不建立 AST 辨識規則。
"""

import json
import re
from datetime import datetime, timezone
from pathlib import Path

import requests
from bs4 import BeautifulSoup


CHAPTERS = [
    (6, "expressions", "expressions.html"),
    (7, "simple-statements", "simple_stmts.html"),
    (8, "compound-statements", "compound_stmts.html"),
]

OUTPUT_DIR = Path(__file__).resolve().parent / "data" / "python-3.13"


def extract_sections(html, url, chapter_number, category_slug, fetched_at):
    soup = BeautifulSoup(html, "html.parser")
    article = soup.find("div", role="main")
    if article is None:
        raise RuntimeError(f"找不到文件主內容：{url}")

    title = soup.title.get_text(" ", strip=True) if soup.title else ""
    version_match = re.search(r"Python ([\d.]+) documentation", title)
    source_version = version_match.group(1) if version_match else "3.13"
    results = []

    for order, section in enumerate(article.find_all("section", id=True), 1):
        heading = section.find(re.compile(r"^h[1-6]$"), recursive=False)
        if heading is None:
            continue

        # 複製本節，移除子章節，避免同一段內容重複存入父節和子節。
        own = BeautifulSoup(str(section), "html.parser").find("section")
        for child in own.find_all("section", recursive=False):
            child.decompose()
        for link in own.select("a.headerlink"):
            link.decompose()

        own_heading = own.find(re.compile(r"^h[1-6]$"), recursive=False)
        official_title = own_heading.get_text(" ", strip=True)
        own_heading.decompose()

        # 文法與範例分開保存；文法規則不能當成可執行的範例。
        grammar_blocks = [
            block.get_text().strip()
            for block in own.find_all("pre")
            if block.select_one('[id^="grammar-token-"]') is not None
            or block.find_parent(class_="productionlist") is not None
            or "productionlist" in block.get("class", [])
        ]
        code_blocks = [
            block.get_text().rstrip()
            for block in own.find_all("pre")
            if block.find_parent(class_="productionlist") is None
            and "productionlist" not in block.get("class", [])
            and block.select_one('[id^="grammar-token-"]') is None
        ]

        results.append({
            "chapter": chapter_number,
            "category_slug": category_slug,
            "section_id": section["id"],
            "parent_section_id": (
                section.parent.get("id")
                if section.parent.name == "section" else None
            ),
            "official_title": official_title,
            "description": own.get_text("\n", strip=True),
            "content_html": str(own),
            "grammar_blocks": grammar_blocks,
            "code_blocks": code_blocks,
            "official_order": order,
            "source_url": f"{url}#{section['id']}",
            "source_version": source_version,
            "source_fetched_at": fetched_at,
            "is_active": False,
        })

    if not results:
        raise RuntimeError(f"沒有取得任何章節：{url}")
    return results


def main():
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    fetched_at = datetime.now(timezone.utc).isoformat()
    all_sections = []
    source_urls = []

    with requests.Session() as session:
        for number, category_slug, filename in CHAPTERS:
            url = f"https://docs.python.org/3.13/reference/{filename}"
            source_urls.append(url)
            response = session.get(url, timeout=30)
            response.raise_for_status()
            response.encoding = "utf-8"

            sections = extract_sections(
                response.text, url, number, category_slug, fetched_at
            )
            all_sections.extend(sections)
            print(f"第 {number} 章：已取得 {len(sections)} 個章節區塊")

    output = OUTPUT_DIR / "all-sections.json"
    data = {
        "source_urls": source_urls,
        "sections": all_sections,
    }
    output.write_text(
        json.dumps(data, ensure_ascii=False, indent=2), encoding="utf-8"
    )
    print(f"\n共保存 {len(all_sections)} 個章節區塊：{output}")
    print("這是來源資料；總覽、規則說明尚未篩選為正式辭典項目。")


if __name__ == "__main__":
    main()
