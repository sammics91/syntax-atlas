"第 6 章語法定義與更新檔工具。匯入：python python_chapter6.py apply"

import argparse

# 共用 SQL 產生與匯入流程；語法定義仍按章節分開。
from python_syntaxes import apply, generate

FILENAME = "002_python_chapter6.sql"

CHAPTER_SYNTAXES = [
    {
        "category": "variables-and-data",
        "section_id": "list-displays",
        "slug": "list-display",
        "name": "[ ]",
        "display_label": "串列",
        "summary": (
            "使用方括號直接列出項目，或透過 [運算式 for ...] 生成式建立串列；[] 表示空串列。串列保留元素順序，"
            "允許重複項目，建立後可新增、刪除或修改元素。生成式可包含多個 for 子句與 if 篩選條件；"
            "各層 for 由左至右對應由外至內的迴圈。也可使用 async for 取得非同步資料。"
        ),
        "example_code": (
            'names = ["Sammi", "Alan"]\n'
            "numbers = [n * 2 for n in range(3)]"
        ),
        "example_description": (
            "第一行直接建立串列；第二行透過生成式建立串列。"
        ),
        "sort_key": "list-display",
        "rules": [
            {
                "analyzer": "python_ast",
                "rule_type": "node_type_load",
                "match_value": "List",
            },
            {
                "analyzer": "python_ast",
                "rule_type": "node_type",
                "match_value": "ListComp",
            },
        ],
    },
    {
        "category": "variables-and-data",
        "section_id": "set-displays",
        "slug": "set-display",
        "name": "{...}",
        "display_label": "集合",
        "summary": (
            "使用大括號直接列出元素，或透過 {運算式 for ...} 生成式建立集合。集合只保留不重複的元素，"
            "不保證元素的排列順序。元素必須可雜湊，例如字串或整數；串列與字典不能直接作為元素。空集合需使用 set()，"
            "{} 表示空字典。生成式可包含多個 for 子句與 if 篩選條件；各層 for 由左至右對應由外至內的迴圈。"
            "也可使用 async for 取得非同步資料。"
        ),
        "example_code": (
            'colors = {"red", "blue", "red"}\n'
            "numbers = {n * 2 for n in range(3)}"
        ),
        "example_description": (
            "第一行直接建立集合，重複的 red 只保留一份；第二行透過生成式建立集合。"
        ),
        "sort_key": "set-display",
        "rules": [
            {
                "analyzer": "python_ast",
                "rule_type": "node_type",
                "match_value": "Set",
            },
            {
                "analyzer": "python_ast",
                "rule_type": "node_type",
                "match_value": "SetComp",
            },
        ],
    },
    {
        "category": "variables-and-data",
        "section_id": "dictionary-displays",
        "slug": "dict-display",
        "name": "{key: value}",
        "display_label": "字典",
        "summary": (
            "以 {鍵: 值} 直接建立字典，或使用 {鍵運算式: 值運算式 for ...} 生成式建立；{} 表示空字典。"
            "每個鍵對應一個值，鍵必須可雜湊，例如字串或整數；串列與字典不能直接作為鍵。若同一個鍵出現多次，"
            "後面的值會取代前面的值。生成式可包含多個 for 子句與 if 篩選條件；"
            "各層 for 由左至右對應由外至內的迴圈。也可使用 async for 取得非同步資料。"
        ),
        "example_code": (
            'profile = {"name": "Sammi", "score": 90}\n'
            "squares = {n: n * n for n in range(3)}\n"
            'latest = {"score": 60, "score": 90}'
        ),
        "example_description": (
            "第一行直接建立字典；第二行用生成式建立 {0: 0, 1: 1, 2: 4}；第三行的 score 重複出現，"
            "最後保留的值為 90。"
        ),
        "sort_key": "dict-display",
        "rules": [
            {
                "analyzer": "python_ast",
                "rule_type": "node_type",
                "match_value": "Dict",
            },
            {
                "analyzer": "python_ast",
                "rule_type": "node_type",
                "match_value": "DictComp",
            },
        ],
    },
    {
        "category": "variables-and-data",
        "section_id": "generator-expressions",
        "slug": "generator-expression",
        "name": "(expr for item in iterable)",
        "display_label": "產生器運算式",
        "summary": (
            "使用運算式搭配 for ... in ... 建立產生器，取用時逐項計算並產生值，也可加入 if 篩選。"
            "作為函式呼叫的唯一引數時，可省略產生器運算式外層的括號。若同時傳入其他引數，則必須保留該括號。"
            "若包含 async for 或 await，則建立非同步產生器，需以非同步方式取得值。"
        ),
        "example_code": (
            "stream = (n * 2 for n in range(3))\n"
            "total = sum(n for n in range(3))\n"
            "with_start = sum((n for n in range(3)), 10)"
        ),
        "example_description": (
            "第一行建立產生器，取值時依序產生 0、2、4。第二行將產生器運算式作為唯一引數，省略其外層括號，結果為 3。"
            "第三行另傳入起始值 10，因此保留產生器運算式的括號，結果為 13。"
        ),
        "sort_key": "generator-expression",
        "rules": [
            {
                "analyzer": "python_ast",
                "rule_type": "node_type",
                "match_value": "GeneratorExp",
            },
        ],
    },
    {
        "category": "variables-and-data",
        "section_id": "parenthesized-forms",
        "slug": "tuple-display",
        "name": "(value, ...)",
        "display_label": "元組",
        "summary": (
            "以逗號分隔項目建立元組，通常搭配括號，部分位置可省略括號。元組保留順序，"
            "建立後不能直接新增、刪除或替換其中的項目。單一元素需保留逗號，例如 (10,)；(10) 只是加上括號的整數，"
            "() 才是空元組。括號也可用於運算式分組，例如 (2 + 3) * 4；這種寫法不會建立元組。"
        ),
        "example_code": (
            'profile = ("Sammi", 90)\n'
            'single = ("Sammi",)\n'
            "pair = 10, 20\n"
            "empty = ()\n"
            "number = (10)"
        ),
        "example_description": (
            "前四行分別建立一般元組、單一元素元組、省略括號的元組及空元組。最後一行只是將整數加上括號，不會建立元組。"
        ),
        "sort_key": "tuple-display",
        "rules": [
            {
                "analyzer": "python_ast",
                "rule_type": "node_type_load",
                "match_value": "Tuple",
            },
        ],
    },
    {
        "category": "variables-and-data",
        "section_id": "attribute-references",
        "slug": "attribute-reference",
        "name": "obj . attr",
        "display_label": "屬性存取",
        "summary": (
            "一般寫法為 obj.attr，點號兩側通常不加空格。"
            "使用點號指定物件的屬性，可讀取、設定或刪除屬性，"
            "也可取得方法後呼叫。"
        ),
        "example_code": (
            'user.name = "Sammi"\n'
            "name = user.name"
        ),
        "example_description": (
            "第一行設定 name 屬性，第二行讀取 name 屬性。"
        ),
        "sort_key": "attribute-reference",
        "rules": [
            {
                "analyzer": "python_ast",
                "rule_type": "node_type",
                "match_value": "Attribute",
            },
        ],
    },
    {
        "category": "variables-and-data",
        "section_id": "subscriptions",
        "slug": "subscription",
        "name": "obj [index]",
        "display_label": "索引",
        "summary": (
            "在物件後使用方括號指定位置或鍵，以讀取、設定或刪除對應項目。對一般序列而言，位置從 0 開始；"
            "-1 表示最後一個項目，-2 表示倒數第二個。位置超出範圍會引發 IndexError。對字典而言，"
            "方括號內指定的是鍵；讀取不存在的鍵會引發 KeyError。實際支援的索引形式依物件而定。"
        ),
        "example_code": (
            'names = ["Sammi", "Alan", "Rosie"]\n'
            'profile = {"name": "Sammi"}\n'
            "first = names[0]\n"
            "last = names[-1]\n"
            'name = profile["name"]'
        ),
        "example_description": (
            "三個索引依序取得 Sammi、Rosie、Sammi。前兩個使用序列位置，第三個使用字典的鍵。"
        ),
        "sort_key": "subscription",
        "rules": [
            {
                "analyzer": "python_ast",
                "rule_type": "subscript_kind",
                "match_value": "index",
            },
        ],
    },
    {
        "category": "variables-and-data",
        "section_id": "slicings",
        "slug": "slicing",
        "name": "seq [start : stop : step]",
        "display_label": "切片",
        "summary": (
            "一般寫法為 seq[start:stop:step]，冒號兩側可依運算式的複雜程度加入空格。"
            "使用冒號指定範圍與步長；對一般序列而言，終點位置不包含在結果內，起點、終點與步長皆可省略。"
            "負數位置從序列尾端計算；步長為負數時，往位置較小的方向取值，例如 seq[::-1] 可反轉順序。"
            "省略的起點與終點會依步長方向決定。範圍超出序列長度時會自動調整，不會因此引發 IndexError；"
            "但步長不能為 0，否則會引發 ValueError。"
        ),
        "example_code": (
            "items = [10, 20, 30, 40, 50]\n"
            "middle = items[1:4]\n"
            "tail = items[-2:]\n"
            "reversed_items = items[::-1]\n"
            "available = items[:100]"
        ),
        "example_description": (
            "四個切片依序取得 [20, 30, 40]、[40, 50]、[50, 40, 30, 20, 10] 與 [10, 20, 30, 40, 50]。"
            "最後一個切片的終點超出長度，仍可取得現有範圍。"
        ),
        "sort_key": "slicing",
        "rules": [
            {
                "analyzer": "python_ast",
                "rule_type": "subscript_kind",
                "match_value": "slice",
            },
        ],
    },
    {
        "category": "functions",
        "section_id": "lambda",
        "slug": "lambda-expression",
        "name": "lambda",
        "display_label": "匿名函式",
        "summary": (
            "使用 lambda 建立匿名函式，可接收參數，也可不接收參數。冒號後只能放一個運算式，其結果作為回傳值，"
            "不能放入一般的指派敘述或多行敘述區塊。建立函式時不會立即求值冒號後的運算式，呼叫函式時才會求值。"
            "可將函式指定給名稱，或直接加上呼叫括號使用。"
        ),
        "example_code": (
            "double = lambda x: x * 2\n"
            "first = double(5)\n"
            "second = (lambda x: x + 1)(5)"
        ),
        "example_description": (
            "第一行建立函式並指定給 double；第二行呼叫它，得到 10。第三行建立另一個匿名函式後立即呼叫，得到 6。"
        ),
        "sort_key": "lambda-expression",
        "rules": [
            {
                "analyzer": "python_ast",
                "rule_type": "node_type",
                "match_value": "Lambda",
            },
        ],
    },
    {
        "category": "variables-and-data",
        "section_id": "assignment-expressions",
        "slug": "assignment-expression",
        "name": ":=",
        "display_label": "指派運算式",
        "summary": (
            "使用 名稱 := 運算式，將運算結果指定給名稱，同時讓這個運算式取得該值。與一般指派敘述 = 不同，"
            "可在部分運算式內同時儲存並使用結果。左側只能是單一名稱，不能直接使用物件屬性、索引或多個名稱的解包。"
            "部分使用位置必須加上括號；例如單獨作為一行敘述時，需寫成 (count := 3)。與比較運算搭配時，"
            "可用括號明確指定要儲存的結果，例如 (count := len(items)) > 0。"
        ),
        "example_code": (
            'items = ["Sammi", "Alan"]\n'
            "if (count := len(items)) > 0:\n"
            "    print(count)"
        ),
        "example_description": (
            "先取得 items 的長度 2，存入 count，再判斷是否大於 0；條件成立，因此印出 2。"
        ),
        "sort_key": "assignment-expression",
        "rules": [
            {
                "analyzer": "python_ast",
                "rule_type": "node_type",
                "match_value": "NamedExpr",
            },
        ],
    },
]

