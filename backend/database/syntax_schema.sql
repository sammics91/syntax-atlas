-- 語法資料表結構
-- 用於建立空白資料庫環境。
-- 執行前先確認連線目標與目前選取的資料庫。


-- 1. 語法分類
CREATE TABLE syntax_categories (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    language VARCHAR(20) NOT NULL,
    slug VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    display_order INT UNSIGNED NOT NULL DEFAULT 0,

    PRIMARY KEY (id),
    UNIQUE KEY uq_category_language_slug (language, slug)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_0900_ai_ci;


-- 2. 語法內容
CREATE TABLE syntaxes (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    category_id BIGINT UNSIGNED NOT NULL,
    slug VARCHAR(100) NOT NULL,
    name VARCHAR(150) NOT NULL,
    display_label VARCHAR(100) DEFAULT NULL,
    summary VARCHAR(500) DEFAULT NULL,
    description TEXT,
    example_code TEXT,
    example_description TEXT,
    sort_key VARCHAR(150) NOT NULL,
    official_order INT UNSIGNED DEFAULT NULL,
    source_url VARCHAR(1000) DEFAULT NULL,
    source_version VARCHAR(50) DEFAULT NULL,
    source_fetched_at DATETIME DEFAULT NULL,
    is_active TINYINT(1) NOT NULL DEFAULT 0,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (id),
    UNIQUE KEY uq_syntax_category_slug (category_id, slug),
    CONSTRAINT fk_syntax_category
        FOREIGN KEY (category_id)
        REFERENCES syntax_categories (id)
        ON DELETE RESTRICT
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_0900_ai_ci;


-- 3. 語法辨識規則
CREATE TABLE syntax_detection_rules (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    syntax_id BIGINT UNSIGNED NOT NULL,
    analyzer VARCHAR(50) NOT NULL,
    rule_type VARCHAR(50) NOT NULL,
    match_value VARCHAR(150) NOT NULL,
    is_active TINYINT(1) NOT NULL DEFAULT 1,

    PRIMARY KEY (id),
    UNIQUE KEY uq_detection_rule (
        syntax_id,
        analyzer,
        rule_type,
        match_value
    ),
    KEY idx_detection_analyzer_active (analyzer, is_active),
    CONSTRAINT fk_detection_syntax
        FOREIGN KEY (syntax_id)
        REFERENCES syntaxes (id)
        ON DELETE RESTRICT
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_0900_ai_ci;