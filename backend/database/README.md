# 資料庫更新

在專案根目錄執行 `python backend/migrate.py`，只檢查檔案，不連線資料庫。
部署使用後端映像中的 `python migrate.py --apply`；執行前先備份資料庫。

## 執行方式

1. 取得與語法匯入工具共用的 MySQL migration 鎖。
2. 驗證 `schema_migrations` 中同名檔案的 SHA-256；已執行檔案不可修改。
3. 執行三份初始 schema 的建表敘述。入口會加入 `IF NOT EXISTS`，已有的表保留。
4. 按數字順序讀取 migrations 下的 SQL 或 Python 更新，跳過已執行且校驗碼相同的檔案。
5. 每份成功後記錄檔名與校驗碼；失敗就停止，不記錄成功。

初始 schema 是空白環境的起點，不會自動修正已存在表的所有結構差異。
既有欄位的新增或修改仍應透過新的 migration 表達。
MySQL DDL 有隱含提交，不能保證整次更新全部回復；結構更新需設計成可重跑。
舊專案不同檔名的歷史紀錄保留，不直接當成新版的已執行紀錄。

## 之後新增更新

新增 `007_用途.sql`，以此類推。不要修改已套用的 SQL，也不要使用重複編號。
一般 SQL 的 `ADD COLUMN` 會先檢查欄位。工具支援的簡單型別定義會驗證型別、
NULL 與預設值；不支援的定義會停止，請使用 Python migration 明確處理。
一般 DML 仍由作者負責資料更新邏輯，不會自動判斷任意 SQL 是否安全重跑。

涉及索引、外鍵、複雜 ALTER 或資料轉換時，可以新增 `007_用途.py`：

```python
from migrate import ensure_column, ensure_index


def upgrade(cursor):
    ensure_column(cursor, "users", "example", "VARCHAR(50) NULL")
    ensure_index(cursor, "users", "idx_users_example", ("example",))
```

同一個編號只能使用 SQL 或 Python 其中一種。Python migration 由程式碼審查確認，
不要自行 commit、關閉 cursor 或操作 migration 鎖。外鍵等尚無共用 helper 的操作，
需先查 information_schema，已存在時驗證定義，再決定是否新增。

`001_add_record_numbers.sql` 有特別相容處理：部署入口不重跑原本重新編號的 SQL，
只補缺少的欄位、索引與 NULL 編號，保留既有編號與不倒退的下一筆編號。
語法資料 SQL 保留既有 category/slug 對應的 ID，只更新該項目的內容與規則，
不刪除只有舊版才有的語法、會員紀錄或收藏。
