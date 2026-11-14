"""整理 CSS 辭典內容與辨識規則；generate 只產生 SQL，不連線資料庫。

check 核對官方快照、來源與欄位；實際解析及計次由 analyzer_css.py 負責。
中文說明與範例自行整理，不直接把整段官方規範匯入辭典。

已確認的計次原則：
1. 依原始碼實際寫出的屬性宣告計次，不把簡寫展開成長寫再加算。
2. 選擇器逐個組成計次，包含 :is() 等函式內實際寫出的選擇器。
3. --brand、--spacing 等自訂屬性宣告合併為 --*；var() 引用不在本項計次。
4. var() 每個呼叫各計一次，包含備援值中的巢狀呼叫。
其他屬性值、單位與一般 CSS 函式未另列項；描述符不是一般元素屬性宣告。
"""

import argparse
import json
import re
from collections import Counter
from datetime import datetime, timezone
from pathlib import Path
from urllib.parse import urldefrag, urlsplit


ROOT = Path(__file__).resolve().parent
SNAPSHOT_PATH = ROOT / "data" / "css" / "syntaxes.json"
MIGRATIONS_DIR = ROOT / "database" / "migrations"
SEPARATOR = "\n-- @statement\n"

# 分類代碼固定；日後增加語法不必變動既有語法的分類與 ID。
CATEGORIES = {
    "properties": ("屬性", 10),
    "selectors": ("選擇器", 20),
    "at-rules": ("At-rules", 30),
    "functions": ("函式", 40),
}


def syntax(category, slug, name, label, summary, details, example,
           explanation, rule_type, match_value, *, source_name=None,
           source_url=None, aliases=()):
    return {
        "category": category,
        "slug": slug,
        "name": name,
        "display_label": label,
        "summary": summary,
        "description": summary + details,
        "example_code": example,
        "example_description": explanation,
        "rule_type": rule_type,
        "match_value": match_value,
        "source_name": source_name if source_name is not None else name,
        "source_url": source_url,
        "aliases": aliases,
    }


def property_syntax(name, label, summary, details, value):
    return syntax(
        "properties", f"property-{name}", name, label, summary, details,
        f".example {{\n  {name}: {value};\n}}",
        f"在 .example 的樣式規則中設定「{label}」。",
        "property_name", name,
    )


