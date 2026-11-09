-- 密碼重設憑證
CREATE TABLE IF NOT EXISTS password_reset_tokens (
    user_id BIGINT UNSIGNED NOT NULL,
    token_hash CHAR(64) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    expires_at DATETIME NOT NULL,
    used_at DATETIME NULL,

    PRIMARY KEY (user_id),

    UNIQUE KEY uq_password_reset_token_hash (token_hash),

    KEY idx_password_reset_expires_at (expires_at),

    CONSTRAINT fk_password_reset_user
        FOREIGN KEY (user_id)
        REFERENCES users (id)
        ON DELETE CASCADE
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_0900_ai_ci;