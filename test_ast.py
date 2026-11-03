import ast
from collections import Counter


# 模擬使用者輸入的 Python 程式碼
source_code = """
def check_scores(scores):
    passed = 0

    for score in scores:
        if score >= 60:
            passed = passed + 1

    return passed

print(check_scores([50, 70, 90]))
"""


# 定義這次想辨識的語法
syntax_types = {
    ast.Assign: "一般賦值",
    ast.If: "條件判斷",
    ast.For: "for 迴圈",
    ast.While: "while 迴圈",
    ast.FunctionDef: "函式定義",
    ast.Return: "return",
    ast.Call: "函式呼叫",
}


def analyze_code(code):
    # 將程式碼解析成 AST；語法錯誤時會拋出 SyntaxError
    tree = ast.parse(code)

    counts = Counter()

    # 走訪整棵語法樹的每個節點
    for node in ast.walk(tree):
        syntax_name = syntax_types.get(type(node))

        if syntax_name is not None:
            counts[syntax_name] += 1

    return counts


def main():
    try:
        result = analyze_code(source_code)
    except SyntaxError as error:
        print(f"程式碼語法錯誤：第 {error.lineno} 行，{error.msg}")
        return

    print("語法分析結果：")

    for syntax_name, count in result.items():
        print(f"{syntax_name}：{count} 次")


if __name__ == "__main__":
    main()