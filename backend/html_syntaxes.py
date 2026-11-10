"""整理 HTML 元素及辨識規則；只有明確執行 generate 才產生 SQL。

本檔不連線資料庫，也不執行使用者的 HTML。實際解析與次數計算由
analyzer_html.py 負責：每個原始開始標籤計一次，結束標籤不另計。
此處僅定義 html_parser / tag_name 與資料庫語法項目的對應。
"""

import argparse
import json
import re
from datetime import datetime, timezone
from pathlib import Path


ROOT = Path(__file__).resolve().parent
SNAPSHOT_PATH = ROOT / "data" / "html" / "elements.json"
MIGRATIONS_DIR = ROOT / "database" / "migrations"

# 與部署入口使用相同的 SQL 敘述分隔格式。
SEPARATOR = "\n-- @statement\n"

CATEGORIES = {
    "document-element": ("文件根元素", 1),
    "document-metadata": ("文件中繼資料", 5),
    "sections": ("文件區段", 8),
    "grouping-content": ("內容分組", 10),
    "text-level-semantics": ("文字層級語意", 20),
    "edits": ("編輯標記", 25),
    "embedded-content": ("嵌入內容", 30),
    "tabular-data": ("表格資料", 40),
    "forms": ("表單", 50),
    "interactive-elements": ("互動元素", 60),
    "scripting": ("指令碼與範本", 70),
}


def element(tag, category, label, summary, details, example, explanation):
    """統一各元素的資料格式；說明與範例為依官方文件整理的中文內容。"""
    return {
        "tag": tag,
        "category": category,
        "display_label": label,
        "summary": summary,
        "description": summary + details,
        "example_code": example,
        "example_description": explanation,
    }


