-- 會員語法收藏
CREATE TABLE IF NOT EXISTS syntax_bookmarks (
    user_id BIGINT UNSIGNED NOT NULL,
    syntax_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (user_id, syntax_id),

    KEY idx_syntax_bookmarks_syntax_id (syntax_id),

    CONSTRAINT fk_syntax_bookmarks_user
        FOREIGN KEY (user_id)
        REFERENCES users (id)
        ON DELETE CASCADE,

    CONSTRAINT fk_syntax_bookmarks_syntax
        FOREIGN KEY (syntax_id)
        REFERENCES syntaxes (id)
        ON DELETE CASCADE
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_0900_ai_ci;