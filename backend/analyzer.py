import ast
from collections import Counter


SYNTAX_TYPES = {
    ast.Assign: ("assignment", "一般賦值"),
    ast.If: ("if", "條件判斷"),
    ast.For: ("for", "for 迴圈"),
    ast.While: ("while", "while 迴圈"),
    ast.FunctionDef: ("function-definition", "函式定義"),
    ast.Return: ("return", "return"),
    ast.Call: ("function-call", "函式呼叫"),
}

SYNTAX_DETAILS = {
    "assignment": {
        "summary": "使用等號將右側的值指定給左側的變數或目標。",
        "example_code": "score = 80\nname = \"Sammi\"",
    },
    "if": {
        "summary": "依條件決定是否執行對應的程式區塊。",
        "example_code": "if score >= 60:\n    print(\"及格\")",
    },
    "for": {
        "summary": "依序取得可迭代物件中的項目，執行迴圈區塊。",
        "example_code": "for number in [1, 2, 3]:\n    print(number)",
    },
    "while": {
        "summary": "條件成立時持續執行迴圈區塊。",
        "example_code": "count = 0\nwhile count < 3:\n    count += 1",
    },
    "function-definition": {
        "summary": "使用 def 定義函式，封裝可重複呼叫的程式。",
        "example_code": "def greet(name):\n    return \"Hello, \" + name",
    },
    "return": {
        "summary": "結束目前的函式呼叫，並可將結果回傳給呼叫端。",
        "example_code": "def add(a, b):\n    return a + b",
    },
    "function-call": {
        "summary": "使用括號呼叫函式或其他可呼叫物件，並可傳入引數。",
        "example_code": "print(\"Hello\")",
    },
}

def analyze_python(code: str):
    tree = ast.parse(code)
    counts = Counter()

    for node in ast.walk(tree):
        syntax = SYNTAX_TYPES.get(type(node))

        if syntax is not None:
            counts[syntax] += 1

    # 全部節點統計完成後，才回傳結果
    return [
        {
            "slug": slug,
            "name": name,
            "count": count,
            **SYNTAX_DETAILS[slug],
        }
        for (slug, name), count in counts.items()
    ]
