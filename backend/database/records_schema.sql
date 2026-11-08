-- 程式碼紀錄初始結構
-- 會員專屬編號由後續 migration 加入。


-- 1. 程式碼紀錄
CREATE TABLE records (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id BIGINT UNSIGNED NOT NULL,
    title VARCHAR(100) DEFAULT NULL,
    language VARCHAR(20) NOT NULL DEFAULT 'python',
    code MEDIUMTEXT,
    code_deleted_at DATETIME DEFAULT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (id),
    KEY idx_records_user_id (user_id),
    CONSTRAINT fk_records_user
        FOREIGN KEY (user_id)
        REFERENCES users (id)
        ON DELETE CASCADE
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_0900_ai_ci;


-- 2. 每筆紀錄的語法使用次數
CREATE TABLE record_syntax_usage (
    record_id BIGINT UNSIGNED NOT NULL,
    syntax_id BIGINT UNSIGNED NOT NULL,
    usage_count INT UNSIGNED NOT NULL,

    PRIMARY KEY (record_id, syntax_id),
    KEY fk_usage_syntax (syntax_id),
    CONSTRAINT fk_usage_record
        FOREIGN KEY (record_id)
        REFERENCES records (id)
        ON DELETE CASCADE,
    CONSTRAINT fk_usage_syntax
        FOREIGN KEY (syntax_id)
        REFERENCES syntaxes (id)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_0900_ai_ci;