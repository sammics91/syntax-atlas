"""Python 3.13 官方文件第 7 章：簡單敘述。

產生 SQL：python backend/python_chapter7.py generate
匯入資料：python backend/python_chapter7.py apply

運算式敘述沿用各運算式的辨識，不另設統計項目。
future 敘述的說明收錄於 from，沿用既有 import、from 關鍵字規則。
"""

import argparse

from python_syntaxes import apply, generate


FILENAME = "003_python_chapter7.sql"


def syntax_entry(
    category, section_id, slug, name, label, summary,
    example_code, example_description, analyzer, rule_type, match_value,
):
    return {
        "category": category,
        "section_id": section_id,
        "slug": slug,
        "name": name,
        "display_label": label,
        "summary": summary,
        "example_code": example_code,
        "example_description": example_description,
        "sort_key": slug,
        "rules": [{
            "analyzer": analyzer,
            "rule_type": rule_type,
            "match_value": match_value,
        }],
    }


# 已存在的項目沿用分類與 slug，匯入時更新原資料、保留 ID。
CHAPTER_SYNTAXES = [
    syntax_entry(
        "variables-and-data", "assignment-statements", "assignment", "=", "指派",
        "將右側的值指定給名稱、物件屬性或容器項目。"
        "可將同一個值連續指定給多個目標，也可依可迭代物件的內容進行解包指派。"
        "使用星號目標時，會將剩餘項目收集成串列。",
        "first = second = 10\na, b = [1, 2]\nhead, *tail = [1, 2, 3]",
        "first 與 second 都取得 10；a 與 b 分別取得 1、2；"
        "head 取得 1，tail 取得 [2, 3]。",
        "python_ast", "node_type", "Assign",
    ),
    syntax_entry(
        "variables-and-data", "annotated-assignment-statements",
        "annotated-assignment", "name: type", "型別註記指派",
        "在單一名稱、屬性或索引目標後加上型別註記，可同時指定初始值，也可只註記型別。"
        "型別註記不會自動檢查或轉換指定的值；只註記名稱時，也不會自動為該名稱建立值。",
        "age: int = 20\nname: str",
        "age 取得值 20 並附上 int 註記；name 只有 str 註記，尚未取得值。",
        "python_ast", "node_type", "AnnAssign",
    ),
    syntax_entry(
        "control-flow", "the-assert-statement", "assert", "assert", "斷言",
        "檢查條件是否成立；條件為假時拋出 AssertionError，可附加錯誤訊息。"
        "使用最佳化模式執行 Python 時可能略過斷言，因此不適合用於必要的輸入驗證或權限檢查。",
        'score = 80\nassert score >= 0, "分數不能為負數"',
        "score 為 80，條件成立；若 score 為負數，則拋出附有指定訊息的 AssertionError。",
        "python_ast", "node_type", "Assert",
    ),
    syntax_entry(
        "control-flow", "the-pass-statement", "pass", "pass", "空敘述",
        "不執行任何操作。當語法需要敘述，但暫時沒有內容時，可用於函式、類別或控制流程區塊的佔位。",
        "def unfinished():\n    pass",
        "建立尚未加入實際操作的函式；呼叫時會結束函式並回傳 None。",
        "python_ast", "node_type", "Pass",
    ),
    syntax_entry(
        "variables-and-data", "the-del-statement", "del", "del", "刪除綁定或項目",
        "刪除名稱的綁定，或刪除物件的屬性、容器項目與切片。"
        "刪除名稱不代表立即銷毀它原本指向的物件；刪除未綁定的名稱會引發 NameError。",
        "items = [10, 20, 30]\ndel items[1]\ntemporary = 5\ndel temporary",
        "先移除串列位置 1 的項目，使 items 成為 [10, 30]；再刪除 temporary 的名稱綁定。",
        "python_ast", "node_type", "Delete",
    ),
    syntax_entry(
        "functions", "the-return-statement", "return", "return", "回傳與結束函式",
        "結束目前函式並回傳指定的值；省略運算式時回傳 None。"
        "只能用於函式內。若離開時必須執行 finally 區塊，會先執行該區塊。",
        "def add(a, b):\n    return a + b\n\ndef finish():\n    return",
        "add 回傳兩個參數相加的結果；finish 未指定回傳值，因此回傳 None。",
        "python_ast", "node_type", "Return",
    ),
    syntax_entry(
        "keywords", "the-yield-statement", "yield", "yield", "產生值並暫停",
        "在產生器函式中產生值並暫停，下一次取值時從暫停處繼續。"
        "yield from 可將子產生器或其他可迭代物件的值逐項交給呼叫端。"
        "函式只要包含 yield，就會成為產生器函式。",
        "def numbers():\n    yield 1\n    yield from [2, 3]",
        "取用 numbers() 產生的值時，會依序得到 1、2、3。",
        "python_tokenize", "keyword", "yield",
    ),
    syntax_entry(
        "keywords", "the-raise-statement", "raise", "raise", "拋出例外",
        "拋出例外類別或例外實例。"
        "在正在處理例外的情境中，單獨使用 raise 可重新拋出目前例外。"
        "raise ... from ... 可指定造成新例外的原因；from None 可抑制隱含的例外關聯顯示。",
        'def check_age(age):\n    if age < 0:\n        raise ValueError("年齡不能為負數")',
        "傳入負數時拋出 ValueError，並附上錯誤訊息。",
        "python_tokenize", "keyword", "raise",
    ),
    syntax_entry(
        "control-flow", "the-break-statement", "break", "break", "中止迴圈",
        "立即離開最近一層的 for 或 while 迴圈，且不執行該迴圈的 else 區塊。"
        "若離開時需要執行 finally 區塊，會先執行該區塊。",
        "for value in [1, 2, 3]:\n    if value == 2:\n        break\n    print(value)",
        "印出 1 後，在 value 為 2 時中止迴圈。",
        "python_ast", "node_type", "Break",
    ),
    syntax_entry(
        "control-flow", "the-continue-statement", "continue", "continue", "繼續下一輪迴圈",
        "略過最近一層 for 或 while 迴圈本輪剩餘的敘述，繼續下一輪。"
        "若途中需要執行 finally 區塊，會先執行該區塊。",
        "for value in [1, 2, 3]:\n    if value == 2:\n        continue\n    print(value)",
        "在 value 為 2 時略過 print，最後依序印出 1、3。",
        "python_ast", "node_type", "Continue",
    ),
    syntax_entry(
        "keywords", "the-import-statement", "import", "import", "匯入",
        "載入模組或套件，並在目前作用域綁定名稱。"
        "可用 as 指定別名，也可透過 from ... import ... 匯入指定名稱。",
        "import math\nimport os as operating_system\nfrom pathlib import Path",
        "匯入 math、替 os 指定別名 operating_system，並從 pathlib 匯入 Path。",
        "python_tokenize", "keyword", "import",
    ),
    syntax_entry(
        "keywords", "the-import-statement", "from", "from", "搭配用關鍵字",
        "搭配 import，從指定模組匯入名稱；也可在套件中使用相對匯入。"
        "搭配 yield 可委派產生值；搭配 raise 則可指定例外原因。"
        "from __future__ import ... 是特殊的編譯指示，除文件字串、註解、空白與其他 future 敘述外，"
        "必須位於其他敘述之前。",
        "from pathlib import Path\n\ndef numbers():\n    yield from [1, 2]",
        "第一處從 pathlib 匯入 Path；第二處將串列中的值交由產生器逐項產生。",
        "python_tokenize", "keyword", "from",
    ),
    syntax_entry(
        "keywords", "the-global-statement", "global", "global", "宣告全域名稱",
        "宣告本程式區塊中的指定名稱使用模組層級的綁定，讓函式等區塊內的指派能更新全域名稱。"
        "同一作用域中，宣告必須出現在相關名稱的使用或指派之前。",
        "score = 0\n\ndef update_score():\n    global score\n    score = 90",
        "呼叫 update_score() 後，模組層級的 score 會更新為 90。",
        "python_ast", "node_type", "Global",
    ),
    syntax_entry(
        "keywords", "the-nonlocal-statement", "nonlocal", "nonlocal", "宣告外層名稱",
        "宣告指定名稱使用最近一層已有該綁定的外層函式作用域，讓內層函式能更新它。"
        "不包含模組全域作用域；若找不到既有的外層綁定，會產生 SyntaxError。",
        "def make_counter():\n    count = 0\n\n    def increment():\n        nonlocal count\n        count += 1\n        return count\n\n    return increment",
        "increment 更新外層 make_counter 中的 count，讓多次呼叫可以累積數值。",
        "python_ast", "node_type", "Nonlocal",
    ),
    syntax_entry(
        "variables-and-data", "the-type-statement", "type-alias", "type", "型別別名",
        "使用 type 名稱 = 型別運算式建立型別別名，Python 3.12 起支援。"
        "type 在此位置是軟關鍵字，也可建立帶型別參數的泛型別名。"
        "別名的值採延後求值；型別別名不會自動驗證或轉換資料。",
        "type Point = tuple[float, float]\ntype Pair[T] = tuple[T, T]",
        "Point 表示由兩個浮點數組成的元組型別；Pair 可以用型別參數指定兩個元素的共同型別。",
        "python_ast", "node_type", "TypeAlias",
    ),
]