# 第 6 章：二元算術運算
# 每筆依序為：
# slug、符號、中文標籤、AST 運算子、解釋、範例、範例說明
ARITHMETIC_DEFINITIONS = [
    (
        "addition", "+", "加法與串接", "Add",
        "計算數值相加，或串接同類型序列，例如字串與串列；"
        "實際行為依運算對象的型別而定。",
        'total = 3 + 2\nname = "Sam" + "mi"',
        "第一行得到 5，第二行得到 Sammi。",
    ),
    (
        "subtraction", "-", "減法", "Sub",
        "從左側數值減去右側數值。a - b 是兩個值相減；-x 則是取得單一值的相反數。",
        "result = 8 - 3",
        "從 8 減去 3，得到 5。",
    ),
    (
        "multiplication", "*", "乘法與重複", "Mult",
        "計算數值相乘，或將序列重複指定的整數次數；"
        "實際行為依運算對象的型別而定。",
        'total = 3 * 2\ntext = "Hi" * 3',
        "第一行得到 6，第二行得到 HiHiHi。",
    ),
    (
        "division", "/", "除法", "Div",
        "計算左側數值除以右側數值。"
        "兩個整數相除時，結果為浮點數。",
        "result = 7 / 2",
        "7 除以 2，得到 3.5。",
    ),
    (
        "floor-division", "//", "向下取整除法", "FloorDiv",
        "將除法結果向負無限大方向取整。"
        "負數結果不一定等同於直接去掉小數。",
        "positive = 7 // 2\nnegative = -7 // 2",
        "結果依序為 3、-4。",
    ),
    (
        "modulo", "%", "取餘數與字串格式化", "Mod",
        "對數值進行取餘數運算，或進行百分比形式的字串格式化；實際行為依運算對象的型別而定。對整數取餘數時，"
        "非零餘數的正負號與右側除數相同，例如 -7 % 3 為 2，7 % -3 為 -2。取餘數的除數不能為 0，"
        "否則會引發 ZeroDivisionError。",
        "positive = 7 % 3\n"
        "negative_left = -7 % 3\n"
        "negative_right = 7 % -3\n"
        'message = "Hello, %s" % "Sammi"',
        "前三行結果依序為 1、2、-2；最後一行得到 Hello, Sammi。",
    ),
    (
        "power", "**", "次方", "Pow",
        "計算左側數值的右側次方。"
        "連續次方由右向左結合，"
        "例如 2 ** 3 ** 2 相當於 2 ** (3 ** 2)。"
        "負號位於次方左側時，-2 ** 2 相當於 -(2 ** 2)，結果為 -4；"
        "若要以負數為底數，需寫成 (-2) ** 2，結果為 4。"
        "次方右側可直接使用負數，例如 2 ** -2 為 0.25。"
        "此項不包含函式引數或字典中的雙星號解包。",
        "result = 2 ** 3",
        "計算 2 的 3 次方，得到 8。",
    ),
    (
        "matrix-multiplication", "@", "矩陣乘法", "MatMult",
        "對支援矩陣乘法的物件執行矩陣乘法。"
        "一般 Python 串列不直接支援此運算。",
        "result = matrix_a @ matrix_b",
        "示範對兩個支援此運算的矩陣物件進行乘法。",
    ),
]