# 分類使用穩定代碼，不根據可能調整的官方章節編號建立唯一識別。
# 原始快照只用於核對元素與保存出處，不直接把瀏覽器實作演算法匯入說明。
HTML_SYNTAXES = [
    # 文件根元素（4.1）
    element("html", "document-element", "文件根元素",
            "表示 HTML 文件的根元素。",
            "一般文件在其中放置 head 與 body；lang 可說明文件的主要語言。DOCTYPE 是獨立宣告，不屬於 html 元素。",
            '<!doctype html>\n<html lang="zh-Hant">\n  <head><title>語法學習</title></head>\n  <body><p>歡迎學習 HTML。</p></body>\n</html>',
            "建立以繁體中文為主要語言的 HTML 文件。"),

    # 文件中繼資料（4.2）
    element("head", "document-metadata", "文件資訊區",
            "包含文件標題、編碼、樣式與其他中繼資料。",
            "它不是頁面上方可見的標頭；可見的介紹區域應使用 header。一般文件將 head 放在 body 之前。",
            '<head>\n  <meta charset="utf-8">\n  <title>Syntax Atlas</title>\n</head>',
            "在文件資訊區設定編碼與分頁標題。"),
    element("title", "document-metadata", "文件標題",
            "定義文件的標題。",
            "通常顯示在瀏覽器分頁或書籤名稱，放在 head 中；它與頁面內容中的 h1 標題用途不同。",
            '<head>\n  <title>語法辭典 — Syntax Atlas</title>\n</head>',
            "設定瀏覽器分頁使用的標題。"),
    element("base", "document-metadata", "基準網址",
            "設定文件相對網址解析時的基準網址，或連結的預設目標。",
            "放在 head 中；href 會影響文件內的相對連結，應在需要該基準的網址之前宣告。base 是空元素，不寫結束標籤。",
            '<head>\n  <title>教學</title>\n  <base href="https://example.com/tutorials/">\n</head>',
            "使相對網址以 tutorials 目錄為基準解析。"),
    element("link", "document-metadata", "外部資源關聯",
            "描述文件與外部資源之間的關係。",
            "常用 rel 與 href 載入樣式表或指定圖示。它不是讓使用者點擊的超連結；link 是空元素。",
            '<head>\n  <title>首頁</title>\n  <link rel="stylesheet" href="/styles.css">\n</head>',
            "為文件指定外部 CSS 樣式表。"),
    element("meta", "document-metadata", "中繼資料",
            "提供文件編碼、描述及其他中繼資料。",
            "依 charset、name 或 http-equiv 等屬性表達不同資訊。charset 宣告應盡早出現在文件中；meta 是空元素。",
            '<head>\n  <meta charset="utf-8">\n  <meta name="description" content="查閱與分析程式語法">\n  <title>Syntax Atlas</title>\n</head>',
            "宣告 UTF-8 編碼與文件描述。"),
    element("style", "document-metadata", "內嵌樣式",
            "在文件中放置 CSS 樣式規則。",
            "通常放在 head 中。style 內的內容是樣式文字，不是 HTML 子元素；本次元素分析不解析其中的 CSS。",
            '<head>\n  <title>範例</title>\n  <style>\n    p { color: teal; }\n  </style>\n</head>',
            "以內嵌 CSS 設定段落文字顏色。"),

    # 文件區段（4.3）
    element("body", "sections", "文件內容區",
            "表示文件的主要內容。",
            "一般 HTML 文件只有一個 body，包含段落、導覽、表單等頁面內容；它與描述文件資訊的 head 不同。",
            '<body>\n  <h1>語法辭典</h1>\n  <p>探索 HTML 元素。</p>\n</body>',
            "放置頁面標題與介紹文字。"),
    element("article", "sections", "獨立文章",
            "表示可獨立理解或重複使用的內容。",
            "適合文章、論壇貼文或獨立評論，通常有自己的標題；不是所有外框或卡片都必須使用 article。",
            '<article>\n  <h2>HTML 入門</h2>\n  <p>從元素與屬性開始學習。</p>\n</article>',
            "標示一篇可獨立閱讀的入門文章。"),
    element("section", "sections", "主題區段",
            "表示文件中具有共同主題的區段。",
            "通常具有標題；若只是為了樣式或排版分組而沒有區段語意，應使用 div。",
            '<section>\n  <h2>學習目標</h2>\n  <p>了解段落與連結。</p>\n</section>',
            "以標題與內容組成學習目標區段。"),
    element("nav", "sections", "導覽區域",
            "表示主要的頁面或站內導覽連結區域。",
            "可用於主選單或章節目錄；不需要把文件內每一組連結都標為 nav。",
            '<nav aria-label="主選單">\n  <a href="/">首頁</a>\n  <a href="/dictionary">語法辭典</a>\n</nav>',
            "為主選單連結提供導覽語意。"),
    element("aside", "sections", "補充內容",
            "表示與周圍內容間接相關、可獨立看待的補充內容。",
            "可用於旁註、相關資訊或側欄；語意由內容關係決定，不由它是否位於畫面側邊決定。",
            '<aside>\n  <h2>延伸閱讀</h2>\n  <a href="/guide">HTML 學習指南</a>\n</aside>',
            "提供主內容以外的延伸閱讀。"),
    element("h1", "sections", "第一級標題",
            "表示第一級的區段標題。",
            "適合文件的主要標題；標題層級應依內容結構選擇，字體大小則交給 CSS。",
            '<h1>我的語法學習筆記</h1>', "標示文件的主要標題。"),
    element("h2", "sections", "第二級標題",
            "表示第二級的區段標題。",
            "通常用於主要標題之下的章節；使用層級建立清楚的內容結構。",
            '<h1>HTML 筆記</h1>\n<h2>文字與連結</h2>', "建立主題之下的第二級章節。"),
    element("h3", "sections", "第三級標題",
            "表示第三級的區段標題。",
            "通常細分第二級章節；不應只因為預設字體大小而選用。",
            '<h2>表單</h2>\n<h3>文字輸入欄位</h3>', "細分表單章節的內容。"),
    element("h4", "sections", "第四級標題",
            "表示第四級的區段標題。",
            "通常細分第三級章節，應讓讀者能由前後標題理解層級關係。",
            '<h3>輸入驗證</h3>\n<h4>必填欄位</h4>', "在輸入驗證之下建立必填欄位子題。"),
    element("h5", "sections", "第五級標題",
            "表示第五級的區段標題。",
            "用於更深一層的內容結構；應有實際章節需要，而非單純作為小字樣式。",
            '<h4>文字欄位規則</h4>\n<h5>長度限制</h5>', "進一步細分文字欄位規則。"),
    element("h6", "sections", "第六級標題",
            "表示第六級的區段標題。",
            "是 HTML 定義中層級最深的標題元素，仍然具有標題語意。",
            '<h5>長度限制</h5>\n<h6>邊界案例</h6>', "標示深層章節中的邊界案例。"),
    element("hgroup", "sections", "標題群組",
            "將一個標題與相關副標題或標語組成群組。",
            "可包含一個 h1 至 h6，以及作為副標、替代標題或標語的 p；不是用來包住任意多個標題層級。",
            '<hgroup>\n  <h1>Syntax Atlas</h1>\n  <p>我的語法足跡</p>\n</hgroup>',
            "將網站名稱與副標題放在同一群組。"),
    element("header", "sections", "介紹標頭",
            "表示頁面或區段的介紹內容與導覽輔助。",
            "可包含標題、標誌或搜尋介面；不等於 head，也不會因為使用 header 就自動固定在畫面頂端。",
            '<header>\n  <h1>Syntax Atlas</h1>\n  <p>探索你的程式語法。</p>\n</header>',
            "建立頁面的介紹標頭。"),
    element("footer", "sections", "頁尾資訊",
            "表示所屬頁面或區段的作者、版權及相關資訊。",
            "可屬於整個頁面，也可屬於 article 等區段；不會自動定位在視窗底部。",
            '<footer>\n  <p>製作者：Riley</p>\n</footer>', "標示頁面的製作者資訊。"),
    element("address", "sections", "聯絡資訊",
            "表示最近所屬文章或文件的聯絡資訊。",
            "適合作者姓名、電子郵件或其他聯絡方式；不是任何街道地址或任意聯絡資訊都適合使用。",
            '<address>\n  作者：Riley\n  <a href="mailto:riley@example.com">聯絡作者</a>\n</address>',
            "提供這份文件作者的聯絡方式。"),

    # 內容分組（4.4）
    element("p", "grouping-content", "段落",
            "表示一個段落。",
            "通常包含文字與文字層級元素；不要為了增加視覺間距而建立空白段落，間距應交給 CSS。",
            '<p>歡迎使用 Syntax Atlas。</p>\n<p>在這裡探索程式語法。</p>',
            "使用兩個元素表示兩段文字。"),
    element("hr", "grouping-content", "主題分隔",
            "表示段落之間的主題轉換。",
            "例如故事場景或討論話題的切換，不只是裝飾線；hr 是空元素。",
            '<p>第一天的學習筆記。</p>\n<hr>\n<p>第二天開始新的練習。</p>',
            "表示兩段學習筆記之間的主題轉換。"),
    element("pre", "grouping-content", "預先格式化文字",
            "表示空白與換行具有意義的文字內容。",
            "適合程式碼或文字排版，常與 code 搭配；內容仍會被當作 HTML 解析，顯示小於符號時需適當跳脫。",
            '<pre><code>if score &gt;= 60:\n    print("passed")</code></pre>',
            "保留程式碼的換行與縮排。"),
    element("blockquote", "grouping-content", "區塊引用",
            "表示從其他來源引用的一段內容。",
            "可用 cite 屬性提供來源網址；作者或來源的署名通常放在引用內容之外。",
            '<blockquote cite="https://example.com/article">\n  <p>學習來自持續練習。</p>\n</blockquote>',
            "標示一段引用文字及其來源網址。"),
    element("ol", "grouping-content", "有序清單",
            "表示項目順序具有意義的清單。",
            "以 li 表示各項目；可透過 start、reversed 等屬性調整編號方式，而非手動把編號寫進文字。",
            '<ol>\n  <li>輸入程式碼</li>\n  <li>分析語法</li>\n  <li>儲存紀錄</li>\n</ol>',
            "列出有先後順序的操作步驟。"),
    element("ul", "grouping-content", "無序清單",
            "表示項目順序不影響意義的清單。",
            "使用 li 表示各項目；清單符號與外觀可透過 CSS 調整。",
            '<ul>\n  <li>Python</li>\n  <li>HTML</li>\n</ul>',
            "列出不要求先後順序的語言。"),
    element("menu", "grouping-content", "指令清單",
            "表示以無序清單組成的使用者操作指令。",
            "使用 li 包含按鈕等指令介面，語意上可作為工具列；外觀與操作效果仍需樣式或程式配合。",
            '<menu>\n  <li><button type="button">複製</button></li>\n  <li><button type="button">貼上</button></li>\n</menu>',
            "用指令清單表示編輯工具列；按鈕功能需另行實作。"),
    element("li", "grouping-content", "清單項目",
            "表示 ol、ul 或 menu 中的一個項目。",
            "在 ol 中可用 value 指定該項目的序號；項目也可以包含其他內容或巢狀清單。",
            '<ul>\n  <li>語法辭典</li>\n  <li>程式碼紀錄</li>\n</ul>',
            "建立清單中的兩個項目。"),
    element("dl", "grouping-content", "名稱與描述清單",
            "表示由名稱及對應描述組成的關聯清單。",
            "使用 dt 放名稱、dd 放描述；一組可有多個名稱或描述，適合詞彙解釋或中繼資訊。",
            '<dl>\n  <dt>HTML</dt>\n  <dd>用於描述網頁內容結構的標記語言。</dd>\n</dl>',
            "建立名詞與說明的對應關係。"),
    element("dt", "grouping-content", "名稱項目",
            "表示 dl 清單中的名稱或術語。",
            "與同組的 dd 描述對應；dt 本身不保證名稱是正式的定義，定義實例可另外使用 dfn。",
            '<dl>\n  <dt>作者</dt>\n  <dd>Riley</dd>\n</dl>', "以 dt 標示資訊名稱。"),
    element("dd", "grouping-content", "描述項目",
            "表示 dl 清單中名稱所對應的描述或值。",
            "通常位於同組的 dt 之後，內容可包含段落、連結或其他分組內容。",
            '<dl>\n  <dt>網站名稱</dt>\n  <dd>Syntax Atlas</dd>\n</dl>', "以 dd 提供名稱對應的值。"),
    element("figure", "grouping-content", "獨立圖文內容",
            "表示可作為一個整體引用的獨立內容。",
            "可包含圖片、圖表或程式碼，不限於圖片；可使用 figcaption 提供說明。",
            '<figure>\n  <img src="diagram.png" alt="HTML 文件結構圖">\n  <figcaption>文件結構示意圖</figcaption>\n</figure>',
            "把圖片與說明組成一個獨立內容單位。"),
    element("figcaption", "grouping-content", "圖文說明",
            "提供所屬 figure 的標題或說明。",
            "放在 figure 的第一個或最後一個子元素位置；同一個 figure 最多包含一個 figcaption。",
            '<figure>\n  <pre><code>print("Hello")</code></pre>\n  <figcaption>第一個 Python 範例</figcaption>\n</figure>',
            "為獨立呈現的程式碼加上說明。"),
    element("main", "grouping-content", "主要內容",
            "表示文件主題或核心功能的主要內容。",
            "一般頁面不應同時有多個未隱藏的 main；重複出現的站內主選單與版權資訊通常不屬於主要內容。",
            '<main>\n  <h1>語法辭典</h1>\n  <p>在這裡查閱語法說明。</p>\n</main>',
            "標示頁面的核心內容區域。"),
    element("search", "grouping-content", "搜尋區域",
            "表示用來搜尋或篩選資訊的內容區域。",
            "可以包含表單或其他搜尋操作介面；不應只因為內容是搜尋結果，就把結果列表全部包進 search。",
            '<search>\n  <form action="/dictionary">\n    <label>搜尋語法 <input type="search" name="q"></label>\n    <button type="submit">搜尋</button>\n  </form>\n</search>',
            "標示語法搜尋介面的用途。"),
    element("div", "grouping-content", "通用容器",
            "用於分組內容，本身不提供特定語意。",
            "適合搭配樣式或程式操作；若內容具有明確文章、區段或導覽用途，應優先使用相應的語意元素。",
            '<div class="profile">\n  <p>會員名稱：Riley</p>\n</div>',
            "把會員資訊放進共用容器。"),

    # 文字層級語意（4.5）
    element("a", "text-level-semantics", "超連結",
            "搭配 href 屬性建立超連結。",
            "可指向其他網頁、檔案或同頁章節；未提供 href 時，是原本可放置連結的位置，本身不構成超連結。",
            '<a href="https://html.spec.whatwg.org/">HTML 官方標準</a>',
            "建立前往 HTML 官方標準的連結。"),
    element("em", "text-level-semantics", "語氣強調",
            "表示文字的語氣強調。",
            "強調的位置會影響句子意思，不只是斜體效果；重要性應使用 strong，純粹的外觀則交給 CSS。",
            '<p>請先<em>儲存</em>再關閉頁面。</p>', "強調句子中的儲存動作。"),
    element("strong", "text-level-semantics", "重要內容",
            "表示內容的重要性、嚴肅性或急迫性。",
            "不只是粗體效果；若只是視覺上加粗，應使用 CSS。",
            '<p><strong>注意：</strong>刪除後無法復原。</p>', "突顯重要的操作提醒。"),
    element("small", "text-level-semantics", "附註小字",
            "表示附帶評論或小字資訊。",
            "適合版權、法律聲明或簡短補充；不是所有想縮小顯示的文字都適合使用。",
            '<p>訂閱電子報。</p>\n<p><small>你可以隨時取消訂閱。</small></p>',
            "提供訂閱服務的附帶說明。"),
    element("s", "text-level-semantics", "不再正確的內容",
            "表示不再準確或不再適用的內容。",
            "例如舊價格；若要標記文件修訂時刪除的內容，應使用 del。",
            '<p><s>原價 500 元</s>，現在 350 元。</p>', "標記不再適用的原價。"),
    element("cite", "text-level-semantics", "作品名稱",
            "表示作品的名稱。",
            "可用於書籍、文章、影片等作品標題；不單純代表作者姓名或一般引文。",
            '<p>我正在閱讀<cite>HTML 學習指南</cite>。</p>', "標示一本作品的名稱。"),
    element("q", "text-level-semantics", "行內引用",
            "表示嵌在其他文字中的引用內容。",
            "可用 cite 屬性記錄來源；引號通常由瀏覽器與樣式處理，不必另外在元素內重複輸入。",
            '<p>作者說：<q cite="https://example.com/guide">練習能幫助理解。</q></p>',
            "在句子中標示一段引用。"),
    element("dfn", "text-level-semantics", "術語定義",
            "標記某個術語正在被定義的實例。",
            "所在的段落、描述清單或區段應提供該術語的定義；它本身不會自動產生解釋。",
            '<p><dfn>元素</dfn>是 HTML 文件結構中的組成單位。</p>',
            "指出正在解釋的術語。"),
    element("abbr", "text-level-semantics", "縮寫",
            "表示縮寫或首字母縮略語。",
            "若提供 title，內容應是完整展開名稱；重要資訊不應只依賴滑鼠移入才看得到。",
            '<p>使用 <abbr title="Hypertext Markup Language">HTML</abbr> 建立網頁。</p>',
            "為 HTML 縮寫提供完整名稱。"),
    element("ruby", "text-level-semantics", "旁註標記",
            "將文字與其旁註組合在一起。",
            "常用於讀音或其他短註解，搭配 rt 表示註解文字，可使用 rp 提供不支援時的括號。",
            '<ruby>漢<rp>（</rp><rt>hàn</rt><rp>）</rp></ruby>',
            "為漢字加上讀音旁註。"),
    element("rt", "text-level-semantics", "旁註文字",
            "表示 ruby 中的旁註內容。",
            "例如為前面的文字提供拼音；應放在對應的 ruby 結構內。",
            '<ruby>字<rt>zì</rt></ruby>', "為文字提供讀音。"),
    element("rp", "text-level-semantics", "旁註備援括號",
            "提供無法呈現 ruby 旁註時使用的括號文字。",
            "支援 ruby 的呈現方式通常不顯示這些括號；應配合 rt 使用。",
            '<ruby>語<rp>（</rp><rt>yǔ</rt><rp>）</rp></ruby>',
            "在讀音旁註前後提供備援括號。"),
    element("data", "text-level-semantics", "機器可讀資料",
            "將可見內容與機器可讀的值建立關聯。",
            "透過 value 保存程式使用的值；日期或時間資料通常更適合使用 time。",
            '<p>商品：<data value="SKU-001">入門教材</data></p>',
            "讓商品名稱對應內部商品編號。"),
    element("time", "text-level-semantics", "日期與時間",
            "表示日期、時間或允許格式的時間長度。",
            "可用 datetime 提供機器可讀值，讓畫面文字採用適合讀者的表達方式。",
            '<p>發布日期：<time datetime="2026-11-10">2026 年 11 月 10 日</time></p>',
            "用機器可讀日期對應中文日期顯示。"),
    element("code", "text-level-semantics", "程式碼",
            "表示一段電腦程式碼。",
            "行內程式碼可直接使用；多行且需保留空白時搭配 pre，HTML 特殊字元仍需跳脫。",
            '<p>使用 <code>print("Hello")</code> 輸出文字。</p>',
            "在句子中顯示程式碼片段。"),
    element("var", "text-level-semantics", "變數",
            "表示數學或程式語境中的變數。",
            "可以是符號、參數或變數名稱；它只提供文字語意，不會宣告或執行變數。",
            '<p>長方形面積為 <var>w</var> × <var>h</var>。</p>',
            "標記公式中的寬度與高度變數。"),
    element("samp", "text-level-semantics", "程式輸出",
            "表示程式或電腦系統的輸出範例。",
            "例如終端機結果或系統訊息；與用來標記程式碼的 code 不同。",
            '<p>終端機顯示：<samp>匯入完成</samp></p>', "標記系統輸出的訊息。"),
    element("kbd", "text-level-semantics", "使用者輸入",
            "表示使用者輸入的內容。",
            "常用來標示按鍵，也可代表其他輸入方式；可巢狀表示按鍵組合。",
            '<p>按下 <kbd><kbd>Ctrl</kbd> + <kbd>S</kbd></kbd> 儲存。</p>',
            "標示儲存操作的按鍵組合。"),
    element("sub", "text-level-semantics", "下標",
            "表示具有文字或符號意義的下標。",
            "適合化學式等慣用表示方式；單純為了位置偏移的裝飾效果應使用 CSS。",
            '<p>水的化學式是 H<sub>2</sub>O。</p>', "呈現化學式中的下標。"),
    element("sup", "text-level-semantics", "上標",
            "表示具有文字或符號意義的上標。",
            "適合指數或特定慣用寫法；不應只用於任意的視覺位置調整。",
            '<p>面積單位為 m<sup>2</sup>。</p>', "呈現面積單位的上標。"),
    element("i", "text-level-semantics", "異質語氣文字",
            "表示與周圍文字不同語氣或性質的文字。",
            "例如術語、分類學名稱、心中想法或其他慣用標記；不單純等於斜體，也不代表語氣強調。",
            '<p>植物學名稱是 <i lang="la">Camellia sinensis</i>。</p>',
            "標記與中文敘述不同性質的學名。"),
    element("b", "text-level-semantics", "引起注意的文字",
            "讓文字受到注意，但不表示額外重要性或不同語氣。",
            "例如摘要中的關鍵字或評論中的商品名稱；單純粗體樣式應使用 CSS。",
            '<p>本課關鍵字：<b>元素</b>與<b>屬性</b>。</p>', "標示需要注意的關鍵字。"),
    element("u", "text-level-semantics", "非文字註記",
            "表示帶有明確呈現方式的非文字註記。",
            "例如拼字錯誤標示；不是一般的底線樣式工具，應避免與超連結外觀混淆。",
            '<p>拼字待修正：<u>recieve</u>。</p>', "標記需要更正的拼字。"),
    element("mark", "text-level-semantics", "重點標記",
            "標示在目前情境中特別相關的內容。",
            "例如搜尋命中的文字或引用內容中要指出的片段；不等於 strong 的重要性語意。",
            '<p>搜尋結果：學習 <mark>HTML</mark> 元素。</p>', "突顯搜尋命中的詞。"),
    element("bdi", "text-level-semantics", "雙向文字隔離",
            "將一段文字的方向性與周圍文字隔離。",
            "適合方向未知的使用者輸入，避免混合左右書寫方向時影響周圍標點與文字順序。",
            '<p>使用者：<bdi>علي</bdi>，歡迎回來。</p>', "隔離方向未知的使用者名稱。"),
    element("bdo", "text-level-semantics", "文字方向覆寫",
            "明確覆寫文字的呈現方向。",
            "必須使用 dir 指定 ltr 或 rtl；需要隔離而非強制改寫方向時，使用 bdi。",
            '<p><bdo dir="rtl">ABC</bdo></p>', "指定文字採用由右至左的呈現方向。"),
    element("span", "text-level-semantics", "通用文字容器",
            "將文字層級內容分組，本身不提供特定語意。",
            "常用來套用樣式、語言或程式操作；若有強調、重要性等語意，優先使用相應元素。",
            '<p>狀態：<span class="status">已儲存</span></p>', "為狀態文字建立可套用樣式的容器。"),
    element("br", "text-level-semantics", "換行",
            "表示內容中有意義的換行。",
            "適合詩句或地址中的換行，不應用多個 br 製造段落間距；br 是空元素。",
            '<p>第一行詩句<br>第二行詩句</p>', "保留詩句之間的換行。"),
    element("wbr", "text-level-semantics", "可選換行點",
            "標示瀏覽器可視需要換行的位置。",
            "不會像 br 一樣強制換行，適合較長字串；wbr 是空元素。",
            '<p>very-long-<wbr>identifier-<wbr>name</p>', "在長識別名稱中提供換行機會。"),

    # 編輯標記（4.7）
    element("ins", "edits", "新增內容",
            "表示文件修訂中加入的內容。",
            "可用 datetime 記錄修訂時間，或 cite 提供變更說明網址；不是單純的底線效果。",
            '<p>目前支援 Python<ins datetime="2026-11-10"> 與 HTML</ins>。</p>',
            "標記新增的語言支援說明。"),
    element("del", "edits", "刪除內容",
            "表示文件修訂中移除的內容。",
            "可用 datetime 或 cite 說明修訂；僅表示內容不再正確而非修訂刪除時，可使用 s。",
            '<p><del>僅支援 Python</del><ins>支援 Python 與 HTML</ins></p>',
            "對照文件修訂前後的內容。"),

    # 嵌入內容（4.8）
    element("picture", "embedded-content", "圖片來源群組",
            "為 img 提供依條件選擇的圖片來源。",
            "透過 source 的 media 或 type 等條件選擇資源，仍需 img 提供圖片本體與替代文字。",
            '<picture>\n  <source media="(min-width: 800px)" srcset="wide.jpg">\n  <img src="small.jpg" alt="山景">\n</picture>',
            "依可用寬度選擇山景圖片來源。"),
    element("source", "embedded-content", "媒體來源",
            "為 picture、audio 或 video 提供可選的來源。",
            "在 picture 中使用 srcset，在音訊或影片中通常使用 src；source 本身不是播放器，是空元素。",
            '<audio controls>\n  <source src="lesson.ogg" type="audio/ogg">\n  <source src="lesson.mp3" type="audio/mpeg">\n</audio>',
            "提供同一音訊的不同格式來源。"),
    element("img", "embedded-content", "圖片",
            "將圖片嵌入文件。",
            "通常以 src 指定資源，以 alt 提供替代文字；純裝飾圖片可使用空 alt。img 是空元素。",
            '<img src="diagram.png" alt="由 head 與 body 組成的 HTML 文件結構" width="640" height="360">',
            "嵌入圖片，提供替代文字與尺寸。"),
    element("iframe", "embedded-content", "內嵌頁面",
            "在目前文件內嵌入另一個頁面。",
            "可用 src 指定網址，title 說明用途；sandbox 可限制內嵌內容能力。外部頁面可能禁止被嵌入。",
            '<iframe src="/preview" title="教學預覽" sandbox></iframe>',
            "嵌入受 sandbox 限制的教學預覽頁面。"),
    element("embed", "embedded-content", "外部內容嵌入",
            "提供外部應用程式或互動內容的嵌入位置。",
            "透過 src 與 type 描述資源，實際支援取決於瀏覽器與內容類型；embed 是空元素。",
            '<embed src="guide.pdf" type="application/pdf" width="600" height="400">',
            "提供 PDF 內嵌顯示的位置，實際呈現視瀏覽器支援而定。"),
    element("object", "embedded-content", "外部資源物件",
            "嵌入外部資源，並可提供備援內容。",
            "使用 data 指定資源、type 描述格式；無法使用該資源時，可呈現元素內的備援內容。",
            '<object data="guide.pdf" type="application/pdf">\n  <a href="guide.pdf">下載 PDF 指南</a>\n</object>',
            "嵌入 PDF，並提供下載連結作為備援。"),
    element("video", "embedded-content", "影片",
            "在文件中提供影片播放內容。",
            "可使用 controls 顯示控制介面、poster 指定封面，並以 track 提供字幕；自動播放可能受瀏覽器限制。",
            '<video controls width="640" poster="cover.jpg">\n  <source src="lesson.mp4" type="video/mp4">\n  <track kind="captions" src="captions.vtt" srclang="zh-Hant" label="繁體中文">\n</video>',
            "提供有控制介面、封面與字幕軌的影片。"),
    element("audio", "embedded-content", "音訊",
            "在文件中提供音訊播放內容。",
            "可直接使用 src 或列出 source，controls 可顯示播放介面；實際格式支援與自動播放政策取決於瀏覽器。",
            '<audio controls src="lesson.mp3">\n  <a href="lesson.mp3">下載音訊</a>\n</audio>',
            "提供音訊播放器及不支援 audio 時的備援連結。"),
    element("track", "embedded-content", "文字軌",
            "為音訊或影片提供字幕、標題或其他定時文字資料。",
            "通常使用 WebVTT 檔案，透過 kind、srclang、label 指定種類、語言與名稱；track 是空元素。",
            '<video controls src="lesson.mp4">\n  <track kind="subtitles" src="zh.vtt" srclang="zh-Hant" label="繁體中文" default>\n</video>',
            "為影片指定預設字幕軌。"),
    element("map", "embedded-content", "影像地圖",
            "定義圖片中的可互動區域集合。",
            "以 name 命名，供 img 的 usemap 引用，並使用 area 描述各區域。",
            '<img src="map.png" alt="樓層配置圖" usemap="#floor">\n<map name="floor">\n  <area shape="rect" coords="0,0,100,100" href="/room-a" alt="A 教室">\n</map>',
            "將圖片的一個矩形區域連到教室頁面。"),
    element("area", "embedded-content", "影像熱區",
            "定義影像地圖中的區域與連結。",
            "放在 map 內，以 shape、coords 描述範圍，連結區域需提供適當 alt；area 是空元素。",
            '<img src="campus.png" alt="校園地圖" usemap="#campus">\n<map name="campus">\n  <area shape="circle" coords="80,80,30" href="/library" alt="圖書館">\n</map>',
            "為校園地圖中的圖書館建立圓形連結熱區。"),

    # 表格資料（4.9）
    element("table", "tabular-data", "資料表格",
            "表示以列與欄組織的資料。",
            "使用 tr、th、td 建立內容，可加上 caption 與列群組；表格不應只用來排版整個網頁。",
            '<table>\n  <caption>語法使用次數</caption>\n  <tr><th scope="col">語法</th><th scope="col">次數</th></tr>\n  <tr><td>div</td><td>3</td></tr>\n</table>',
            "使用表格呈現語法與次數的對應。"),
    element("caption", "tabular-data", "表格標題",
            "為所屬 table 提供標題。",
            "通常是 table 的第一個子元素，可協助使用者理解表格主題；不同於 figure 的 figcaption。",
            '<table>\n  <caption>學習進度</caption>\n  <tr><th scope="col">語言</th><th scope="col">狀態</th></tr>\n  <tr><td>HTML</td><td>練習中</td></tr>\n</table>',
            "為學習進度表提供標題。"),
    element("colgroup", "tabular-data", "表格欄群組",
            "表示表格中一組欄位。",
            "可包含 col，或在沒有 col 子元素時用 span 指定欄數；它定義欄群組，不建立資料儲存格。",
            '<table>\n  <colgroup><col class="name"><col class="count"></colgroup>\n  <tr><th scope="col">語法</th><th scope="col">次數</th></tr>\n  <tr><td>p</td><td>2</td></tr>\n</table>',
            "將表格欄位分組以便套用支援的欄樣式。"),
    element("col", "tabular-data", "表格欄",
            "表示 colgroup 中的一個或多個欄位。",
            "可用 span 表示連續欄數；不建立資料內容，也不是所有 CSS 屬性都能套用到欄。col 是空元素。",
            '<table>\n  <colgroup><col span="2" class="summary-columns"></colgroup>\n  <tr><td>HTML</td><td>完成</td></tr>\n</table>',
            "為前兩欄設定共用欄定義。"),
    element("tbody", "tabular-data", "表格資料列群組",
            "將表格中的主要資料列分成群組。",
            "包含 tr，與 thead 的標題列及 tfoot 的彙總列區分；一張表格可有多個 tbody。",
            '<table>\n  <thead><tr><th scope="col">語法</th></tr></thead>\n  <tbody><tr><td>div</td></tr><tr><td>p</td></tr></tbody>\n</table>',
            "將語法資料列組成表格主體。"),
    element("thead", "tabular-data", "表格標題列群組",
            "將表格中作為欄標題的列組成群組。",
            "通常包含使用 th 的 tr，放在主要資料列之前；不應只為了讓某列變粗體而使用。",
            '<table>\n  <thead><tr><th scope="col">名稱</th><th scope="col">次數</th></tr></thead>\n  <tbody><tr><td>p</td><td>2</td></tr></tbody>\n</table>',
            "為資料欄位建立標題列。"),
    element("tfoot", "tabular-data", "表格彙總列群組",
            "將表格中的彙總或結尾資料列組成群組。",
            "適合總計等資料，包含 tr，放在主要資料列群組之後。",
            '<table>\n  <tbody><tr><td>HTML</td><td>3</td></tr></tbody>\n  <tfoot><tr><th scope="row">合計</th><td>3</td></tr></tfoot>\n</table>',
            "在表格結尾提供合計資料。"),
    element("tr", "tabular-data", "表格列",
            "表示表格中的一列儲存格。",
            "使用 th 或 td 建立該列的儲存格，通常放在 thead、tbody 或 tfoot 中。",
            '<table>\n  <tbody>\n    <tr><td>Python</td><td>5</td></tr>\n    <tr><td>HTML</td><td>3</td></tr>\n  </tbody>\n</table>',
            "建立兩筆列資料。"),
    element("td", "tabular-data", "資料儲存格",
            "表示表格列中的資料儲存格。",
            "可用 colspan 或 rowspan 跨欄、跨列；標題儲存格應使用 th。",
            '<table>\n  <tr><th scope="row">語言</th><td>HTML</td></tr>\n</table>',
            "在列標題旁放置資料值。"),
    element("th", "tabular-data", "標題儲存格",
            "表示表格中的列或欄標題儲存格。",
            "可用 scope 指明標題適用的列或欄，複雜表格可用 headers 建立關聯；不只是粗體的 td。",
            '<table>\n  <tr><th scope="col">語法</th><th scope="col">次數</th></tr>\n  <tr><th scope="row">div</th><td>3</td></tr>\n</table>',
            "分別標示欄標題與列標題。"),

    # 表單（4.10）
    element("form", "forms", "表單",
            "將可提交的輸入控制項組成表單。",
            "使用 action、method 等描述提交方式；欄位通常需要 name 才能隨表單提交，form 不可巢狀。",
            '<form action="/search" method="get">\n  <label>關鍵字 <input name="q"></label>\n  <button type="submit">搜尋</button>\n</form>',
            "將關鍵字以 GET 表單提交。"),
    element("label", "forms", "欄位標籤",
            "為可標記的表單控制項提供文字標籤。",
            "可用 for 對應控制項的 id，或直接包住控制項；它與輸入框中的 placeholder 用途不同。",
            '<label for="nickname">暱稱</label>\n<input id="nickname" name="nickname">',
            "以 for 與 id 建立暱稱欄位的標籤關聯。"),
    element("input", "forms", "輸入控制項",
            "依 type 提供文字、核取方塊及其他輸入功能。",
            "各類型可用的屬性與行為不同；用 name 指定提交名稱、label 提供標籤。input 是空元素。",
            '<label for="email">Email</label>\n<input id="email" name="email" type="email" autocomplete="email" required>',
            "建立有標籤、必填且使用 Email 輸入型別的欄位。"),
    element("button", "forms", "按鈕",
            "表示可由使用者啟動操作的按鈕。",
            "在表單內應明確指定 type，避免非提交用途的按鈕意外提交；自訂操作仍需程式處理。",
            '<button type="button">分析程式碼</button>', "建立不會自動提交表單的操作按鈕。"),
    element("select", "forms", "選擇控制項",
            "讓使用者從選項清單選取值。",
            "通常包含 option，也可透過 optgroup 分組；multiple 允許多選，name 決定提交名稱。",
            '<label for="language">語言</label>\n<select id="language" name="language">\n  <option value="python">Python</option>\n  <option value="html">HTML</option>\n</select>',
            "建立程式語言選單。"),
    element("datalist", "forms", "輸入建議清單",
            "為輸入控制項提供建議值。",
            "用 id 與 input 的 list 建立關聯；建議清單通常不限制使用者只能輸入列出的值。",
            '<label>語言 <input name="language" list="languages"></label>\n<datalist id="languages">\n  <option value="Python"></option>\n  <option value="HTML"></option>\n</datalist>',
            "為文字輸入提供語言名稱建議。"),
    element("optgroup", "forms", "選項群組",
            "將 select 中的 option 分組。",
            "使用 label 為群組命名，disabled 可停用整組選項；不應巢狀放置 optgroup。",
            '<label>技術\n  <select name="technology">\n    <optgroup label="標記語言"><option value="html">HTML</option></optgroup>\n    <optgroup label="程式語言"><option value="python">Python</option></optgroup>\n  </select>\n</label>',
            "把選項依技術類型分組。"),
    element("option", "forms", "選項",
            "表示 select 或 datalist 中的一個選項。",
            "value 可指定對應值；在 select 中可使用 selected 指定初始選取狀態。",
            '<label>語言\n  <select name="language">\n    <option value="python">Python</option>\n    <option value="html" selected>HTML</option>\n  </select>\n</label>',
            "預設選取 HTML 選項。"),
    element("textarea", "forms", "多行文字欄位",
            "讓使用者輸入多行純文字。",
            "初始值寫在開始與結束標籤之間，不使用 value 屬性；其中的文字不作為 HTML 子元素呈現。",
            '<label for="notes">學習筆記</label>\n<textarea id="notes" name="notes" rows="4">今天學習 HTML。</textarea>',
            "建立有初始內容的多行筆記欄位。"),
    element("output", "forms", "計算或操作結果",
            "表示計算或使用者操作所得到的結果。",
            "可用 for 列出相關控制項 id，但元素本身不會自動執行計算；需由程式更新結果。",
            '<label for="amount">數量</label>\n<input id="amount" type="number" value="2">\n<output for="amount">總額 200 元</output>',
            "標示與數量輸入相關的結果；數值更新需另行實作。"),
    element("progress", "forms", "工作進度",
            "表示工作目前的完成進度。",
            "使用 value 與 max 描述進度；沒有 value 時代表進度不確定，固定範圍的測量值則適合 meter。",
            '<label for="upload">上傳進度</label>\n<progress id="upload" value="30" max="100">30%</progress>',
            "表示上傳工作完成百分之三十。"),
    element("meter", "forms", "範圍測量值",
            "表示已知範圍內的測量值或比例。",
            "可用 min、max、low、high、optimum 描述範圍及理想值；不應用來表示工作的完成進度。",
            '<label for="storage">儲存空間使用量</label>\n<meter id="storage" min="0" max="100" value="65">65%</meter>',
            "表示已知容量範圍內的使用比例。"),
    element("fieldset", "forms", "表單欄位群組",
            "將相關表單控制項組成群組。",
            "通常以第一個 legend 提供群組名稱；disabled 可停用群組中的多數控制項。",
            '<fieldset>\n  <legend>聯絡方式</legend>\n  <label>Email <input name="email" type="email"></label>\n</fieldset>',
            "把聯絡欄位組成具名稱的群組。"),
    element("legend", "forms", "表單群組標題",
            "為所屬 fieldset 提供群組標題。",
            "放在 fieldset 的第一個子元素位置，協助使用者理解這組控制項的共同用途。",
            '<fieldset>\n  <legend>偏好語言</legend>\n  <label><input type="checkbox" name="language" value="html">HTML</label>\n</fieldset>',
            "以 legend 說明核取方塊群組的用途。"),
    element("selectedcontent", "forms", "目前選取內容",
            "反映 select 中目前所選 option 的內容。",
            "用於可自訂 select 的第一個子 button，讓按鈕以宣告式呈現選取內容；實際呈現依瀏覽器支援而定。",
            '<label for="custom-language">語言</label>\n<select id="custom-language" name="language">\n  <button><selectedcontent></selectedcontent></button>\n  <option value="python">Python</option>\n  <option value="html">HTML</option>\n</select>',
            "示範可自訂選單中的目前選取內容，需瀏覽器支援此功能。"),

    # 互動元素（4.11）
    element("details", "interactive-elements", "可展開內容",
            "提供使用者可展開或收合的補充內容。",
            "通常以第一個 summary 作為標題，open 表示初始展開；適合揭露式說明，不等於所有類型的互動控制項。",
            '<details>\n  <summary>什麼是 HTML？</summary>\n  <p>HTML 用於描述網頁內容結構。</p>\n</details>',
            "建立可由使用者展開的解釋。"),
    element("summary", "interactive-elements", "展開區塊標題",
            "提供所屬 details 的標題或摘要。",
            "作為 details 的第一個子元素時，通常是使用者切換展開狀態的操作位置。",
            '<details open>\n  <summary>學習提示</summary>\n  <p>從常見元素開始練習。</p>\n</details>',
            "為預設展開的說明區塊提供標題。"),
    element("dialog", "interactive-elements", "對話框",
            "表示對話框或其他需要使用者互動的獨立視窗。",
            "可用 showModal() 開啟模態對話框；單純加上 open 是非模態顯示，不會自動產生背景遮罩或模態行為。",
            '<dialog open aria-labelledby="notice-title">\n  <h2 id="notice-title">操作提示</h2>\n  <p>請確認輸入內容。</p>\n  <form method="dialog"><button>關閉</button></form>\n</dialog>',
            "顯示非模態對話框，使用 method=dialog 的表單關閉它。"),

    # 指令碼與範本（4.12）；canvas 依官方分類列在本組。
    element("script", "scripting", "指令碼或資料區塊",
            "嵌入或引用指令碼，也可承載指定型別的資料。",
            "type 決定模組、資料區塊等用途，src 可引用外部指令碼；本次 HTML 分析不解析或執行其中的 JavaScript。",
            '<script type="module" src="/app.js"></script>',
            "引用外部 JavaScript 模組；分析工具只讀取標記，不執行指令碼。"),
    element("noscript", "scripting", "停用指令碼時的內容",
            "在指令碼停用等指定條件下提供替代內容。",
            "內容的解析與允許寫法會受到所在位置及指令碼啟用狀態影響；它不是偵測某支指令碼執行失敗的工具。",
            '<noscript>\n  <p>互動功能需要啟用 JavaScript。</p>\n</noscript>',
            "為停用 JavaScript 的使用者提供提示。"),
    element("template", "scripting", "內容範本",
            "保存可供之後使用的 HTML 範本內容。",
            "一般範本內容不會像普通頁面內容立即呈現，通常由程式複製使用；特定屬性也能用於宣告式 Shadow DOM。",
            '<template id="syntax-card">\n  <article><h2>語法名稱</h2><p>語法說明</p></article>\n</template>',
            "保存日後可複製的語法卡片範本。"),
    element("slot", "scripting", "Shadow DOM 插槽",
            "在 Shadow DOM 中指定承接外部內容的位置。",
            "name 可建立具名插槽，沒有分配內容時可使用元素內的備援文字；單獨放在一般頁面中不會自動建立 Shadow DOM。",
            '<div>\n  <template shadowrootmode="open">\n    <p>您好，<slot name="username">訪客</slot>。</p>\n  </template>\n  <span slot="username">Riley</span>\n</div>',
            "在支援宣告式 Shadow DOM 的瀏覽器中，將外部名稱分配到具名插槽。"),
    element("canvas", "scripting", "繪圖畫布",
            "提供可由程式繪製點陣圖的畫布與備援內容。",
            "width 與 height 設定繪圖尺寸，實際繪圖通常需要 JavaScript；元素內可放適合用途的備援內容。",
            '<canvas id="chart" width="400" height="200">\n  <p>語法使用統計圖；也可查閱下方文字統計。</p>\n</canvas>',
            "建立繪圖區域及備援說明，實際圖形需另外繪製。"),
]