# 第一版收錄常見標準屬性；不把索引中的所有實驗、舊版及廠商項目公開。
# 每列依序為名稱、中文名稱、摘要、補充說明、範例值。
PROPERTY_DATA = [
    ("display", "顯示與排版模式", "設定元素產生的盒子及其子元素的排版方式。", "常見值包含 block、inline、flex、grid 與 none；none 會使元素不產生排版盒子。", "flex"),
    ("position", "定位方式", "設定元素採用的定位方式。", "常見值包含 static、relative、absolute、fixed 與 sticky；定位偏移可搭配 top、right、bottom、left。", "relative"),
    ("top", "頂端偏移", "設定定位元素的頂端偏移或限制。", "實際效果取決於 position；對 static 定位的元素不產生定位偏移效果。", "12px"),
    ("right", "右側偏移", "設定定位元素的右側偏移或限制。", "常用於 absolute、fixed 或 sticky 定位。", "12px"),
    ("bottom", "底端偏移", "設定定位元素的底端偏移或限制。", "它是定位偏移，不是元素的外邊距。", "12px"),
    ("left", "左側偏移", "設定定位元素的左側偏移或限制。", "可使用長度、百分比或 auto；實際效果依定位方式而定。", "12px"),
    ("inset", "四邊定位偏移", "以簡寫設定 top、right、bottom、left。", "可提供一到四個值；四個值依上、右、下、左的順序指定。", "0"),
    ("z-index", "堆疊層級", "設定元素在相關堆疊情境中的堆疊層級。", "數值只能在其所屬的堆疊情境中比較；並非數值越大就一定蓋過整個頁面的其他元素。", "10"),
    ("width", "寬度", "設定元素的寬度。", "寬度的計算範圍會受 box-sizing 影響，也可使用百分比與 auto。", "240px"),
    ("height", "高度", "設定元素的高度。", "百分比高度的解析會受包含區塊的尺寸是否確定等條件影響。", "120px"),
    ("min-width", "最小寬度", "設定元素寬度的下限。", "常搭配可伸縮版面，避免內容區域縮得太窄。", "160px"),
    ("max-width", "最大寬度", "設定元素寬度的上限。", "常搭配 width: 100% 建立可縮小且有最大寬度的容器。", "1200px"),
    ("min-height", "最小高度", "設定元素高度的下限。", "內容較多時元素仍可繼續長高；它與固定 height 的效果不同。", "200px"),
    ("max-height", "最大高度", "設定元素高度的上限。", "內容溢出時，可再搭配 overflow 決定如何顯示。", "400px"),
    ("box-sizing", "盒模型尺寸計算", "設定 width 與 height 是否包含內邊距和邊框。", "border-box 將內邊距與邊框包含在指定尺寸內；content-box 以內容區計算。", "border-box"),
    ("aspect-ratio", "寬高比例", "設定盒子的偏好寬高比例。", "常用於至少一個尺寸由自動計算決定的版面，例如維持影片或卡片比例。", "16 / 9"),
    ("margin", "外邊距", "設定元素邊框外側的空間。一個值套用四邊；兩個值依序為「上下、左右」；三個值為「上、左右、下」；四個值為「上、右、下、左」，依順時針排列。", "在適用的版面條件下，左右 auto 外邊距可用於置中。", "8px 20px 16px 12px"),
    ("margin-top", "上外邊距", "設定元素上方的外邊距。", "部分區塊排版中的垂直外邊距會發生摺疊。", "16px"),
    ("margin-right", "右外邊距", "設定元素右方的外邊距。", "外邊距位於邊框以外，不屬於元素的背景繪製區。", "16px"),
    ("margin-bottom", "下外邊距", "設定元素下方的外邊距。", "可用於安排相鄰內容的垂直間隔。", "24px"),
    ("margin-left", "左外邊距", "設定元素左方的外邊距。", "可使用長度、百分比或 auto。", "16px"),
    ("margin-inline", "行內方向外邊距", "設定行內方向起點與終點的外邊距。", "對應方向由書寫模式與文字方向決定，不固定等同左與右。", "auto"),
    ("margin-block", "區塊方向外邊距", "設定區塊方向起點與終點的外邊距。", "一般橫向書寫時通常對應上與下。", "16px"),
    ("padding", "內邊距", "設定元素內容與邊框之間的空間。一個值套用四邊；兩個值依序為「上下、左右」；三個值為「上、左右、下」；四個值為「上、右、下、左」，依順時針排列。", "內邊距不接受負值。", "8px 20px 16px 12px"),
    ("padding-top", "上內邊距", "設定內容上方的內邊距。", "內邊距位於邊框以內，通常會顯示元素背景。", "12px"),
    ("padding-right", "右內邊距", "設定內容右方的內邊距。", "可使用長度或百分比。", "20px"),
    ("padding-bottom", "下內邊距", "設定內容下方的內邊距。", "常用於增加文字與容器底部的距離。", "12px"),
    ("padding-left", "左內邊距", "設定內容左方的內邊距。", "常用於調整容器內文字的水平起始位置。", "20px"),
    ("padding-inline", "行內方向內邊距", "設定行內方向兩端的內邊距。", "可提供一個值設定兩端，或兩個值分別設定起點與終點。", "20px"),
    ("padding-block", "區塊方向內邊距", "設定區塊方向兩端的內邊距。", "一般橫向書寫時通常對應上與下。", "12px"),
    ("overflow", "溢出內容處理", "設定內容超出盒子時的顯示與捲動方式。", "常見值包含 visible、hidden、clip、scroll 與 auto。", "auto"),
    ("overflow-x", "水平溢出處理", "設定水平方向溢出內容的處理方式。", "可用於程式碼範例的水平捲動區。", "auto"),
    ("overflow-y", "垂直溢出處理", "設定垂直方向溢出內容的處理方式。", "通常搭配受限高度建立垂直捲動區。", "auto"),
    ("visibility", "可見性", "設定元素盒子的可見狀態。", "hidden 通常保留原有排版空間；display: none 則不產生排版盒子。", "hidden"),
    ("opacity", "不透明度", "設定元素及其內容整體的不透明程度。", "0 表示完全透明，1 表示完全不透明；它不會自動取消元素的互動。", "0.8"),
    ("color", "文字前景色", "設定文字等前景內容使用的顏色。", "也提供 currentColor 的顏色來源，可使用色名、十六進位與色彩函式等寫法。", "#24545a"),
    ("background", "背景簡寫", "以簡寫設定背景色、背景圖及其他背景屬性。", "簡寫會同時設定相關的長寫屬性；未提供的部分通常回到初始值。", "#f6f7f5"),
    ("background-color", "背景色", "設定元素的背景顏色。", "背景色繪製於背景圖片下方。", "#f6f7f5"),
    ("background-image", "背景圖片", "設定一層或多層背景圖片。", "可使用 url() 或漸層函式，多層背景以逗號分隔。", "linear-gradient(to right, teal, white)"),
    ("background-size", "背景圖片尺寸", "設定背景圖片的尺寸。", "cover 會填滿區域且可能裁切；contain 會完整容納圖片。", "cover"),
    ("background-position", "背景圖片位置", "設定背景圖片在背景定位區域中的位置。", "可使用 center 等關鍵字，或長度、百分比指定。", "center"),
    ("background-repeat", "背景圖片重複", "設定背景圖片是否及如何重複。", "no-repeat 只繪製單份圖片。", "no-repeat"),
    ("border", "邊框簡寫", "以簡寫設定四邊邊框的寬度、樣式與顏色。", "若沒有可見的邊框樣式，單獨設定寬度不一定會出現邊框。", "1px solid #daddd9"),
    ("border-width", "邊框寬度", "設定四個方向的邊框寬度。", "可提供一到四個值，實際顯示仍需搭配邊框樣式。", "1px"),
    ("border-style", "邊框樣式", "設定邊框的線條樣式。", "常見值包含 solid、dashed、dotted 與 none。", "solid"),
    ("border-color", "邊框顏色", "設定四個方向的邊框顏色。", "可提供一到四個值；未明確指定顏色時常使用 currentColor。", "#daddd9"),
    ("border-top", "上邊框", "以簡寫設定上方邊框的寬度、樣式與顏色。", "適合製作分隔線或區塊頂部的裝飾。", "3px solid #c5a454"),
    ("border-right", "右邊框", "以簡寫設定右方邊框。", "常用於側欄與主要內容之間的分隔。", "1px solid #daddd9"),
    ("border-bottom", "下邊框", "以簡寫設定下方邊框。", "常用於頁籤底線或列表分隔線。", "1px solid #daddd9"),
    ("border-left", "左邊框", "以簡寫設定左方邊框。", "可作為說明區塊左側的襯線。", "3px solid #c5a454"),
    ("border-radius", "邊框圓角", "設定盒子各個角落的圓角半徑。", "可使用長度或百分比；也能以斜線分別指定水平與垂直半徑。", "6px"),
    ("box-shadow", "盒子陰影", "為盒子加入外陰影或內陰影。", "可設定偏移、模糊、擴散與顏色，多個陰影以逗號分隔。", "0 4px 12px rgb(0 0 0 / 12%)"),
    ("outline", "外框簡寫", "設定不佔用排版空間的外框。", "常用於鍵盤焦點提示；不要在沒有替代提示的情況下移除焦點外框。", "2px solid #24545a"),
    ("outline-offset", "外框偏移", "設定外框與邊框邊緣之間的距離。", "可讓鍵盤焦點提示與元素本身保留間隔。", "3px"),
    ("font-family", "字型家族", "設定文字使用的字型與後備字型順序。", "瀏覽器依可用字型及字元支援情況選擇；通常在最後提供通用字型家族。", 'Arial, "Microsoft JhengHei", sans-serif'),
    ("font-size", "字體大小", "設定字體的大小。", "可使用 px、rem、百分比等單位，實際顯示也受字型本身影響。", "16px"),
    ("font-weight", "字體粗細", "設定字體的粗細。", "可使用 normal、bold 或數值；可用粗細取決於字型提供的字重。", "700"),
    ("font-style", "字體樣式", "設定一般、斜體或傾斜字體樣式。", "italic 與 oblique 的字型選用及傾斜方式不同。", "italic"),
    ("line-height", "行高", "設定文字行框的高度。", "無單位數值會依元素字體大小計算，常用於可繼承的閱讀行距。", "1.8"),
    ("letter-spacing", "字元間距", "調整相鄰文字字元之間的額外間距。", "可使用 normal 或長度值，實際效果會配合文字塑形規則。", "0.05em"),
    ("text-align", "文字水平對齊", "設定區塊內行內內容的水平對齊方式。", "它不會把區塊元素本身移到父容器中央。", "center"),
    ("text-decoration", "文字裝飾簡寫", "設定底線、刪除線等文字裝飾。", "可搭配線條樣式、顏色與粗細等設定。", "underline"),
    ("text-underline-offset", "文字底線偏移", "設定文字底線與文字之間的偏移距離。", "適合微調連結底線的視覺間隔。", "3px"),
    ("text-transform", "文字大小寫轉換", "設定文字呈現時的大小寫轉換。", "不會修改原始文字資料，轉換方式也可能受語言影響。", "uppercase"),
    ("text-indent", "首行縮排", "設定區塊首行文字的縮排。", "一般用於段落首行，不等同於調整整個區塊的內邊距。", "2em"),
    ("text-overflow", "文字溢出提示", "設定被裁切的行內溢出內容如何提示。", "ellipsis 常搭配受限寬度、overflow 與 white-space 製作省略號。", "ellipsis"),
    ("white-space", "空白與換行處理", "設定文字中空白與換行的處理方式。", "例如 nowrap 不自動換行，pre-wrap 會保留空白並允許換行。", "pre-wrap"),
    ("overflow-wrap", "長字串換行", "設定不可斷行的長字串是否可在必要時換行。", "anywhere 適合避免長網址等內容撐開容器。", "anywhere"),
    ("word-break", "單字斷行方式", "設定文字換行時的斷行規則。", "break-all 可能在一般單字中間斷行，使用時需考慮閱讀性。", "normal"),
    ("vertical-align", "行內垂直對齊", "設定行內層級或表格儲存格內容的垂直對齊。", "它不是一般區塊元素的通用垂直置中方式。", "middle"),
    ("flex", "彈性項目簡寫", "設定彈性項目的放大、縮小與基準尺寸。", "它是 flex-grow、flex-shrink、flex-basis 的簡寫，作用於彈性項目。", "1 1 0"),
    ("flex-direction", "彈性排列方向", "設定彈性容器主軸的方向。", "row 與 column 分別沿行內及區塊方向排列，並可使用反向版本。", "column"),
    ("flex-wrap", "彈性換行", "設定彈性項目是否換行。", "wrap 允許分成多行；nowrap 會維持單行排列。", "wrap"),
    ("flex-grow", "彈性放大比例", "設定彈性項目分配剩餘空間時的放大因子。", "比例用於分配剩餘空間，不保證最終寬度比例一定相同。", "1"),
    ("flex-shrink", "彈性縮小比例", "設定彈性項目空間不足時的縮小因子。", "實際縮小量還會考慮項目的彈性基準尺寸。", "0"),
    ("flex-basis", "彈性基準尺寸", "設定彈性項目在分配空間前的主軸基準尺寸。", "可使用長度、百分比或 auto，並受主軸方向影響。", "240px"),
    ("justify-content", "主方向內容對齊", "設定內容在適用對齊軸上的排列與空間分配。", "在 Flexbox 中通常作用於主軸；Grid 中則作用於行內軸。", "space-between"),
    ("align-items", "項目對齊", "設定容器中項目的預設對齊方式。", "在 Flexbox 中通常作用於交叉軸；可使用 center、stretch 等值。", "center"),
    ("align-self", "單一項目對齊", "設定單一項目的對齊方式。", "可覆寫容器 align-items 為該項目提供的預設值。", "center"),
    ("align-content", "多行內容對齊", "設定內容在適用對齊軸上的整體分配方式。", "在多行 Flexbox 中可分配各行的交叉軸空間。", "space-between"),
    ("order", "排列順序", "設定彈性或格線項目的視覺排列順序。", "不會改變文件中的語意順序，鍵盤與輔助科技閱讀順序可能仍依原始碼。", "1"),
    ("gap", "項目間隔", "設定列與欄之間的間隔。", "可用於 Grid、Flexbox 等排版；不會在容器最外側額外加入間隔。", "16px"),
    ("row-gap", "列間隔", "設定相鄰列之間的間隔。", "適用的方向與排版方式有關。", "12px"),
    ("column-gap", "欄間隔", "設定相鄰欄之間的間隔。", "可用於多欄、Grid 與 Flexbox 等排版。", "20px"),
    ("grid-template-columns", "格線欄軌道", "定義格線容器的明確欄軌道尺寸。", "可使用 fr、長度、repeat() 與 minmax() 等寫法。", "repeat(3, minmax(0, 1fr))"),
    ("grid-template-rows", "格線列軌道", "定義格線容器的明確列軌道尺寸。", "可為不同列分別指定固定或可伸縮的尺寸。", "auto 1fr auto"),
    ("grid-template-areas", "格線命名區域", "以文字模板定義命名格線區域。", "同名格子必須形成矩形，項目可用 grid-area 放入命名區域。", '\"header header\" \"sidebar main\"'),
    ("grid-column", "格線欄位置", "以簡寫指定格線項目的欄起點與終點。", "可使用格線編號、名稱或 span 跨越軌道。", "1 / 3"),
    ("grid-row", "格線列位置", "以簡寫指定格線項目的列起點與終點。", "數字通常代表格線位置，不是列數本身。", "1 / span 2"),
    ("grid-area", "格線區域位置", "設定格線項目所佔的區域。", "可使用命名區域，或指定列與欄的起訖位置。", "main"),
    ("grid-auto-flow", "格線自動放置", "設定自動放置格線項目的方向與填補方式。", "dense 可填補先前空隙，但可能使視覺順序與文件順序不同。", "row"),
    ("grid-auto-rows", "隱含格線列尺寸", "設定隱含格線列的軌道尺寸。", "當項目超出明確列軌道時，可用此屬性控制自動建立的列。", "minmax(100px, auto)"),
    ("place-items", "雙軸項目對齊", "以簡寫設定 align-items 與 justify-items。", "常用於 Grid 讓項目在兩個方向對齊。", "center"),
    ("justify-items", "行內軸項目對齊", "設定項目在其對齊容器中的預設行內軸對齊方式。", "常用於 Grid；不以此屬性對齊 Flexbox 主軸項目。", "center"),
    ("object-fit", "替換內容縮放", "設定圖片或影片等替換內容如何放入內容盒。", "cover 保持比例填滿且可能裁切；contain 保持比例完整容納。", "cover"),
    ("object-position", "替換內容位置", "設定圖片或影片等替換內容在內容盒中的位置。", "常搭配 object-fit 調整裁切的視覺中心。", "center"),
    ("transform", "幾何變形", "設定平移、旋轉、縮放等變形。", "可串接多個變形函式，順序會影響最終結果。", "translateY(-2px)"),
    ("transform-origin", "變形基準點", "設定變形使用的基準點。", "旋轉或縮放時可指定中心、角落或其他位置。", "center bottom"),
    ("transition", "轉場簡寫", "設定屬性值改變時的轉場效果。", "可指定目標屬性、持續時間、時間函式與延遲，多組設定以逗號分隔。", "opacity 200ms ease"),
    ("transition-property", "轉場目標屬性", "設定哪些屬性值的改變要套用轉場。", "不是每個屬性或值都能以相同方式平滑插值。", "opacity, transform"),
    ("transition-duration", "轉場持續時間", "設定轉場完成所需的時間。", "以 s 或 ms 指定，可提供逗號分隔的時間清單。", "200ms"),
    ("transition-timing-function", "轉場時間函式", "設定轉場隨時間推進的速度曲線。", "可使用 ease、linear、cubic-bezier() 等寫法。", "ease-in-out"),
    ("animation", "動畫簡寫", "設定關鍵影格動畫及其播放方式。", "常搭配 @keyframes 定義動畫內容；可指定名稱、時間、次數等設定。", "fade 1s ease both"),
    ("animation-name", "動畫名稱", "指定要使用的關鍵影格動畫名稱。", "名稱對應 @keyframes，none 表示不套用該動畫。", "fade"),
    ("animation-duration", "動畫持續時間", "設定動畫單次循環的持續時間。", "可用 s 或 ms 指定，並可為多個動畫分別設定。", "1s"),
    ("animation-iteration-count", "動畫重複次數", "設定動畫重複播放的次數。", "可使用非負數或 infinite。", "infinite"),
    ("cursor", "滑鼠游標", "設定游標移到元素上方時使用的外觀。", "pointer 常用於可點擊項目，但不會自行讓元素具有按鈕的語意與行為。", "pointer"),
    ("pointer-events", "指標事件命中", "設定元素是否可成為指標事件命中的目標。", "none 不會自動取消鍵盤焦點或移除元素。", "none"),
    ("user-select", "文字選取", "設定使用者是否及如何選取文字。", "none 可限制選取，但不應用來取代資料保護措施。", "none"),
    ("resize", "使用者調整尺寸", "設定元素是否允許使用者拖曳調整尺寸。", "常見於文字輸入區，是否適用也受元素與 overflow 等條件影響。", "vertical"),
    ("filter", "視覺濾鏡", "對元素繪製結果套用模糊、亮度等濾鏡。", "可串接 blur()、brightness() 等函式。", "brightness(0.95)"),
    ("list-style", "清單標記簡寫", "設定清單標記的類型、位置與圖片。", "常用於 ul、ol 或具有 list-item 顯示方式的元素。", "square inside"),
    ("list-style-type", "清單標記類型", "設定清單項目的標記樣式。", "例如 disc、decimal、square 或 none。", "decimal"),
    ("border-collapse", "表格邊框合併", "設定表格相鄰儲存格的邊框是否合併。", "collapse 與 separate 使用不同的表格邊框模型。", "collapse"),
    ("table-layout", "表格排版演算法", "設定表格欄寬採用的排版方式。", "fixed 與 auto 對欄寬及內容的處理不同；fixed 的適用條件也與表格寬度有關。", "fixed"),
    ("scroll-behavior", "捲動行為", "設定特定程式或導覽觸發捲動時的移動方式。", "smooth 提供平滑捲動，不會控制所有使用者手動捲動行為。", "smooth"),
]