for (
    slug, symbol, label, operator,
    summary, example, explanation
) in ARITHMETIC_DEFINITIONS:
    CHAPTER_SYNTAXES.append({
        "category": "variables-and-data",
        "section_id": (
            "the-power-operator"
            if operator == "Pow"
            else "binary-arithmetic-operations"
        ),
        "slug": slug,
        "name": symbol,
        "display_label": label,
        "summary": summary,
        "example_code": example,
        "example_description": explanation,
        "sort_key": slug,
        "rules": [
            {
                "analyzer": "python_ast",
                "rule_type": "binary_operator",
                "match_value": operator,
            },
        ],
    })

# 第 6.10 節：比較運算
# 每筆依序為：
# slug、顯示寫法、中文標籤、AST 節點、
# 官方小節、解釋、範例、範例說明
COMPARISON_DEFINITIONS = [
    (
        "equal", "==", "等於", "Eq",
        "value-comparisons",
        "比較兩個物件的值是否相等。不同物件也可能具有相等的值，例如兩個內容相同的串列。"
        "與 is 判斷是否為同一個物件不同。",
        "first = [1, 2]\n"
        "second = [1, 2]\n"
        "same_value = first == second",
        "first 與 second 是不同的串列，但內容相同，因此比較結果為 True。",
    ),
    (
        "not-equal", "!=", "不等於", "NotEq",
        "value-comparisons",
        "比較兩個物件的值是否不相等。不同物件仍可能具有相等的值，例如兩個內容相同的串列。"
        "與 is not 判斷是否為不同物件不同。",
        "first = [1, 2]\n"
        "second = [1, 2]\n"
        "third = [1, 3]\n"
        "same_content = first != second\n"
        "different_content = first != third",
        "first 與 second 內容相同，第一個比較結果為 False；first 與 third 內容不同，"
        "第二個比較結果為 True。",
    ),
    (
        "less-than", "<", "小於", "Lt",
        "value-comparisons",
        "比較左側的值是否小於右側。運算對象必須支援此比較。可與其他比較運算子連鎖使用，"
        "例如 0 < score <= 100，表示 score 大於 0 且小於或等於 100。連鎖比較由左至右判斷，"
        "遇到不成立的比較就停止；中間的運算式只求值一次。",
        "first = 3 < 5\n"
        "second = 0 < score < 100",
        "第一行判斷 3 是否小於 5；第二行判斷 score 是否大於 0 且小於 100。",
    ),
    (
        "less-than-or-equal", "<=", "小於或等於", "LtE",
        "value-comparisons",
        "比較左側的值是否小於或等於右側。可與其他比較運算子連鎖使用，例如 0 < score <= 100，"
        "表示 score 大於 0 且小於或等於 100。連鎖比較由左至右判斷，遇到不成立的比較就停止；"
        "中間的運算式只求值一次。",
        "first = 3 <= 5\n"
        "second = 0 <= score <= 100",
        "第一行判斷 3 是否小於或等於 5；第二行判斷 score 是否介於 0 到 100 之間，包含兩端。",
    ),
    (
        "greater-than", ">", "大於", "Gt",
        "value-comparisons",
        "比較左側的值是否大於右側。運算對象必須支援此比較。可與其他比較運算子連鎖使用。連鎖比較由左至右判斷，"
        "遇到不成立的比較就停止；中間的運算式只求值一次。",
        "first = 5 > 3\n"
        "second = 100 > score > 0",
        "第一行判斷 5 是否大於 3；第二行判斷 score 是否小於 100 且大於 0，不包含兩端。",
    ),
    (
        "greater-than-or-equal", ">=", "大於或等於", "GtE",
        "value-comparisons",
        "比較左側的值是否大於或等於右側。可與其他比較運算子連鎖使用。連鎖比較由左至右判斷，遇到不成立的比較就停止；"
        "中間的運算式只求值一次。",
        "first = 5 >= 3\n"
        "second = 100 >= score >= 0",
        "第一行判斷 5 是否大於或等於 3；第二行判斷 score 是否介於 0 到 100 之間，包含兩端。",
    ),
    (
        "membership-in", "in", "包含於", "In",
        "membership-test-operations",
        "判斷指定元素是否包含於物件中。對字串而言，判斷是否包含指定子字串；對字典而言，預設檢查鍵，不是值。",
        'names = ["Sammi", "Alan"]\n'
        'profile = {"name": "Sammi"}\n'
        'has_name = "Sammi" in names\n'
        'has_text = "amm" in "Sammi"\n'
        'has_key = "name" in profile',
        "依序檢查串列元素、字串中的子字串及字典的鍵。三個比較結果皆為 True。",
    ),
    (
        "membership-not-in", "not in", "不包含於", "NotIn",
        "membership-test-operations",
        "判斷指定元素是否不包含於物件中。對字串而言，判斷是否不包含指定子字串；對字典而言，預設檢查鍵，不是值。",
        'names = ["Sammi", "Alan"]\n'
        'profile = {"name": "Sammi"}\n'
        'missing_name = "Chris" not in names\n'
        'missing_text = "xyz" not in "Sammi"\n'
        'missing_key = "score" not in profile',
        "依序檢查串列、字串與字典中不存在的項目。三個比較結果皆為 True。",
    ),
    (
        "identity-is", "is", "相同物件", "Is",
        "is-not",
        "判斷兩個名稱或運算式是否指向同一個物件，不是比較內容是否相等。常用於判斷是否為 None，"
        "例如 result is None。比較數字或字串的值是否相等時，應使用 ==。",
        "first = [1, 2]\n"
        "second = [1, 2]\n"
        "alias = first\n"
        "different_object = first is second\n"
        "same_object = first is alias",
        "first 與 second 是不同物件，第一個比較結果為 False；"
        "alias 指向 first 的同一個物件，第二個比較結果為 True。",
    ),
    (
        "identity-is-not", "is not", "不同物件", "IsNot",
        "is-not",
        "判斷兩個名稱或運算式是否指向不同物件，不是比較內容是否不同。常用於判斷是否不是 None，"
        "例如 result is not None。比較數字或字串的值是否不同時，應使用 !=。",
        "first = [1, 2]\n"
        "second = [1, 2]\n"
        "alias = first\n"
        "different_object = first is not second\n"
        "same_object = first is not alias",
        "first 與 second 是不同物件，第一個比較結果為 True；"
        "alias 指向 first 的同一個物件，第二個比較結果為 False。",
    ),
]

