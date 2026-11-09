# 初版 Python 基礎語法匯入工具

這五個工具用於初版少量基礎語法的資料匯入，保留作為初版資料建立流程的參考。它們不是 AST 自動化測試，也不會在網站啟動時自動執行。

| 檔案 | 用途 |
| --- | --- |
| `import_assignment_syntax.py` | 指派語法 |
| `import_condition_syntaxes.py` | 條件判斷語法 |
| `import_function_syntaxes.py` | 函式相關語法 |
| `import_loop_syntaxes.py` | 迴圈語法 |
| `import_module_syntaxes.py` | 模組匯入與相關關鍵字 |

## 執行前準備

- 使用已安裝 `backend/requirements.txt` 套件的 Python 環境。
- 透過 `backend/.env` 指定目標資料庫，並先建立語法相關資料表。
- 準備 `backend/data/python-3.13/all-sections.json` 官方文件快照；可透過 `backend/fetch_python_chapters.py` 擷取。

## 執行方式

在專案根目錄執行需要的工具，例如：

```powershell
.\.venv\Scripts\python.exe .\backend\scripts\initial_syntax_import\import_assignment_syntax.py
```

其他工具以相同方式執行，替換檔名即可。工具會固定尋找 `backend` 內的連線模組與資料快照。

## 與目前章節工具的關係

目前 Python 第 6 ~ 8 章的資料維護使用 `backend/python_chapter6.py`、`backend/python_chapter7.py`、`backend/python_chapter8.py`，共用 `backend/python_syntaxes.py`。

這些初版工具保留原本的 SQL 與匯入行為，執行時會寫入 `.env` 指定的資料庫，部分同鍵項目會被更新。不要在目前或正式資料庫重新執行它們來重現初版；請使用獨立的測試資料庫。

它們不包含會員資料，也不納入網站 API 的 Docker 映像。
