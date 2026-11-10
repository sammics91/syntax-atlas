"""部署入口：預設只檢查檔案，--apply 才連線執行更新。"""

import argparse
import ast
import hashlib
import importlib.util
import re

from python_syntaxes import MIGRATIONS, ROOT, SEPARATOR


BASE_SCHEMAS = ("member_schema.sql", "syntax_schema.sql", "records_schema.sql")
GENERATED_HEADER = "-- syntax-atlas generated migration v1\n"


def split_sql(text):
    """切開一般 SQL，保留引號內分號；複雜腳本請用 Python migration。"""
    statements, buffer = [], []
    quote = None
    index = 0
    if re.search(r"(?im)^\s*DELIMITER\b", text):
        raise ValueError("DELIMITER 請改用 Python migration。")
    while index < len(text):
        char = text[index]
        if quote:
            buffer.append(char)
            if char == "\\" and index + 1 < len(text):
                index += 1
                buffer.append(text[index])
            elif char == quote:
                if index + 1 < len(text) and text[index + 1] == quote:
                    index += 1
                    buffer.append(text[index])
                else:
                    quote = None
        elif char in "'\"`":
            quote = char
            buffer.append(char)
        elif char == "#" or (text.startswith("--", index) and
                              (index + 2 == len(text) or text[index + 2].isspace())):
            end = text.find("\n", index)
            index = len(text) if end == -1 else end
            buffer.append("\n")
            continue
        elif text.startswith("/*", index):
            raise ValueError("此入口只接受 -- 或 # 行註解。")
        elif char == ";":
            if "".join(buffer).strip():
                statements.append("".join(buffer).strip())
            buffer = []
        else:
            buffer.append(char)
        index += 1
    if quote:
        raise ValueError("SQL 引號未結束。")
    if "".join(buffer).strip():
        statements.append("".join(buffer).strip())
    return statements


def quoted(name):
    if not re.fullmatch(r"[a-zA-Z_][a-zA-Z0-9_]*", name):
        raise ValueError(f"無效名稱：{name}")
    return f"`{name}`"


def ensure_column(cursor, table, column, definition):
    """不存在才新增；已有欄位的型別、NULL、預設值不同就停止。"""
    quoted(table)
    quoted(column)
    expected = re.fullmatch(
        r"(BIGINT UNSIGNED|INT UNSIGNED|VARCHAR\(\d+\)|CHAR\(\d+\)|DATETIME|TEXT)"
        r"\s+(NOT NULL|NULL)(?:\s+DEFAULT\s+(NULL|\d+|'[^']*'|CURRENT_TIMESTAMP))?",
        definition.strip(), re.I,
    )
    if not expected:
        raise ValueError("此欄位定義請使用自訂 Python migration：" + definition)
    cursor.execute(
        "SELECT COLUMN_TYPE, IS_NULLABLE, COLUMN_DEFAULT FROM information_schema.columns "
        "WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = %s AND COLUMN_NAME = %s",
        (table, column),
    )
    row = cursor.fetchone()
    if row is None:
        cursor.execute(f"ALTER TABLE {quoted(table)} ADD COLUMN {quoted(column)} {definition}")
        return
    actual_type = re.sub(r"\b(bigint|int)\(\d+\)", r"\1", row[0].lower())
    default = expected[3]
    default = None if default is None or default.upper() == "NULL" else default.strip("'").lower()
    actual_default = None if row[2] is None else str(row[2]).lower().replace("()", "")
    if (actual_type, row[1], actual_default) != (
        expected[1].lower(), "NO" if expected[2].upper() == "NOT NULL" else "YES", default
    ):
        raise RuntimeError(f"既有欄位定義不同：{table}.{column}；請新增明確的結構更新。")