for (
    slug, symbol, label, node_type,
    section_id, summary, example, explanation
) in COMPARISON_DEFINITIONS:
    CHAPTER_SYNTAXES.append({
        "category": "variables-and-data",
        "section_id": section_id,
        "slug": slug,
        "name": symbol,
        "display_label": label,
        "summary": summary,
        "example_code": example,
        "example_description": explanation,
        "sort_key": slug,
        "rules": [
            {
                "analyzer": "python_ast",
                "rule_type": "node_type",
                "match_value": node_type,
            },
        ],
    })

# 第 6.11 節：布林運算
CHAPTER_SYNTAXES.extend([
    {
        "category": "control-flow",
        "section_id": "boolean-operations",
        "slug": "boolean-and",
        "name": "and",
        "display_label": "邏輯且",
        "summary": (
            "由左至右判斷各運算元的真假。遇到第一個假值就回傳該值，不再求值後面的運算式；若全部為真，"
            "則回傳最後一個運算元的值。結果不一定是 True 或 False。"
        ),
        "example_code": (
            "first = 0 and 100\n"
            'second = 1 and "Sammi"\n'
            "third = 1 and 2 and 3"
        ),
        "example_description": (
            "三行結果依序為 0、字串 Sammi、3。"
        ),
        "sort_key": "boolean-and",
        "rules": [
            {
                "analyzer": "python_ast",
                "rule_type": "boolean_operator",
                "match_value": "And",
            },
        ],
    },
    {
        "category": "control-flow",
        "section_id": "boolean-operations",
        "slug": "boolean-or",
        "name": "or",
        "display_label": "邏輯或",
        "summary": (
            "由左至右判斷各運算元的真假。遇到第一個真值就回傳該值，不再求值後面的運算式；若全部為假，"
            "則回傳最後一個運算元的值。結果不一定是 True 或 False。"
        ),
        "example_code": (
            'first = "" or "Sammi"\n'
            "second = 10 or 20\n"
            'third = 0 or "" or None'
        ),
        "example_description": (
            "三行結果依序為字串 Sammi、10、None。"
        ),
        "sort_key": "boolean-or",
        "rules": [
            {
                "analyzer": "python_ast",
                "rule_type": "boolean_operator",
                "match_value": "Or",
            },
        ],
    },
    {
        "category": "control-flow",
        "section_id": "boolean-operations",
        "slug": "boolean-not",
        "name": "not",
        "display_label": "邏輯否定",
        "summary": (
            "依運算元的真假回傳相反的布林值。運算元為假時回傳 True，為真時回傳 False。與 and、or 不同，"
            "not 的結果一定是布林值。"
        ),
        "example_code": (
            "first = not 0\n"
            'second = not "Sammi"\n'
            "third = not (3 > 2)"
        ),
        "example_description": (
            "三行結果依序為 True、False、False。"
        ),
        "sort_key": "boolean-not",
        "rules": [
            {
                "analyzer": "python_ast",
                "rule_type": "node_type",
                "match_value": "Not",
            },
        ],
    },
])

