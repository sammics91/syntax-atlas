"""共用語法匯入工具。generate 只產生 SQL；apply 才會連線並更新資料庫。"""
import ast
import hashlib
import json
from datetime import datetime, timezone
from pathlib import Path
ROOT = Path(__file__).resolve().parent
MIGRATIONS = ROOT / 'database' / 'migrations'
SEPARATOR = '\n-- @statement\n'
CATEGORIES = {
    'variables-and-data': ('變數與資料', 5),
    'control-flow': ('流程控制', 10),
    'functions': ('函式', 20),
    'classes-and-objects': ('類別與物件', 25),
    'keywords': ('關鍵字', 30),
}

def sql_value(value):
    # 使用 UTF-8 十六進位字串，避免引號與換行影響 SQL。
    if value is None:
        return 'NULL'
    return "CONVERT(X'" + str(value).encode('utf-8').hex() + "' USING utf8mb4)"

def build_statements(sections, items):
    # 同分類與 slug 更新原資料，保留會員紀錄引用的語法 ID。
    statements = ['SET NAMES utf8mb4;']
    for slug, (name, order) in CATEGORIES.items():
        statements.append(f"INSERT INTO syntax_categories\n                        (language, slug, name, display_order)\n                        VALUES ('python', {sql_value(slug)}, {sql_value(name)}, {order})\n                        ON DUPLICATE KEY UPDATE name = {sql_value(name)};")
    for item in items:
        source = sections[item['section_id']]
        rules = item.get('rules')
        if rules is None:
            rules = [{'analyzer': item['analyzer'], 'rule_type': item['rule_type'], 'match_value': item['match_value']}]
        if not rules:
            raise ValueError(f"項目沒有偵測規則：{item['slug']}")
        keys = [(rule['analyzer'], rule['rule_type'], rule['match_value']) for rule in rules]
        if len(keys) != len(set(keys)):
            raise ValueError(f"項目有重複規則：{item['slug']}")
        # 只確認範例語法，不執行範例，也不連線資料庫。
        ast.parse(item['example_code'])
        statements.append(f"SET @category_id = (\n                        SELECT id FROM syntax_categories\n                        WHERE language = 'python'\n                        AND slug = {sql_value(item['category'])}\n                        );")
        fetched = datetime.fromisoformat(source['source_fetched_at']).astimezone(timezone.utc).strftime('%Y-%m-%d %H:%M:%S')
        fields = {'slug': item['slug'], 'name': item['name'], 'display_label': item.get('display_label'), 'summary': item['summary'], 'description': item.get('description_prefix', '') + source['description'], 'example_code': item['example_code'], 'example_description': item['example_description'], 'sort_key': item['sort_key'], 'source_url': source['source_url'], 'source_version': source['source_version'], 'source_fetched_at': fetched}
        columns = ', '.join(fields)
        values = ', '.join((sql_value(v) for v in fields.values()))
        updates = ',\n'.join((f'{key} = {sql_value(value)}' for key, value in fields.items() if key != 'slug'))
        statements.append(f'INSERT INTO syntaxes\n                        (category_id, {columns}, is_active)\n                        VALUES (@category_id, {values}, 1)\n                        ON DUPLICATE KEY UPDATE\n                        {updates},\n                        is_active = 1;')
        statements.append(f"SET @syntax_id = (\n                        SELECT id FROM syntaxes\n                        WHERE category_id = @category_id\n                        AND slug = {sql_value(item['slug'])}\n                        );")
        statements.append('UPDATE syntax_detection_rules\n                        SET is_active = 0\n                        WHERE syntax_id = @syntax_id;')
        for rule in rules:
            statements.append(f"INSERT INTO syntax_detection_rules\n                                (syntax_id, analyzer, rule_type, match_value, is_active)\n                                VALUES (\n                                        @syntax_id,\n                                        {sql_value(rule['analyzer'])},\n                                        {sql_value(rule['rule_type'])},\n                                        {sql_value(rule['match_value'])},\n                                        1\n                                )\n                                ON DUPLICATE KEY UPDATE is_active = 1;")
    return statements

def generate(filename, items):
    # 從本機官方文件快照產生 SQL，不直接匯入。
    data = json.loads((ROOT / 'data/python-3.13/all-sections.json').read_text(encoding='utf-8'))
    sections = {s['section_id']: s for s in data['sections']}
    statements = build_statements(sections, items)
    MIGRATIONS.mkdir(parents=True, exist_ok=True)
    output = MIGRATIONS / filename
    # 已產生的 migration 不覆寫，內容改動時使用新的版本檔名。
    with output.open('x', encoding='utf-8', newline='\n') as file:
        file.write('-- syntax-atlas generated migration v1\n')
        file.write(f'-- Migration: {filename}; no member records included.\n')
        file.write(SEPARATOR + SEPARATOR.join(statements) + '\n')
    print(f'已產生：{output}')
    rule_count = sum((len(item['rules']) if 'rules' in item else 1 for item in items))
    print(f'{len(items)} 個語法、{rule_count} 條規則；尚未修改資料庫。')

def read_migration(filename):
    if Path(filename).name != filename or not filename.endswith('.sql'):
        raise ValueError('請只提供 migrations 裡的 SQL 檔名。')
    raw = (MIGRATIONS / filename).read_bytes()
    content = raw.decode('utf-8')
    if not content.startswith('-- syntax-atlas generated migration v1\n'):
        raise ValueError('這個匯入工具只接受本工具產生的更新檔。')
    statements = [s.strip() for s in content.split(SEPARATOR)[1:] if s.strip()]
    if not statements:
        raise ValueError('更新檔沒有 SQL 敘述。')
    return (statements, hashlib.sha256(raw).hexdigest())

def apply(filename, *, yes=False):
    statements, checksum = read_migration(filename)
    # 只有明確執行 apply 時，才讀取資料庫連線設定。
    from database import get_db_connection
    connection = get_db_connection()
    cursor = connection.cursor()
    locked = False
    try:
        cursor.execute('SELECT DATABASE(), @@hostname')
        print('目標資料庫與主機：', cursor.fetchone())
        print('更新檔：', filename)
        if not yes and input('確認目標正確後，輸入 APPLY 才執行： ') != 'APPLY':
            print('已取消，未執行更新。')
            return
        cursor.execute("SELECT GET_LOCK('syntax_atlas_migrations', 10)")
        locked = cursor.fetchone()[0] == 1
        if not locked:
            raise RuntimeError('另一次資料更新正在進行，請稍後再試。')
        cursor.execute('CREATE TABLE IF NOT EXISTS schema_migrations (\nfilename VARCHAR(255) PRIMARY KEY,\nchecksum CHAR(64) NOT NULL,\napplied_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP\n) ENGINE=InnoDB')
        connection.commit()
        connection.start_transaction()
        cursor.execute('SELECT checksum FROM schema_migrations WHERE filename = %s', (filename,))
        previous = cursor.fetchone()
        if previous:
            if previous[0] != checksum:
                raise RuntimeError('已套用的更新檔被修改，請使用新的版本編號。')
            connection.rollback()
            print('這份更新檔已套用，略過。')
            return
        for statement in statements:
            cursor.execute(statement)
        cursor.execute('INSERT INTO schema_migrations (filename, checksum) VALUES (%s, %s)', (filename, checksum))
        connection.commit()
        print('更新完成，已保存版本紀錄。')
    except Exception:
        connection.rollback()
        raise
    finally:
        if locked:
            cursor.execute("SELECT RELEASE_LOCK('syntax_atlas_migrations')")
            cursor.fetchone()
        cursor.close()
        connection.close()
