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


def analyze_python(code: str):
    tree = ast.parse(code)
    counts = Counter()

    for node in ast.walk(tree):
        syntax = SYNTAX_TYPES.get(type(node))

        if syntax is not None:
            counts[syntax] += 1

    return [
        {
            "slug": slug,
            "name": name,
            "count": count,
        }
        for (slug, name), count in counts.items()
    ]