def sql_value(value):
    # 使用 UTF-8 十六進位字串，避免引號與換行破壞 SQL。
    if value is None:
        return "NULL"

    encoded = str(value).encode("utf-8").hex()
    return f"CONVERT(X'{encoded}' USING utf8mb4)"


def build_statements(snapshot):
    """產生 HTML 專屬的資料更新，不修改其他語言或未列入清單的項目。"""
    official_elements = {}

    for element in snapshot["elements"]:
        tag = element["tag"]

        if tag in official_elements:
            raise ValueError(f"官方快照出現重複元素：{tag}")

        official_elements[tag] = element

    defined_tags = [item["tag"] for item in HTML_SYNTAXES]
    if len(defined_tags) != len(set(defined_tags)):
        raise ValueError("語法整理清單有重複元素。")

    missing = set(official_elements) - set(defined_tags)
    extra = set(defined_tags) - set(official_elements)
    if missing or extra:
        raise ValueError(
            "官方快照與整理清單不同，請先核對後再產生 SQL。"
            f"尚未整理：{sorted(missing)}；快照中不存在：{sorted(extra)}"
        )

    if snapshot.get("element_count") != len(official_elements):
        raise ValueError("官方快照的元素數量與內容不一致。")

    source_version = snapshot["source_version"]
    if not isinstance(source_version, str) or not source_version.strip() or len(source_version) > 50:
        raise ValueError("來源版本必須是 1～50 字元的文字。")

    fetched = datetime.fromisoformat(snapshot["source_fetched_at"])
    if fetched.tzinfo is None or fetched.utcoffset() is None:
        raise ValueError("官方快照的擷取時間必須包含時區。")

    fetched_at = (
        fetched
        .astimezone(timezone.utc)
        .strftime("%Y-%m-%d %H:%M:%S")
    )

    statements = ["SET NAMES utf8mb4;"]

    # HTML 分類與 Python 分開，不會覆蓋 Python 分類。
    for slug, (name, order) in CATEGORIES.items():
        statements.append(
            f"""
            INSERT INTO syntax_categories (
                language, slug, name, display_order
            )
            VALUES (
                'html',
                {sql_value(slug)},
                {sql_value(name)},
                {order}
            )
            ON DUPLICATE KEY UPDATE
                name = {sql_value(name)},
                display_order = {order};
            """
        )

    seen_tags = set()

    for item in HTML_SYNTAXES:
        tag = item["tag"]

        if tag in seen_tags:
            raise ValueError(f"語法整理清單出現重複元素：{tag}")

        seen_tags.add(tag)

        if tag not in official_elements:
            raise ValueError(f"官方快照中找不到元素：{tag}")

        if item["category"] not in CATEGORIES:
            raise ValueError(f"尚未定義分類：{item['category']}")

        if not re.fullmatch(r"[a-z][a-z0-9]*", tag):
            raise ValueError(f"無效的元素名稱：{tag}")

        for field in (
            "display_label", "summary", "description",
            "example_code", "example_description",
        ):
            if not isinstance(item[field], str) or not item[field].strip():
                raise ValueError(f"元素 {tag} 缺少有效內容：{field}")

        if len(item["summary"]) > 500 or len(item["display_label"]) > 100:
            raise ValueError(f"元素 {tag} 的摘要或中文名稱超過資料表限制。")

        source = official_elements[tag]
        if not isinstance(source["source_url"], str) or not source["source_url"].strip() or len(source["source_url"]) > 1000:
            raise ValueError(f"元素 {tag} 的官方來源網址不正確。")

        statements.append(
            f"""
            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = {sql_value(item["category"])}
            );
            """
        )

        fields = {
            "slug": f"element-{tag}",
            "name": f"<{tag}>",
            "display_label": item["display_label"],
            "summary": item["summary"],
            "description": item["description"],
            "example_code": item["example_code"],
            "example_description": item["example_description"],
            "sort_key": tag,
            "source_url": source["source_url"],
            "source_version": source_version,
            "source_fetched_at": fetched_at,
        }

        columns = ", ".join(fields)
        values = ", ".join(
            sql_value(value)
            for value in fields.values()
        )
        updates = ",\n".join(
            f"{key} = {sql_value(value)}"
            for key, value in fields.items()
            if key != "slug"
        )

        # 同分類、同 slug 更新內容，保留既有語法 ID。
        statements.append(
            f"""
            INSERT INTO syntaxes (
                category_id, {columns}, is_active
            )
            VALUES (
                @category_id, {values}, 1
            )
            ON DUPLICATE KEY UPDATE
                {updates},
                is_active = 1;
            """
        )

        statements.append(
            f"""
            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = {sql_value(fields["slug"])}
            );
            """
        )

        # 只更新此項目的規則：一種標籤對應一筆語法。
        # 關閉標籤、文字、屬性、DOCTYPE 與註解不建立額外的 tag_name 規則。
        # 開始標籤及 <br /> 等寫法的實際計數，在 analyzer_html.py 處理。
        statements.append(
            """
            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            """
        )

        statements.append(
            f"""
            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                {sql_value(tag)},
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            """
        )

    return statements


