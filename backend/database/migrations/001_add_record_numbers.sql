-- 為會員與程式碼紀錄加入專屬編號
-- 執行前提：users、records 已存在，尚未加入這兩個欄位。
-- 此更新只能執行一次。


-- 1. 每位會員下一筆要使用的編號
ALTER TABLE users
ADD COLUMN next_record_number BIGINT UNSIGNED NOT NULL DEFAULT 1;


-- 2. 先允許空值，才能替既有紀錄補上編號
ALTER TABLE records
ADD COLUMN record_number BIGINT UNSIGNED NULL;


-- 3. 每位會員的舊紀錄依建立順序，從 1 開始編號
UPDATE records AS r
JOIN (
    SELECT
        id,
        ROW_NUMBER() OVER (
            PARTITION BY user_id
            ORDER BY created_at ASC, id ASC
        ) AS assigned_number
    FROM records
) AS numbered
    ON numbered.id = r.id
SET
    r.record_number = numbered.assigned_number,
    r.updated_at = r.updated_at;


-- 4. 設定每位會員下一筆可用的編號
UPDATE users AS u
LEFT JOIN (
    SELECT
        user_id,
        MAX(record_number) + 1 AS next_number
    FROM records
    GROUP BY user_id
) AS numbered
    ON numbered.user_id = u.id
SET
    u.next_record_number = COALESCE(numbered.next_number, 1),
    u.updated_at = u.updated_at;


-- 5. 補值完成後，設定不可為空，限制同會員編號不能重複
ALTER TABLE records
MODIFY COLUMN record_number BIGINT UNSIGNED NOT NULL,
ADD UNIQUE KEY uq_records_user_record_number (user_id, record_number);