def selector_syntax(slug, name, label, summary, details, selector,
                    rule_type, match_value, **source):
    if match_value == "nesting":
        example = selector
    elif rule_type == "pseudo_element_name" and match_value in {"before", "after"}:
        example = f'{selector} {{\n  content: "";\n  color: teal;\n}}'
    else:
        example = f"{selector} {{\n  color: teal;\n}}"
    return syntax(
        "selectors", f"selector-{slug}", name, label, summary, details,
        example,
        "將符合選擇器條件的內容設為青綠色。",
        rule_type, match_value, **source,
    )


# 官方總索引未單列的基本選擇器，補上同一份 Selectors 規範的章節連結。
SELECTORS_SOURCE = "https://drafts.csswg.org/selectors-4/"
BASIC_SELECTORS = [
    ("type", "element", "元素類型選擇器", "依元素名稱選取元素。", "例如 p 選取段落元素；名稱的大小寫處理也受文件語言影響。", "p", "type", "type-selectors"),
    ("class", ".class", "類別選擇器", "選取具有指定 class 的元素。", "同一個元素可以有多個類別；實際類別名稱由使用者自行命名。", ".card", "class", "class-html"),
    ("id", "#id", "識別碼選擇器", "選取具有指定 id 的元素。", "同一份 HTML 文件的 id 應保持唯一。", "#main", "id", "id-selectors"),
    ("attribute", "[attr]", "屬性選擇器", "依元素是否具有指定屬性或符合屬性值條件來選取。", "包含 [attr]、[attr=value]、[attr~=value] 等寫法；它們的比對條件不同。", '[type="email"]', "attribute", "attribute-selectors"),
    ("descendant", "A B", "後代結合符", "選取位於指定祖先元素之內的後代元素。", "以空白分隔兩側選擇器，後代不限於直接子元素。", ".card p", "descendant", "descendant-combinators"),
]

