"""Python 3.13 官方文件第 8 章：複合敘述。

產生 SQL：python backend/python_chapter8.py generate
匯入資料：python backend/python_chapter8.py apply

async 獨立列項，非同步敘述同時歸入 def、for、with。
except 與 except* 合併；模式比對只列 match、case。
裝飾器、參數與各種模式的說明收錄於相關項目，不另設統計。
"""

import argparse

from python_syntaxes import apply, generate


FILENAME = "004_python_chapter8.sql"


def syntax_entry(
    category, section_id, slug, name, label, summary,
    example_code, example_description, rules,
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
        "rules": rules,
    }


def node_rules(*names):
    return [
        {"analyzer": "python_ast", "rule_type": "node_type", "match_value": name}
        for name in names
    ]


def keyword_rules(keyword):
    return [{
        "analyzer": "python_tokenize",
        "rule_type": "keyword",
        "match_value": keyword,
    }]


# 既有項目維持分類與 slug，讓匯入更新原資料而不改變 ID。
CHAPTER_SYNTAXES = [
    syntax_entry(
        "control-flow", "the-if-statement", "if", "if", "條件判斷",
        "依條件決定要執行的區塊。條件成立時執行 if 區塊，否則繼續檢查 elif 或執行 else。"
        "if 也可出現在條件運算式、生成式篩選及 case 的守衛條件中。",
        'score = 75\nif score >= 60:\n    print("及格")',
        "score 為 75，條件成立，因此印出及格。",
        keyword_rules("if"),
    ),
    syntax_entry(
        "control-flow", "the-if-statement", "elif", "elif", "其他條件",
        "當同一組 if 或前面的 elif 條件不成立時，繼續檢查下一個條件。"
        "可以加入多個 elif；選到符合的分支後，不再檢查同組後面的條件。",
        'score = 75\nif score >= 90:\n    print("優等")\nelif score >= 60:\n    print("及格")',
        "第一個條件不成立，接著判斷 elif，最後印出及格。",
        keyword_rules("elif"),
    ),
    syntax_entry(
        "control-flow", "else-clause", "else", "else", "其他分支",
        "搭配 if 時，在前面的條件皆不成立時執行；也可用於條件運算式。"
        "搭配 for 或 while 時，在迴圈正常結束且未經 break 中止時執行。"
        "搭配 try 時，在 try 區塊未拋出例外，且未經 return、break、continue 提前離開時執行；"
        "else 區塊中的例外不由同組前面的 except 處理。",
        'for value in [1, 2]:\n    print(value)\nelse:\n    print("已完成")',
        "迴圈依序印出 1、2，正常結束後再印出已完成。",
        keyword_rules("else"),
    ),
    syntax_entry(
        "control-flow", "the-while-statement", "while", "while", "條件迴圈",
        "只要條件為真，就重複執行區塊；條件在進入每輪之前重新判斷。"
        "break 可中止迴圈，continue 可略過本輪剩餘內容。"
        "可搭配 else，在條件變假而正常結束時執行。",
        "count = 0\nwhile count < 3:\n    print(count)\n    count += 1",
        "count 從 0 開始，每輪增加 1，依序印出 0、1、2。",
        node_rules("While"),
    ),
    syntax_entry(
        "control-flow", "the-for-statement", "for", "for ... in ...", "逐項迴圈",
        "從可迭代物件依序取出項目，指定給迴圈目標，再執行區塊。"
        "可使用解包目標，也可搭配 break、continue、else。"
        "async for 用於非同步可迭代物件，等待各項資料後執行區塊；"
        "它不會自動讓每一輪並行執行，也不能直接取代一般串列的 for。",
        'for name in ["Sammi", "Alan"]:\n    print(name)',
        "依序取出串列中的名稱，印出 Sammi、Alan。",
        node_rules("For", "AsyncFor"),
    ),
    syntax_entry(
        "control-flow", "the-try-statement", "try", "try", "例外處理區塊",
        "包住可能產生例外的程式，搭配 except 或 except* 處理例外，"
        "並可加入 else 與 finally。except 和 except* 不能放在同一個 try 結構中。"
        "也可只搭配 finally，讓離開區塊時進行清理。",
        'try:\n    number = int("abc")\nexcept ValueError:\n    number = 0',
        "文字無法轉成整數而產生 ValueError，交由 except 處理並將 number 設為 0。",
        node_rules("Try", "TryStar"),
    ),
    syntax_entry(
        "control-flow", "except-clause", "except", "except", "例外處理",
        "搭配 try 處理符合指定類型的例外，可用元組指定多種類型，並以 as 綁定例外物件。"
        "一般 except 會選擇第一個符合的處理區塊，也可捕捉整個例外群組。"
        "使用 except* 時，會從例外群組中分別取出符合類型的部分，交給各個處理區塊。"
        "except* 必須指定類型，其區塊中不能使用 return、break 或 continue。",
        'try:\n    int("abc")\nexcept ValueError as error:\n    print(error)\n\n'
        'try:\n    raise ExceptionGroup("錯誤", [ValueError("格式錯誤"), TypeError("型別錯誤")])\n'
        'except* ValueError:\n    print("處理格式錯誤")\n'
        'except* TypeError:\n    print("處理型別錯誤")',
        "前半段捕捉一般例外；後半段依例外類型分別處理同一群組中的錯誤。",
        node_rules("ExceptHandler"),
    ),
    syntax_entry(
        "control-flow", "finally-clause", "finally", "finally", "離開時清理",
        "搭配 try，在控制流程離開相關區塊時進行清理，包括正常結束、例外傳遞或提前回傳等情境。"
        "若 finally 本身回傳值或拋出新例外，可能覆蓋原本的回傳或例外，因此應避免在此改變控制流程。"
        "強制終止程序等情況不保證能執行清理。",
        'try:\n    print("執行工作")\nfinally:\n    print("清理資源")',
        "工作完成後執行 finally；若工作發生例外，也會先嘗試執行清理，再繼續傳遞例外。",
        [{"analyzer": "python_ast", "rule_type": "compound_clause", "match_value": "finally"}],
    ),
    syntax_entry(
        "control-flow", "the-with-statement", "with", "with", "情境管理",
        "透過情境管理器安排進入區塊與離開區塊時的操作，常用於檔案、鎖與其他資源管理。"
        "可用 as 取得進入操作回傳的值，也可在同一個 with 中使用多個管理器。"
        "async with 使用非同步情境管理器，會等待進入與離開操作完成。",
        'with open("notes.txt", encoding="utf-8") as file:\n    content = file.read()',
        "進入區塊時開啟檔案，離開時由管理器關閉檔案；此範例只供語法解析，網站不會執行讀檔。",
        node_rules("With", "AsyncWith"),
    ),
    syntax_entry(
        "control-flow", "the-match-statement", "match", "match", "結構模式比對",
        "將目標值與各個 case 的模式依序比對，執行第一個模式符合且守衛條件成立的分支。"
        "模式可比對常值、序列、映射與類別結構；若沒有符合分支，則略過整個 match。"
        "match 是軟關鍵字，在其他合法位置仍可作為名稱。",
        'value = [1, 2]\nmatch value:\n    case [first, second]:\n'
        '        print(first, second)\n    case _:\n        print("其他情況")',
        "value 符合有兩個元素的序列模式，first 與 second 分別取得 1、2。",
        node_rules("Match"),
    ),
    syntax_entry(
        "control-flow", "patterns", "case", "case", "模式分支",
        "在 match 中指定模式，並可用 if 加上守衛條件。"
        "常值模式比對值；一般名稱可擷取資料，_ 接受任意值而不綁定名稱。"
        "序列、映射與類別模式比對結構；帶點號的名稱可參照既有值。"
        "| 表示可接受的替代模式，as 可保留整個符合值，括號可協助分組。"
        "序列模式中的方括號不會建立串列，類別模式也不是函式呼叫。",
        'match value:\n    case 1 | 2:\n        print("小整數")\n'
        '    case [first, second] if first > 0:\n        print(second)\n'
        '    case {"name": name}:\n        print(name)\n'
        '    case Point(x, y) as point:\n        print(point)\n'
        '    case Color.RED:\n        print("紅色")\n'
        '    case _:\n        print("其他情況")',
        "依序示範 OR、序列與守衛、映射、類別與 AS、值模式及萬用模式。"
        "擷取的名稱可在該分支中使用。",
        node_rules("match_case"),
    ),
    syntax_entry(
        "functions", "function-definitions", "function-definition", "def", "定義函式",
        "建立函式並綁定名稱；定義時不會立即執行函式主體。"
        "可設定預設引數、型別註記、位置專用與關鍵字專用參數，或以 *args、**kwargs 接收額外引數。"
        "裝飾器可在定義時包裝函式；Python 3.13 也支援帶型別參數的泛型函式。"
        "async def 建立非同步函式；呼叫它取得協程物件，需由 await 或事件迴圈推進執行。",
        "def add(a, b=1):\n    return a + b\n\nasync def load():\n    return 90",
        "add 是有預設引數的函式；load 是非同步函式。兩者的主體都不會因為定義而立即執行。",
        node_rules("FunctionDef", "AsyncFunctionDef"),
    ),
    syntax_entry(
        "classes-and-objects", "class-definitions", "class-definition", "class", "定義類別",
        "建立類別並綁定名稱，定義時會執行類別主體以建立類別命名空間。"
        "可定義屬性、方法、指定基底類別與 metaclass，也可使用類別裝飾器。"
        "Python 3.13 支援帶型別參數的泛型類別；實例通常透過呼叫類別建立。",
        'class Person:\n    def __init__(self, name):\n        self.name = name\n\n'
        'person = Person("Sammi")',
        "定義 Person 類別與初始化方法，再建立名稱為 Sammi 的實例。",
        node_rules("ClassDef"),
    ),
    syntax_entry(
        "keywords", "coroutines", "async", "async", "非同步宣告",
        "搭配 def 宣告非同步函式，搭配 for 走訪非同步可迭代物件，或搭配 with 使用非同步情境管理器。"
        "也可出現在非同步生成式中。async 不代表自動建立執行緒或讓所有操作並行；"
        "一般阻塞操作不會因為放進 async def 就自動轉為非同步操作。",
        "async def load(stream, resource):\n    async for item in stream:\n"
        "        async with resource:\n            print(item)",
        "函式等待 stream 提供項目，並在每輪透過非同步情境管理器安排資源操作。",
        keyword_rules("async"),
    ),
    syntax_entry(
        "keywords", "the-with-statement", "as", "as", "綁定別名或結果",
        "搭配 import 為匯入名稱指定別名；搭配 with 取得管理器進入操作的結果；"
        "搭配 except 或 except* 綁定例外物件。"
        "在 case 的 AS 模式中，也可保留整個符合的值。",
        'import math as maths\n\nwith open("notes.txt", encoding="utf-8") as file:\n'
        '    content = file.read()',
        "第一處為 math 指定別名 maths；第二處將管理器回傳的檔案物件綁定給 file。",
        keyword_rules("as"),
    ),
]


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