# 每個增強指派符號獨立列項，不額外計入 Assign 或 BinOp。
# slug、顯示符號、中文名稱、AST 運算子、用途、範例
AUGMENTED_ASSIGNMENTS = [
    (
        "addition-assignment", "+=", "加法指派", "Add",
        "將右側值加到目標，或依目標型別串接內容，再將結果指定回原目標。",
        "total = 3\ntotal += 2",
    ),
    (
        "subtraction-assignment", "-=", "減法指派", "Sub",
        "從目標減去右側值，再將結果指定回原目標；集合等型別也可定義對應的差集行為。",
        "total = 8\ntotal -= 3",
    ),
    (
        "multiplication-assignment", "*=", "乘法指派", "Mult",
        "將目標乘以右側值，或依型別重複序列，再將結果指定回原目標。",
        "total = 3\ntotal *= 2",
    ),
    (
        "matrix-multiplication-assignment", "@=", "矩陣乘法指派", "MatMult",
        "對支援此運算的物件執行矩陣乘法，再將結果指定回原目標。一般 Python 串列不直接支援此運算。",
        "matrix_a @= matrix_b",
    ),
    (
        "division-assignment", "/=", "除法指派", "Div",
        "將目標除以右側值，再將結果指定回原目標；整數使用一般除法後會得到浮點數。",
        "total = 7\ntotal /= 2",
    ),
    (
        "floor-division-assignment", "//=", "向下取整除法指派", "FloorDiv",
        "將目標除以右側值並向負無限大方向取整，再將結果指定回原目標。",
        "total = -7\ntotal //= 2",
    ),
    (
        "modulo-assignment", "%=", "取餘數與格式化指派", "Mod",
        "對目標進行取餘數，或依型別進行百分比形式的字串格式化，再將結果指定回原目標。",
        'total = 7\ntotal %= 3\nmessage = "Hello, %s"\nmessage %= "Sammi"',
    ),
    (
        "power-assignment", "**=", "次方指派", "Pow",
        "以目標為底數、右側值為指數進行次方運算，再將結果指定回原目標。",
        "total = 2\ntotal **= 3",
    ),
    (
        "left-shift-assignment", "<<=", "向左位移指派", "LShift",
        "將目標整數的位元向左移動指定的非負位數，再將結果指定回原目標。",
        "value = 3\nvalue <<= 2",
    ),
    (
        "right-shift-assignment", ">>=", "向右位移指派", "RShift",
        "將目標整數的位元向右移動指定的非負位數，再將結果指定回原目標。",
        "value = 12\nvalue >>= 2",
    ),
    (
        "bitwise-and-assignment", "&=", "位元 AND 與交集指派", "BitAnd",
        "對整數執行逐位 AND，或對集合取得交集，再將結果指定回原目標。",
        "value = 6\nvalue &= 3",
    ),
    (
        "bitwise-xor-assignment", "^=", "位元 XOR 與對稱差集指派", "BitXor",
        "對整數執行逐位 XOR，或對集合取得對稱差集，再將結果指定回原目標。",
        "value = 6\nvalue ^= 3",
    ),
    (
        "bitwise-or-assignment", "|=", "位元 OR 與聯集指派", "BitOr",
        "對整數執行逐位 OR，或對集合取得聯集；字典等型別也可支援合併，再將結果指定回原目標。",
        "value = 6\nvalue |= 3",
    ),
]

for slug, symbol, label, operator, summary, example in AUGMENTED_ASSIGNMENTS:
    CHAPTER_SYNTAXES.append(syntax_entry(
        "variables-and-data", "augmented-assignment-statements",
        slug, symbol, label,
        summary + "目標只求值一次，並可能就地修改原物件，因此不保證與一般指派搭配運算完全相同。",
        example,
        "示範增強指派的寫法；實際是否支援此運算及其結果，取決於目標物件的型別。",
        "python_ast", "augmented_operator", operator,
    ))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("command", choices=["generate", "apply"])
    args = parser.parse_args()

    if args.command == "generate":
        generate(FILENAME, CHAPTER_SYNTAXES)
    else:
        apply(FILENAME)


if __name__ == "__main__":
    main()