SELECTOR_DATA = [
    ("universal", "*", "全稱選擇器", "選取符合命名空間條件的所有元素。", "常用於整體設定盒模型；不代表會選取偽元素。", "*", "selector_kind", "universal"),
    ("child", ">", "子元素結合符", "選取指定元素的直接子元素。", "與空白後代結合符不同，它只比對下一層。", ".menu > li", "selector_kind", "child"),
    ("adjacent-sibling", "+", "相鄰兄弟結合符", "選取緊接在指定元素後方的兄弟元素。", "兩個元素必須有共同父元素；比對元素時忽略文字節點。", "h2 + p", "selector_kind", "adjacent-sibling"),
    ("general-sibling", "~", "後續兄弟結合符", "選取指定元素後方符合條件的兄弟元素。", "不必緊接相鄰，但必須位於同一父元素之下。", "h2 ~ p", "selector_kind", "general-sibling"),
    ("nesting", "&", "巢狀選擇器", "在巢狀樣式規則中參照父層選擇器。", "常用於補上狀態或組合子規則，不是字串直接拼接的前置處理器語法。", ".card {\n  &:hover { opacity: 0.9; }\n}", "selector_kind", "nesting"),
]

# 名稱不包含參數；例如 :nth-child(2n) 對應同一個 :nth-child() 項目。
PSEUDO_CLASSES = [
    ("hover", "指標懸停", "選取使用者以指標懸停的元素。", "觸控裝置不一定具有方便或持續可用的懸停操作。", "button:hover", False),
    ("active", "啟動狀態", "選取正被使用者啟動的元素。", "例如以滑鼠按住按鈕的期間；它不是持續選取的頁籤狀態。", "button:active", False),
    ("focus", "取得焦點", "選取目前取得輸入焦點的元素。", "焦點可以來自鍵盤、指標操作或程式。", "input:focus", False),
    ("focus-visible", "可見焦點提示", "選取瀏覽器判定應顯示焦點提示的焦點元素。", "常用於提供鍵盤導覽時清楚的外框。", "button:focus-visible", False),
    ("focus-within", "內部具有焦點", "選取本身或其後代具有焦點的元素。", "可在表單欄位取得焦點時強調整組容器。", ".field:focus-within", False),
    ("link", "未造訪連結", "選取尚未造訪的超連結。", "通常與 :visited 搭配設定連結外觀。", "a:link", False),
    ("visited", "已造訪連結", "選取使用者已造訪的超連結。", "基於隱私，瀏覽器會限制可用於已造訪連結的樣式及資訊讀取。", "a:visited", False),
    ("first-child", "第一個子元素", "選取在兄弟元素中位於第一個位置的元素。", "位置依元素計算，不只比較同一種類型。", "li:first-child", False),
    ("last-child", "最後一個子元素", "選取在兄弟元素中位於最後一個位置的元素。", "文字與註解節點不列入元素位置。", "li:last-child", False),
    ("only-child", "唯一子元素", "選取沒有其他兄弟元素的元素。", "不要求父元素內完全沒有文字節點。", "p:only-child", False),
    ("nth-child", "子元素位置比對", "依兄弟元素位置公式選取元素。", "可使用 odd、even、An+B，並可用 of 選擇器清單限制位置比對的對象。", "li:nth-child(2n)", True),
    ("nth-last-child", "反向子元素位置比對", "由最後一個兄弟元素開始計算位置並選取。", "可使用 An+B 等公式。", "li:nth-last-child(2)", True),
    ("first-of-type", "同類型第一個元素", "選取同一元素類型兄弟中的第一個元素。", "與 :first-child 不同，它只比較同類型元素。", "p:first-of-type", False),
    ("last-of-type", "同類型最後一個元素", "選取同一元素類型兄弟中的最後一個元素。", "可用於強調區塊中的最後一段文字。", "p:last-of-type", False),
    ("nth-of-type", "同類型位置比對", "依同一元素類型的兄弟位置選取元素。", "使用 An+B 等公式，與類別名稱是否相同無關。", "p:nth-of-type(2)", True),
    ("root", "文件根元素", "選取文件的根元素。", "在 HTML 文件中通常是 html，常用於宣告全域自訂屬性。", ":root", False),
    ("empty", "空元素狀態", "依規範的空內容條件選取元素。", "空白文字是否影響比對，需注意規範版本與瀏覽器實作差異；最直接的例子是沒有任何內容的元素。", "p:empty", False),
    ("checked", "勾選狀態", "選取已勾選或選取的適用表單控制項。", "例如 checkbox、radio 與已選取的 option。", "input:checked", False),
    ("disabled", "停用狀態", "選取處於停用狀態的適用元素。", "它不是檢查所有元素是否任意帶有 disabled 字樣。", "button:disabled", False),
    ("enabled", "可用狀態", "選取處於可用狀態的適用元素。", "常用於依是否停用調整表單控制項外觀。", "input:enabled", False),
    ("required", "必填狀態", "選取必須填寫的適用表單元素。", "通常對應 HTML required 約束。", "input:required", False),
    ("optional", "非必填狀態", "選取不具有必填要求的適用表單元素。", "它不是所有未帶 required 屬性的任意元素。", "input:optional", False),
    ("valid", "驗證有效狀態", "選取符合相關資料驗證條件的適用元素。", "驗證條件可來自輸入類型及表單約束。", "input:valid", False),
    ("invalid", "驗證無效狀態", "選取未符合相關資料驗證條件的適用元素。", "是否在互動前就顯示錯誤樣式，需配合產品的表單設計。", "input:invalid", False),
    ("target", "網址目標元素", "選取目前網址片段識別的目標元素。", "例如網址結尾為 #intro 時，對應到相同 id 的元素。", "section:target", False),
    ("not", "否定比對", "選取不符合參數選擇器清單的元素。", "參數用於排除條件，並會依規則影響選擇器權重。", "button:not(:disabled)", True),
    ("is", "任一條件比對", "選取符合參數選擇器清單中任一條件的元素。", "可縮短重複選擇器；權重取決於參數中的選擇器。", ":is(h1, h2)", True),
    ("where", "零權重條件比對", "選取符合參數中任一條件的元素，且此部分權重為零。", "適合撰寫容易被其他樣式覆寫的預設規則。", ":where(h1, h2)", True),
    ("has", "關聯條件比對", "依相對選擇器所描述的關係選取元素。", "例如選取內部具有圖片的卡片；不只限於直接子元素。", ".card:has(img)", True),
    ("lang", "內容語言比對", "依元素的內容語言選取元素。", "語言可繼承自祖先；不等同於只檢查元素自身是否有 lang 屬性。", "p:lang(zh)", True),
]

