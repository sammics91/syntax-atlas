"""擷取 CSS 官方索引；加上 --details 取得章節原文，覆寫 JSON，不修改資料庫。"""

import argparse
import hashlib
import json
import re
import time
from datetime import datetime, timezone
from pathlib import Path
from urllib.parse import unquote, urldefrag, urljoin

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

HEADING_PATTERN = re.compile(r"^h[1-6]$")
MAX_SECTION_LENGTH = 20000


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


def extract_document_metadata(soup, content, source_url):
    """不同 CSS 模組有自己的版本，不以索引日期代替規範版本。"""
    header = soup.select_one(".head")
    title = header.find("h1") if header else soup.find("h1")
    version_heading = (
        (header.select_one("#w3c-state") or header.find("h2"))
        if header
        else None
    )
    date = header.find("time") if header else None

    return {
        "source_url": source_url,
        "title": title.get_text(" ", strip=True) if title else None,
        "version_label": (
            version_heading.get_text(" ", strip=True)
            if version_heading
            else None
        ),
        "document_date": (
            (date.get("datetime") or date.get_text(" ", strip=True))
            if date
            else None
        ),
        "source_fetched_at": datetime.now(timezone.utc).isoformat(),
        "source_sha256": hashlib.sha256(content).hexdigest(),
    }


def extract_details(soup, source_url):
    """保留定位點所在章節供整理，不直接當成辭典的中文解釋。"""
    _, fragment = urldefrag(source_url)

    if not fragment:
        raise ValueError("官方連結缺少章節定位點")

    target = soup.find(id=unquote(fragment))
    if target is None:
        # 部分較舊的規範使用 name，而不是 id。
        target = soup.find("a", attrs={"name": unquote(fragment)})
    if target is None:
        raise ValueError("找不到官方章節定位點")

    heading = (
        target
        if HEADING_PATTERN.fullmatch(target.name)
        else target.find_parent(HEADING_PATTERN)
    )
    if heading is None:
        heading = target.find_previous(HEADING_PATTERN)
    if heading is None or heading.get("id") in {
        "abstract", "sotd", "contents", "references",
    }:
        raise ValueError("找不到對應的語法章節標題")

    level = int(heading.name[1])
    blocks = []
    # ReSpec 格式會把標題放在 header-wrapper，正文位於外框後面。
    section_start = heading
    if "header-wrapper" in heading.parent.get("class", []):
        section_start = heading.parent

    for sibling in section_start.find_next_siblings():
        next_heading = (
            sibling if HEADING_PATTERN.fullmatch(sibling.name)
            else sibling.find(HEADING_PATTERN, recursive=False)
        )
        if (
            next_heading is not None
            and int(next_heading.name[1]) <= level
        ):
            break
        blocks.append(str(sibling))

    if not blocks:
        raise ValueError("官方章節沒有可擷取內容")

    section = BeautifulSoup("".join(blocks), "html5lib")
    for unwanted in section.select("script, style, .self-link"):
        unwanted.decompose()

    description = section.get_text("\n", strip=True)
    if not description:
        raise ValueError("官方章節內容為空")

    return {
        "source_url": source_url,
        "official_title": heading.get_text(" ", strip=True),
        "official_description": description[:MAX_SECTION_LENGTH],
        "description_truncated": len(description) > MAX_SECTION_LENGTH,
        # 同一章節可能說明多個語法，範例需要人工挑選，不能直接公開。
        "official_content_scope": "section",
        "code_blocks": list(
            dict.fromkeys(
                block.get_text().strip()
                for block in section.find_all("pre")
                if block.get_text().strip()
            )
        ),
    }


def fetch_details(session, entries):
    # 按文件分組：同一份規範只下載一次，處理完就釋放解析結果。
    documents = {}
    metadata = {}
    failures = []

    for entry in entries:
        entry["review_status"] = "pending"
        entry["details_status"] = "pending"
        # 優先使用 CSSWG 的來源；其他官方來源仍保留在 source_urls。
        sources = sorted(
            entry["source_urls"],
            key=lambda url: (
                not url.startswith("https://drafts.csswg.org/"), url
            ),
        )
        source_url = sources[0]
        document_url, _ = urldefrag(source_url)
        documents.setdefault(document_url, []).append((entry, source_url))

    for index, (document_url, items) in enumerate(documents.items(), 1):
        print(f"[{index}/{len(documents)}] 取得規範：{document_url}", flush=True)
        try:
            time.sleep(0.3)
            response = session.get(document_url, timeout=(10, 45))
            response.raise_for_status()
            soup = BeautifulSoup(
                response.content, "html5lib", from_encoding="utf-8"
            )
            metadata[document_url] = extract_document_metadata(
                soup, response.content, response.url
            )
        except requests.RequestException as error:
            # 不讓單一失效草案連結中斷所有資料；失敗必須明確記錄。
            reason = f"規範下載失敗：{type(error).__name__}"
            for entry, source_url in items:
                entry["details_status"] = "needs_review"
                entry["details_error"] = reason
                failures.append({
                    "name": entry["name"],
                    "source_url": source_url,
                    "reason": reason,
                })
            continue

        for entry, source_url in items:
            try:
                entry.update(extract_details(soup, source_url))
                entry["source_document"] = document_url
                entry["details_status"] = "fetched"
            except ValueError as error:
                entry["details_status"] = "needs_review"
                entry["details_error"] = str(error)
                failures.append({
                    "name": entry["name"],
                    "source_url": source_url,
                    "reason": str(error),
                })

    return metadata, failures


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--details", action="store_true",
        help="同時取得官方章節內容與範例；未加此參數時只更新索引",
    )
    args = parser.parse_args()

    with create_session() as session:
        response = session.get(
            SOURCE_URL,
            timeout=(10, 60),
        )
        response.raise_for_status()

    # 使用現有的 html5lib，處理官方清單省略結束標籤的寫法。
    soup = BeautifulSoup(response.content, "html5lib", from_encoding="utf-8")

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

    if args.details:
        with create_session() as session:
            documents, failures = fetch_details(session, entries)
        document["documents"] = documents
        document["detail_failures"] = failures
        document["details_complete"] = not failures
        print(f"已取得詳細內容：{len(entries) - len(failures)} 項", flush=True)
        print(f"待檢查來源：{len(failures)} 項", flush=True)

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

    if args.details:
        print("內容仍為官方原文候選資料，尚未整理成中文辭典。")


if __name__ == "__main__":
    main()