# 第 6.6、6.8、6.9 節：一元、位移與位元運算
# 每筆依序為：
# slug、顯示寫法、中文標籤、規則種類、比對值、
# 官方小節、解釋、範例、範例說明
BITWISE_DEFINITIONS = [
    (
        "unary-plus", "+x", "一元正號",
        "node_type", "UAdd",
        "unary-arithmetic-and-bitwise-operations",
        "對數值使用一元正號，通常保留原本的數值與正負號；"
        "不是將負數轉成正數，也不是兩個值相加。",
        "result = +(-5)",
        "對 -5 使用一元正號，結果仍為 -5。",
    ),
    (
        "unary-minus", "-x", "一元負號",
        "node_type", "USub",
        "unary-arithmetic-and-bitwise-operations",
        "取得數值的相反數；正數變負數，負數變正數。與 a - b 的兩個值相減不同，-x 只作用於一個運算元。",
        "result = -5",
        "取得 5 的相反數，得到 -5。",
    ),
    (
        "bitwise-invert", "~x", "位元反轉",
        "node_type", "Invert",
        "unary-arithmetic-and-bitwise-operations",
        "對整數的位元進行反轉。"
        "Python 整數的結果等於 -(x + 1)。",
        "result = ~5",
        "反轉整數 5 的位元，結果為 -6。",
    ),
    (
        "left-shift", "<<", "向左位移",
        "binary_operator", "LShift",
        "shifting-operations",
        "將整數的位元向左移動指定的非負位數。對整數而言，左移 n 位等同乘以 2 的 n 次方。移動 0 位時，值不變。"
        "右側位數必須是整數；若為負數，會引發 ValueError。",
        "shifted = 3 << 2\n"
        "unchanged = 3 << 0",
        "第一行左移兩位，得到 12；第二行移動零位，仍為 3。",
    ),
    (
        "right-shift", ">>", "向右位移",
        "binary_operator", "RShift",
        "shifting-operations",
        "將整數的位元向右移動指定的非負位數。對整數而言，右移 n 位等同除以 2 的 n 次方後向下取整。"
        "負數同樣向負無限大方向取整，例如 -7 >> 1 為 -4，不是 -3。移動 0 位時，值不變。"
        "右側位數必須是整數；若為負數，會引發 ValueError。",
        "positive = 12 >> 2\n"
        "negative = -7 >> 1",
        "第一行得到 3；第二行相當於 -7 // 2，得到 -4。",
    ),
    (
        "bitwise-and", "&", "位元 AND",
        "binary_operator", "BitAnd",
        "binary-bitwise-operations",
        "對整數逐位比較，兩側該位皆為 1 時，結果才為 1。"
        "用於集合時表示交集，不等同布林運算 and。",
        "result = 6 & 3",
        "6 的二進位為 110，3 為 011；逐位 AND 得到 010，即 2。",
    ),
    (
        "bitwise-or", "|", "位元 OR",
        "binary_operator", "BitOr",
        "binary-bitwise-operations",
        "對整數逐位比較，任一側該位為 1 時，結果即為 1。"
        "用於集合時表示聯集；也支援其他型別定義的用途，"
        "不等同布林運算 or。",
        "result = 6 | 3",
        "二進位 110 與 011 逐位 OR，得到 111，即 7。",
    ),
    (
        "bitwise-xor", "^", "位元 XOR",
        "binary_operator", "BitXor",
        "binary-bitwise-operations",
        "對整數逐位比較，兩側該位不同時結果為 1，"
        "相同時為 0。用於集合時表示對稱差集。"
        "Python 的次方使用 **，不是 ^。",
        "result = 6 ^ 3",
        "二進位 110 與 011 逐位 XOR，得到 101，即 5。",
    ),
]