PSEUDO_ELEMENTS = [
    ("before", "前置偽元素", "選取元素內容之前產生的偽元素。", "常搭配 content 產生裝飾內容，不會在原始 HTML 中新增真正的元素。", ".card::before"),
    ("after", "後置偽元素", "選取元素內容之後產生的偽元素。", "常搭配 content 放置圖示或裝飾。", ".card::after"),
    ("first-line", "第一行偽元素", "選取區塊第一個格式化行的文字部分。", "適用的樣式屬性有限，第一行範圍也會隨排版改變。", "p::first-line"),
    ("first-letter", "首字偽元素", "選取區塊第一個格式化行的首字部分。", "常用於首字放大等排版，適用條件與標點處理有專門規則。", "p::first-letter"),
    ("selection", "選取文字偽元素", "選取使用者反白選取的內容部分。", "可設定的樣式受限，常用於調整選取內容的前景與背景色。", "::selection"),
    ("placeholder", "輸入提示偽元素", "選取輸入框中的 placeholder 提示文字。", "與使用者實際輸入的值不同，提示文字不應取代欄位標籤。", "input::placeholder"),
    ("marker", "清單標記偽元素", "選取清單項目的標記盒子。", "可調整清單圓點或編號的部分樣式。", "li::marker"),
    ("backdrop", "背景幕偽元素", "選取頂層顯示元素所產生的背景幕。", "例如以 showModal() 開啟的原生 dialog，其背景幕可單獨設定樣式。", "dialog::backdrop"),
    ("file-selector-button", "檔案選取按鈕偽元素", "選取檔案輸入控制項內的選檔按鈕。", "可針對 input type=file 的內建按鈕設定樣式。", "input::file-selector-button"),
]