def generate(filename):
    if not re.fullmatch(r"\d{3,}_[A-Za-z0-9_]+\.sql", filename):
        raise ValueError("請使用例如 007_html_elements.sql 的檔名，不要包含資料夾路徑。")

    number = int(filename.split("_", 1)[0])
    if MIGRATIONS_DIR.exists():
        for existing in MIGRATIONS_DIR.iterdir():
            match = re.fullmatch(r"(\d{3,})_[A-Za-z0-9_]+\.(sql|py)", existing.name)
            if match and int(match[1]) == number:
                raise ValueError(f"migration 編號已使用：{existing.name}，請選擇新編號。")

    snapshot = json.loads(
        SNAPSHOT_PATH.read_text(encoding="utf-8")
    )

    statements = build_statements(snapshot)

    MIGRATIONS_DIR.mkdir(parents=True, exist_ok=True)
    output_path = MIGRATIONS_DIR / filename

    # 已產生的 migration 不覆寫；後續更新使用新的編號。
    with output_path.open(
        "x",
        encoding="utf-8",
        newline="\n",
    ) as file:
        file.write("-- syntax-atlas generated migration v1\n")
        file.write(
            f"-- Migration: {filename}; no member records included.\n"
        )
        file.write(
            SEPARATOR + SEPARATOR.join(statements) + "\n"
        )

    print(f"已產生：{output_path}")
    print(f"來源版本：{snapshot['source_version']}")
    print(f"包含 {len(HTML_SYNTAXES)} 個 HTML 元素、每項一條 tag_name 辨識規則。")
    print("尚未修改資料庫。")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("command", choices=["generate"])
    parser.add_argument(
        "--filename",
        required=True,
        help="新的 migration SQL 檔名",
    )
    args = parser.parse_args()

    generate(args.filename)


if __name__ == "__main__":
    main()