for (
    slug, symbol, label, rule_type, match_value,
    section_id, summary, example, explanation
) in BITWISE_DEFINITIONS:
    CHAPTER_SYNTAXES.append({
        "category": "variables-and-data",
        "section_id": section_id,
        "slug": slug,
        "name": symbol,
        "display_label": label,
        "summary": summary,
        "example_code": example,
        "example_description": explanation,
        "sort_key": slug,
        "rules": [
            {
                "analyzer": "python_ast",
                "rule_type": rule_type,
                "match_value": match_value,
            },
        ],
    })

# 第 6.4 節：await 運算式
CHAPTER_SYNTAXES.append({
    "category": "control-flow",
    "section_id": "await-expression",
    "slug": "await-expression",
    "name": "await",
    "display_label": "等待非同步結果",
    "summary": (
        "在 async def 定義的非同步函式中，等待可等待物件的結果。可等待物件包括呼叫非同步函式取得的協程物件，"
        "以及支援等待協定的物件；不能直接等待一般整數或字串。等待尚未完成時，可暫停目前協程，讓事件迴圈執行其他工作；"
        "取得結果後再繼續執行。await 不會自動將一般的阻塞操作變成非同步操作。"
    ),
    "example_code": (
        "async def fetch_score():\n"
        "    return 90\n"
        "\n"
        "async def load_score():\n"
        "    score = await fetch_score()\n"
        "    return score"
    ),
    "example_description": (
        "呼叫 fetch_score() 取得協程物件，再以 await 等待它完成，取得回傳值 90。範例只定義函式，"
        "尚未啟動執行，也不涉及實際的網路或檔案等待。"
    ),
    "sort_key": "await-expression",
    "rules": [
        {
            "analyzer": "python_ast",
            "rule_type": "node_type",
            "match_value": "Await",
        },
    ],
})