AT_RULE_DATA = [
    ("media", "媒體條件規則", "依媒體查詢條件套用樣式。", "可依視窗寬度、輸出媒體或使用者偏好等條件調整內容。", "@media (max-width: 640px) {\n  .card { padding: 12px; }\n}"),
    ("supports", "功能支援條件", "依瀏覽器是否支援指定 CSS 功能套用樣式。", "條件可以測試屬性宣告或選擇器等功能，不等同於偵測特定瀏覽器名稱。", "@supports (display: grid) {\n  .cards { display: grid; }\n}"),
    ("import", "匯入樣式表", "匯入另一份樣式表。", "必須遵守樣式表中的位置限制，並可附加媒體條件或 cascade layer。", '@import url("theme.css");'),
    ("charset", "樣式表編碼宣告", "以特定的檔案開頭格式宣告樣式表編碼。", "它參與解碼，不是一般會保留在 CSS 語法樹中的 at-rule；必須位於檔案開頭，使用雙引號等規定格式。", '@charset "UTF-8";\n.card { color: teal; }'),
    ("font-face", "自訂字型來源", "定義可供樣式使用的字型來源與字型描述。", "區塊內的 font-family、src 等是字型描述符，不是套用在元素上的一般屬性宣告。", '@font-face {\n  font-family: "Example";\n  src: url("example.woff2") format("woff2");\n}'),
    ("keyframes", "關鍵影格動畫", "定義動畫不同進度的樣式。", "可使用 from、to 或百分比指定影格，再由 animation 等屬性套用。", "@keyframes fade {\n  from { opacity: 0; }\n  to { opacity: 1; }\n}"),
    ("layer", "層疊分層", "建立或排列 CSS 的層疊分層。", "分層參與層疊優先順序，可使用區塊或名稱清單宣告。", "@layer base, components;\n@layer components {\n  .card { padding: 16px; }\n}"),
    ("container", "容器條件查詢", "依查詢容器的條件套用樣式。", "尺寸查詢通常需要先用 container-type 等設定適用容器。", "@container (min-width: 400px) {\n  .card { display: flex; }\n}"),
    ("page", "分頁樣式", "設定列印或其他分頁媒體的頁面樣式。", "區塊中可包含頁面相關設定及頁面邊距規則，不是一般網頁元素選擇器。", "@page {\n  margin: 20mm;\n}"),
    ("namespace", "命名空間宣告", "宣告選擇器使用的命名空間前綴或預設命名空間。", "常用於含有 SVG、XML 等命名空間的文件，且有樣式表位置限制。", '@namespace svg url("http://www.w3.org/2000/svg");\nsvg|a { color: teal; }'),
    ("property", "註冊自訂屬性", "為自訂屬性宣告語法、繼承方式與初始值等設定。", "區塊中的 syntax、inherits 與 initial-value 是描述符，不是一般元素屬性。", '@property --brand {\n  syntax: "<color>";\n  inherits: false;\n  initial-value: teal;\n}'),
    ("starting-style", "起始轉場樣式", "為符合條件的轉場提供起始樣式。", "可用於原先沒有前一個樣式狀態的元素，例如某些首次顯示的轉場情況。", "@starting-style {\n  .notice { opacity: 0; }\n}"),
]