def ensure_index(cursor, table, name, columns, *, unique=False):
    fields = ", ".join(quoted(column) for column in columns)
    cursor.execute(
        "SELECT COLUMN_NAME, NON_UNIQUE, SUB_PART FROM information_schema.statistics "
        "WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = %s AND INDEX_NAME = %s "
        "ORDER BY SEQ_IN_INDEX", (table, name),
    )
    rows = cursor.fetchall()
    if rows:
        if [row[0] for row in rows] != list(columns) or any(
            row[1] != int(not unique) or row[2] is not None for row in rows
        ):
            raise RuntimeError(f"既有索引定義不同：{table}.{name}")
    else:
        kind = "UNIQUE KEY" if unique else "KEY"
        cursor.execute(f"ALTER TABLE {quoted(table)} ADD {kind} {quoted(name)} ({fields})")


ADD_COLUMN = re.compile(
    r"ALTER\s+TABLE\s+`?(\w+)`?\s+ADD\s+COLUMN\s+`?(\w+)`?\s+(.+?)\s*;?\s*$", re.I | re.S
)


def validate_statement(statement):
    if re.match(r"\s*ALTER\b", statement, re.I) and not ADD_COLUMN.fullmatch(statement):
        raise ValueError("複雜 ALTER 請新增 Python migration，先檢查結構再更新。")
    if re.match(r"\s*(DROP|TRUNCATE|RENAME)\b", statement, re.I):
        raise ValueError("此操作請使用明確的 Python migration。")


def execute_statement(cursor, statement):
    match = ADD_COLUMN.fullmatch(statement)
    if match:
        ensure_column(cursor, match[1], match[2], match[3])
    else:
        statement = re.sub(
            r"^CREATE\s+TABLE\s+(?!IF\s+NOT\s+EXISTS\b)",
            "CREATE TABLE IF NOT EXISTS ", statement, count=1, flags=re.I,
        )
        cursor.execute(statement)


def ensure_record_numbers(cursor):
    """相容原本 001：只補缺值，已取得的編號與下一筆編號都不倒退。"""
    ensure_column(cursor, "users", "next_record_number", "BIGINT UNSIGNED NOT NULL DEFAULT 1")
    cursor.execute(
        "SELECT COLUMN_TYPE, IS_NULLABLE FROM information_schema.columns "
        "WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'records' AND COLUMN_NAME = 'record_number'"
    )
    existing = cursor.fetchone()
    if existing is None:
        cursor.execute("ALTER TABLE records ADD COLUMN record_number BIGINT UNSIGNED NULL")
    elif re.sub(r"\(\d+\)", "", existing[0]) != "bigint unsigned":
        raise RuntimeError("records.record_number 型別不同。")
    cursor.execute("SELECT id FROM users ORDER BY id FOR UPDATE")
    cursor.fetchall()
    cursor.execute("""
        UPDATE records AS r
        JOIN (
            SELECT pending.id,
                   COALESCE(previous.maximum, 0) + ROW_NUMBER() OVER (
                       PARTITION BY pending.user_id ORDER BY pending.created_at, pending.id
                   ) AS assigned_number
            FROM records AS pending
            LEFT JOIN (
                SELECT user_id, MAX(record_number) AS maximum
                FROM records GROUP BY user_id
            ) AS previous ON previous.user_id = pending.user_id
            WHERE pending.record_number IS NULL
        ) AS numbered ON numbered.id = r.id
        SET r.record_number = numbered.assigned_number, r.updated_at = r.updated_at
    """)
    cursor.execute("""
        UPDATE users AS u
        LEFT JOIN (
            SELECT user_id, MAX(record_number) + 1 AS next_number
            FROM records GROUP BY user_id
        ) AS numbered ON numbered.user_id = u.id
        SET u.next_record_number = GREATEST(
                u.next_record_number, COALESCE(numbered.next_number, 1)
            ), u.updated_at = u.updated_at
    """)
    if existing is None or existing[1] == "YES":
        cursor.execute("ALTER TABLE records MODIFY COLUMN record_number BIGINT UNSIGNED NOT NULL")
    ensure_index(cursor, "records", "uq_records_user_record_number", ("user_id", "record_number"), unique=True)