# 第 6.2.2 節：常值
LITERAL_DEFINITIONS = [
    (
        "integer-literal", "123", "整數常值", "int",
        "直接寫出的整數，可使用十進位、二進位、八進位或十六進位。"
        "數字前的正負號屬於另外的一元運算。",
        "age = 20\nmask = 0xFF",
        "age 的值為十進位整數 20；mask 的值為十六進位整數 0xFF，相當於十進位的 255。",
    ),
    (
        "float-literal", "1.23", "浮點數常值", "float",
        "直接寫出的浮點數，可使用小數點或科學記號。"
        "浮點數不一定能精確表示所有十進位小數。",
        "price = 3.14\nlarge = 1e3",
        "3.14 和 1e3 都是浮點數常值，其中 1e3 表示 1000.0。",
    ),
    (
        "string-literal", '"..."', "字串常值", "str",
        "使用單引號、雙引號或三個引號表示文字。相鄰的普通字串常值會自動串接，例如 \"Hello, \" \"Sammi\"。"
        "也可以使用 + 串接字串。文件字串也屬於字串常值；以 # 開頭的註解則不是字串。",
        'first = "Hello, " "Sammi"\n'
        'second = "Hello, " + "Sammi"',
        "兩行結果皆為 Hello, Sammi。第一行使用相鄰字串常值自動串接；第二行使用 + 串接。",
    ),
    (
        "bytes-literal", 'b "..."', "位元組字串常值", "bytes",
        "在引號前加上 b，直接表示位元組資料。"
        "可直接寫入 ASCII 字元，其他位元組可使用跳脫表示法。"
        "標題中的空格僅供排版；實際程式碼中，"
        "b 或 B 必須緊接開頭引號，中間不能有空格。",
        'data = b"ABC"',
        "建立包含 ASCII 字元 A、B、C 的三個位元組資料。",
    ),
    (
        "imaginary-literal", "1j", "虛數常值", "imaginary",
        "在數字後加上 j 或 J，表示虛數部分。"
        "例如 2 + 3j 是整數常值、加法與虛數常值的組合。",
        "value = 3j",
        "直接寫出虛數常值 3j。",
    ),
]

for (
    slug, name, label, kind,
    summary, example, explanation
) in LITERAL_DEFINITIONS:
    CHAPTER_SYNTAXES.append({
        "category": "variables-and-data",
        "section_id": "literals",
        "slug": slug,
        "name": name,
        "display_label": label,
        "summary": summary,
        "example_code": example,
        "example_description": explanation,
        "sort_key": slug,
        "rules": [
            {
                "analyzer": "python_ast",
                "rule_type": "constant_type",
                "match_value": kind,
            },
        ],
    })

# 字串常值延伸：f-string
CHAPTER_SYNTAXES.append({
    "category": "variables-and-data",
    "section_id": "literals",
    "slug": "formatted-string-literal",
    "name": 'f "...{expr}..."',
    "display_label": "格式化字串",
    "summary": (
        "在字串前加上 f 或 F，可將大括號中的運算式結果插入文字。可在大括號內的運算式後加上冒號，指定顯示格式；"
        "若要顯示大括號本身，使用 {{ 或 }}。大括號中可以放入函式呼叫、屬性存取或算術運算等運算式。"
        "標題中的空格僅供排版；實際程式碼中，f 或 F 必須緊接開頭引號，中間不能有空格。"
    ),
    "example_code": (
        'name = "Sammi"\n'
        "price = 12.5\n"
        'message = f"Hello, {name.upper()}"\n'
        'formatted = f"Price: {price:.2f}"'
    ),
    "example_description": (
        "第一個 f-string 呼叫 upper，得到 Hello, SAMMI；第二個將價格顯示為小數點後兩位，"
        "得到 Price: 12.50。"
    ),
    "sort_key": "formatted-string-literal",
    "rules": [
        {
            "analyzer": "python_ast",
            "rule_type": "constant_type",
            "match_value": "fstring",
        },
    ],
})