CSS_SYNTAXES = [property_syntax(*row) for row in PROPERTY_DATA]
CSS_SYNTAXES.append(syntax(
    "properties", "property-custom", "--*", "自訂屬性",
    "以 -- 開頭的名稱宣告可重複使用的自訂屬性。",
    "名稱區分大小寫，通常透過 var() 在屬性值中取用；"
    "也可搭配 @property 註冊語法與繼承設定。",
    ":root {\n  --brand: teal;\n  --spacing: 16px;\n}\n"
    ".card {\n  color: var(--brand);\n  padding: var(--spacing);\n}",
    "宣告主題顏色與間距，並在卡片樣式中取用。",
    "property_kind", "custom",
))
CSS_SYNTAXES.append(syntax(
    "functions", "function-var", "var()", "自訂屬性取值",
    "取用自訂屬性的值，並可提供備援值。",
    "第一個參數是自訂屬性名稱；逗號後可提供備援值，也可巢狀使用 var()。",
    ".card {\n  color: var(--brand, teal);\n  padding: var(--spacing, var(--default-spacing, 16px));\n}",
    "取用主題顏色與間距，未取得有效值時使用備援值。",
    "function_name", "var",
    source_url="https://drafts.csswg.org/css-variables-2/#funcdef-var",
))
CSS_SYNTAXES.extend(
    selector_syntax(
        slug, name, label, summary, details, example,
        "selector_kind", kind,
        source_url=f"{SELECTORS_SOURCE}#{fragment}",
    )
    for slug, name, label, summary, details, example, kind, fragment in BASIC_SELECTORS
)
CSS_SYNTAXES.extend(selector_syntax(*row) for row in SELECTOR_DATA)

for name, label, summary, details, example, functional in PSEUDO_CLASSES:
    display = f":{name}{'()' if functional else ''}"
    CSS_SYNTAXES.append(selector_syntax(
        f"pseudo-class-{name}", display, label, summary, details, example,
        "pseudo_class_name", name,
    ))

for name, label, summary, details, example in PSEUDO_ELEMENTS:
    CSS_SYNTAXES.append(selector_syntax(
        f"pseudo-element-{name}", f"::{name}", label, summary, details,
        example, "pseudo_element_name", name,
    ))

for name, label, summary, details, example in AT_RULE_DATA:
    CSS_SYNTAXES.append(syntax(
        "at-rules", f"at-rule-{name}", f"@{name}", label, summary,
        details, example, f"示範 @{name} 規則的基本寫法。",
        "at_rule_name", name,
    ))


def sql_value(value):
    if value is None:
        return "NULL"
    return f"CONVERT(X'{str(value).encode('utf-8').hex()}' USING utf8mb4)"


def utc_timestamp(value):
    fetched = datetime.fromisoformat(value)
    if fetched.tzinfo is None or fetched.utcoffset() is None:
        raise ValueError("官方資料的擷取時間必須包含時區。")
    return fetched.astimezone(timezone.utc).strftime("%Y-%m-%d %H:%M:%S")


def resolve_source(item, snapshot, official):
    if item["source_url"]:
        # 基本選擇器補充連結必須屬於已擷取的規範。
        source_url = item["source_url"]
    else:
        kind = {
            "properties": "property", "selectors": "selector",
            "at-rules": "at-rule",
        }[item["category"]]
        source = official.get((kind, item["source_name"]))
        if source is None or source.get("details_status") != "fetched":
            raise ValueError(f"官方快照缺少已擷取項目：{item['name']}")
        source_url = source["source_url"]

    document_url, fragment = urldefrag(source_url)
    document = snapshot["documents"].get(document_url)
    if not document or not fragment or not source_url.startswith("https://"):
        raise ValueError(f"官方來源資料不完整：{item['name']}")

    module = urlsplit(document_url).path.rstrip("/").split("/")[-1]
    date = document.get("document_date")
    version_label = document.get("version_label") or ""
    if date is None:
        # 舊格式的規範可能只在標題列寫日期，沒有 time 元素。
        match = re.search(r"\b(\d{1,2} [A-Za-z]+ \d{4})\b", version_label)
        if match:
            date = datetime.strptime(match[1], "%d %B %Y").date().isoformat()
    if not date or not re.fullmatch(r"\d{4}-\d{2}-\d{2}", date):
        raise ValueError(f"來源規範缺少明確日期：{document_url}")
    if "Editor" in version_label and "Draft" in version_label:
        status = "ED"
    elif "Working Draft" in version_label:
        status = "WD"
    elif "Candidate Recommendation" in version_label:
        status = "CR"
    elif "Recommendation" in version_label:
        status = "REC"
    else:
        status = "spec"
    version = f"{module} {status} {date}"
    if len(version) > 50:
        raise ValueError(f"來源版本超過 50 字元：{version}")
    return source_url, version, utc_timestamp(document["source_fetched_at"])