def load_migrations(directory=MIGRATIONS):
    numbers, result = set(), []
    for path in sorted(directory.iterdir()):
        if path.suffix not in {".sql", ".py"}:
            continue
        match = re.fullmatch(r"(\d{3,})_[a-zA-Z0-9_]+\.(sql|py)", path.name)
        if not match or int(match[1]) in numbers:
            raise ValueError(f"名稱不符或編號重複：{path.name}")
        numbers.add(int(match[1]))
        raw = path.read_bytes()
        content = raw.decode("utf-8-sig")
        statements = None
        if path.suffix == ".py":
            tree = ast.parse(content, filename=str(path))
            if not any(isinstance(node, ast.FunctionDef) and node.name == "upgrade" for node in tree.body):
                raise ValueError(f"{path.name} 需要提供 upgrade(cursor)。")
        else:
            statements = (
                [part.strip() for part in content.split(SEPARATOR)[1:] if part.strip()]
                if content.startswith(GENERATED_HEADER) else split_sql(content)
            )
            if not statements:
                raise ValueError(f"空白更新檔：{path.name}")
            if path.name != "001_add_record_numbers.sql":
                for statement in statements:
                    validate_statement(statement)
        result.append((int(match[1]), path, hashlib.sha256(raw).hexdigest(), statements))
    return sorted(result, key=lambda item: item[0])


def run(migrations):
    from database import get_db_connection

    connection = get_db_connection()
    cursor = connection.cursor()
    locked = False
    try:
        cursor.execute("SELECT DATABASE(), @@hostname")
        print("目標資料庫與主機：", cursor.fetchone())
        cursor.execute("SELECT GET_LOCK('syntax_atlas_migrations', 60)")
        locked = cursor.fetchone()[0] == 1
        if not locked:
            raise RuntimeError("另一次資料庫更新尚未完成。")
        cursor.execute("""
            CREATE TABLE IF NOT EXISTS schema_migrations (
                filename VARCHAR(255) PRIMARY KEY,
                checksum CHAR(64) NOT NULL,
                applied_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
            ) ENGINE=InnoDB
        """)
        cursor.execute("SELECT filename, checksum FROM schema_migrations")
        applied = dict(cursor.fetchall())
        for _, path, checksum, _ in migrations:
            if path.name in applied and applied[path.name] != checksum:
                raise RuntimeError(f"已執行的檔案被修改：{path.name}；請新增 migration。")
        connection.commit()
        for filename in BASE_SCHEMAS:
            for statement in split_sql((ROOT / "database" / filename).read_text(encoding="utf-8-sig")):
                execute_statement(cursor, statement)
        ensure_column(cursor, "syntaxes", "display_label", "VARCHAR(100) NULL")
        connection.commit()
        for _, path, checksum, statements in migrations:
            if path.name in applied:
                print(f"已執行，跳過：{path.name}")
                continue
            print(f"執行：{path.name}")
            if path.name == "001_add_record_numbers.sql":
                ensure_record_numbers(cursor)
            elif path.suffix == ".py":
                spec = importlib.util.spec_from_file_location("database_migration", path)
                module = importlib.util.module_from_spec(spec)
                spec.loader.exec_module(module)
                module.upgrade(cursor)
            else:
                for statement in statements:
                    execute_statement(cursor, statement)
            cursor.execute(
                "INSERT INTO schema_migrations (filename, checksum) VALUES (%s, %s)", (path.name, checksum)
            )
            connection.commit()
        print("資料庫更新完成。")
    except Exception:
        connection.rollback()
        raise
    finally:
        if locked:
            cursor.execute("SELECT RELEASE_LOCK('syntax_atlas_migrations')")
            cursor.fetchone()
        cursor.close()
        connection.close()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--apply", action="store_true", help="連線並執行更新")
    args = parser.parse_args()
    migrations = load_migrations()
    for filename in BASE_SCHEMAS:
        statements = split_sql((ROOT / "database" / filename).read_text(encoding="utf-8-sig"))
        if not statements or any(not re.match(r"CREATE\s+TABLE\b", sql, re.I) for sql in statements):
            raise ValueError(f"初始結構只能包含建表敘述：{filename}")
    for _, path, _, _ in migrations:
        print(f"檢查通過：{path.name}")
    if args.apply:
        run(migrations)
    else:
        print("檢查完成，尚未連線或修改資料庫。")


if __name__ == "__main__":
    main()