# 基本元素延伸：布林值、None、Ellipsis
CHAPTER_SYNTAXES.extend([
    {
        "category": "variables-and-data",
        "section_id": "atoms",
        "slug": "boolean-constant",
        "name": "True / False",
        "display_label": "布林值",
        "summary": (
            "True 表示真，False 表示假，首字母必須大寫。兩者是布林型別的值，不是加上引號的字串。"
        ),
        "example_code": (
            "is_ready = True\n"
            "is_finished = False"
        ),
        "example_description": (
            "is_ready 設為 True，表示已準備好；is_finished 設為 False，表示尚未完成。"
        ),
        "sort_key": "boolean-constant",
        "rules": [
            {
                "analyzer": "python_ast",
                "rule_type": "constant_type",
                "match_value": "bool",
            },
        ],
    },
    {
        "category": "variables-and-data",
        "section_id": "atoms",
        "slug": "none-constant",
        "name": "None",
        "display_label": "空值",
        "summary": (
            "表示沒有值或尚未提供值。"
            "None 不等同於 0、空字串或空容器。"
            "判斷是否為 None，通常使用 is None。"
        ),
        "example_code": (
            "result = None\n"
            "missing = result is None"
        ),
        "example_description": (
            "先將 result 設為 None，再使用 is None 判斷，missing 的結果為 True。"
        ),
        "sort_key": "none-constant",
        "rules": [
            {
                "analyzer": "python_ast",
                "rule_type": "constant_type",
                "match_value": "none",
            },
        ],
    },
    {
        "category": "variables-and-data",
        "section_id": "atoms",
        "slug": "ellipsis-literal",
        "name": "...",
        "display_label": "省略號常值",
        "summary": (
            "三個連續句點表示 Ellipsis 物件，"
            "可作為待完成程式碼的佔位，"
            "也會用於部分套件的多維索引。"
            "它不是註解，也不等同於 pass 敘述。"
        ),
        "example_code": (
            "def unfinished():\n"
            "    ..."
        ),
        "example_description": (
            "使用 ... 作為尚未完成的函式內容。這個函式本身不會因此自動拋出未實作錯誤。"
        ),
        "sort_key": "ellipsis-literal",
        "rules": [
            {
                "analyzer": "python_ast",
                "rule_type": "constant_type",
                "match_value": "ellipsis",
            },
        ],
    },
])

CHAPTER_SYNTAXES.extend([
    {
        "category": "variables-and-data",
        "section_id": "expression-lists",
        "slug": "iterable-unpacking",
        "name": "*iterable",
        "display_label": "可迭代物件解包",
        "summary": (
            "在可迭代物件前加上 *，將其中的元素逐項展開。可用於串列、元組、集合的建立，或將元素作為函式的位置引數傳入。"
        ),
        "example_code": (
            "items = [10, 20]\n"
            "combined = [0, *items]\n"
            "print(*items)"
        ),
        "example_description": (
            "第一個 *items 將元素展開到新串列；第二個將元素分別傳給 print。"
        ),
        "sort_key": "*iterable",
        "rules": [
            {
                "analyzer": "python_ast",
                "rule_type": "unpacking",
                "match_value": "iterable",
            },
        ],
    },
    {
        "category": "variables-and-data",
        "section_id": "dictionary-displays",
        "slug": "mapping-unpacking",
        "name": "**mapping",
        "display_label": "映射解包",
        "summary": (
            "在映射物件前加上 **，將其中的鍵值配對展開。可用於建立字典，或傳入函式的關鍵字引數。建立字典時，若鍵重複，"
            "後面的值會取代前面的值。傳入函式時，鍵必須是字串，同一個關鍵字引數不能重複提供，否則會引發 TypeError。"
        ),
        "example_code": (
            'options = {"name": "Sammi"}\n'
            'merged = {**options, "name": "Alan"}\n'
            'message = "Hello, {name}".format(**merged)'
        ),
        "example_description": (
            "建立 merged 時，後面的 name 值取代原本的 Sammi，"
            "因此 merged 為 {\"name\": \"Alan\"}。接著將它展開為 format 的關鍵字引數，"
            "得到 Hello, Alan。"
        ),
        "sort_key": "**mapping",
        "rules": [
            {
                "analyzer": "python_ast",
                "rule_type": "unpacking",
                "match_value": "mapping",
            },
        ],
    },
])

def main():
    parser = argparse.ArgumentParser(description=__doc__)

    parser.add_argument(
        "command",
        choices=["generate", "apply"],
    )

    args = parser.parse_args()

    if args.command == "generate":
        generate(FILENAME, CHAPTER_SYNTAXES)

    elif args.command == "apply":
        apply(FILENAME)



if __name__ == "__main__":
    main()