def validate_items(snapshot):
    if snapshot.get("language") != "css" or not snapshot.get("documents"):
        raise ValueError("請先執行 fetch_css_syntaxes.py --details。")

    official = {}
    for entry in snapshot["syntaxes"]:
        key = (entry["category"], entry["name"])
        if key in official:
            raise ValueError(f"官方快照出現重複項目：{key}")
        official[key] = entry

    slugs = set()
    names = set()
    rules = set()
    for item in CSS_SYNTAXES:
        if item["category"] not in CATEGORIES:
            raise ValueError(f"未定義的分類：{item['category']}")
        if not re.fullmatch(r"[a-z0-9]+(?:-[a-z0-9]+)*", item["slug"]):
            raise ValueError(f"無效的語法代碼：{item['slug']}")
        key = (item["category"], item["slug"])
        name_key = (item["category"], item["name"].casefold())
        rule = (item["rule_type"], item["match_value"])
        if key in slugs or name_key in names or rule in rules:
            raise ValueError(f"整理清單有重複語法或規則：{item['name']}")
        slugs.add(key)
        names.add(name_key)
        rules.add(rule)

        limits = {"slug": 100, "name": 150, "display_label": 100,
                  "summary": 500, "match_value": 150}
        for field in ("slug", "name", "display_label", "summary",
                      "description", "example_code", "example_description",
                      "rule_type", "match_value"):
            value = item[field]
            if not isinstance(value, str) or not value.strip():
                raise ValueError(f"{item['name']} 缺少有效欄位：{field}")
            if len(value) > limits.get(field, 65535):
                raise ValueError(f"{item['name']} 的 {field} 超過長度限制。")
        resolve_source(item, snapshot, official)

    return official


def build_statements(snapshot):
    official = validate_items(snapshot)
    statements = ["SET NAMES utf8mb4;"]
    for slug, (name, order) in CATEGORIES.items():
        statements.append(f"""
            INSERT INTO syntax_categories (language, slug, name, display_order)
            VALUES ('css', {sql_value(slug)}, {sql_value(name)}, {order})
            ON DUPLICATE KEY UPDATE
                name = {sql_value(name)}, display_order = {order};
        """)

    for item in CSS_SYNTAXES:
        source_url, version, fetched_at = resolve_source(item, snapshot, official)
        fields = {key: item[key] for key in (
            "slug", "name", "display_label", "summary", "description",
            "example_code", "example_description",
        )}
        fields.update({
            "sort_key": item["name"].casefold(),
            "source_url": source_url,
            "source_version": version,
            "source_fetched_at": fetched_at,
        })
        columns = ", ".join(fields)
        values = ", ".join(sql_value(value) for value in fields.values())
        updates = ",\n".join(
            f"{field} = {sql_value(value)}"
            for field, value in fields.items() if field != "slug"
        )
        statements.extend([
            f"""
            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = {sql_value(item['category'])}
            );
            """,
            f"""
            INSERT INTO syntaxes (category_id, {columns}, is_active)
            VALUES (@category_id, {values}, 1)
            ON DUPLICATE KEY UPDATE {updates}, is_active = 1;
            """,
            f"""
            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = {sql_value(item['slug'])}
            );
            """,
            """
            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            """,
            f"""
            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', {sql_value(item['rule_type'])},
                    {sql_value(item['match_value'])}, 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            """,
        ])
    return statements


def generate(filename, snapshot):
    if not re.fullmatch(r"\d{3,}_[A-Za-z0-9_]+\.sql", filename):
        raise ValueError("請使用例如 008_css_syntaxes.sql 的檔名，不要包含路徑。")
    number = int(filename.split("_", 1)[0])
    for existing in MIGRATIONS_DIR.glob("*"):
        match = re.fullmatch(r"(\d{3,})_[A-Za-z0-9_]+\.(sql|py)", existing.name)
        if match and int(match[1]) == number:
            raise ValueError(f"migration 編號已使用：{existing.name}")

    statements = build_statements(snapshot)
    MIGRATIONS_DIR.mkdir(parents=True, exist_ok=True)
    output = MIGRATIONS_DIR / filename
    with output.open("x", encoding="utf-8", newline="\n") as file:
        file.write("-- syntax-atlas generated migration v1\n")
        file.write(f"-- Migration: {filename}; CSS catalog only.\n")
        file.write(SEPARATOR + SEPARATOR.join(statements) + "\n")
    print(f"已產生：{output}")
    print("尚未修改資料庫。")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("command", choices=["check", "generate"])
    parser.add_argument("--filename", help="新的 migration SQL 檔名")
    args = parser.parse_args()
    if args.command == "generate" and not args.filename:
        parser.error("generate 必須提供 --filename。")
    if args.command == "check" and args.filename:
        parser.error("check 不需要 --filename。")

    snapshot = json.loads(SNAPSHOT_PATH.read_text(encoding="utf-8"))
    validate_items(snapshot)
    counts = Counter(item["category"] for item in CSS_SYNTAXES)
    print(f"屬性：{counts['properties']}；選擇器：{counts['selectors']}；At-rules：{counts['at-rules']}；函式：{counts['functions']}")
    print(f"共 {len(CSS_SYNTAXES)} 項，官方來源與欄位檢查通過。")
    if args.command == "generate":
        generate(args.filename, snapshot)
    else:
        print("未產生 SQL，也未連線資料庫。")


if __name__ == "__main__":
    main()
