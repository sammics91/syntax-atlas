-- syntax-atlas generated migration v1
-- Migration: 008_css_syntaxes.sql; CSS catalog only.

-- @statement
SET NAMES utf8mb4;
-- @statement

            INSERT INTO syntax_categories (language, slug, name, display_order)
            VALUES ('css', CONVERT(X'70726f70657274696573' USING utf8mb4), CONVERT(X'e5b1ace680a7' USING utf8mb4), 10)
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'e5b1ace680a7' USING utf8mb4), display_order = 10;
        
-- @statement

            INSERT INTO syntax_categories (language, slug, name, display_order)
            VALUES ('css', CONVERT(X'73656c6563746f7273' USING utf8mb4), CONVERT(X'e981b8e69387e599a8' USING utf8mb4), 20)
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'e981b8e69387e599a8' USING utf8mb4), display_order = 20;
        
-- @statement

            INSERT INTO syntax_categories (language, slug, name, display_order)
            VALUES ('css', CONVERT(X'61742d72756c6573' USING utf8mb4), CONVERT(X'41742d72756c6573' USING utf8mb4), 30)
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'41742d72756c6573' USING utf8mb4), display_order = 30;
        
-- @statement

            INSERT INTO syntax_categories (language, slug, name, display_order)
            VALUES ('css', CONVERT(X'66756e6374696f6e73' USING utf8mb4), CONVERT(X'e587bde5bc8f' USING utf8mb4), 40)
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'e587bde5bc8f' USING utf8mb4), display_order = 40;
        
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d646973706c6179' USING utf8mb4), CONVERT(X'646973706c6179' USING utf8mb4), CONVERT(X'e9a1afe7a4bae88887e68e92e78988e6a8a1e5bc8f' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e794a2e7949fe79a84e79b92e5ad90e58f8ae585b6e5ad90e58583e7b4a0e79a84e68e92e78988e696b9e5bc8fe38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e794a2e7949fe79a84e79b92e5ad90e58f8ae585b6e5ad90e58583e7b4a0e79a84e68e92e78988e696b9e5bc8fe38082e5b8b8e8a68be580bce58c85e590ab20626c6f636be38081696e6c696e65e38081666c6578e380816772696420e88887206e6f6e65efbc9b6e6f6e6520e69c83e4bdbfe58583e7b4a0e4b88de794a2e7949fe68e92e78988e79b92e5ad90e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020646973706c61793a20666c65783b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce9a1afe7a4bae88887e68e92e78988e6a8a1e5bc8fe3808de38082' USING utf8mb4), CONVERT(X'646973706c6179' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d646973706c61792d342f2370726f706465662d646973706c6179' USING utf8mb4), CONVERT(X'6373732d646973706c61792d3420454420323032362d30362d3035' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'646973706c6179' USING utf8mb4),
display_label = CONVERT(X'e9a1afe7a4bae88887e68e92e78988e6a8a1e5bc8f' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e794a2e7949fe79a84e79b92e5ad90e58f8ae585b6e5ad90e58583e7b4a0e79a84e68e92e78988e696b9e5bc8fe38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e794a2e7949fe79a84e79b92e5ad90e58f8ae585b6e5ad90e58583e7b4a0e79a84e68e92e78988e696b9e5bc8fe38082e5b8b8e8a68be580bce58c85e590ab20626c6f636be38081696e6c696e65e38081666c6578e380816772696420e88887206e6f6e65efbc9b6e6f6e6520e69c83e4bdbfe58583e7b4a0e4b88de794a2e7949fe68e92e78988e79b92e5ad90e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020646973706c61793a20666c65783b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce9a1afe7a4bae88887e68e92e78988e6a8a1e5bc8fe3808de38082' USING utf8mb4),
sort_key = CONVERT(X'646973706c6179' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d646973706c61792d342f2370726f706465662d646973706c6179' USING utf8mb4),
source_version = CONVERT(X'6373732d646973706c61792d3420454420323032362d30362d3035' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d646973706c6179' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'646973706c6179' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d706f736974696f6e' USING utf8mb4), CONVERT(X'706f736974696f6e' USING utf8mb4), CONVERT(X'e5ae9ae4bd8de696b9e5bc8f' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e68ea1e794a8e79a84e5ae9ae4bd8de696b9e5bc8fe38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e68ea1e794a8e79a84e5ae9ae4bd8de696b9e5bc8fe38082e5b8b8e8a68be580bce58c85e590ab20737461746963e3808172656c6174697665e380816162736f6c757465e38081666978656420e8888720737469636b79efbc9be5ae9ae4bd8de5818fe7a7bbe58fafe690ade9858d20746f70e380817269676874e38081626f74746f6de380816c656674e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020706f736974696f6e3a2072656c61746976653b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5ae9ae4bd8de696b9e5bc8fe3808de38082' USING utf8mb4), CONVERT(X'706f736974696f6e' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d706f736974696f6e2d332f2370726f706465662d706f736974696f6e' USING utf8mb4), CONVERT(X'6373732d706f736974696f6e2d3320454420323032362d30352d3134' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3532' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'706f736974696f6e' USING utf8mb4),
display_label = CONVERT(X'e5ae9ae4bd8de696b9e5bc8f' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e68ea1e794a8e79a84e5ae9ae4bd8de696b9e5bc8fe38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e68ea1e794a8e79a84e5ae9ae4bd8de696b9e5bc8fe38082e5b8b8e8a68be580bce58c85e590ab20737461746963e3808172656c6174697665e380816162736f6c757465e38081666978656420e8888720737469636b79efbc9be5ae9ae4bd8de5818fe7a7bbe58fafe690ade9858d20746f70e380817269676874e38081626f74746f6de380816c656674e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020706f736974696f6e3a2072656c61746976653b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5ae9ae4bd8de696b9e5bc8fe3808de38082' USING utf8mb4),
sort_key = CONVERT(X'706f736974696f6e' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d706f736974696f6e2d332f2370726f706465662d706f736974696f6e' USING utf8mb4),
source_version = CONVERT(X'6373732d706f736974696f6e2d3320454420323032362d30352d3134' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3532' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d706f736974696f6e' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'706f736974696f6e' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d746f70' USING utf8mb4), CONVERT(X'746f70' USING utf8mb4), CONVERT(X'e9a082e7abafe5818fe7a7bb' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae5ae9ae4bd8de58583e7b4a0e79a84e9a082e7abafe5818fe7a7bbe68896e99990e588b6e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae5ae9ae4bd8de58583e7b4a0e79a84e9a082e7abafe5818fe7a7bbe68896e99990e588b6e38082e5afa6e99a9be69588e69e9ce58f96e6b1bae696bc20706f736974696f6eefbc9be5b08d2073746174696320e5ae9ae4bd8de79a84e58583e7b4a0e4b88de794a2e7949fe5ae9ae4bd8de5818fe7a7bbe69588e69e9ce38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020746f703a20313270783b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce9a082e7abafe5818fe7a7bbe3808de38082' USING utf8mb4), CONVERT(X'746f70' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d706f736974696f6e2d332f2370726f706465662d746f70' USING utf8mb4), CONVERT(X'6373732d706f736974696f6e2d3320454420323032362d30352d3134' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3532' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'746f70' USING utf8mb4),
display_label = CONVERT(X'e9a082e7abafe5818fe7a7bb' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae5ae9ae4bd8de58583e7b4a0e79a84e9a082e7abafe5818fe7a7bbe68896e99990e588b6e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae5ae9ae4bd8de58583e7b4a0e79a84e9a082e7abafe5818fe7a7bbe68896e99990e588b6e38082e5afa6e99a9be69588e69e9ce58f96e6b1bae696bc20706f736974696f6eefbc9be5b08d2073746174696320e5ae9ae4bd8de79a84e58583e7b4a0e4b88de794a2e7949fe5ae9ae4bd8de5818fe7a7bbe69588e69e9ce38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020746f703a20313270783b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce9a082e7abafe5818fe7a7bbe3808de38082' USING utf8mb4),
sort_key = CONVERT(X'746f70' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d706f736974696f6e2d332f2370726f706465662d746f70' USING utf8mb4),
source_version = CONVERT(X'6373732d706f736974696f6e2d3320454420323032362d30352d3134' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3532' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d746f70' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'746f70' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d7269676874' USING utf8mb4), CONVERT(X'7269676874' USING utf8mb4), CONVERT(X'e58fb3e581b4e5818fe7a7bb' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae5ae9ae4bd8de58583e7b4a0e79a84e58fb3e581b4e5818fe7a7bbe68896e99990e588b6e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae5ae9ae4bd8de58583e7b4a0e79a84e58fb3e581b4e5818fe7a7bbe68896e99990e588b6e38082e5b8b8e794a8e696bc206162736f6c757465e38081666978656420e6889620737469636b7920e5ae9ae4bd8de38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a202072696768743a20313270783b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce58fb3e581b4e5818fe7a7bbe3808de38082' USING utf8mb4), CONVERT(X'7269676874' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d706f736974696f6e2d332f2370726f706465662d7269676874' USING utf8mb4), CONVERT(X'6373732d706f736974696f6e2d3320454420323032362d30352d3134' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3532' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'7269676874' USING utf8mb4),
display_label = CONVERT(X'e58fb3e581b4e5818fe7a7bb' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae5ae9ae4bd8de58583e7b4a0e79a84e58fb3e581b4e5818fe7a7bbe68896e99990e588b6e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae5ae9ae4bd8de58583e7b4a0e79a84e58fb3e581b4e5818fe7a7bbe68896e99990e588b6e38082e5b8b8e794a8e696bc206162736f6c757465e38081666978656420e6889620737469636b7920e5ae9ae4bd8de38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a202072696768743a20313270783b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce58fb3e581b4e5818fe7a7bbe3808de38082' USING utf8mb4),
sort_key = CONVERT(X'7269676874' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d706f736974696f6e2d332f2370726f706465662d7269676874' USING utf8mb4),
source_version = CONVERT(X'6373732d706f736974696f6e2d3320454420323032362d30352d3134' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3532' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d7269676874' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'7269676874' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d626f74746f6d' USING utf8mb4), CONVERT(X'626f74746f6d' USING utf8mb4), CONVERT(X'e5ba95e7abafe5818fe7a7bb' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae5ae9ae4bd8de58583e7b4a0e79a84e5ba95e7abafe5818fe7a7bbe68896e99990e588b6e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae5ae9ae4bd8de58583e7b4a0e79a84e5ba95e7abafe5818fe7a7bbe68896e99990e588b6e38082e5ae83e698afe5ae9ae4bd8de5818fe7a7bbefbc8ce4b88de698afe58583e7b4a0e79a84e5a496e9828ae8b79de38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020626f74746f6d3a20313270783b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5ba95e7abafe5818fe7a7bbe3808de38082' USING utf8mb4), CONVERT(X'626f74746f6d' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d706f736974696f6e2d332f2370726f706465662d626f74746f6d' USING utf8mb4), CONVERT(X'6373732d706f736974696f6e2d3320454420323032362d30352d3134' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3532' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'626f74746f6d' USING utf8mb4),
display_label = CONVERT(X'e5ba95e7abafe5818fe7a7bb' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae5ae9ae4bd8de58583e7b4a0e79a84e5ba95e7abafe5818fe7a7bbe68896e99990e588b6e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae5ae9ae4bd8de58583e7b4a0e79a84e5ba95e7abafe5818fe7a7bbe68896e99990e588b6e38082e5ae83e698afe5ae9ae4bd8de5818fe7a7bbefbc8ce4b88de698afe58583e7b4a0e79a84e5a496e9828ae8b79de38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020626f74746f6d3a20313270783b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5ba95e7abafe5818fe7a7bbe3808de38082' USING utf8mb4),
sort_key = CONVERT(X'626f74746f6d' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d706f736974696f6e2d332f2370726f706465662d626f74746f6d' USING utf8mb4),
source_version = CONVERT(X'6373732d706f736974696f6e2d3320454420323032362d30352d3134' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3532' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d626f74746f6d' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'626f74746f6d' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d6c656674' USING utf8mb4), CONVERT(X'6c656674' USING utf8mb4), CONVERT(X'e5b7a6e581b4e5818fe7a7bb' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae5ae9ae4bd8de58583e7b4a0e79a84e5b7a6e581b4e5818fe7a7bbe68896e99990e588b6e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae5ae9ae4bd8de58583e7b4a0e79a84e5b7a6e581b4e5818fe7a7bbe68896e99990e588b6e38082e58fafe4bdbfe794a8e995b7e5baa6e38081e799bee58886e6af94e68896206175746fefbc9be5afa6e99a9be69588e69e9ce4be9de5ae9ae4bd8de696b9e5bc8fe8808ce5ae9ae38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20206c6566743a20313270783b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5b7a6e581b4e5818fe7a7bbe3808de38082' USING utf8mb4), CONVERT(X'6c656674' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d706f736974696f6e2d332f2370726f706465662d6c656674' USING utf8mb4), CONVERT(X'6373732d706f736974696f6e2d3320454420323032362d30352d3134' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3532' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'6c656674' USING utf8mb4),
display_label = CONVERT(X'e5b7a6e581b4e5818fe7a7bb' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae5ae9ae4bd8de58583e7b4a0e79a84e5b7a6e581b4e5818fe7a7bbe68896e99990e588b6e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae5ae9ae4bd8de58583e7b4a0e79a84e5b7a6e581b4e5818fe7a7bbe68896e99990e588b6e38082e58fafe4bdbfe794a8e995b7e5baa6e38081e799bee58886e6af94e68896206175746fefbc9be5afa6e99a9be69588e69e9ce4be9de5ae9ae4bd8de696b9e5bc8fe8808ce5ae9ae38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20206c6566743a20313270783b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5b7a6e581b4e5818fe7a7bbe3808de38082' USING utf8mb4),
sort_key = CONVERT(X'6c656674' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d706f736974696f6e2d332f2370726f706465662d6c656674' USING utf8mb4),
source_version = CONVERT(X'6373732d706f736974696f6e2d3320454420323032362d30352d3134' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3532' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d6c656674' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'6c656674' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d696e736574' USING utf8mb4), CONVERT(X'696e736574' USING utf8mb4), CONVERT(X'e59b9be9828ae5ae9ae4bd8de5818fe7a7bb' USING utf8mb4), CONVERT(X'e4bba5e7b0a1e5afabe8a8ade5ae9a20746f70e380817269676874e38081626f74746f6de380816c656674e38082' USING utf8mb4), CONVERT(X'e4bba5e7b0a1e5afabe8a8ade5ae9a20746f70e380817269676874e38081626f74746f6de380816c656674e38082e58fafe68f90e4be9be4b880e588b0e59b9be5808be580bcefbc9be59b9be5808be580bce4be9de4b88ae38081e58fb3e38081e4b88be38081e5b7a6e79a84e9a086e5ba8fe68c87e5ae9ae38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020696e7365743a20303b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce59b9be9828ae5ae9ae4bd8de5818fe7a7bbe3808de38082' USING utf8mb4), CONVERT(X'696e736574' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d706f736974696f6e2d332f2370726f706465662d696e736574' USING utf8mb4), CONVERT(X'6373732d706f736974696f6e2d3320454420323032362d30352d3134' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3532' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'696e736574' USING utf8mb4),
display_label = CONVERT(X'e59b9be9828ae5ae9ae4bd8de5818fe7a7bb' USING utf8mb4),
summary = CONVERT(X'e4bba5e7b0a1e5afabe8a8ade5ae9a20746f70e380817269676874e38081626f74746f6de380816c656674e38082' USING utf8mb4),
description = CONVERT(X'e4bba5e7b0a1e5afabe8a8ade5ae9a20746f70e380817269676874e38081626f74746f6de380816c656674e38082e58fafe68f90e4be9be4b880e588b0e59b9be5808be580bcefbc9be59b9be5808be580bce4be9de4b88ae38081e58fb3e38081e4b88be38081e5b7a6e79a84e9a086e5ba8fe68c87e5ae9ae38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020696e7365743a20303b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce59b9be9828ae5ae9ae4bd8de5818fe7a7bbe3808de38082' USING utf8mb4),
sort_key = CONVERT(X'696e736574' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d706f736974696f6e2d332f2370726f706465662d696e736574' USING utf8mb4),
source_version = CONVERT(X'6373732d706f736974696f6e2d3320454420323032362d30352d3134' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3532' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d696e736574' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'696e736574' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d7a2d696e646578' USING utf8mb4), CONVERT(X'7a2d696e646578' USING utf8mb4), CONVERT(X'e5a086e7968ae5b1a4e7b49a' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e59ca8e79bb8e9979ce5a086e7968ae68385e5a283e4b8ade79a84e5a086e7968ae5b1a4e7b49ae38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e59ca8e79bb8e9979ce5a086e7968ae68385e5a283e4b8ade79a84e5a086e7968ae5b1a4e7b49ae38082e695b8e580bce58faae883bde59ca8e585b6e68980e5b1ace79a84e5a086e7968ae68385e5a283e4b8ade6af94e8bc83efbc9be4b8a6e99d9ee695b8e580bce8b68ae5a4a7e5b0b1e4b880e5ae9ae8938be9818ee695b4e5808be9a081e99da2e79a84e585b6e4bb96e58583e7b4a0e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20207a2d696e6465783a2031303b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5a086e7968ae5b1a4e7b49ae3808de38082' USING utf8mb4), CONVERT(X'7a2d696e646578' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f637373322f2370726f706465662d7a2d696e646578' USING utf8mb4), CONVERT(X'6373733220454420323032352d31322d3330' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3530' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'7a2d696e646578' USING utf8mb4),
display_label = CONVERT(X'e5a086e7968ae5b1a4e7b49a' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e59ca8e79bb8e9979ce5a086e7968ae68385e5a283e4b8ade79a84e5a086e7968ae5b1a4e7b49ae38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e59ca8e79bb8e9979ce5a086e7968ae68385e5a283e4b8ade79a84e5a086e7968ae5b1a4e7b49ae38082e695b8e580bce58faae883bde59ca8e585b6e68980e5b1ace79a84e5a086e7968ae68385e5a283e4b8ade6af94e8bc83efbc9be4b8a6e99d9ee695b8e580bce8b68ae5a4a7e5b0b1e4b880e5ae9ae8938be9818ee695b4e5808be9a081e99da2e79a84e585b6e4bb96e58583e7b4a0e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20207a2d696e6465783a2031303b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5a086e7968ae5b1a4e7b49ae3808de38082' USING utf8mb4),
sort_key = CONVERT(X'7a2d696e646578' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f637373322f2370726f706465662d7a2d696e646578' USING utf8mb4),
source_version = CONVERT(X'6373733220454420323032352d31322d3330' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3530' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d7a2d696e646578' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'7a2d696e646578' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d7769647468' USING utf8mb4), CONVERT(X'7769647468' USING utf8mb4), CONVERT(X'e5aface5baa6' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e79a84e5aface5baa6e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e79a84e5aface5baa6e38082e5aface5baa6e79a84e8a888e7ae97e7af84e59c8de69c83e58f9720626f782d73697a696e6720e5bdb1e99fbfefbc8ce4b99fe58fafe4bdbfe794a8e799bee58886e6af94e88887206175746fe38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a202077696474683a2032343070783b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5aface5baa6e3808de38082' USING utf8mb4), CONVERT(X'7769647468' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d73697a696e672d332f2370726f706465662d7769647468' USING utf8mb4), CONVERT(X'6373732d73697a696e672d3320454420323032362d31302d3038' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3534' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'7769647468' USING utf8mb4),
display_label = CONVERT(X'e5aface5baa6' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e79a84e5aface5baa6e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e79a84e5aface5baa6e38082e5aface5baa6e79a84e8a888e7ae97e7af84e59c8de69c83e58f9720626f782d73697a696e6720e5bdb1e99fbfefbc8ce4b99fe58fafe4bdbfe794a8e799bee58886e6af94e88887206175746fe38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a202077696474683a2032343070783b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5aface5baa6e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'7769647468' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d73697a696e672d332f2370726f706465662d7769647468' USING utf8mb4),
source_version = CONVERT(X'6373732d73697a696e672d3320454420323032362d31302d3038' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3534' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d7769647468' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'7769647468' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d686569676874' USING utf8mb4), CONVERT(X'686569676874' USING utf8mb4), CONVERT(X'e9ab98e5baa6' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e79a84e9ab98e5baa6e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e79a84e9ab98e5baa6e38082e799bee58886e6af94e9ab98e5baa6e79a84e8a7a3e69e90e69c83e58f97e58c85e590abe58d80e5a18ae79a84e5b0bae5afb8e698afe590a6e7a2bae5ae9ae7ad89e6a29de4bbb6e5bdb1e99fbfe38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20206865696768743a2031323070783b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce9ab98e5baa6e3808de38082' USING utf8mb4), CONVERT(X'686569676874' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d73697a696e672d332f2370726f706465662d686569676874' USING utf8mb4), CONVERT(X'6373732d73697a696e672d3320454420323032362d31302d3038' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3534' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'686569676874' USING utf8mb4),
display_label = CONVERT(X'e9ab98e5baa6' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e79a84e9ab98e5baa6e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e79a84e9ab98e5baa6e38082e799bee58886e6af94e9ab98e5baa6e79a84e8a7a3e69e90e69c83e58f97e58c85e590abe58d80e5a18ae79a84e5b0bae5afb8e698afe590a6e7a2bae5ae9ae7ad89e6a29de4bbb6e5bdb1e99fbfe38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20206865696768743a2031323070783b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce9ab98e5baa6e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'686569676874' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d73697a696e672d332f2370726f706465662d686569676874' USING utf8mb4),
source_version = CONVERT(X'6373732d73697a696e672d3320454420323032362d31302d3038' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3534' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d686569676874' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'686569676874' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d6d696e2d7769647468' USING utf8mb4), CONVERT(X'6d696e2d7769647468' USING utf8mb4), CONVERT(X'e69c80e5b08fe5aface5baa6' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e5aface5baa6e79a84e4b88be99990e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e5aface5baa6e79a84e4b88be99990e38082e5b8b8e690ade9858de58fafe4bcb8e7b8aee78988e99da2efbc8ce981bfe5858de585a7e5aeb9e58d80e59f9fe7b8aee5be97e5a4aae7aa84e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20206d696e2d77696474683a2031363070783b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce69c80e5b08fe5aface5baa6e3808de38082' USING utf8mb4), CONVERT(X'6d696e2d7769647468' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d73697a696e672d332f2370726f706465662d6d696e2d7769647468' USING utf8mb4), CONVERT(X'6373732d73697a696e672d3320454420323032362d31302d3038' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3534' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'6d696e2d7769647468' USING utf8mb4),
display_label = CONVERT(X'e69c80e5b08fe5aface5baa6' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e5aface5baa6e79a84e4b88be99990e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e5aface5baa6e79a84e4b88be99990e38082e5b8b8e690ade9858de58fafe4bcb8e7b8aee78988e99da2efbc8ce981bfe5858de585a7e5aeb9e58d80e59f9fe7b8aee5be97e5a4aae7aa84e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20206d696e2d77696474683a2031363070783b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce69c80e5b08fe5aface5baa6e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'6d696e2d7769647468' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d73697a696e672d332f2370726f706465662d6d696e2d7769647468' USING utf8mb4),
source_version = CONVERT(X'6373732d73697a696e672d3320454420323032362d31302d3038' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3534' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d6d696e2d7769647468' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'6d696e2d7769647468' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d6d61782d7769647468' USING utf8mb4), CONVERT(X'6d61782d7769647468' USING utf8mb4), CONVERT(X'e69c80e5a4a7e5aface5baa6' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e5aface5baa6e79a84e4b88ae99990e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e5aface5baa6e79a84e4b88ae99990e38082e5b8b8e690ade9858d2077696474683a203130302520e5bbbae7ab8be58fafe7b8aee5b08fe4b894e69c89e69c80e5a4a7e5aface5baa6e79a84e5aeb9e599a8e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20206d61782d77696474683a203132303070783b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce69c80e5a4a7e5aface5baa6e3808de38082' USING utf8mb4), CONVERT(X'6d61782d7769647468' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d73697a696e672d332f2370726f706465662d6d61782d7769647468' USING utf8mb4), CONVERT(X'6373732d73697a696e672d3320454420323032362d31302d3038' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3534' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'6d61782d7769647468' USING utf8mb4),
display_label = CONVERT(X'e69c80e5a4a7e5aface5baa6' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e5aface5baa6e79a84e4b88ae99990e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e5aface5baa6e79a84e4b88ae99990e38082e5b8b8e690ade9858d2077696474683a203130302520e5bbbae7ab8be58fafe7b8aee5b08fe4b894e69c89e69c80e5a4a7e5aface5baa6e79a84e5aeb9e599a8e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20206d61782d77696474683a203132303070783b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce69c80e5a4a7e5aface5baa6e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'6d61782d7769647468' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d73697a696e672d332f2370726f706465662d6d61782d7769647468' USING utf8mb4),
source_version = CONVERT(X'6373732d73697a696e672d3320454420323032362d31302d3038' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3534' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d6d61782d7769647468' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'6d61782d7769647468' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d6d696e2d686569676874' USING utf8mb4), CONVERT(X'6d696e2d686569676874' USING utf8mb4), CONVERT(X'e69c80e5b08fe9ab98e5baa6' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e9ab98e5baa6e79a84e4b88be99990e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e9ab98e5baa6e79a84e4b88be99990e38082e585a7e5aeb9e8bc83e5a49ae69982e58583e7b4a0e4bb8de58fafe7b9bce7ba8ce995b7e9ab98efbc9be5ae83e88887e59bbae5ae9a2068656967687420e79a84e69588e69e9ce4b88de5908ce38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20206d696e2d6865696768743a2032303070783b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce69c80e5b08fe9ab98e5baa6e3808de38082' USING utf8mb4), CONVERT(X'6d696e2d686569676874' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d73697a696e672d332f2370726f706465662d6d696e2d686569676874' USING utf8mb4), CONVERT(X'6373732d73697a696e672d3320454420323032362d31302d3038' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3534' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'6d696e2d686569676874' USING utf8mb4),
display_label = CONVERT(X'e69c80e5b08fe9ab98e5baa6' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e9ab98e5baa6e79a84e4b88be99990e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e9ab98e5baa6e79a84e4b88be99990e38082e585a7e5aeb9e8bc83e5a49ae69982e58583e7b4a0e4bb8de58fafe7b9bce7ba8ce995b7e9ab98efbc9be5ae83e88887e59bbae5ae9a2068656967687420e79a84e69588e69e9ce4b88de5908ce38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20206d696e2d6865696768743a2032303070783b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce69c80e5b08fe9ab98e5baa6e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'6d696e2d686569676874' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d73697a696e672d332f2370726f706465662d6d696e2d686569676874' USING utf8mb4),
source_version = CONVERT(X'6373732d73697a696e672d3320454420323032362d31302d3038' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3534' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d6d696e2d686569676874' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'6d696e2d686569676874' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d6d61782d686569676874' USING utf8mb4), CONVERT(X'6d61782d686569676874' USING utf8mb4), CONVERT(X'e69c80e5a4a7e9ab98e5baa6' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e9ab98e5baa6e79a84e4b88ae99990e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e9ab98e5baa6e79a84e4b88ae99990e38082e585a7e5aeb9e6baa2e587bae69982efbc8ce58fafe5868de690ade9858d206f766572666c6f7720e6b1bae5ae9ae5a682e4bd95e9a1afe7a4bae38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20206d61782d6865696768743a2034303070783b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce69c80e5a4a7e9ab98e5baa6e3808de38082' USING utf8mb4), CONVERT(X'6d61782d686569676874' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d73697a696e672d332f2370726f706465662d6d61782d686569676874' USING utf8mb4), CONVERT(X'6373732d73697a696e672d3320454420323032362d31302d3038' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3534' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'6d61782d686569676874' USING utf8mb4),
display_label = CONVERT(X'e69c80e5a4a7e9ab98e5baa6' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e9ab98e5baa6e79a84e4b88ae99990e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e9ab98e5baa6e79a84e4b88ae99990e38082e585a7e5aeb9e6baa2e587bae69982efbc8ce58fafe5868de690ade9858d206f766572666c6f7720e6b1bae5ae9ae5a682e4bd95e9a1afe7a4bae38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20206d61782d6865696768743a2034303070783b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce69c80e5a4a7e9ab98e5baa6e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'6d61782d686569676874' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d73697a696e672d332f2370726f706465662d6d61782d686569676874' USING utf8mb4),
source_version = CONVERT(X'6373732d73697a696e672d3320454420323032362d31302d3038' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3534' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d6d61782d686569676874' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'6d61782d686569676874' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d626f782d73697a696e67' USING utf8mb4), CONVERT(X'626f782d73697a696e67' USING utf8mb4), CONVERT(X'e79b92e6a8a1e59e8be5b0bae5afb8e8a888e7ae97' USING utf8mb4), CONVERT(X'e8a8ade5ae9a20776964746820e888872068656967687420e698afe590a6e58c85e590abe585a7e9828ae8b79de5928ce9828ae6a186e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9a20776964746820e888872068656967687420e698afe590a6e58c85e590abe585a7e9828ae8b79de5928ce9828ae6a186e38082626f726465722d626f7820e5b087e585a7e9828ae8b79de88887e9828ae6a186e58c85e590abe59ca8e68c87e5ae9ae5b0bae5afb8e585a7efbc9b636f6e74656e742d626f7820e4bba5e585a7e5aeb9e58d80e8a888e7ae97e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020626f782d73697a696e673a20626f726465722d626f783b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce79b92e6a8a1e59e8be5b0bae5afb8e8a888e7ae97e3808de38082' USING utf8mb4), CONVERT(X'626f782d73697a696e67' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d73697a696e672d332f2370726f706465662d626f782d73697a696e67' USING utf8mb4), CONVERT(X'6373732d73697a696e672d3320454420323032362d31302d3038' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3534' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'626f782d73697a696e67' USING utf8mb4),
display_label = CONVERT(X'e79b92e6a8a1e59e8be5b0bae5afb8e8a888e7ae97' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9a20776964746820e888872068656967687420e698afe590a6e58c85e590abe585a7e9828ae8b79de5928ce9828ae6a186e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9a20776964746820e888872068656967687420e698afe590a6e58c85e590abe585a7e9828ae8b79de5928ce9828ae6a186e38082626f726465722d626f7820e5b087e585a7e9828ae8b79de88887e9828ae6a186e58c85e590abe59ca8e68c87e5ae9ae5b0bae5afb8e585a7efbc9b636f6e74656e742d626f7820e4bba5e585a7e5aeb9e58d80e8a888e7ae97e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020626f782d73697a696e673a20626f726465722d626f783b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce79b92e6a8a1e59e8be5b0bae5afb8e8a888e7ae97e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'626f782d73697a696e67' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d73697a696e672d332f2370726f706465662d626f782d73697a696e67' USING utf8mb4),
source_version = CONVERT(X'6373732d73697a696e672d3320454420323032362d31302d3038' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3534' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d626f782d73697a696e67' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'626f782d73697a696e67' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d6173706563742d726174696f' USING utf8mb4), CONVERT(X'6173706563742d726174696f' USING utf8mb4), CONVERT(X'e5aface9ab98e6af94e4be8b' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae79b92e5ad90e79a84e5818fe5a5bde5aface9ab98e6af94e4be8be38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae79b92e5ad90e79a84e5818fe5a5bde5aface9ab98e6af94e4be8be38082e5b8b8e794a8e696bce887b3e5b091e4b880e5808be5b0bae5afb8e794b1e887aae58b95e8a888e7ae97e6b1bae5ae9ae79a84e78988e99da2efbc8ce4be8be5a682e7b6ade68c81e5bdb1e78987e68896e58da1e78987e6af94e4be8be38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20206173706563742d726174696f3a203136202f20393b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5aface9ab98e6af94e4be8be3808de38082' USING utf8mb4), CONVERT(X'6173706563742d726174696f' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d73697a696e672d342f2370726f706465662d6173706563742d726174696f' USING utf8mb4), CONVERT(X'6373732d73697a696e672d3420454420323032362d31302d3237' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3330' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'6173706563742d726174696f' USING utf8mb4),
display_label = CONVERT(X'e5aface9ab98e6af94e4be8b' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae79b92e5ad90e79a84e5818fe5a5bde5aface9ab98e6af94e4be8be38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae79b92e5ad90e79a84e5818fe5a5bde5aface9ab98e6af94e4be8be38082e5b8b8e794a8e696bce887b3e5b091e4b880e5808be5b0bae5afb8e794b1e887aae58b95e8a888e7ae97e6b1bae5ae9ae79a84e78988e99da2efbc8ce4be8be5a682e7b6ade68c81e5bdb1e78987e68896e58da1e78987e6af94e4be8be38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20206173706563742d726174696f3a203136202f20393b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5aface9ab98e6af94e4be8be3808de38082' USING utf8mb4),
sort_key = CONVERT(X'6173706563742d726174696f' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d73697a696e672d342f2370726f706465662d6173706563742d726174696f' USING utf8mb4),
source_version = CONVERT(X'6373732d73697a696e672d3420454420323032362d31302d3237' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3330' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d6173706563742d726174696f' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'6173706563742d726174696f' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d6d617267696e' USING utf8mb4), CONVERT(X'6d617267696e' USING utf8mb4), CONVERT(X'e5a496e9828ae8b79d' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e9828ae6a186e5a496e581b4e79a84e7a9bae99693e38082e4b880e5808be580bce5a597e794a8e59b9be9828aefbc9be585a9e5808be580bce4be9de5ba8fe782bae3808ce4b88ae4b88be38081e5b7a6e58fb3e3808defbc9be4b889e5808be580bce782bae3808ce4b88ae38081e5b7a6e58fb3e38081e4b88be3808defbc9be59b9be5808be580bce782bae3808ce4b88ae38081e58fb3e38081e4b88be38081e5b7a6e3808defbc8ce4be9de9a086e69982e9879de68e92e58897e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e9828ae6a186e5a496e581b4e79a84e7a9bae99693e38082e4b880e5808be580bce5a597e794a8e59b9be9828aefbc9be585a9e5808be580bce4be9de5ba8fe782bae3808ce4b88ae4b88be38081e5b7a6e58fb3e3808defbc9be4b889e5808be580bce782bae3808ce4b88ae38081e5b7a6e58fb3e38081e4b88be3808defbc9be59b9be5808be580bce782bae3808ce4b88ae38081e58fb3e38081e4b88be38081e5b7a6e3808defbc8ce4be9de9a086e69982e9879de68e92e58897e38082e59ca8e981a9e794a8e79a84e78988e99da2e6a29de4bbb6e4b88befbc8ce5b7a6e58fb3206175746f20e5a496e9828ae8b79de58fafe794a8e696bce7bdaee4b8ade38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20206d617267696e3a203870782032307078203136707820313270783b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5a496e9828ae8b79de3808de38082' USING utf8mb4), CONVERT(X'6d617267696e' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d626f782d342f2370726f706465662d6d617267696e' USING utf8mb4), CONVERT(X'6373732d626f782d3420454420323032362d30382d3036' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3436' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'6d617267696e' USING utf8mb4),
display_label = CONVERT(X'e5a496e9828ae8b79d' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e9828ae6a186e5a496e581b4e79a84e7a9bae99693e38082e4b880e5808be580bce5a597e794a8e59b9be9828aefbc9be585a9e5808be580bce4be9de5ba8fe782bae3808ce4b88ae4b88be38081e5b7a6e58fb3e3808defbc9be4b889e5808be580bce782bae3808ce4b88ae38081e5b7a6e58fb3e38081e4b88be3808defbc9be59b9be5808be580bce782bae3808ce4b88ae38081e58fb3e38081e4b88be38081e5b7a6e3808defbc8ce4be9de9a086e69982e9879de68e92e58897e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e9828ae6a186e5a496e581b4e79a84e7a9bae99693e38082e4b880e5808be580bce5a597e794a8e59b9be9828aefbc9be585a9e5808be580bce4be9de5ba8fe782bae3808ce4b88ae4b88be38081e5b7a6e58fb3e3808defbc9be4b889e5808be580bce782bae3808ce4b88ae38081e5b7a6e58fb3e38081e4b88be3808defbc9be59b9be5808be580bce782bae3808ce4b88ae38081e58fb3e38081e4b88be38081e5b7a6e3808defbc8ce4be9de9a086e69982e9879de68e92e58897e38082e59ca8e981a9e794a8e79a84e78988e99da2e6a29de4bbb6e4b88befbc8ce5b7a6e58fb3206175746f20e5a496e9828ae8b79de58fafe794a8e696bce7bdaee4b8ade38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20206d617267696e3a203870782032307078203136707820313270783b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5a496e9828ae8b79de3808de38082' USING utf8mb4),
sort_key = CONVERT(X'6d617267696e' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d626f782d342f2370726f706465662d6d617267696e' USING utf8mb4),
source_version = CONVERT(X'6373732d626f782d3420454420323032362d30382d3036' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3436' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d6d617267696e' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'6d617267696e' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d6d617267696e2d746f70' USING utf8mb4), CONVERT(X'6d617267696e2d746f70' USING utf8mb4), CONVERT(X'e4b88ae5a496e9828ae8b79d' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e4b88ae696b9e79a84e5a496e9828ae8b79de38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e4b88ae696b9e79a84e5a496e9828ae8b79de38082e983a8e58886e58d80e5a18ae68e92e78988e4b8ade79a84e59e82e79bb4e5a496e9828ae8b79de69c83e799bce7949fe691bae7968ae38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20206d617267696e2d746f703a20313670783b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce4b88ae5a496e9828ae8b79de3808de38082' USING utf8mb4), CONVERT(X'6d617267696e2d746f70' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d626f782d342f2370726f706465662d6d617267696e2d746f70' USING utf8mb4), CONVERT(X'6373732d626f782d3420454420323032362d30382d3036' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3436' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'6d617267696e2d746f70' USING utf8mb4),
display_label = CONVERT(X'e4b88ae5a496e9828ae8b79d' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e4b88ae696b9e79a84e5a496e9828ae8b79de38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e4b88ae696b9e79a84e5a496e9828ae8b79de38082e983a8e58886e58d80e5a18ae68e92e78988e4b8ade79a84e59e82e79bb4e5a496e9828ae8b79de69c83e799bce7949fe691bae7968ae38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20206d617267696e2d746f703a20313670783b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce4b88ae5a496e9828ae8b79de3808de38082' USING utf8mb4),
sort_key = CONVERT(X'6d617267696e2d746f70' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d626f782d342f2370726f706465662d6d617267696e2d746f70' USING utf8mb4),
source_version = CONVERT(X'6373732d626f782d3420454420323032362d30382d3036' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3436' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d6d617267696e2d746f70' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'6d617267696e2d746f70' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d6d617267696e2d7269676874' USING utf8mb4), CONVERT(X'6d617267696e2d7269676874' USING utf8mb4), CONVERT(X'e58fb3e5a496e9828ae8b79d' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e58fb3e696b9e79a84e5a496e9828ae8b79de38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e58fb3e696b9e79a84e5a496e9828ae8b79de38082e5a496e9828ae8b79de4bd8de696bce9828ae6a186e4bba5e5a496efbc8ce4b88de5b1ace696bce58583e7b4a0e79a84e8838ce699afe7b9aae8a3bde58d80e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20206d617267696e2d72696768743a20313670783b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce58fb3e5a496e9828ae8b79de3808de38082' USING utf8mb4), CONVERT(X'6d617267696e2d7269676874' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d626f782d342f2370726f706465662d6d617267696e2d7269676874' USING utf8mb4), CONVERT(X'6373732d626f782d3420454420323032362d30382d3036' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3436' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'6d617267696e2d7269676874' USING utf8mb4),
display_label = CONVERT(X'e58fb3e5a496e9828ae8b79d' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e58fb3e696b9e79a84e5a496e9828ae8b79de38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e58fb3e696b9e79a84e5a496e9828ae8b79de38082e5a496e9828ae8b79de4bd8de696bce9828ae6a186e4bba5e5a496efbc8ce4b88de5b1ace696bce58583e7b4a0e79a84e8838ce699afe7b9aae8a3bde58d80e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20206d617267696e2d72696768743a20313670783b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce58fb3e5a496e9828ae8b79de3808de38082' USING utf8mb4),
sort_key = CONVERT(X'6d617267696e2d7269676874' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d626f782d342f2370726f706465662d6d617267696e2d7269676874' USING utf8mb4),
source_version = CONVERT(X'6373732d626f782d3420454420323032362d30382d3036' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3436' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d6d617267696e2d7269676874' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'6d617267696e2d7269676874' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d6d617267696e2d626f74746f6d' USING utf8mb4), CONVERT(X'6d617267696e2d626f74746f6d' USING utf8mb4), CONVERT(X'e4b88be5a496e9828ae8b79d' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e4b88be696b9e79a84e5a496e9828ae8b79de38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e4b88be696b9e79a84e5a496e9828ae8b79de38082e58fafe794a8e696bce5ae89e68e92e79bb8e984b0e585a7e5aeb9e79a84e59e82e79bb4e99693e99a94e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20206d617267696e2d626f74746f6d3a20323470783b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce4b88be5a496e9828ae8b79de3808de38082' USING utf8mb4), CONVERT(X'6d617267696e2d626f74746f6d' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d626f782d342f2370726f706465662d6d617267696e2d626f74746f6d' USING utf8mb4), CONVERT(X'6373732d626f782d3420454420323032362d30382d3036' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3436' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'6d617267696e2d626f74746f6d' USING utf8mb4),
display_label = CONVERT(X'e4b88be5a496e9828ae8b79d' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e4b88be696b9e79a84e5a496e9828ae8b79de38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e4b88be696b9e79a84e5a496e9828ae8b79de38082e58fafe794a8e696bce5ae89e68e92e79bb8e984b0e585a7e5aeb9e79a84e59e82e79bb4e99693e99a94e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20206d617267696e2d626f74746f6d3a20323470783b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce4b88be5a496e9828ae8b79de3808de38082' USING utf8mb4),
sort_key = CONVERT(X'6d617267696e2d626f74746f6d' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d626f782d342f2370726f706465662d6d617267696e2d626f74746f6d' USING utf8mb4),
source_version = CONVERT(X'6373732d626f782d3420454420323032362d30382d3036' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3436' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d6d617267696e2d626f74746f6d' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'6d617267696e2d626f74746f6d' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d6d617267696e2d6c656674' USING utf8mb4), CONVERT(X'6d617267696e2d6c656674' USING utf8mb4), CONVERT(X'e5b7a6e5a496e9828ae8b79d' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e5b7a6e696b9e79a84e5a496e9828ae8b79de38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e5b7a6e696b9e79a84e5a496e9828ae8b79de38082e58fafe4bdbfe794a8e995b7e5baa6e38081e799bee58886e6af94e68896206175746fe38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20206d617267696e2d6c6566743a20313670783b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5b7a6e5a496e9828ae8b79de3808de38082' USING utf8mb4), CONVERT(X'6d617267696e2d6c656674' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d626f782d342f2370726f706465662d6d617267696e2d6c656674' USING utf8mb4), CONVERT(X'6373732d626f782d3420454420323032362d30382d3036' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3436' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'6d617267696e2d6c656674' USING utf8mb4),
display_label = CONVERT(X'e5b7a6e5a496e9828ae8b79d' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e5b7a6e696b9e79a84e5a496e9828ae8b79de38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e5b7a6e696b9e79a84e5a496e9828ae8b79de38082e58fafe4bdbfe794a8e995b7e5baa6e38081e799bee58886e6af94e68896206175746fe38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20206d617267696e2d6c6566743a20313670783b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5b7a6e5a496e9828ae8b79de3808de38082' USING utf8mb4),
sort_key = CONVERT(X'6d617267696e2d6c656674' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d626f782d342f2370726f706465662d6d617267696e2d6c656674' USING utf8mb4),
source_version = CONVERT(X'6373732d626f782d3420454420323032362d30382d3036' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3436' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d6d617267696e2d6c656674' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'6d617267696e2d6c656674' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d6d617267696e2d696e6c696e65' USING utf8mb4), CONVERT(X'6d617267696e2d696e6c696e65' USING utf8mb4), CONVERT(X'e8a18ce585a7e696b9e59091e5a496e9828ae8b79d' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae8a18ce585a7e696b9e59091e8b5b7e9bb9ee88887e7b582e9bb9ee79a84e5a496e9828ae8b79de38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae8a18ce585a7e696b9e59091e8b5b7e9bb9ee88887e7b582e9bb9ee79a84e5a496e9828ae8b79de38082e5b08de68789e696b9e59091e794b1e69bb8e5afabe6a8a1e5bc8fe88887e69687e5ad97e696b9e59091e6b1bae5ae9aefbc8ce4b88de59bbae5ae9ae7ad89e5908ce5b7a6e88887e58fb3e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20206d617267696e2d696e6c696e653a206175746f3b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8a18ce585a7e696b9e59091e5a496e9828ae8b79de3808de38082' USING utf8mb4), CONVERT(X'6d617267696e2d696e6c696e65' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6c6f676963616c2d312f2370726f706465662d6d617267696e2d696e6c696e65' USING utf8mb4), CONVERT(X'6373732d6c6f676963616c2d3120454420323032352d31322d3132' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3430' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'6d617267696e2d696e6c696e65' USING utf8mb4),
display_label = CONVERT(X'e8a18ce585a7e696b9e59091e5a496e9828ae8b79d' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae8a18ce585a7e696b9e59091e8b5b7e9bb9ee88887e7b582e9bb9ee79a84e5a496e9828ae8b79de38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae8a18ce585a7e696b9e59091e8b5b7e9bb9ee88887e7b582e9bb9ee79a84e5a496e9828ae8b79de38082e5b08de68789e696b9e59091e794b1e69bb8e5afabe6a8a1e5bc8fe88887e69687e5ad97e696b9e59091e6b1bae5ae9aefbc8ce4b88de59bbae5ae9ae7ad89e5908ce5b7a6e88887e58fb3e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20206d617267696e2d696e6c696e653a206175746f3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8a18ce585a7e696b9e59091e5a496e9828ae8b79de3808de38082' USING utf8mb4),
sort_key = CONVERT(X'6d617267696e2d696e6c696e65' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6c6f676963616c2d312f2370726f706465662d6d617267696e2d696e6c696e65' USING utf8mb4),
source_version = CONVERT(X'6373732d6c6f676963616c2d3120454420323032352d31322d3132' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3430' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d6d617267696e2d696e6c696e65' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'6d617267696e2d696e6c696e65' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d6d617267696e2d626c6f636b' USING utf8mb4), CONVERT(X'6d617267696e2d626c6f636b' USING utf8mb4), CONVERT(X'e58d80e5a18ae696b9e59091e5a496e9828ae8b79d' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58d80e5a18ae696b9e59091e8b5b7e9bb9ee88887e7b582e9bb9ee79a84e5a496e9828ae8b79de38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58d80e5a18ae696b9e59091e8b5b7e9bb9ee88887e7b582e9bb9ee79a84e5a496e9828ae8b79de38082e4b880e888ace6a9abe59091e69bb8e5afabe69982e9809ae5b8b8e5b08de68789e4b88ae88887e4b88be38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20206d617267696e2d626c6f636b3a20313670783b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce58d80e5a18ae696b9e59091e5a496e9828ae8b79de3808de38082' USING utf8mb4), CONVERT(X'6d617267696e2d626c6f636b' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6c6f676963616c2d312f2370726f706465662d6d617267696e2d626c6f636b' USING utf8mb4), CONVERT(X'6373732d6c6f676963616c2d3120454420323032352d31322d3132' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3430' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'6d617267696e2d626c6f636b' USING utf8mb4),
display_label = CONVERT(X'e58d80e5a18ae696b9e59091e5a496e9828ae8b79d' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae58d80e5a18ae696b9e59091e8b5b7e9bb9ee88887e7b582e9bb9ee79a84e5a496e9828ae8b79de38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae58d80e5a18ae696b9e59091e8b5b7e9bb9ee88887e7b582e9bb9ee79a84e5a496e9828ae8b79de38082e4b880e888ace6a9abe59091e69bb8e5afabe69982e9809ae5b8b8e5b08de68789e4b88ae88887e4b88be38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20206d617267696e2d626c6f636b3a20313670783b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce58d80e5a18ae696b9e59091e5a496e9828ae8b79de3808de38082' USING utf8mb4),
sort_key = CONVERT(X'6d617267696e2d626c6f636b' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6c6f676963616c2d312f2370726f706465662d6d617267696e2d626c6f636b' USING utf8mb4),
source_version = CONVERT(X'6373732d6c6f676963616c2d3120454420323032352d31322d3132' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3430' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d6d617267696e2d626c6f636b' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'6d617267696e2d626c6f636b' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d70616464696e67' USING utf8mb4), CONVERT(X'70616464696e67' USING utf8mb4), CONVERT(X'e585a7e9828ae8b79d' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e585a7e5aeb9e88887e9828ae6a186e4b98be99693e79a84e7a9bae99693e38082e4b880e5808be580bce5a597e794a8e59b9be9828aefbc9be585a9e5808be580bce4be9de5ba8fe782bae3808ce4b88ae4b88be38081e5b7a6e58fb3e3808defbc9be4b889e5808be580bce782bae3808ce4b88ae38081e5b7a6e58fb3e38081e4b88be3808defbc9be59b9be5808be580bce782bae3808ce4b88ae38081e58fb3e38081e4b88be38081e5b7a6e3808defbc8ce4be9de9a086e69982e9879de68e92e58897e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e585a7e5aeb9e88887e9828ae6a186e4b98be99693e79a84e7a9bae99693e38082e4b880e5808be580bce5a597e794a8e59b9be9828aefbc9be585a9e5808be580bce4be9de5ba8fe782bae3808ce4b88ae4b88be38081e5b7a6e58fb3e3808defbc9be4b889e5808be580bce782bae3808ce4b88ae38081e5b7a6e58fb3e38081e4b88be3808defbc9be59b9be5808be580bce782bae3808ce4b88ae38081e58fb3e38081e4b88be38081e5b7a6e3808defbc8ce4be9de9a086e69982e9879de68e92e58897e38082e585a7e9828ae8b79de4b88de68ea5e58f97e8b2a0e580bce38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a202070616464696e673a203870782032307078203136707820313270783b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce585a7e9828ae8b79de3808de38082' USING utf8mb4), CONVERT(X'70616464696e67' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d626f782d342f2370726f706465662d70616464696e67' USING utf8mb4), CONVERT(X'6373732d626f782d3420454420323032362d30382d3036' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3436' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'70616464696e67' USING utf8mb4),
display_label = CONVERT(X'e585a7e9828ae8b79d' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e585a7e5aeb9e88887e9828ae6a186e4b98be99693e79a84e7a9bae99693e38082e4b880e5808be580bce5a597e794a8e59b9be9828aefbc9be585a9e5808be580bce4be9de5ba8fe782bae3808ce4b88ae4b88be38081e5b7a6e58fb3e3808defbc9be4b889e5808be580bce782bae3808ce4b88ae38081e5b7a6e58fb3e38081e4b88be3808defbc9be59b9be5808be580bce782bae3808ce4b88ae38081e58fb3e38081e4b88be38081e5b7a6e3808defbc8ce4be9de9a086e69982e9879de68e92e58897e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e585a7e5aeb9e88887e9828ae6a186e4b98be99693e79a84e7a9bae99693e38082e4b880e5808be580bce5a597e794a8e59b9be9828aefbc9be585a9e5808be580bce4be9de5ba8fe782bae3808ce4b88ae4b88be38081e5b7a6e58fb3e3808defbc9be4b889e5808be580bce782bae3808ce4b88ae38081e5b7a6e58fb3e38081e4b88be3808defbc9be59b9be5808be580bce782bae3808ce4b88ae38081e58fb3e38081e4b88be38081e5b7a6e3808defbc8ce4be9de9a086e69982e9879de68e92e58897e38082e585a7e9828ae8b79de4b88de68ea5e58f97e8b2a0e580bce38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a202070616464696e673a203870782032307078203136707820313270783b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce585a7e9828ae8b79de3808de38082' USING utf8mb4),
sort_key = CONVERT(X'70616464696e67' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d626f782d342f2370726f706465662d70616464696e67' USING utf8mb4),
source_version = CONVERT(X'6373732d626f782d3420454420323032362d30382d3036' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3436' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d70616464696e67' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'70616464696e67' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d70616464696e672d746f70' USING utf8mb4), CONVERT(X'70616464696e672d746f70' USING utf8mb4), CONVERT(X'e4b88ae585a7e9828ae8b79d' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae585a7e5aeb9e4b88ae696b9e79a84e585a7e9828ae8b79de38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae585a7e5aeb9e4b88ae696b9e79a84e585a7e9828ae8b79de38082e585a7e9828ae8b79de4bd8de696bce9828ae6a186e4bba5e585a7efbc8ce9809ae5b8b8e69c83e9a1afe7a4bae58583e7b4a0e8838ce699afe38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a202070616464696e672d746f703a20313270783b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce4b88ae585a7e9828ae8b79de3808de38082' USING utf8mb4), CONVERT(X'70616464696e672d746f70' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d626f782d342f2370726f706465662d70616464696e672d746f70' USING utf8mb4), CONVERT(X'6373732d626f782d3420454420323032362d30382d3036' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3436' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'70616464696e672d746f70' USING utf8mb4),
display_label = CONVERT(X'e4b88ae585a7e9828ae8b79d' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae585a7e5aeb9e4b88ae696b9e79a84e585a7e9828ae8b79de38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae585a7e5aeb9e4b88ae696b9e79a84e585a7e9828ae8b79de38082e585a7e9828ae8b79de4bd8de696bce9828ae6a186e4bba5e585a7efbc8ce9809ae5b8b8e69c83e9a1afe7a4bae58583e7b4a0e8838ce699afe38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a202070616464696e672d746f703a20313270783b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce4b88ae585a7e9828ae8b79de3808de38082' USING utf8mb4),
sort_key = CONVERT(X'70616464696e672d746f70' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d626f782d342f2370726f706465662d70616464696e672d746f70' USING utf8mb4),
source_version = CONVERT(X'6373732d626f782d3420454420323032362d30382d3036' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3436' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d70616464696e672d746f70' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'70616464696e672d746f70' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d70616464696e672d7269676874' USING utf8mb4), CONVERT(X'70616464696e672d7269676874' USING utf8mb4), CONVERT(X'e58fb3e585a7e9828ae8b79d' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae585a7e5aeb9e58fb3e696b9e79a84e585a7e9828ae8b79de38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae585a7e5aeb9e58fb3e696b9e79a84e585a7e9828ae8b79de38082e58fafe4bdbfe794a8e995b7e5baa6e68896e799bee58886e6af94e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a202070616464696e672d72696768743a20323070783b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce58fb3e585a7e9828ae8b79de3808de38082' USING utf8mb4), CONVERT(X'70616464696e672d7269676874' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d626f782d342f2370726f706465662d70616464696e672d7269676874' USING utf8mb4), CONVERT(X'6373732d626f782d3420454420323032362d30382d3036' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3436' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'70616464696e672d7269676874' USING utf8mb4),
display_label = CONVERT(X'e58fb3e585a7e9828ae8b79d' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae585a7e5aeb9e58fb3e696b9e79a84e585a7e9828ae8b79de38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae585a7e5aeb9e58fb3e696b9e79a84e585a7e9828ae8b79de38082e58fafe4bdbfe794a8e995b7e5baa6e68896e799bee58886e6af94e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a202070616464696e672d72696768743a20323070783b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce58fb3e585a7e9828ae8b79de3808de38082' USING utf8mb4),
sort_key = CONVERT(X'70616464696e672d7269676874' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d626f782d342f2370726f706465662d70616464696e672d7269676874' USING utf8mb4),
source_version = CONVERT(X'6373732d626f782d3420454420323032362d30382d3036' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3436' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d70616464696e672d7269676874' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'70616464696e672d7269676874' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d70616464696e672d626f74746f6d' USING utf8mb4), CONVERT(X'70616464696e672d626f74746f6d' USING utf8mb4), CONVERT(X'e4b88be585a7e9828ae8b79d' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae585a7e5aeb9e4b88be696b9e79a84e585a7e9828ae8b79de38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae585a7e5aeb9e4b88be696b9e79a84e585a7e9828ae8b79de38082e5b8b8e794a8e696bce5a29ee58aa0e69687e5ad97e88887e5aeb9e599a8e5ba95e983a8e79a84e8b79de99ba2e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a202070616464696e672d626f74746f6d3a20313270783b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce4b88be585a7e9828ae8b79de3808de38082' USING utf8mb4), CONVERT(X'70616464696e672d626f74746f6d' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d626f782d342f2370726f706465662d70616464696e672d626f74746f6d' USING utf8mb4), CONVERT(X'6373732d626f782d3420454420323032362d30382d3036' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3436' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'70616464696e672d626f74746f6d' USING utf8mb4),
display_label = CONVERT(X'e4b88be585a7e9828ae8b79d' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae585a7e5aeb9e4b88be696b9e79a84e585a7e9828ae8b79de38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae585a7e5aeb9e4b88be696b9e79a84e585a7e9828ae8b79de38082e5b8b8e794a8e696bce5a29ee58aa0e69687e5ad97e88887e5aeb9e599a8e5ba95e983a8e79a84e8b79de99ba2e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a202070616464696e672d626f74746f6d3a20313270783b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce4b88be585a7e9828ae8b79de3808de38082' USING utf8mb4),
sort_key = CONVERT(X'70616464696e672d626f74746f6d' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d626f782d342f2370726f706465662d70616464696e672d626f74746f6d' USING utf8mb4),
source_version = CONVERT(X'6373732d626f782d3420454420323032362d30382d3036' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3436' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d70616464696e672d626f74746f6d' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'70616464696e672d626f74746f6d' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d70616464696e672d6c656674' USING utf8mb4), CONVERT(X'70616464696e672d6c656674' USING utf8mb4), CONVERT(X'e5b7a6e585a7e9828ae8b79d' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae585a7e5aeb9e5b7a6e696b9e79a84e585a7e9828ae8b79de38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae585a7e5aeb9e5b7a6e696b9e79a84e585a7e9828ae8b79de38082e5b8b8e794a8e696bce8aabfe695b4e5aeb9e599a8e585a7e69687e5ad97e79a84e6b0b4e5b9b3e8b5b7e5a78be4bd8de7bdaee38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a202070616464696e672d6c6566743a20323070783b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5b7a6e585a7e9828ae8b79de3808de38082' USING utf8mb4), CONVERT(X'70616464696e672d6c656674' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d626f782d342f2370726f706465662d70616464696e672d6c656674' USING utf8mb4), CONVERT(X'6373732d626f782d3420454420323032362d30382d3036' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3436' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'70616464696e672d6c656674' USING utf8mb4),
display_label = CONVERT(X'e5b7a6e585a7e9828ae8b79d' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae585a7e5aeb9e5b7a6e696b9e79a84e585a7e9828ae8b79de38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae585a7e5aeb9e5b7a6e696b9e79a84e585a7e9828ae8b79de38082e5b8b8e794a8e696bce8aabfe695b4e5aeb9e599a8e585a7e69687e5ad97e79a84e6b0b4e5b9b3e8b5b7e5a78be4bd8de7bdaee38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a202070616464696e672d6c6566743a20323070783b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5b7a6e585a7e9828ae8b79de3808de38082' USING utf8mb4),
sort_key = CONVERT(X'70616464696e672d6c656674' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d626f782d342f2370726f706465662d70616464696e672d6c656674' USING utf8mb4),
source_version = CONVERT(X'6373732d626f782d3420454420323032362d30382d3036' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3436' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d70616464696e672d6c656674' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'70616464696e672d6c656674' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d70616464696e672d696e6c696e65' USING utf8mb4), CONVERT(X'70616464696e672d696e6c696e65' USING utf8mb4), CONVERT(X'e8a18ce585a7e696b9e59091e585a7e9828ae8b79d' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae8a18ce585a7e696b9e59091e585a9e7abafe79a84e585a7e9828ae8b79de38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae8a18ce585a7e696b9e59091e585a9e7abafe79a84e585a7e9828ae8b79de38082e58fafe68f90e4be9be4b880e5808be580bce8a8ade5ae9ae585a9e7abafefbc8ce68896e585a9e5808be580bce58886e588a5e8a8ade5ae9ae8b5b7e9bb9ee88887e7b582e9bb9ee38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a202070616464696e672d696e6c696e653a20323070783b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8a18ce585a7e696b9e59091e585a7e9828ae8b79de3808de38082' USING utf8mb4), CONVERT(X'70616464696e672d696e6c696e65' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6c6f676963616c2d312f2370726f706465662d70616464696e672d696e6c696e65' USING utf8mb4), CONVERT(X'6373732d6c6f676963616c2d3120454420323032352d31322d3132' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3430' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'70616464696e672d696e6c696e65' USING utf8mb4),
display_label = CONVERT(X'e8a18ce585a7e696b9e59091e585a7e9828ae8b79d' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae8a18ce585a7e696b9e59091e585a9e7abafe79a84e585a7e9828ae8b79de38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae8a18ce585a7e696b9e59091e585a9e7abafe79a84e585a7e9828ae8b79de38082e58fafe68f90e4be9be4b880e5808be580bce8a8ade5ae9ae585a9e7abafefbc8ce68896e585a9e5808be580bce58886e588a5e8a8ade5ae9ae8b5b7e9bb9ee88887e7b582e9bb9ee38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a202070616464696e672d696e6c696e653a20323070783b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8a18ce585a7e696b9e59091e585a7e9828ae8b79de3808de38082' USING utf8mb4),
sort_key = CONVERT(X'70616464696e672d696e6c696e65' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6c6f676963616c2d312f2370726f706465662d70616464696e672d696e6c696e65' USING utf8mb4),
source_version = CONVERT(X'6373732d6c6f676963616c2d3120454420323032352d31322d3132' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3430' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d70616464696e672d696e6c696e65' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'70616464696e672d696e6c696e65' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d70616464696e672d626c6f636b' USING utf8mb4), CONVERT(X'70616464696e672d626c6f636b' USING utf8mb4), CONVERT(X'e58d80e5a18ae696b9e59091e585a7e9828ae8b79d' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58d80e5a18ae696b9e59091e585a9e7abafe79a84e585a7e9828ae8b79de38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58d80e5a18ae696b9e59091e585a9e7abafe79a84e585a7e9828ae8b79de38082e4b880e888ace6a9abe59091e69bb8e5afabe69982e9809ae5b8b8e5b08de68789e4b88ae88887e4b88be38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a202070616464696e672d626c6f636b3a20313270783b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce58d80e5a18ae696b9e59091e585a7e9828ae8b79de3808de38082' USING utf8mb4), CONVERT(X'70616464696e672d626c6f636b' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6c6f676963616c2d312f2370726f706465662d70616464696e672d626c6f636b' USING utf8mb4), CONVERT(X'6373732d6c6f676963616c2d3120454420323032352d31322d3132' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3430' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'70616464696e672d626c6f636b' USING utf8mb4),
display_label = CONVERT(X'e58d80e5a18ae696b9e59091e585a7e9828ae8b79d' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae58d80e5a18ae696b9e59091e585a9e7abafe79a84e585a7e9828ae8b79de38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae58d80e5a18ae696b9e59091e585a9e7abafe79a84e585a7e9828ae8b79de38082e4b880e888ace6a9abe59091e69bb8e5afabe69982e9809ae5b8b8e5b08de68789e4b88ae88887e4b88be38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a202070616464696e672d626c6f636b3a20313270783b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce58d80e5a18ae696b9e59091e585a7e9828ae8b79de3808de38082' USING utf8mb4),
sort_key = CONVERT(X'70616464696e672d626c6f636b' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6c6f676963616c2d312f2370726f706465662d70616464696e672d626c6f636b' USING utf8mb4),
source_version = CONVERT(X'6373732d6c6f676963616c2d3120454420323032352d31322d3132' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3430' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d70616464696e672d626c6f636b' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'70616464696e672d626c6f636b' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d6f766572666c6f77' USING utf8mb4), CONVERT(X'6f766572666c6f77' USING utf8mb4), CONVERT(X'e6baa2e587bae585a7e5aeb9e89995e79086' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae585a7e5aeb9e8b685e587bae79b92e5ad90e69982e79a84e9a1afe7a4bae88887e68db2e58b95e696b9e5bc8fe38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae585a7e5aeb9e8b685e587bae79b92e5ad90e69982e79a84e9a1afe7a4bae88887e68db2e58b95e696b9e5bc8fe38082e5b8b8e8a68be580bce58c85e590ab2076697369626c65e3808168696464656ee38081636c6970e380817363726f6c6c20e88887206175746fe38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20206f766572666c6f773a206175746f3b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce6baa2e587bae585a7e5aeb9e89995e79086e3808de38082' USING utf8mb4), CONVERT(X'6f766572666c6f77' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6f766572666c6f772d332f2370726f706465662d6f766572666c6f77' USING utf8mb4), CONVERT(X'6373732d6f766572666c6f772d3320454420323032362d30382d3133' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3532' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'6f766572666c6f77' USING utf8mb4),
display_label = CONVERT(X'e6baa2e587bae585a7e5aeb9e89995e79086' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae585a7e5aeb9e8b685e587bae79b92e5ad90e69982e79a84e9a1afe7a4bae88887e68db2e58b95e696b9e5bc8fe38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae585a7e5aeb9e8b685e587bae79b92e5ad90e69982e79a84e9a1afe7a4bae88887e68db2e58b95e696b9e5bc8fe38082e5b8b8e8a68be580bce58c85e590ab2076697369626c65e3808168696464656ee38081636c6970e380817363726f6c6c20e88887206175746fe38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20206f766572666c6f773a206175746f3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce6baa2e587bae585a7e5aeb9e89995e79086e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'6f766572666c6f77' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6f766572666c6f772d332f2370726f706465662d6f766572666c6f77' USING utf8mb4),
source_version = CONVERT(X'6373732d6f766572666c6f772d3320454420323032362d30382d3133' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3532' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d6f766572666c6f77' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'6f766572666c6f77' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d6f766572666c6f772d78' USING utf8mb4), CONVERT(X'6f766572666c6f772d78' USING utf8mb4), CONVERT(X'e6b0b4e5b9b3e6baa2e587bae89995e79086' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae6b0b4e5b9b3e696b9e59091e6baa2e587bae585a7e5aeb9e79a84e89995e79086e696b9e5bc8fe38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae6b0b4e5b9b3e696b9e59091e6baa2e587bae585a7e5aeb9e79a84e89995e79086e696b9e5bc8fe38082e58fafe794a8e696bce7a88be5bc8fe7a2bce7af84e4be8be79a84e6b0b4e5b9b3e68db2e58b95e58d80e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20206f766572666c6f772d783a206175746f3b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce6b0b4e5b9b3e6baa2e587bae89995e79086e3808de38082' USING utf8mb4), CONVERT(X'6f766572666c6f772d78' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6f766572666c6f772d332f2370726f706465662d6f766572666c6f772d78' USING utf8mb4), CONVERT(X'6373732d6f766572666c6f772d3320454420323032362d30382d3133' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3532' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'6f766572666c6f772d78' USING utf8mb4),
display_label = CONVERT(X'e6b0b4e5b9b3e6baa2e587bae89995e79086' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae6b0b4e5b9b3e696b9e59091e6baa2e587bae585a7e5aeb9e79a84e89995e79086e696b9e5bc8fe38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae6b0b4e5b9b3e696b9e59091e6baa2e587bae585a7e5aeb9e79a84e89995e79086e696b9e5bc8fe38082e58fafe794a8e696bce7a88be5bc8fe7a2bce7af84e4be8be79a84e6b0b4e5b9b3e68db2e58b95e58d80e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20206f766572666c6f772d783a206175746f3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce6b0b4e5b9b3e6baa2e587bae89995e79086e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'6f766572666c6f772d78' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6f766572666c6f772d332f2370726f706465662d6f766572666c6f772d78' USING utf8mb4),
source_version = CONVERT(X'6373732d6f766572666c6f772d3320454420323032362d30382d3133' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3532' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d6f766572666c6f772d78' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'6f766572666c6f772d78' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d6f766572666c6f772d79' USING utf8mb4), CONVERT(X'6f766572666c6f772d79' USING utf8mb4), CONVERT(X'e59e82e79bb4e6baa2e587bae89995e79086' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae59e82e79bb4e696b9e59091e6baa2e587bae585a7e5aeb9e79a84e89995e79086e696b9e5bc8fe38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae59e82e79bb4e696b9e59091e6baa2e587bae585a7e5aeb9e79a84e89995e79086e696b9e5bc8fe38082e9809ae5b8b8e690ade9858de58f97e99990e9ab98e5baa6e5bbbae7ab8be59e82e79bb4e68db2e58b95e58d80e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20206f766572666c6f772d793a206175746f3b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce59e82e79bb4e6baa2e587bae89995e79086e3808de38082' USING utf8mb4), CONVERT(X'6f766572666c6f772d79' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6f766572666c6f772d332f2370726f706465662d6f766572666c6f772d79' USING utf8mb4), CONVERT(X'6373732d6f766572666c6f772d3320454420323032362d30382d3133' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3532' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'6f766572666c6f772d79' USING utf8mb4),
display_label = CONVERT(X'e59e82e79bb4e6baa2e587bae89995e79086' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae59e82e79bb4e696b9e59091e6baa2e587bae585a7e5aeb9e79a84e89995e79086e696b9e5bc8fe38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae59e82e79bb4e696b9e59091e6baa2e587bae585a7e5aeb9e79a84e89995e79086e696b9e5bc8fe38082e9809ae5b8b8e690ade9858de58f97e99990e9ab98e5baa6e5bbbae7ab8be59e82e79bb4e68db2e58b95e58d80e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20206f766572666c6f772d793a206175746f3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce59e82e79bb4e6baa2e587bae89995e79086e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'6f766572666c6f772d79' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6f766572666c6f772d332f2370726f706465662d6f766572666c6f772d79' USING utf8mb4),
source_version = CONVERT(X'6373732d6f766572666c6f772d3320454420323032362d30382d3133' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3532' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d6f766572666c6f772d79' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'6f766572666c6f772d79' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d7669736962696c697479' USING utf8mb4), CONVERT(X'7669736962696c697479' USING utf8mb4), CONVERT(X'e58fafe8a68be680a7' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e79b92e5ad90e79a84e58fafe8a68be78b80e6858be38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e79b92e5ad90e79a84e58fafe8a68be78b80e6858be3808268696464656e20e9809ae5b8b8e4bf9de79599e58e9fe69c89e68e92e78988e7a9bae99693efbc9b646973706c61793a206e6f6e6520e58987e4b88de794a2e7949fe68e92e78988e79b92e5ad90e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20207669736962696c6974793a2068696464656e3b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce58fafe8a68be680a7e3808de38082' USING utf8mb4), CONVERT(X'7669736962696c697479' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d646973706c61792d342f2370726f706465662d7669736962696c697479' USING utf8mb4), CONVERT(X'6373732d646973706c61792d3420454420323032362d30362d3035' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'7669736962696c697479' USING utf8mb4),
display_label = CONVERT(X'e58fafe8a68be680a7' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e79b92e5ad90e79a84e58fafe8a68be78b80e6858be38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e79b92e5ad90e79a84e58fafe8a68be78b80e6858be3808268696464656e20e9809ae5b8b8e4bf9de79599e58e9fe69c89e68e92e78988e7a9bae99693efbc9b646973706c61793a206e6f6e6520e58987e4b88de794a2e7949fe68e92e78988e79b92e5ad90e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20207669736962696c6974793a2068696464656e3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce58fafe8a68be680a7e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'7669736962696c697479' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d646973706c61792d342f2370726f706465662d7669736962696c697479' USING utf8mb4),
source_version = CONVERT(X'6373732d646973706c61792d3420454420323032362d30362d3035' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d7669736962696c697479' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'7669736962696c697479' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d6f706163697479' USING utf8mb4), CONVERT(X'6f706163697479' USING utf8mb4), CONVERT(X'e4b88de9808fe6988ee5baa6' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e58f8ae585b6e585a7e5aeb9e695b4e9ab94e79a84e4b88de9808fe6988ee7a88be5baa6e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e58f8ae585b6e585a7e5aeb9e695b4e9ab94e79a84e4b88de9808fe6988ee7a88be5baa6e380823020e8a1a8e7a4bae5ae8ce585a8e9808fe6988eefbc8c3120e8a1a8e7a4bae5ae8ce585a8e4b88de9808fe6988eefbc9be5ae83e4b88de69c83e887aae58b95e58f96e6b688e58583e7b4a0e79a84e4ba92e58b95e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20206f7061636974793a20302e383b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce4b88de9808fe6988ee5baa6e3808de38082' USING utf8mb4), CONVERT(X'6f706163697479' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d636f6c6f722d342f2370726f706465662d6f706163697479' USING utf8mb4), CONVERT(X'6373732d636f6c6f722d3420454420323032362d31312d3132' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3538' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'6f706163697479' USING utf8mb4),
display_label = CONVERT(X'e4b88de9808fe6988ee5baa6' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e58f8ae585b6e585a7e5aeb9e695b4e9ab94e79a84e4b88de9808fe6988ee7a88be5baa6e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e58f8ae585b6e585a7e5aeb9e695b4e9ab94e79a84e4b88de9808fe6988ee7a88be5baa6e380823020e8a1a8e7a4bae5ae8ce585a8e9808fe6988eefbc8c3120e8a1a8e7a4bae5ae8ce585a8e4b88de9808fe6988eefbc9be5ae83e4b88de69c83e887aae58b95e58f96e6b688e58583e7b4a0e79a84e4ba92e58b95e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20206f7061636974793a20302e383b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce4b88de9808fe6988ee5baa6e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'6f706163697479' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d636f6c6f722d342f2370726f706465662d6f706163697479' USING utf8mb4),
source_version = CONVERT(X'6373732d636f6c6f722d3420454420323032362d31312d3132' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3538' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d6f706163697479' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'6f706163697479' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d636f6c6f72' USING utf8mb4), CONVERT(X'636f6c6f72' USING utf8mb4), CONVERT(X'e69687e5ad97e5898de699afe889b2' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae69687e5ad97e7ad89e5898de699afe585a7e5aeb9e4bdbfe794a8e79a84e9a18fe889b2e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae69687e5ad97e7ad89e5898de699afe585a7e5aeb9e4bdbfe794a8e79a84e9a18fe889b2e38082e4b99fe68f90e4be9b2063757272656e74436f6c6f7220e79a84e9a18fe889b2e4be86e6ba90efbc8ce58fafe4bdbfe794a8e889b2e5908de38081e58d81e585ade980b2e4bd8de88887e889b2e5bda9e587bde5bc8fe7ad89e5afabe6b395e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020636f6c6f723a20233234353435613b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce69687e5ad97e5898de699afe889b2e3808de38082' USING utf8mb4), CONVERT(X'636f6c6f72' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d636f6c6f722d342f2370726f706465662d636f6c6f72' USING utf8mb4), CONVERT(X'6373732d636f6c6f722d3420454420323032362d31312d3132' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3538' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'636f6c6f72' USING utf8mb4),
display_label = CONVERT(X'e69687e5ad97e5898de699afe889b2' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae69687e5ad97e7ad89e5898de699afe585a7e5aeb9e4bdbfe794a8e79a84e9a18fe889b2e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae69687e5ad97e7ad89e5898de699afe585a7e5aeb9e4bdbfe794a8e79a84e9a18fe889b2e38082e4b99fe68f90e4be9b2063757272656e74436f6c6f7220e79a84e9a18fe889b2e4be86e6ba90efbc8ce58fafe4bdbfe794a8e889b2e5908de38081e58d81e585ade980b2e4bd8de88887e889b2e5bda9e587bde5bc8fe7ad89e5afabe6b395e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020636f6c6f723a20233234353435613b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce69687e5ad97e5898de699afe889b2e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'636f6c6f72' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d636f6c6f722d342f2370726f706465662d636f6c6f72' USING utf8mb4),
source_version = CONVERT(X'6373732d636f6c6f722d3420454420323032362d31312d3132' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3538' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d636f6c6f72' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'636f6c6f72' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d6261636b67726f756e64' USING utf8mb4), CONVERT(X'6261636b67726f756e64' USING utf8mb4), CONVERT(X'e8838ce699afe7b0a1e5afab' USING utf8mb4), CONVERT(X'e4bba5e7b0a1e5afabe8a8ade5ae9ae8838ce699afe889b2e38081e8838ce699afe59c96e58f8ae585b6e4bb96e8838ce699afe5b1ace680a7e38082' USING utf8mb4), CONVERT(X'e4bba5e7b0a1e5afabe8a8ade5ae9ae8838ce699afe889b2e38081e8838ce699afe59c96e58f8ae585b6e4bb96e8838ce699afe5b1ace680a7e38082e7b0a1e5afabe69c83e5908ce69982e8a8ade5ae9ae79bb8e9979ce79a84e995b7e5afabe5b1ace680a7efbc9be69caae68f90e4be9be79a84e983a8e58886e9809ae5b8b8e59b9ee588b0e5889de5a78be580bce38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20206261636b67726f756e643a20236636663766353b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8838ce699afe7b0a1e5afabe3808de38082' USING utf8mb4), CONVERT(X'6261636b67726f756e64' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6261636b67726f756e64732d332f2370726f706465662d6261636b67726f756e64' USING utf8mb4), CONVERT(X'6373732d6261636b67726f756e64732d3320454420323032352d31322d3136' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3336' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'6261636b67726f756e64' USING utf8mb4),
display_label = CONVERT(X'e8838ce699afe7b0a1e5afab' USING utf8mb4),
summary = CONVERT(X'e4bba5e7b0a1e5afabe8a8ade5ae9ae8838ce699afe889b2e38081e8838ce699afe59c96e58f8ae585b6e4bb96e8838ce699afe5b1ace680a7e38082' USING utf8mb4),
description = CONVERT(X'e4bba5e7b0a1e5afabe8a8ade5ae9ae8838ce699afe889b2e38081e8838ce699afe59c96e58f8ae585b6e4bb96e8838ce699afe5b1ace680a7e38082e7b0a1e5afabe69c83e5908ce69982e8a8ade5ae9ae79bb8e9979ce79a84e995b7e5afabe5b1ace680a7efbc9be69caae68f90e4be9be79a84e983a8e58886e9809ae5b8b8e59b9ee588b0e5889de5a78be580bce38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20206261636b67726f756e643a20236636663766353b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8838ce699afe7b0a1e5afabe3808de38082' USING utf8mb4),
sort_key = CONVERT(X'6261636b67726f756e64' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6261636b67726f756e64732d332f2370726f706465662d6261636b67726f756e64' USING utf8mb4),
source_version = CONVERT(X'6373732d6261636b67726f756e64732d3320454420323032352d31322d3136' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3336' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d6261636b67726f756e64' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'6261636b67726f756e64' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d6261636b67726f756e642d636f6c6f72' USING utf8mb4), CONVERT(X'6261636b67726f756e642d636f6c6f72' USING utf8mb4), CONVERT(X'e8838ce699afe889b2' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e79a84e8838ce699afe9a18fe889b2e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e79a84e8838ce699afe9a18fe889b2e38082e8838ce699afe889b2e7b9aae8a3bde696bce8838ce699afe59c96e78987e4b88be696b9e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20206261636b67726f756e642d636f6c6f723a20236636663766353b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8838ce699afe889b2e3808de38082' USING utf8mb4), CONVERT(X'6261636b67726f756e642d636f6c6f72' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6261636b67726f756e64732d332f2370726f706465662d6261636b67726f756e642d636f6c6f72' USING utf8mb4), CONVERT(X'6373732d6261636b67726f756e64732d3320454420323032352d31322d3136' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3336' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'6261636b67726f756e642d636f6c6f72' USING utf8mb4),
display_label = CONVERT(X'e8838ce699afe889b2' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e79a84e8838ce699afe9a18fe889b2e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e79a84e8838ce699afe9a18fe889b2e38082e8838ce699afe889b2e7b9aae8a3bde696bce8838ce699afe59c96e78987e4b88be696b9e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20206261636b67726f756e642d636f6c6f723a20236636663766353b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8838ce699afe889b2e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'6261636b67726f756e642d636f6c6f72' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6261636b67726f756e64732d332f2370726f706465662d6261636b67726f756e642d636f6c6f72' USING utf8mb4),
source_version = CONVERT(X'6373732d6261636b67726f756e64732d3320454420323032352d31322d3136' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3336' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d6261636b67726f756e642d636f6c6f72' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'6261636b67726f756e642d636f6c6f72' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d6261636b67726f756e642d696d616765' USING utf8mb4), CONVERT(X'6261636b67726f756e642d696d616765' USING utf8mb4), CONVERT(X'e8838ce699afe59c96e78987' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae4b880e5b1a4e68896e5a49ae5b1a4e8838ce699afe59c96e78987e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae4b880e5b1a4e68896e5a49ae5b1a4e8838ce699afe59c96e78987e38082e58fafe4bdbfe794a82075726c282920e68896e6bcb8e5b1a4e587bde5bc8fefbc8ce5a49ae5b1a4e8838ce699afe4bba5e98097e8999fe58886e99a94e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20206261636b67726f756e642d696d6167653a206c696e6561722d6772616469656e7428746f2072696768742c207465616c2c207768697465293b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8838ce699afe59c96e78987e3808de38082' USING utf8mb4), CONVERT(X'6261636b67726f756e642d696d616765' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6261636b67726f756e64732d332f2370726f706465662d6261636b67726f756e642d696d616765' USING utf8mb4), CONVERT(X'6373732d6261636b67726f756e64732d3320454420323032352d31322d3136' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3336' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'6261636b67726f756e642d696d616765' USING utf8mb4),
display_label = CONVERT(X'e8838ce699afe59c96e78987' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae4b880e5b1a4e68896e5a49ae5b1a4e8838ce699afe59c96e78987e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae4b880e5b1a4e68896e5a49ae5b1a4e8838ce699afe59c96e78987e38082e58fafe4bdbfe794a82075726c282920e68896e6bcb8e5b1a4e587bde5bc8fefbc8ce5a49ae5b1a4e8838ce699afe4bba5e98097e8999fe58886e99a94e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20206261636b67726f756e642d696d6167653a206c696e6561722d6772616469656e7428746f2072696768742c207465616c2c207768697465293b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8838ce699afe59c96e78987e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'6261636b67726f756e642d696d616765' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6261636b67726f756e64732d332f2370726f706465662d6261636b67726f756e642d696d616765' USING utf8mb4),
source_version = CONVERT(X'6373732d6261636b67726f756e64732d3320454420323032352d31322d3136' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3336' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d6261636b67726f756e642d696d616765' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'6261636b67726f756e642d696d616765' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d6261636b67726f756e642d73697a65' USING utf8mb4), CONVERT(X'6261636b67726f756e642d73697a65' USING utf8mb4), CONVERT(X'e8838ce699afe59c96e78987e5b0bae5afb8' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae8838ce699afe59c96e78987e79a84e5b0bae5afb8e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae8838ce699afe59c96e78987e79a84e5b0bae5afb8e38082636f76657220e69c83e5a1abe6bbbfe58d80e59f9fe4b894e58fafe883bde8a381e58887efbc9b636f6e7461696e20e69c83e5ae8ce695b4e5aeb9e7b48de59c96e78987e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20206261636b67726f756e642d73697a653a20636f7665723b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8838ce699afe59c96e78987e5b0bae5afb8e3808de38082' USING utf8mb4), CONVERT(X'6261636b67726f756e642d73697a65' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6261636b67726f756e64732d332f2370726f706465662d6261636b67726f756e642d73697a65' USING utf8mb4), CONVERT(X'6373732d6261636b67726f756e64732d3320454420323032352d31322d3136' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3336' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'6261636b67726f756e642d73697a65' USING utf8mb4),
display_label = CONVERT(X'e8838ce699afe59c96e78987e5b0bae5afb8' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae8838ce699afe59c96e78987e79a84e5b0bae5afb8e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae8838ce699afe59c96e78987e79a84e5b0bae5afb8e38082636f76657220e69c83e5a1abe6bbbfe58d80e59f9fe4b894e58fafe883bde8a381e58887efbc9b636f6e7461696e20e69c83e5ae8ce695b4e5aeb9e7b48de59c96e78987e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20206261636b67726f756e642d73697a653a20636f7665723b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8838ce699afe59c96e78987e5b0bae5afb8e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'6261636b67726f756e642d73697a65' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6261636b67726f756e64732d332f2370726f706465662d6261636b67726f756e642d73697a65' USING utf8mb4),
source_version = CONVERT(X'6373732d6261636b67726f756e64732d3320454420323032352d31322d3136' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3336' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d6261636b67726f756e642d73697a65' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'6261636b67726f756e642d73697a65' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d6261636b67726f756e642d706f736974696f6e' USING utf8mb4), CONVERT(X'6261636b67726f756e642d706f736974696f6e' USING utf8mb4), CONVERT(X'e8838ce699afe59c96e78987e4bd8de7bdae' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae8838ce699afe59c96e78987e59ca8e8838ce699afe5ae9ae4bd8de58d80e59f9fe4b8ade79a84e4bd8de7bdaee38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae8838ce699afe59c96e78987e59ca8e8838ce699afe5ae9ae4bd8de58d80e59f9fe4b8ade79a84e4bd8de7bdaee38082e58fafe4bdbfe794a82063656e74657220e7ad89e9979ce98db5e5ad97efbc8ce68896e995b7e5baa6e38081e799bee58886e6af94e68c87e5ae9ae38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20206261636b67726f756e642d706f736974696f6e3a2063656e7465723b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8838ce699afe59c96e78987e4bd8de7bdaee3808de38082' USING utf8mb4), CONVERT(X'6261636b67726f756e642d706f736974696f6e' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6261636b67726f756e64732d332f2370726f706465662d6261636b67726f756e642d706f736974696f6e' USING utf8mb4), CONVERT(X'6373732d6261636b67726f756e64732d3320454420323032352d31322d3136' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3336' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'6261636b67726f756e642d706f736974696f6e' USING utf8mb4),
display_label = CONVERT(X'e8838ce699afe59c96e78987e4bd8de7bdae' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae8838ce699afe59c96e78987e59ca8e8838ce699afe5ae9ae4bd8de58d80e59f9fe4b8ade79a84e4bd8de7bdaee38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae8838ce699afe59c96e78987e59ca8e8838ce699afe5ae9ae4bd8de58d80e59f9fe4b8ade79a84e4bd8de7bdaee38082e58fafe4bdbfe794a82063656e74657220e7ad89e9979ce98db5e5ad97efbc8ce68896e995b7e5baa6e38081e799bee58886e6af94e68c87e5ae9ae38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20206261636b67726f756e642d706f736974696f6e3a2063656e7465723b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8838ce699afe59c96e78987e4bd8de7bdaee3808de38082' USING utf8mb4),
sort_key = CONVERT(X'6261636b67726f756e642d706f736974696f6e' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6261636b67726f756e64732d332f2370726f706465662d6261636b67726f756e642d706f736974696f6e' USING utf8mb4),
source_version = CONVERT(X'6373732d6261636b67726f756e64732d3320454420323032352d31322d3136' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3336' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d6261636b67726f756e642d706f736974696f6e' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'6261636b67726f756e642d706f736974696f6e' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d6261636b67726f756e642d726570656174' USING utf8mb4), CONVERT(X'6261636b67726f756e642d726570656174' USING utf8mb4), CONVERT(X'e8838ce699afe59c96e78987e9878de8a487' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae8838ce699afe59c96e78987e698afe590a6e58f8ae5a682e4bd95e9878de8a487e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae8838ce699afe59c96e78987e698afe590a6e58f8ae5a682e4bd95e9878de8a487e380826e6f2d72657065617420e58faae7b9aae8a3bde596aee4bbbde59c96e78987e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20206261636b67726f756e642d7265706561743a206e6f2d7265706561743b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8838ce699afe59c96e78987e9878de8a487e3808de38082' USING utf8mb4), CONVERT(X'6261636b67726f756e642d726570656174' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6261636b67726f756e64732d332f2370726f706465662d6261636b67726f756e642d726570656174' USING utf8mb4), CONVERT(X'6373732d6261636b67726f756e64732d3320454420323032352d31322d3136' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3336' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'6261636b67726f756e642d726570656174' USING utf8mb4),
display_label = CONVERT(X'e8838ce699afe59c96e78987e9878de8a487' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae8838ce699afe59c96e78987e698afe590a6e58f8ae5a682e4bd95e9878de8a487e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae8838ce699afe59c96e78987e698afe590a6e58f8ae5a682e4bd95e9878de8a487e380826e6f2d72657065617420e58faae7b9aae8a3bde596aee4bbbde59c96e78987e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20206261636b67726f756e642d7265706561743a206e6f2d7265706561743b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8838ce699afe59c96e78987e9878de8a487e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'6261636b67726f756e642d726570656174' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6261636b67726f756e64732d332f2370726f706465662d6261636b67726f756e642d726570656174' USING utf8mb4),
source_version = CONVERT(X'6373732d6261636b67726f756e64732d3320454420323032352d31322d3136' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3336' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d6261636b67726f756e642d726570656174' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'6261636b67726f756e642d726570656174' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d626f72646572' USING utf8mb4), CONVERT(X'626f72646572' USING utf8mb4), CONVERT(X'e9828ae6a186e7b0a1e5afab' USING utf8mb4), CONVERT(X'e4bba5e7b0a1e5afabe8a8ade5ae9ae59b9be9828ae9828ae6a186e79a84e5aface5baa6e38081e6a8a3e5bc8fe88887e9a18fe889b2e38082' USING utf8mb4), CONVERT(X'e4bba5e7b0a1e5afabe8a8ade5ae9ae59b9be9828ae9828ae6a186e79a84e5aface5baa6e38081e6a8a3e5bc8fe88887e9a18fe889b2e38082e88ba5e6b292e69c89e58fafe8a68be79a84e9828ae6a186e6a8a3e5bc8fefbc8ce596aee78da8e8a8ade5ae9ae5aface5baa6e4b88de4b880e5ae9ae69c83e587bae78fbee9828ae6a186e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020626f726465723a2031707820736f6c696420236461646464393b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce9828ae6a186e7b0a1e5afabe3808de38082' USING utf8mb4), CONVERT(X'626f72646572' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6261636b67726f756e64732d332f2370726f706465662d626f72646572' USING utf8mb4), CONVERT(X'6373732d6261636b67726f756e64732d3320454420323032352d31322d3136' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3336' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'626f72646572' USING utf8mb4),
display_label = CONVERT(X'e9828ae6a186e7b0a1e5afab' USING utf8mb4),
summary = CONVERT(X'e4bba5e7b0a1e5afabe8a8ade5ae9ae59b9be9828ae9828ae6a186e79a84e5aface5baa6e38081e6a8a3e5bc8fe88887e9a18fe889b2e38082' USING utf8mb4),
description = CONVERT(X'e4bba5e7b0a1e5afabe8a8ade5ae9ae59b9be9828ae9828ae6a186e79a84e5aface5baa6e38081e6a8a3e5bc8fe88887e9a18fe889b2e38082e88ba5e6b292e69c89e58fafe8a68be79a84e9828ae6a186e6a8a3e5bc8fefbc8ce596aee78da8e8a8ade5ae9ae5aface5baa6e4b88de4b880e5ae9ae69c83e587bae78fbee9828ae6a186e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020626f726465723a2031707820736f6c696420236461646464393b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce9828ae6a186e7b0a1e5afabe3808de38082' USING utf8mb4),
sort_key = CONVERT(X'626f72646572' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6261636b67726f756e64732d332f2370726f706465662d626f72646572' USING utf8mb4),
source_version = CONVERT(X'6373732d6261636b67726f756e64732d3320454420323032352d31322d3136' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3336' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d626f72646572' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'626f72646572' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d626f726465722d7769647468' USING utf8mb4), CONVERT(X'626f726465722d7769647468' USING utf8mb4), CONVERT(X'e9828ae6a186e5aface5baa6' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae59b9be5808be696b9e59091e79a84e9828ae6a186e5aface5baa6e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae59b9be5808be696b9e59091e79a84e9828ae6a186e5aface5baa6e38082e58fafe68f90e4be9be4b880e588b0e59b9be5808be580bcefbc8ce5afa6e99a9be9a1afe7a4bae4bb8de99c80e690ade9858de9828ae6a186e6a8a3e5bc8fe38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020626f726465722d77696474683a203170783b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce9828ae6a186e5aface5baa6e3808de38082' USING utf8mb4), CONVERT(X'626f726465722d7769647468' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6261636b67726f756e64732d332f2370726f706465662d626f726465722d7769647468' USING utf8mb4), CONVERT(X'6373732d6261636b67726f756e64732d3320454420323032352d31322d3136' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3336' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'626f726465722d7769647468' USING utf8mb4),
display_label = CONVERT(X'e9828ae6a186e5aface5baa6' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae59b9be5808be696b9e59091e79a84e9828ae6a186e5aface5baa6e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae59b9be5808be696b9e59091e79a84e9828ae6a186e5aface5baa6e38082e58fafe68f90e4be9be4b880e588b0e59b9be5808be580bcefbc8ce5afa6e99a9be9a1afe7a4bae4bb8de99c80e690ade9858de9828ae6a186e6a8a3e5bc8fe38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020626f726465722d77696474683a203170783b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce9828ae6a186e5aface5baa6e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'626f726465722d7769647468' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6261636b67726f756e64732d332f2370726f706465662d626f726465722d7769647468' USING utf8mb4),
source_version = CONVERT(X'6373732d6261636b67726f756e64732d3320454420323032352d31322d3136' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3336' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d626f726465722d7769647468' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'626f726465722d7769647468' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d626f726465722d7374796c65' USING utf8mb4), CONVERT(X'626f726465722d7374796c65' USING utf8mb4), CONVERT(X'e9828ae6a186e6a8a3e5bc8f' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae9828ae6a186e79a84e7b79ae6a29de6a8a3e5bc8fe38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae9828ae6a186e79a84e7b79ae6a29de6a8a3e5bc8fe38082e5b8b8e8a68be580bce58c85e590ab20736f6c6964e38081646173686564e38081646f7474656420e88887206e6f6e65e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020626f726465722d7374796c653a20736f6c69643b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce9828ae6a186e6a8a3e5bc8fe3808de38082' USING utf8mb4), CONVERT(X'626f726465722d7374796c65' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6261636b67726f756e64732d332f2370726f706465662d626f726465722d7374796c65' USING utf8mb4), CONVERT(X'6373732d6261636b67726f756e64732d3320454420323032352d31322d3136' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3336' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'626f726465722d7374796c65' USING utf8mb4),
display_label = CONVERT(X'e9828ae6a186e6a8a3e5bc8f' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae9828ae6a186e79a84e7b79ae6a29de6a8a3e5bc8fe38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae9828ae6a186e79a84e7b79ae6a29de6a8a3e5bc8fe38082e5b8b8e8a68be580bce58c85e590ab20736f6c6964e38081646173686564e38081646f7474656420e88887206e6f6e65e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020626f726465722d7374796c653a20736f6c69643b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce9828ae6a186e6a8a3e5bc8fe3808de38082' USING utf8mb4),
sort_key = CONVERT(X'626f726465722d7374796c65' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6261636b67726f756e64732d332f2370726f706465662d626f726465722d7374796c65' USING utf8mb4),
source_version = CONVERT(X'6373732d6261636b67726f756e64732d3320454420323032352d31322d3136' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3336' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d626f726465722d7374796c65' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'626f726465722d7374796c65' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d626f726465722d636f6c6f72' USING utf8mb4), CONVERT(X'626f726465722d636f6c6f72' USING utf8mb4), CONVERT(X'e9828ae6a186e9a18fe889b2' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae59b9be5808be696b9e59091e79a84e9828ae6a186e9a18fe889b2e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae59b9be5808be696b9e59091e79a84e9828ae6a186e9a18fe889b2e38082e58fafe68f90e4be9be4b880e588b0e59b9be5808be580bcefbc9be69caae6988ee7a2bae68c87e5ae9ae9a18fe889b2e69982e5b8b8e4bdbfe794a82063757272656e74436f6c6f72e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020626f726465722d636f6c6f723a20236461646464393b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce9828ae6a186e9a18fe889b2e3808de38082' USING utf8mb4), CONVERT(X'626f726465722d636f6c6f72' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6261636b67726f756e64732d332f2370726f706465662d626f726465722d636f6c6f72' USING utf8mb4), CONVERT(X'6373732d6261636b67726f756e64732d3320454420323032352d31322d3136' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3336' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'626f726465722d636f6c6f72' USING utf8mb4),
display_label = CONVERT(X'e9828ae6a186e9a18fe889b2' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae59b9be5808be696b9e59091e79a84e9828ae6a186e9a18fe889b2e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae59b9be5808be696b9e59091e79a84e9828ae6a186e9a18fe889b2e38082e58fafe68f90e4be9be4b880e588b0e59b9be5808be580bcefbc9be69caae6988ee7a2bae68c87e5ae9ae9a18fe889b2e69982e5b8b8e4bdbfe794a82063757272656e74436f6c6f72e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020626f726465722d636f6c6f723a20236461646464393b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce9828ae6a186e9a18fe889b2e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'626f726465722d636f6c6f72' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6261636b67726f756e64732d332f2370726f706465662d626f726465722d636f6c6f72' USING utf8mb4),
source_version = CONVERT(X'6373732d6261636b67726f756e64732d3320454420323032352d31322d3136' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3336' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d626f726465722d636f6c6f72' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'626f726465722d636f6c6f72' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d626f726465722d746f70' USING utf8mb4), CONVERT(X'626f726465722d746f70' USING utf8mb4), CONVERT(X'e4b88ae9828ae6a186' USING utf8mb4), CONVERT(X'e4bba5e7b0a1e5afabe8a8ade5ae9ae4b88ae696b9e9828ae6a186e79a84e5aface5baa6e38081e6a8a3e5bc8fe88887e9a18fe889b2e38082' USING utf8mb4), CONVERT(X'e4bba5e7b0a1e5afabe8a8ade5ae9ae4b88ae696b9e9828ae6a186e79a84e5aface5baa6e38081e6a8a3e5bc8fe88887e9a18fe889b2e38082e981a9e59088e8a3bde4bd9ce58886e99a94e7b79ae68896e58d80e5a18ae9a082e983a8e79a84e8a39de9a3bee38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020626f726465722d746f703a2033707820736f6c696420236335613435343b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce4b88ae9828ae6a186e3808de38082' USING utf8mb4), CONVERT(X'626f726465722d746f70' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6261636b67726f756e64732d332f2370726f706465662d626f726465722d746f70' USING utf8mb4), CONVERT(X'6373732d6261636b67726f756e64732d3320454420323032352d31322d3136' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3336' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'626f726465722d746f70' USING utf8mb4),
display_label = CONVERT(X'e4b88ae9828ae6a186' USING utf8mb4),
summary = CONVERT(X'e4bba5e7b0a1e5afabe8a8ade5ae9ae4b88ae696b9e9828ae6a186e79a84e5aface5baa6e38081e6a8a3e5bc8fe88887e9a18fe889b2e38082' USING utf8mb4),
description = CONVERT(X'e4bba5e7b0a1e5afabe8a8ade5ae9ae4b88ae696b9e9828ae6a186e79a84e5aface5baa6e38081e6a8a3e5bc8fe88887e9a18fe889b2e38082e981a9e59088e8a3bde4bd9ce58886e99a94e7b79ae68896e58d80e5a18ae9a082e983a8e79a84e8a39de9a3bee38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020626f726465722d746f703a2033707820736f6c696420236335613435343b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce4b88ae9828ae6a186e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'626f726465722d746f70' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6261636b67726f756e64732d332f2370726f706465662d626f726465722d746f70' USING utf8mb4),
source_version = CONVERT(X'6373732d6261636b67726f756e64732d3320454420323032352d31322d3136' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3336' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d626f726465722d746f70' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'626f726465722d746f70' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d626f726465722d7269676874' USING utf8mb4), CONVERT(X'626f726465722d7269676874' USING utf8mb4), CONVERT(X'e58fb3e9828ae6a186' USING utf8mb4), CONVERT(X'e4bba5e7b0a1e5afabe8a8ade5ae9ae58fb3e696b9e9828ae6a186e38082' USING utf8mb4), CONVERT(X'e4bba5e7b0a1e5afabe8a8ade5ae9ae58fb3e696b9e9828ae6a186e38082e5b8b8e794a8e696bce581b4e6ac84e88887e4b8bbe8a681e585a7e5aeb9e4b98be99693e79a84e58886e99a94e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020626f726465722d72696768743a2031707820736f6c696420236461646464393b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce58fb3e9828ae6a186e3808de38082' USING utf8mb4), CONVERT(X'626f726465722d7269676874' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6261636b67726f756e64732d332f2370726f706465662d626f726465722d7269676874' USING utf8mb4), CONVERT(X'6373732d6261636b67726f756e64732d3320454420323032352d31322d3136' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3336' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'626f726465722d7269676874' USING utf8mb4),
display_label = CONVERT(X'e58fb3e9828ae6a186' USING utf8mb4),
summary = CONVERT(X'e4bba5e7b0a1e5afabe8a8ade5ae9ae58fb3e696b9e9828ae6a186e38082' USING utf8mb4),
description = CONVERT(X'e4bba5e7b0a1e5afabe8a8ade5ae9ae58fb3e696b9e9828ae6a186e38082e5b8b8e794a8e696bce581b4e6ac84e88887e4b8bbe8a681e585a7e5aeb9e4b98be99693e79a84e58886e99a94e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020626f726465722d72696768743a2031707820736f6c696420236461646464393b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce58fb3e9828ae6a186e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'626f726465722d7269676874' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6261636b67726f756e64732d332f2370726f706465662d626f726465722d7269676874' USING utf8mb4),
source_version = CONVERT(X'6373732d6261636b67726f756e64732d3320454420323032352d31322d3136' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3336' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d626f726465722d7269676874' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'626f726465722d7269676874' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d626f726465722d626f74746f6d' USING utf8mb4), CONVERT(X'626f726465722d626f74746f6d' USING utf8mb4), CONVERT(X'e4b88be9828ae6a186' USING utf8mb4), CONVERT(X'e4bba5e7b0a1e5afabe8a8ade5ae9ae4b88be696b9e9828ae6a186e38082' USING utf8mb4), CONVERT(X'e4bba5e7b0a1e5afabe8a8ade5ae9ae4b88be696b9e9828ae6a186e38082e5b8b8e794a8e696bce9a081e7b1a4e5ba95e7b79ae68896e58897e8a1a8e58886e99a94e7b79ae38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020626f726465722d626f74746f6d3a2031707820736f6c696420236461646464393b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce4b88be9828ae6a186e3808de38082' USING utf8mb4), CONVERT(X'626f726465722d626f74746f6d' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6261636b67726f756e64732d332f2370726f706465662d626f726465722d626f74746f6d' USING utf8mb4), CONVERT(X'6373732d6261636b67726f756e64732d3320454420323032352d31322d3136' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3336' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'626f726465722d626f74746f6d' USING utf8mb4),
display_label = CONVERT(X'e4b88be9828ae6a186' USING utf8mb4),
summary = CONVERT(X'e4bba5e7b0a1e5afabe8a8ade5ae9ae4b88be696b9e9828ae6a186e38082' USING utf8mb4),
description = CONVERT(X'e4bba5e7b0a1e5afabe8a8ade5ae9ae4b88be696b9e9828ae6a186e38082e5b8b8e794a8e696bce9a081e7b1a4e5ba95e7b79ae68896e58897e8a1a8e58886e99a94e7b79ae38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020626f726465722d626f74746f6d3a2031707820736f6c696420236461646464393b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce4b88be9828ae6a186e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'626f726465722d626f74746f6d' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6261636b67726f756e64732d332f2370726f706465662d626f726465722d626f74746f6d' USING utf8mb4),
source_version = CONVERT(X'6373732d6261636b67726f756e64732d3320454420323032352d31322d3136' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3336' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d626f726465722d626f74746f6d' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'626f726465722d626f74746f6d' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d626f726465722d6c656674' USING utf8mb4), CONVERT(X'626f726465722d6c656674' USING utf8mb4), CONVERT(X'e5b7a6e9828ae6a186' USING utf8mb4), CONVERT(X'e4bba5e7b0a1e5afabe8a8ade5ae9ae5b7a6e696b9e9828ae6a186e38082' USING utf8mb4), CONVERT(X'e4bba5e7b0a1e5afabe8a8ade5ae9ae5b7a6e696b9e9828ae6a186e38082e58fafe4bd9ce782bae8aaaae6988ee58d80e5a18ae5b7a6e581b4e79a84e8a5afe7b79ae38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020626f726465722d6c6566743a2033707820736f6c696420236335613435343b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5b7a6e9828ae6a186e3808de38082' USING utf8mb4), CONVERT(X'626f726465722d6c656674' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6261636b67726f756e64732d332f2370726f706465662d626f726465722d6c656674' USING utf8mb4), CONVERT(X'6373732d6261636b67726f756e64732d3320454420323032352d31322d3136' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3336' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'626f726465722d6c656674' USING utf8mb4),
display_label = CONVERT(X'e5b7a6e9828ae6a186' USING utf8mb4),
summary = CONVERT(X'e4bba5e7b0a1e5afabe8a8ade5ae9ae5b7a6e696b9e9828ae6a186e38082' USING utf8mb4),
description = CONVERT(X'e4bba5e7b0a1e5afabe8a8ade5ae9ae5b7a6e696b9e9828ae6a186e38082e58fafe4bd9ce782bae8aaaae6988ee58d80e5a18ae5b7a6e581b4e79a84e8a5afe7b79ae38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020626f726465722d6c6566743a2033707820736f6c696420236335613435343b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5b7a6e9828ae6a186e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'626f726465722d6c656674' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6261636b67726f756e64732d332f2370726f706465662d626f726465722d6c656674' USING utf8mb4),
source_version = CONVERT(X'6373732d6261636b67726f756e64732d3320454420323032352d31322d3136' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3336' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d626f726465722d6c656674' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'626f726465722d6c656674' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d626f726465722d726164697573' USING utf8mb4), CONVERT(X'626f726465722d726164697573' USING utf8mb4), CONVERT(X'e9828ae6a186e59c93e8a792' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae79b92e5ad90e59084e5808be8a792e890bde79a84e59c93e8a792e58d8ae5be91e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae79b92e5ad90e59084e5808be8a792e890bde79a84e59c93e8a792e58d8ae5be91e38082e58fafe4bdbfe794a8e995b7e5baa6e68896e799bee58886e6af94efbc9be4b99fe883bde4bba5e6969ce7b79ae58886e588a5e68c87e5ae9ae6b0b4e5b9b3e88887e59e82e79bb4e58d8ae5be91e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020626f726465722d7261646975733a203670783b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce9828ae6a186e59c93e8a792e3808de38082' USING utf8mb4), CONVERT(X'626f726465722d726164697573' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6261636b67726f756e64732d332f2370726f706465662d626f726465722d726164697573' USING utf8mb4), CONVERT(X'6373732d6261636b67726f756e64732d3320454420323032352d31322d3136' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3336' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'626f726465722d726164697573' USING utf8mb4),
display_label = CONVERT(X'e9828ae6a186e59c93e8a792' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae79b92e5ad90e59084e5808be8a792e890bde79a84e59c93e8a792e58d8ae5be91e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae79b92e5ad90e59084e5808be8a792e890bde79a84e59c93e8a792e58d8ae5be91e38082e58fafe4bdbfe794a8e995b7e5baa6e68896e799bee58886e6af94efbc9be4b99fe883bde4bba5e6969ce7b79ae58886e588a5e68c87e5ae9ae6b0b4e5b9b3e88887e59e82e79bb4e58d8ae5be91e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020626f726465722d7261646975733a203670783b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce9828ae6a186e59c93e8a792e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'626f726465722d726164697573' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6261636b67726f756e64732d332f2370726f706465662d626f726465722d726164697573' USING utf8mb4),
source_version = CONVERT(X'6373732d6261636b67726f756e64732d3320454420323032352d31322d3136' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3336' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d626f726465722d726164697573' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'626f726465722d726164697573' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d626f782d736861646f77' USING utf8mb4), CONVERT(X'626f782d736861646f77' USING utf8mb4), CONVERT(X'e79b92e5ad90e999b0e5bdb1' USING utf8mb4), CONVERT(X'e782bae79b92e5ad90e58aa0e585a5e5a496e999b0e5bdb1e68896e585a7e999b0e5bdb1e38082' USING utf8mb4), CONVERT(X'e782bae79b92e5ad90e58aa0e585a5e5a496e999b0e5bdb1e68896e585a7e999b0e5bdb1e38082e58fafe8a8ade5ae9ae5818fe7a7bbe38081e6a8a1e7b38ae38081e693b4e695a3e88887e9a18fe889b2efbc8ce5a49ae5808be999b0e5bdb1e4bba5e98097e8999fe58886e99a94e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020626f782d736861646f773a203020347078203132707820726762283020302030202f20313225293b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce79b92e5ad90e999b0e5bdb1e3808de38082' USING utf8mb4), CONVERT(X'626f782d736861646f77' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6261636b67726f756e64732d332f2370726f706465662d626f782d736861646f77' USING utf8mb4), CONVERT(X'6373732d6261636b67726f756e64732d3320454420323032352d31322d3136' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3336' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'626f782d736861646f77' USING utf8mb4),
display_label = CONVERT(X'e79b92e5ad90e999b0e5bdb1' USING utf8mb4),
summary = CONVERT(X'e782bae79b92e5ad90e58aa0e585a5e5a496e999b0e5bdb1e68896e585a7e999b0e5bdb1e38082' USING utf8mb4),
description = CONVERT(X'e782bae79b92e5ad90e58aa0e585a5e5a496e999b0e5bdb1e68896e585a7e999b0e5bdb1e38082e58fafe8a8ade5ae9ae5818fe7a7bbe38081e6a8a1e7b38ae38081e693b4e695a3e88887e9a18fe889b2efbc8ce5a49ae5808be999b0e5bdb1e4bba5e98097e8999fe58886e99a94e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020626f782d736861646f773a203020347078203132707820726762283020302030202f20313225293b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce79b92e5ad90e999b0e5bdb1e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'626f782d736861646f77' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6261636b67726f756e64732d332f2370726f706465662d626f782d736861646f77' USING utf8mb4),
source_version = CONVERT(X'6373732d6261636b67726f756e64732d3320454420323032352d31322d3136' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3336' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d626f782d736861646f77' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'626f782d736861646f77' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d6f75746c696e65' USING utf8mb4), CONVERT(X'6f75746c696e65' USING utf8mb4), CONVERT(X'e5a496e6a186e7b0a1e5afab' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae4b88de4bd94e794a8e68e92e78988e7a9bae99693e79a84e5a496e6a186e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae4b88de4bd94e794a8e68e92e78988e7a9bae99693e79a84e5a496e6a186e38082e5b8b8e794a8e696bce98db5e79ba4e784a6e9bb9ee68f90e7a4baefbc9be4b88de8a681e59ca8e6b292e69c89e69bbfe4bba3e68f90e7a4bae79a84e68385e6b381e4b88be7a7bbe999a4e784a6e9bb9ee5a496e6a186e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20206f75746c696e653a2032707820736f6c696420233234353435613b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5a496e6a186e7b0a1e5afabe3808de38082' USING utf8mb4), CONVERT(X'6f75746c696e65' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d75692d342f2370726f706465662d6f75746c696e65' USING utf8mb4), CONVERT(X'6373732d75692d3420574420323032362d31302d3135' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3137' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'6f75746c696e65' USING utf8mb4),
display_label = CONVERT(X'e5a496e6a186e7b0a1e5afab' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae4b88de4bd94e794a8e68e92e78988e7a9bae99693e79a84e5a496e6a186e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae4b88de4bd94e794a8e68e92e78988e7a9bae99693e79a84e5a496e6a186e38082e5b8b8e794a8e696bce98db5e79ba4e784a6e9bb9ee68f90e7a4baefbc9be4b88de8a681e59ca8e6b292e69c89e69bbfe4bba3e68f90e7a4bae79a84e68385e6b381e4b88be7a7bbe999a4e784a6e9bb9ee5a496e6a186e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20206f75746c696e653a2032707820736f6c696420233234353435613b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5a496e6a186e7b0a1e5afabe3808de38082' USING utf8mb4),
sort_key = CONVERT(X'6f75746c696e65' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d75692d342f2370726f706465662d6f75746c696e65' USING utf8mb4),
source_version = CONVERT(X'6373732d75692d3420574420323032362d31302d3135' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3137' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d6f75746c696e65' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'6f75746c696e65' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d6f75746c696e652d6f6666736574' USING utf8mb4), CONVERT(X'6f75746c696e652d6f6666736574' USING utf8mb4), CONVERT(X'e5a496e6a186e5818fe7a7bb' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae5a496e6a186e88887e9828ae6a186e9828ae7b7a3e4b98be99693e79a84e8b79de99ba2e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae5a496e6a186e88887e9828ae6a186e9828ae7b7a3e4b98be99693e79a84e8b79de99ba2e38082e58fafe8ae93e98db5e79ba4e784a6e9bb9ee68f90e7a4bae88887e58583e7b4a0e69cace8baabe4bf9de79599e99693e99a94e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20206f75746c696e652d6f66667365743a203370783b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5a496e6a186e5818fe7a7bbe3808de38082' USING utf8mb4), CONVERT(X'6f75746c696e652d6f6666736574' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d75692d342f2370726f706465662d6f75746c696e652d6f6666736574' USING utf8mb4), CONVERT(X'6373732d75692d3420574420323032362d31302d3135' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3137' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'6f75746c696e652d6f6666736574' USING utf8mb4),
display_label = CONVERT(X'e5a496e6a186e5818fe7a7bb' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae5a496e6a186e88887e9828ae6a186e9828ae7b7a3e4b98be99693e79a84e8b79de99ba2e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae5a496e6a186e88887e9828ae6a186e9828ae7b7a3e4b98be99693e79a84e8b79de99ba2e38082e58fafe8ae93e98db5e79ba4e784a6e9bb9ee68f90e7a4bae88887e58583e7b4a0e69cace8baabe4bf9de79599e99693e99a94e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20206f75746c696e652d6f66667365743a203370783b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5a496e6a186e5818fe7a7bbe3808de38082' USING utf8mb4),
sort_key = CONVERT(X'6f75746c696e652d6f6666736574' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d75692d342f2370726f706465662d6f75746c696e652d6f6666736574' USING utf8mb4),
source_version = CONVERT(X'6373732d75692d3420574420323032362d31302d3135' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3137' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d6f75746c696e652d6f6666736574' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'6f75746c696e652d6f6666736574' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d666f6e742d66616d696c79' USING utf8mb4), CONVERT(X'666f6e742d66616d696c79' USING utf8mb4), CONVERT(X'e5ad97e59e8be5aeb6e6978f' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae69687e5ad97e4bdbfe794a8e79a84e5ad97e59e8be88887e5be8ce58299e5ad97e59e8be9a086e5ba8fe38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae69687e5ad97e4bdbfe794a8e79a84e5ad97e59e8be88887e5be8ce58299e5ad97e59e8be9a086e5ba8fe38082e7808fe8a6bde599a8e4be9de58fafe794a8e5ad97e59e8be58f8ae5ad97e58583e694afe68fb4e68385e6b381e981b8e69387efbc9be9809ae5b8b8e59ca8e69c80e5be8ce68f90e4be9be9809ae794a8e5ad97e59e8be5aeb6e6978fe38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020666f6e742d66616d696c793a20417269616c2c20224d6963726f736f6674204a68656e67486569222c2073616e732d73657269663b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5ad97e59e8be5aeb6e6978fe3808de38082' USING utf8mb4), CONVERT(X'666f6e742d66616d696c79' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d666f6e74732d342f2370726f706465662d666f6e742d66616d696c79' USING utf8mb4), CONVERT(X'6373732d666f6e74732d3420454420323032362d31312d3132' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3330' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'666f6e742d66616d696c79' USING utf8mb4),
display_label = CONVERT(X'e5ad97e59e8be5aeb6e6978f' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae69687e5ad97e4bdbfe794a8e79a84e5ad97e59e8be88887e5be8ce58299e5ad97e59e8be9a086e5ba8fe38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae69687e5ad97e4bdbfe794a8e79a84e5ad97e59e8be88887e5be8ce58299e5ad97e59e8be9a086e5ba8fe38082e7808fe8a6bde599a8e4be9de58fafe794a8e5ad97e59e8be58f8ae5ad97e58583e694afe68fb4e68385e6b381e981b8e69387efbc9be9809ae5b8b8e59ca8e69c80e5be8ce68f90e4be9be9809ae794a8e5ad97e59e8be5aeb6e6978fe38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020666f6e742d66616d696c793a20417269616c2c20224d6963726f736f6674204a68656e67486569222c2073616e732d73657269663b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5ad97e59e8be5aeb6e6978fe3808de38082' USING utf8mb4),
sort_key = CONVERT(X'666f6e742d66616d696c79' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d666f6e74732d342f2370726f706465662d666f6e742d66616d696c79' USING utf8mb4),
source_version = CONVERT(X'6373732d666f6e74732d3420454420323032362d31312d3132' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3330' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d666f6e742d66616d696c79' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'666f6e742d66616d696c79' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d666f6e742d73697a65' USING utf8mb4), CONVERT(X'666f6e742d73697a65' USING utf8mb4), CONVERT(X'e5ad97e9ab94e5a4a7e5b08f' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae5ad97e9ab94e79a84e5a4a7e5b08fe38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae5ad97e9ab94e79a84e5a4a7e5b08fe38082e58fafe4bdbfe794a8207078e3808172656de38081e799bee58886e6af94e7ad89e596aee4bd8defbc8ce5afa6e99a9be9a1afe7a4bae4b99fe58f97e5ad97e59e8be69cace8baabe5bdb1e99fbfe38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020666f6e742d73697a653a20313670783b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5ad97e9ab94e5a4a7e5b08fe3808de38082' USING utf8mb4), CONVERT(X'666f6e742d73697a65' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d666f6e74732d342f2370726f706465662d666f6e742d73697a65' USING utf8mb4), CONVERT(X'6373732d666f6e74732d3420454420323032362d31312d3132' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3330' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'666f6e742d73697a65' USING utf8mb4),
display_label = CONVERT(X'e5ad97e9ab94e5a4a7e5b08f' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae5ad97e9ab94e79a84e5a4a7e5b08fe38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae5ad97e9ab94e79a84e5a4a7e5b08fe38082e58fafe4bdbfe794a8207078e3808172656de38081e799bee58886e6af94e7ad89e596aee4bd8defbc8ce5afa6e99a9be9a1afe7a4bae4b99fe58f97e5ad97e59e8be69cace8baabe5bdb1e99fbfe38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020666f6e742d73697a653a20313670783b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5ad97e9ab94e5a4a7e5b08fe3808de38082' USING utf8mb4),
sort_key = CONVERT(X'666f6e742d73697a65' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d666f6e74732d342f2370726f706465662d666f6e742d73697a65' USING utf8mb4),
source_version = CONVERT(X'6373732d666f6e74732d3420454420323032362d31312d3132' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3330' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d666f6e742d73697a65' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'666f6e742d73697a65' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d666f6e742d776569676874' USING utf8mb4), CONVERT(X'666f6e742d776569676874' USING utf8mb4), CONVERT(X'e5ad97e9ab94e7b297e7b4b0' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae5ad97e9ab94e79a84e7b297e7b4b0e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae5ad97e9ab94e79a84e7b297e7b4b0e38082e58fafe4bdbfe794a8206e6f726d616ce38081626f6c6420e68896e695b8e580bcefbc9be58fafe794a8e7b297e7b4b0e58f96e6b1bae696bce5ad97e59e8be68f90e4be9be79a84e5ad97e9878de38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020666f6e742d7765696768743a203730303b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5ad97e9ab94e7b297e7b4b0e3808de38082' USING utf8mb4), CONVERT(X'666f6e742d776569676874' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d666f6e74732d342f2370726f706465662d666f6e742d776569676874' USING utf8mb4), CONVERT(X'6373732d666f6e74732d3420454420323032362d31312d3132' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3330' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'666f6e742d776569676874' USING utf8mb4),
display_label = CONVERT(X'e5ad97e9ab94e7b297e7b4b0' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae5ad97e9ab94e79a84e7b297e7b4b0e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae5ad97e9ab94e79a84e7b297e7b4b0e38082e58fafe4bdbfe794a8206e6f726d616ce38081626f6c6420e68896e695b8e580bcefbc9be58fafe794a8e7b297e7b4b0e58f96e6b1bae696bce5ad97e59e8be68f90e4be9be79a84e5ad97e9878de38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020666f6e742d7765696768743a203730303b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5ad97e9ab94e7b297e7b4b0e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'666f6e742d776569676874' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d666f6e74732d342f2370726f706465662d666f6e742d776569676874' USING utf8mb4),
source_version = CONVERT(X'6373732d666f6e74732d3420454420323032362d31312d3132' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3330' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d666f6e742d776569676874' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'666f6e742d776569676874' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d666f6e742d7374796c65' USING utf8mb4), CONVERT(X'666f6e742d7374796c65' USING utf8mb4), CONVERT(X'e5ad97e9ab94e6a8a3e5bc8f' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae4b880e888ace38081e6969ce9ab94e68896e582bee6969ce5ad97e9ab94e6a8a3e5bc8fe38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae4b880e888ace38081e6969ce9ab94e68896e582bee6969ce5ad97e9ab94e6a8a3e5bc8fe380826974616c696320e88887206f626c6971756520e79a84e5ad97e59e8be981b8e794a8e58f8ae582bee6969ce696b9e5bc8fe4b88de5908ce38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020666f6e742d7374796c653a206974616c69633b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5ad97e9ab94e6a8a3e5bc8fe3808de38082' USING utf8mb4), CONVERT(X'666f6e742d7374796c65' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d666f6e74732d342f2370726f706465662d666f6e742d7374796c65' USING utf8mb4), CONVERT(X'6373732d666f6e74732d3420454420323032362d31312d3132' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3330' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'666f6e742d7374796c65' USING utf8mb4),
display_label = CONVERT(X'e5ad97e9ab94e6a8a3e5bc8f' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae4b880e888ace38081e6969ce9ab94e68896e582bee6969ce5ad97e9ab94e6a8a3e5bc8fe38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae4b880e888ace38081e6969ce9ab94e68896e582bee6969ce5ad97e9ab94e6a8a3e5bc8fe380826974616c696320e88887206f626c6971756520e79a84e5ad97e59e8be981b8e794a8e58f8ae582bee6969ce696b9e5bc8fe4b88de5908ce38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020666f6e742d7374796c653a206974616c69633b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5ad97e9ab94e6a8a3e5bc8fe3808de38082' USING utf8mb4),
sort_key = CONVERT(X'666f6e742d7374796c65' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d666f6e74732d342f2370726f706465662d666f6e742d7374796c65' USING utf8mb4),
source_version = CONVERT(X'6373732d666f6e74732d3420454420323032362d31312d3132' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3330' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d666f6e742d7374796c65' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'666f6e742d7374796c65' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d6c696e652d686569676874' USING utf8mb4), CONVERT(X'6c696e652d686569676874' USING utf8mb4), CONVERT(X'e8a18ce9ab98' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae69687e5ad97e8a18ce6a186e79a84e9ab98e5baa6e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae69687e5ad97e8a18ce6a186e79a84e9ab98e5baa6e38082e784a1e596aee4bd8de695b8e580bce69c83e4be9de58583e7b4a0e5ad97e9ab94e5a4a7e5b08fe8a888e7ae97efbc8ce5b8b8e794a8e696bce58fafe7b9bce689bfe79a84e996b1e8ae80e8a18ce8b79de38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20206c696e652d6865696768743a20312e383b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8a18ce9ab98e3808de38082' USING utf8mb4), CONVERT(X'6c696e652d686569676874' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d696e6c696e652d332f2370726f706465662d6c696e652d686569676874' USING utf8mb4), CONVERT(X'6373732d696e6c696e652d3320454420323032362d31302d3134' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3232' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'6c696e652d686569676874' USING utf8mb4),
display_label = CONVERT(X'e8a18ce9ab98' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae69687e5ad97e8a18ce6a186e79a84e9ab98e5baa6e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae69687e5ad97e8a18ce6a186e79a84e9ab98e5baa6e38082e784a1e596aee4bd8de695b8e580bce69c83e4be9de58583e7b4a0e5ad97e9ab94e5a4a7e5b08fe8a888e7ae97efbc8ce5b8b8e794a8e696bce58fafe7b9bce689bfe79a84e996b1e8ae80e8a18ce8b79de38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20206c696e652d6865696768743a20312e383b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8a18ce9ab98e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'6c696e652d686569676874' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d696e6c696e652d332f2370726f706465662d6c696e652d686569676874' USING utf8mb4),
source_version = CONVERT(X'6373732d696e6c696e652d3320454420323032362d31302d3134' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3232' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d6c696e652d686569676874' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'6c696e652d686569676874' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d6c65747465722d73706163696e67' USING utf8mb4), CONVERT(X'6c65747465722d73706163696e67' USING utf8mb4), CONVERT(X'e5ad97e58583e99693e8b79d' USING utf8mb4), CONVERT(X'e8aabfe695b4e79bb8e984b0e69687e5ad97e5ad97e58583e4b98be99693e79a84e9a18de5a496e99693e8b79de38082' USING utf8mb4), CONVERT(X'e8aabfe695b4e79bb8e984b0e69687e5ad97e5ad97e58583e4b98be99693e79a84e9a18de5a496e99693e8b79de38082e58fafe4bdbfe794a8206e6f726d616c20e68896e995b7e5baa6e580bcefbc8ce5afa6e99a9be69588e69e9ce69c83e9858de59088e69687e5ad97e5a191e5bda2e8a68fe58987e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20206c65747465722d73706163696e673a20302e3035656d3b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5ad97e58583e99693e8b79de3808de38082' USING utf8mb4), CONVERT(X'6c65747465722d73706163696e67' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d746578742d342f2370726f706465662d6c65747465722d73706163696e67' USING utf8mb4), CONVERT(X'6373732d746578742d3420454420323032362d31302d3236' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3338' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'6c65747465722d73706163696e67' USING utf8mb4),
display_label = CONVERT(X'e5ad97e58583e99693e8b79d' USING utf8mb4),
summary = CONVERT(X'e8aabfe695b4e79bb8e984b0e69687e5ad97e5ad97e58583e4b98be99693e79a84e9a18de5a496e99693e8b79de38082' USING utf8mb4),
description = CONVERT(X'e8aabfe695b4e79bb8e984b0e69687e5ad97e5ad97e58583e4b98be99693e79a84e9a18de5a496e99693e8b79de38082e58fafe4bdbfe794a8206e6f726d616c20e68896e995b7e5baa6e580bcefbc8ce5afa6e99a9be69588e69e9ce69c83e9858de59088e69687e5ad97e5a191e5bda2e8a68fe58987e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20206c65747465722d73706163696e673a20302e3035656d3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5ad97e58583e99693e8b79de3808de38082' USING utf8mb4),
sort_key = CONVERT(X'6c65747465722d73706163696e67' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d746578742d342f2370726f706465662d6c65747465722d73706163696e67' USING utf8mb4),
source_version = CONVERT(X'6373732d746578742d3420454420323032362d31302d3236' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3338' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d6c65747465722d73706163696e67' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'6c65747465722d73706163696e67' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d746578742d616c69676e' USING utf8mb4), CONVERT(X'746578742d616c69676e' USING utf8mb4), CONVERT(X'e69687e5ad97e6b0b4e5b9b3e5b08de9bd8a' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58d80e5a18ae585a7e8a18ce585a7e585a7e5aeb9e79a84e6b0b4e5b9b3e5b08de9bd8ae696b9e5bc8fe38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58d80e5a18ae585a7e8a18ce585a7e585a7e5aeb9e79a84e6b0b4e5b9b3e5b08de9bd8ae696b9e5bc8fe38082e5ae83e4b88de69c83e68a8ae58d80e5a18ae58583e7b4a0e69cace8baabe7a7bbe588b0e788b6e5aeb9e599a8e4b8ade5a4aee38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020746578742d616c69676e3a2063656e7465723b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce69687e5ad97e6b0b4e5b9b3e5b08de9bd8ae3808de38082' USING utf8mb4), CONVERT(X'746578742d616c69676e' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d746578742d342f2370726f706465662d746578742d616c69676e' USING utf8mb4), CONVERT(X'6373732d746578742d3420454420323032362d31302d3236' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3338' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'746578742d616c69676e' USING utf8mb4),
display_label = CONVERT(X'e69687e5ad97e6b0b4e5b9b3e5b08de9bd8a' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae58d80e5a18ae585a7e8a18ce585a7e585a7e5aeb9e79a84e6b0b4e5b9b3e5b08de9bd8ae696b9e5bc8fe38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae58d80e5a18ae585a7e8a18ce585a7e585a7e5aeb9e79a84e6b0b4e5b9b3e5b08de9bd8ae696b9e5bc8fe38082e5ae83e4b88de69c83e68a8ae58d80e5a18ae58583e7b4a0e69cace8baabe7a7bbe588b0e788b6e5aeb9e599a8e4b8ade5a4aee38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020746578742d616c69676e3a2063656e7465723b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce69687e5ad97e6b0b4e5b9b3e5b08de9bd8ae3808de38082' USING utf8mb4),
sort_key = CONVERT(X'746578742d616c69676e' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d746578742d342f2370726f706465662d746578742d616c69676e' USING utf8mb4),
source_version = CONVERT(X'6373732d746578742d3420454420323032362d31302d3236' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3338' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d746578742d616c69676e' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'746578742d616c69676e' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d746578742d6465636f726174696f6e' USING utf8mb4), CONVERT(X'746578742d6465636f726174696f6e' USING utf8mb4), CONVERT(X'e69687e5ad97e8a39de9a3bee7b0a1e5afab' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae5ba95e7b79ae38081e588aae999a4e7b79ae7ad89e69687e5ad97e8a39de9a3bee38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae5ba95e7b79ae38081e588aae999a4e7b79ae7ad89e69687e5ad97e8a39de9a3bee38082e58fafe690ade9858de7b79ae6a29de6a8a3e5bc8fe38081e9a18fe889b2e88887e7b297e7b4b0e7ad89e8a8ade5ae9ae38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020746578742d6465636f726174696f6e3a20756e6465726c696e653b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce69687e5ad97e8a39de9a3bee7b0a1e5afabe3808de38082' USING utf8mb4), CONVERT(X'746578742d6465636f726174696f6e' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d746578742d6465636f722d342f2370726f706465662d746578742d6465636f726174696f6e' USING utf8mb4), CONVERT(X'6373732d746578742d6465636f722d3420454420323032362d30382d3137' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3037' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'746578742d6465636f726174696f6e' USING utf8mb4),
display_label = CONVERT(X'e69687e5ad97e8a39de9a3bee7b0a1e5afab' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae5ba95e7b79ae38081e588aae999a4e7b79ae7ad89e69687e5ad97e8a39de9a3bee38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae5ba95e7b79ae38081e588aae999a4e7b79ae7ad89e69687e5ad97e8a39de9a3bee38082e58fafe690ade9858de7b79ae6a29de6a8a3e5bc8fe38081e9a18fe889b2e88887e7b297e7b4b0e7ad89e8a8ade5ae9ae38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020746578742d6465636f726174696f6e3a20756e6465726c696e653b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce69687e5ad97e8a39de9a3bee7b0a1e5afabe3808de38082' USING utf8mb4),
sort_key = CONVERT(X'746578742d6465636f726174696f6e' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d746578742d6465636f722d342f2370726f706465662d746578742d6465636f726174696f6e' USING utf8mb4),
source_version = CONVERT(X'6373732d746578742d6465636f722d3420454420323032362d30382d3137' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3037' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d746578742d6465636f726174696f6e' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'746578742d6465636f726174696f6e' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d746578742d756e6465726c696e652d6f6666736574' USING utf8mb4), CONVERT(X'746578742d756e6465726c696e652d6f6666736574' USING utf8mb4), CONVERT(X'e69687e5ad97e5ba95e7b79ae5818fe7a7bb' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae69687e5ad97e5ba95e7b79ae88887e69687e5ad97e4b98be99693e79a84e5818fe7a7bbe8b79de99ba2e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae69687e5ad97e5ba95e7b79ae88887e69687e5ad97e4b98be99693e79a84e5818fe7a7bbe8b79de99ba2e38082e981a9e59088e5beaee8aabfe980a3e7b590e5ba95e7b79ae79a84e8a696e8a6bae99693e99a94e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020746578742d756e6465726c696e652d6f66667365743a203370783b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce69687e5ad97e5ba95e7b79ae5818fe7a7bbe3808de38082' USING utf8mb4), CONVERT(X'746578742d756e6465726c696e652d6f6666736574' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d746578742d6465636f722d342f2370726f706465662d746578742d756e6465726c696e652d6f6666736574' USING utf8mb4), CONVERT(X'6373732d746578742d6465636f722d3420454420323032362d30382d3137' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3037' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'746578742d756e6465726c696e652d6f6666736574' USING utf8mb4),
display_label = CONVERT(X'e69687e5ad97e5ba95e7b79ae5818fe7a7bb' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae69687e5ad97e5ba95e7b79ae88887e69687e5ad97e4b98be99693e79a84e5818fe7a7bbe8b79de99ba2e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae69687e5ad97e5ba95e7b79ae88887e69687e5ad97e4b98be99693e79a84e5818fe7a7bbe8b79de99ba2e38082e981a9e59088e5beaee8aabfe980a3e7b590e5ba95e7b79ae79a84e8a696e8a6bae99693e99a94e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020746578742d756e6465726c696e652d6f66667365743a203370783b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce69687e5ad97e5ba95e7b79ae5818fe7a7bbe3808de38082' USING utf8mb4),
sort_key = CONVERT(X'746578742d756e6465726c696e652d6f6666736574' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d746578742d6465636f722d342f2370726f706465662d746578742d756e6465726c696e652d6f6666736574' USING utf8mb4),
source_version = CONVERT(X'6373732d746578742d6465636f722d3420454420323032362d30382d3137' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3037' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d746578742d756e6465726c696e652d6f6666736574' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'746578742d756e6465726c696e652d6f6666736574' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d746578742d7472616e73666f726d' USING utf8mb4), CONVERT(X'746578742d7472616e73666f726d' USING utf8mb4), CONVERT(X'e69687e5ad97e5a4a7e5b08fe5afabe8bd89e68f9b' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae69687e5ad97e59188e78fbee69982e79a84e5a4a7e5b08fe5afabe8bd89e68f9be38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae69687e5ad97e59188e78fbee69982e79a84e5a4a7e5b08fe5afabe8bd89e68f9be38082e4b88de69c83e4bfaee694b9e58e9fe5a78be69687e5ad97e8b387e69699efbc8ce8bd89e68f9be696b9e5bc8fe4b99fe58fafe883bde58f97e8aa9ee8a880e5bdb1e99fbfe38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020746578742d7472616e73666f726d3a207570706572636173653b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce69687e5ad97e5a4a7e5b08fe5afabe8bd89e68f9be3808de38082' USING utf8mb4), CONVERT(X'746578742d7472616e73666f726d' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d746578742d342f2370726f706465662d746578742d7472616e73666f726d' USING utf8mb4), CONVERT(X'6373732d746578742d3420454420323032362d31302d3236' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3338' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'746578742d7472616e73666f726d' USING utf8mb4),
display_label = CONVERT(X'e69687e5ad97e5a4a7e5b08fe5afabe8bd89e68f9b' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae69687e5ad97e59188e78fbee69982e79a84e5a4a7e5b08fe5afabe8bd89e68f9be38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae69687e5ad97e59188e78fbee69982e79a84e5a4a7e5b08fe5afabe8bd89e68f9be38082e4b88de69c83e4bfaee694b9e58e9fe5a78be69687e5ad97e8b387e69699efbc8ce8bd89e68f9be696b9e5bc8fe4b99fe58fafe883bde58f97e8aa9ee8a880e5bdb1e99fbfe38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020746578742d7472616e73666f726d3a207570706572636173653b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce69687e5ad97e5a4a7e5b08fe5afabe8bd89e68f9be3808de38082' USING utf8mb4),
sort_key = CONVERT(X'746578742d7472616e73666f726d' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d746578742d342f2370726f706465662d746578742d7472616e73666f726d' USING utf8mb4),
source_version = CONVERT(X'6373732d746578742d3420454420323032362d31302d3236' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3338' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d746578742d7472616e73666f726d' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'746578742d7472616e73666f726d' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d746578742d696e64656e74' USING utf8mb4), CONVERT(X'746578742d696e64656e74' USING utf8mb4), CONVERT(X'e9a696e8a18ce7b8aee68e92' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58d80e5a18ae9a696e8a18ce69687e5ad97e79a84e7b8aee68e92e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58d80e5a18ae9a696e8a18ce69687e5ad97e79a84e7b8aee68e92e38082e4b880e888ace794a8e696bce6aeb5e890bde9a696e8a18cefbc8ce4b88de7ad89e5908ce696bce8aabfe695b4e695b4e5808be58d80e5a18ae79a84e585a7e9828ae8b79de38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020746578742d696e64656e743a2032656d3b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce9a696e8a18ce7b8aee68e92e3808de38082' USING utf8mb4), CONVERT(X'746578742d696e64656e74' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d746578742d342f2370726f706465662d746578742d696e64656e74' USING utf8mb4), CONVERT(X'6373732d746578742d3420454420323032362d31302d3236' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3338' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'746578742d696e64656e74' USING utf8mb4),
display_label = CONVERT(X'e9a696e8a18ce7b8aee68e92' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae58d80e5a18ae9a696e8a18ce69687e5ad97e79a84e7b8aee68e92e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae58d80e5a18ae9a696e8a18ce69687e5ad97e79a84e7b8aee68e92e38082e4b880e888ace794a8e696bce6aeb5e890bde9a696e8a18cefbc8ce4b88de7ad89e5908ce696bce8aabfe695b4e695b4e5808be58d80e5a18ae79a84e585a7e9828ae8b79de38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020746578742d696e64656e743a2032656d3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce9a696e8a18ce7b8aee68e92e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'746578742d696e64656e74' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d746578742d342f2370726f706465662d746578742d696e64656e74' USING utf8mb4),
source_version = CONVERT(X'6373732d746578742d3420454420323032362d31302d3236' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3338' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d746578742d696e64656e74' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'746578742d696e64656e74' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d746578742d6f766572666c6f77' USING utf8mb4), CONVERT(X'746578742d6f766572666c6f77' USING utf8mb4), CONVERT(X'e69687e5ad97e6baa2e587bae68f90e7a4ba' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae8a2abe8a381e58887e79a84e8a18ce585a7e6baa2e587bae585a7e5aeb9e5a682e4bd95e68f90e7a4bae38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae8a2abe8a381e58887e79a84e8a18ce585a7e6baa2e587bae585a7e5aeb9e5a682e4bd95e68f90e7a4bae38082656c6c697073697320e5b8b8e690ade9858de58f97e99990e5aface5baa6e380816f766572666c6f7720e888872077686974652d737061636520e8a3bde4bd9ce79c81e795a5e8999fe38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020746578742d6f766572666c6f773a20656c6c69707369733b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce69687e5ad97e6baa2e587bae68f90e7a4bae3808de38082' USING utf8mb4), CONVERT(X'746578742d6f766572666c6f77' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6f766572666c6f772d342f2370726f706465662d746578742d6f766572666c6f77' USING utf8mb4), CONVERT(X'6373732d6f766572666c6f772d3420454420323032362d31312d3132' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3230' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'746578742d6f766572666c6f77' USING utf8mb4),
display_label = CONVERT(X'e69687e5ad97e6baa2e587bae68f90e7a4ba' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae8a2abe8a381e58887e79a84e8a18ce585a7e6baa2e587bae585a7e5aeb9e5a682e4bd95e68f90e7a4bae38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae8a2abe8a381e58887e79a84e8a18ce585a7e6baa2e587bae585a7e5aeb9e5a682e4bd95e68f90e7a4bae38082656c6c697073697320e5b8b8e690ade9858de58f97e99990e5aface5baa6e380816f766572666c6f7720e888872077686974652d737061636520e8a3bde4bd9ce79c81e795a5e8999fe38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020746578742d6f766572666c6f773a20656c6c69707369733b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce69687e5ad97e6baa2e587bae68f90e7a4bae3808de38082' USING utf8mb4),
sort_key = CONVERT(X'746578742d6f766572666c6f77' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6f766572666c6f772d342f2370726f706465662d746578742d6f766572666c6f77' USING utf8mb4),
source_version = CONVERT(X'6373732d6f766572666c6f772d3420454420323032362d31312d3132' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3230' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d746578742d6f766572666c6f77' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'746578742d6f766572666c6f77' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d77686974652d7370616365' USING utf8mb4), CONVERT(X'77686974652d7370616365' USING utf8mb4), CONVERT(X'e7a9bae799bde88887e68f9be8a18ce89995e79086' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae69687e5ad97e4b8ade7a9bae799bde88887e68f9be8a18ce79a84e89995e79086e696b9e5bc8fe38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae69687e5ad97e4b8ade7a9bae799bde88887e68f9be8a18ce79a84e89995e79086e696b9e5bc8fe38082e4be8be5a682206e6f7772617020e4b88de887aae58b95e68f9be8a18cefbc8c7072652d7772617020e69c83e4bf9de79599e7a9bae799bde4b8a6e58581e8a8b1e68f9be8a18ce38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a202077686974652d73706163653a207072652d777261703b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce7a9bae799bde88887e68f9be8a18ce89995e79086e3808de38082' USING utf8mb4), CONVERT(X'77686974652d7370616365' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d746578742d342f2370726f706465662d77686974652d7370616365' USING utf8mb4), CONVERT(X'6373732d746578742d3420454420323032362d31302d3236' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3338' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'77686974652d7370616365' USING utf8mb4),
display_label = CONVERT(X'e7a9bae799bde88887e68f9be8a18ce89995e79086' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae69687e5ad97e4b8ade7a9bae799bde88887e68f9be8a18ce79a84e89995e79086e696b9e5bc8fe38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae69687e5ad97e4b8ade7a9bae799bde88887e68f9be8a18ce79a84e89995e79086e696b9e5bc8fe38082e4be8be5a682206e6f7772617020e4b88de887aae58b95e68f9be8a18cefbc8c7072652d7772617020e69c83e4bf9de79599e7a9bae799bde4b8a6e58581e8a8b1e68f9be8a18ce38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a202077686974652d73706163653a207072652d777261703b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce7a9bae799bde88887e68f9be8a18ce89995e79086e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'77686974652d7370616365' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d746578742d342f2370726f706465662d77686974652d7370616365' USING utf8mb4),
source_version = CONVERT(X'6373732d746578742d3420454420323032362d31302d3236' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3338' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d77686974652d7370616365' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'77686974652d7370616365' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d6f766572666c6f772d77726170' USING utf8mb4), CONVERT(X'6f766572666c6f772d77726170' USING utf8mb4), CONVERT(X'e995b7e5ad97e4b8b2e68f9be8a18c' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae4b88de58fafe696b7e8a18ce79a84e995b7e5ad97e4b8b2e698afe590a6e58fafe59ca8e5bf85e8a681e69982e68f9be8a18ce38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae4b88de58fafe696b7e8a18ce79a84e995b7e5ad97e4b8b2e698afe590a6e58fafe59ca8e5bf85e8a681e69982e68f9be8a18ce38082616e79776865726520e981a9e59088e981bfe5858de995b7e7b6b2e59d80e7ad89e585a7e5aeb9e69290e9968be5aeb9e599a8e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20206f766572666c6f772d777261703a20616e7977686572653b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce995b7e5ad97e4b8b2e68f9be8a18ce3808de38082' USING utf8mb4), CONVERT(X'6f766572666c6f772d77726170' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d746578742d342f2370726f706465662d6f766572666c6f772d77726170' USING utf8mb4), CONVERT(X'6373732d746578742d3420454420323032362d31302d3236' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3338' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'6f766572666c6f772d77726170' USING utf8mb4),
display_label = CONVERT(X'e995b7e5ad97e4b8b2e68f9be8a18c' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae4b88de58fafe696b7e8a18ce79a84e995b7e5ad97e4b8b2e698afe590a6e58fafe59ca8e5bf85e8a681e69982e68f9be8a18ce38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae4b88de58fafe696b7e8a18ce79a84e995b7e5ad97e4b8b2e698afe590a6e58fafe59ca8e5bf85e8a681e69982e68f9be8a18ce38082616e79776865726520e981a9e59088e981bfe5858de995b7e7b6b2e59d80e7ad89e585a7e5aeb9e69290e9968be5aeb9e599a8e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20206f766572666c6f772d777261703a20616e7977686572653b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce995b7e5ad97e4b8b2e68f9be8a18ce3808de38082' USING utf8mb4),
sort_key = CONVERT(X'6f766572666c6f772d77726170' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d746578742d342f2370726f706465662d6f766572666c6f772d77726170' USING utf8mb4),
source_version = CONVERT(X'6373732d746578742d3420454420323032362d31302d3236' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3338' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d6f766572666c6f772d77726170' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'6f766572666c6f772d77726170' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d776f72642d627265616b' USING utf8mb4), CONVERT(X'776f72642d627265616b' USING utf8mb4), CONVERT(X'e596aee5ad97e696b7e8a18ce696b9e5bc8f' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae69687e5ad97e68f9be8a18ce69982e79a84e696b7e8a18ce8a68fe58987e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae69687e5ad97e68f9be8a18ce69982e79a84e696b7e8a18ce8a68fe58987e38082627265616b2d616c6c20e58fafe883bde59ca8e4b880e888ace596aee5ad97e4b8ade99693e696b7e8a18cefbc8ce4bdbfe794a8e69982e99c80e88083e685aee996b1e8ae80e680a7e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020776f72642d627265616b3a206e6f726d616c3b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce596aee5ad97e696b7e8a18ce696b9e5bc8fe3808de38082' USING utf8mb4), CONVERT(X'776f72642d627265616b' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d746578742d342f2370726f706465662d776f72642d627265616b' USING utf8mb4), CONVERT(X'6373732d746578742d3420454420323032362d31302d3236' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3338' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'776f72642d627265616b' USING utf8mb4),
display_label = CONVERT(X'e596aee5ad97e696b7e8a18ce696b9e5bc8f' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae69687e5ad97e68f9be8a18ce69982e79a84e696b7e8a18ce8a68fe58987e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae69687e5ad97e68f9be8a18ce69982e79a84e696b7e8a18ce8a68fe58987e38082627265616b2d616c6c20e58fafe883bde59ca8e4b880e888ace596aee5ad97e4b8ade99693e696b7e8a18cefbc8ce4bdbfe794a8e69982e99c80e88083e685aee996b1e8ae80e680a7e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020776f72642d627265616b3a206e6f726d616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce596aee5ad97e696b7e8a18ce696b9e5bc8fe3808de38082' USING utf8mb4),
sort_key = CONVERT(X'776f72642d627265616b' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d746578742d342f2370726f706465662d776f72642d627265616b' USING utf8mb4),
source_version = CONVERT(X'6373732d746578742d3420454420323032362d31302d3236' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3338' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d776f72642d627265616b' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'776f72642d627265616b' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d766572746963616c2d616c69676e' USING utf8mb4), CONVERT(X'766572746963616c2d616c69676e' USING utf8mb4), CONVERT(X'e8a18ce585a7e59e82e79bb4e5b08de9bd8a' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae8a18ce585a7e5b1a4e7b49ae68896e8a1a8e6a0bce584b2e5ad98e6a0bce585a7e5aeb9e79a84e59e82e79bb4e5b08de9bd8ae38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae8a18ce585a7e5b1a4e7b49ae68896e8a1a8e6a0bce584b2e5ad98e6a0bce585a7e5aeb9e79a84e59e82e79bb4e5b08de9bd8ae38082e5ae83e4b88de698afe4b880e888ace58d80e5a18ae58583e7b4a0e79a84e9809ae794a8e59e82e79bb4e7bdaee4b8ade696b9e5bc8fe38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020766572746963616c2d616c69676e3a206d6964646c653b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8a18ce585a7e59e82e79bb4e5b08de9bd8ae3808de38082' USING utf8mb4), CONVERT(X'766572746963616c2d616c69676e' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d696e6c696e652d332f2370726f706465662d766572746963616c2d616c69676e' USING utf8mb4), CONVERT(X'6373732d696e6c696e652d3320454420323032362d31302d3134' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3232' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'766572746963616c2d616c69676e' USING utf8mb4),
display_label = CONVERT(X'e8a18ce585a7e59e82e79bb4e5b08de9bd8a' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae8a18ce585a7e5b1a4e7b49ae68896e8a1a8e6a0bce584b2e5ad98e6a0bce585a7e5aeb9e79a84e59e82e79bb4e5b08de9bd8ae38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae8a18ce585a7e5b1a4e7b49ae68896e8a1a8e6a0bce584b2e5ad98e6a0bce585a7e5aeb9e79a84e59e82e79bb4e5b08de9bd8ae38082e5ae83e4b88de698afe4b880e888ace58d80e5a18ae58583e7b4a0e79a84e9809ae794a8e59e82e79bb4e7bdaee4b8ade696b9e5bc8fe38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020766572746963616c2d616c69676e3a206d6964646c653b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8a18ce585a7e59e82e79bb4e5b08de9bd8ae3808de38082' USING utf8mb4),
sort_key = CONVERT(X'766572746963616c2d616c69676e' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d696e6c696e652d332f2370726f706465662d766572746963616c2d616c69676e' USING utf8mb4),
source_version = CONVERT(X'6373732d696e6c696e652d3320454420323032362d31302d3134' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3232' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d766572746963616c2d616c69676e' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'766572746963616c2d616c69676e' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d666c6578' USING utf8mb4), CONVERT(X'666c6578' USING utf8mb4), CONVERT(X'e5bd88e680a7e9a085e79baee7b0a1e5afab' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae5bd88e680a7e9a085e79baee79a84e694bee5a4a7e38081e7b8aee5b08fe88887e59fbae6ba96e5b0bae5afb8e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae5bd88e680a7e9a085e79baee79a84e694bee5a4a7e38081e7b8aee5b08fe88887e59fbae6ba96e5b0bae5afb8e38082e5ae83e698af20666c65782d67726f77e38081666c65782d736872696e6be38081666c65782d626173697320e79a84e7b0a1e5afabefbc8ce4bd9ce794a8e696bce5bd88e680a7e9a085e79baee38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020666c65783a2031203120303b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5bd88e680a7e9a085e79baee7b0a1e5afabe3808de38082' USING utf8mb4), CONVERT(X'666c6578' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d666c6578626f782d322f2370726f706465662d666c6578' USING utf8mb4), CONVERT(X'6373732d666c6578626f782d3220454420323032362d31302d3231' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3236' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'666c6578' USING utf8mb4),
display_label = CONVERT(X'e5bd88e680a7e9a085e79baee7b0a1e5afab' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae5bd88e680a7e9a085e79baee79a84e694bee5a4a7e38081e7b8aee5b08fe88887e59fbae6ba96e5b0bae5afb8e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae5bd88e680a7e9a085e79baee79a84e694bee5a4a7e38081e7b8aee5b08fe88887e59fbae6ba96e5b0bae5afb8e38082e5ae83e698af20666c65782d67726f77e38081666c65782d736872696e6be38081666c65782d626173697320e79a84e7b0a1e5afabefbc8ce4bd9ce794a8e696bce5bd88e680a7e9a085e79baee38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020666c65783a2031203120303b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5bd88e680a7e9a085e79baee7b0a1e5afabe3808de38082' USING utf8mb4),
sort_key = CONVERT(X'666c6578' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d666c6578626f782d322f2370726f706465662d666c6578' USING utf8mb4),
source_version = CONVERT(X'6373732d666c6578626f782d3220454420323032362d31302d3231' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3236' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d666c6578' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'666c6578' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d666c65782d646972656374696f6e' USING utf8mb4), CONVERT(X'666c65782d646972656374696f6e' USING utf8mb4), CONVERT(X'e5bd88e680a7e68e92e58897e696b9e59091' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae5bd88e680a7e5aeb9e599a8e4b8bbe8bbb8e79a84e696b9e59091e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae5bd88e680a7e5aeb9e599a8e4b8bbe8bbb8e79a84e696b9e59091e38082726f7720e8888720636f6c756d6e20e58886e588a5e6b2bfe8a18ce585a7e58f8ae58d80e5a18ae696b9e59091e68e92e58897efbc8ce4b8a6e58fafe4bdbfe794a8e58f8de59091e78988e69cace38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020666c65782d646972656374696f6e3a20636f6c756d6e3b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5bd88e680a7e68e92e58897e696b9e59091e3808de38082' USING utf8mb4), CONVERT(X'666c65782d646972656374696f6e' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d666c6578626f782d322f2370726f706465662d666c65782d646972656374696f6e' USING utf8mb4), CONVERT(X'6373732d666c6578626f782d3220454420323032362d31302d3231' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3236' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'666c65782d646972656374696f6e' USING utf8mb4),
display_label = CONVERT(X'e5bd88e680a7e68e92e58897e696b9e59091' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae5bd88e680a7e5aeb9e599a8e4b8bbe8bbb8e79a84e696b9e59091e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae5bd88e680a7e5aeb9e599a8e4b8bbe8bbb8e79a84e696b9e59091e38082726f7720e8888720636f6c756d6e20e58886e588a5e6b2bfe8a18ce585a7e58f8ae58d80e5a18ae696b9e59091e68e92e58897efbc8ce4b8a6e58fafe4bdbfe794a8e58f8de59091e78988e69cace38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020666c65782d646972656374696f6e3a20636f6c756d6e3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5bd88e680a7e68e92e58897e696b9e59091e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'666c65782d646972656374696f6e' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d666c6578626f782d322f2370726f706465662d666c65782d646972656374696f6e' USING utf8mb4),
source_version = CONVERT(X'6373732d666c6578626f782d3220454420323032362d31302d3231' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3236' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d666c65782d646972656374696f6e' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'666c65782d646972656374696f6e' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d666c65782d77726170' USING utf8mb4), CONVERT(X'666c65782d77726170' USING utf8mb4), CONVERT(X'e5bd88e680a7e68f9be8a18c' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae5bd88e680a7e9a085e79baee698afe590a6e68f9be8a18ce38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae5bd88e680a7e9a085e79baee698afe590a6e68f9be8a18ce380827772617020e58581e8a8b1e58886e68890e5a49ae8a18cefbc9b6e6f7772617020e69c83e7b6ade68c81e596aee8a18ce68e92e58897e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020666c65782d777261703a20777261703b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5bd88e680a7e68f9be8a18ce3808de38082' USING utf8mb4), CONVERT(X'666c65782d77726170' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d666c6578626f782d322f2370726f706465662d666c65782d77726170' USING utf8mb4), CONVERT(X'6373732d666c6578626f782d3220454420323032362d31302d3231' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3236' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'666c65782d77726170' USING utf8mb4),
display_label = CONVERT(X'e5bd88e680a7e68f9be8a18c' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae5bd88e680a7e9a085e79baee698afe590a6e68f9be8a18ce38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae5bd88e680a7e9a085e79baee698afe590a6e68f9be8a18ce380827772617020e58581e8a8b1e58886e68890e5a49ae8a18cefbc9b6e6f7772617020e69c83e7b6ade68c81e596aee8a18ce68e92e58897e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020666c65782d777261703a20777261703b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5bd88e680a7e68f9be8a18ce3808de38082' USING utf8mb4),
sort_key = CONVERT(X'666c65782d77726170' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d666c6578626f782d322f2370726f706465662d666c65782d77726170' USING utf8mb4),
source_version = CONVERT(X'6373732d666c6578626f782d3220454420323032362d31302d3231' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3236' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d666c65782d77726170' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'666c65782d77726170' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d666c65782d67726f77' USING utf8mb4), CONVERT(X'666c65782d67726f77' USING utf8mb4), CONVERT(X'e5bd88e680a7e694bee5a4a7e6af94e4be8b' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae5bd88e680a7e9a085e79baee58886e9858de589a9e9a498e7a9bae99693e69982e79a84e694bee5a4a7e59ba0e5ad90e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae5bd88e680a7e9a085e79baee58886e9858de589a9e9a498e7a9bae99693e69982e79a84e694bee5a4a7e59ba0e5ad90e38082e6af94e4be8be794a8e696bce58886e9858de589a9e9a498e7a9bae99693efbc8ce4b88de4bf9de8ad89e69c80e7b582e5aface5baa6e6af94e4be8be4b880e5ae9ae79bb8e5908ce38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020666c65782d67726f773a20313b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5bd88e680a7e694bee5a4a7e6af94e4be8be3808de38082' USING utf8mb4), CONVERT(X'666c65782d67726f77' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d666c6578626f782d322f2370726f706465662d666c65782d67726f77' USING utf8mb4), CONVERT(X'6373732d666c6578626f782d3220454420323032362d31302d3231' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3236' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'666c65782d67726f77' USING utf8mb4),
display_label = CONVERT(X'e5bd88e680a7e694bee5a4a7e6af94e4be8b' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae5bd88e680a7e9a085e79baee58886e9858de589a9e9a498e7a9bae99693e69982e79a84e694bee5a4a7e59ba0e5ad90e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae5bd88e680a7e9a085e79baee58886e9858de589a9e9a498e7a9bae99693e69982e79a84e694bee5a4a7e59ba0e5ad90e38082e6af94e4be8be794a8e696bce58886e9858de589a9e9a498e7a9bae99693efbc8ce4b88de4bf9de8ad89e69c80e7b582e5aface5baa6e6af94e4be8be4b880e5ae9ae79bb8e5908ce38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020666c65782d67726f773a20313b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5bd88e680a7e694bee5a4a7e6af94e4be8be3808de38082' USING utf8mb4),
sort_key = CONVERT(X'666c65782d67726f77' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d666c6578626f782d322f2370726f706465662d666c65782d67726f77' USING utf8mb4),
source_version = CONVERT(X'6373732d666c6578626f782d3220454420323032362d31302d3231' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3236' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d666c65782d67726f77' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'666c65782d67726f77' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d666c65782d736872696e6b' USING utf8mb4), CONVERT(X'666c65782d736872696e6b' USING utf8mb4), CONVERT(X'e5bd88e680a7e7b8aee5b08fe6af94e4be8b' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae5bd88e680a7e9a085e79baee7a9bae99693e4b88de8b6b3e69982e79a84e7b8aee5b08fe59ba0e5ad90e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae5bd88e680a7e9a085e79baee7a9bae99693e4b88de8b6b3e69982e79a84e7b8aee5b08fe59ba0e5ad90e38082e5afa6e99a9be7b8aee5b08fe9878fe98284e69c83e88083e685aee9a085e79baee79a84e5bd88e680a7e59fbae6ba96e5b0bae5afb8e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020666c65782d736872696e6b3a20303b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5bd88e680a7e7b8aee5b08fe6af94e4be8be3808de38082' USING utf8mb4), CONVERT(X'666c65782d736872696e6b' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d666c6578626f782d322f2370726f706465662d666c65782d736872696e6b' USING utf8mb4), CONVERT(X'6373732d666c6578626f782d3220454420323032362d31302d3231' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3236' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'666c65782d736872696e6b' USING utf8mb4),
display_label = CONVERT(X'e5bd88e680a7e7b8aee5b08fe6af94e4be8b' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae5bd88e680a7e9a085e79baee7a9bae99693e4b88de8b6b3e69982e79a84e7b8aee5b08fe59ba0e5ad90e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae5bd88e680a7e9a085e79baee7a9bae99693e4b88de8b6b3e69982e79a84e7b8aee5b08fe59ba0e5ad90e38082e5afa6e99a9be7b8aee5b08fe9878fe98284e69c83e88083e685aee9a085e79baee79a84e5bd88e680a7e59fbae6ba96e5b0bae5afb8e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020666c65782d736872696e6b3a20303b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5bd88e680a7e7b8aee5b08fe6af94e4be8be3808de38082' USING utf8mb4),
sort_key = CONVERT(X'666c65782d736872696e6b' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d666c6578626f782d322f2370726f706465662d666c65782d736872696e6b' USING utf8mb4),
source_version = CONVERT(X'6373732d666c6578626f782d3220454420323032362d31302d3231' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3236' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d666c65782d736872696e6b' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'666c65782d736872696e6b' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d666c65782d6261736973' USING utf8mb4), CONVERT(X'666c65782d6261736973' USING utf8mb4), CONVERT(X'e5bd88e680a7e59fbae6ba96e5b0bae5afb8' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae5bd88e680a7e9a085e79baee59ca8e58886e9858de7a9bae99693e5898de79a84e4b8bbe8bbb8e59fbae6ba96e5b0bae5afb8e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae5bd88e680a7e9a085e79baee59ca8e58886e9858de7a9bae99693e5898de79a84e4b8bbe8bbb8e59fbae6ba96e5b0bae5afb8e38082e58fafe4bdbfe794a8e995b7e5baa6e38081e799bee58886e6af94e68896206175746fefbc8ce4b8a6e58f97e4b8bbe8bbb8e696b9e59091e5bdb1e99fbfe38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020666c65782d62617369733a2032343070783b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5bd88e680a7e59fbae6ba96e5b0bae5afb8e3808de38082' USING utf8mb4), CONVERT(X'666c65782d6261736973' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d666c6578626f782d322f2370726f706465662d666c65782d6261736973' USING utf8mb4), CONVERT(X'6373732d666c6578626f782d3220454420323032362d31302d3231' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3236' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'666c65782d6261736973' USING utf8mb4),
display_label = CONVERT(X'e5bd88e680a7e59fbae6ba96e5b0bae5afb8' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae5bd88e680a7e9a085e79baee59ca8e58886e9858de7a9bae99693e5898de79a84e4b8bbe8bbb8e59fbae6ba96e5b0bae5afb8e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae5bd88e680a7e9a085e79baee59ca8e58886e9858de7a9bae99693e5898de79a84e4b8bbe8bbb8e59fbae6ba96e5b0bae5afb8e38082e58fafe4bdbfe794a8e995b7e5baa6e38081e799bee58886e6af94e68896206175746fefbc8ce4b8a6e58f97e4b8bbe8bbb8e696b9e59091e5bdb1e99fbfe38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020666c65782d62617369733a2032343070783b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5bd88e680a7e59fbae6ba96e5b0bae5afb8e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'666c65782d6261736973' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d666c6578626f782d322f2370726f706465662d666c65782d6261736973' USING utf8mb4),
source_version = CONVERT(X'6373732d666c6578626f782d3220454420323032362d31302d3231' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3236' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d666c65782d6261736973' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'666c65782d6261736973' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d6a7573746966792d636f6e74656e74' USING utf8mb4), CONVERT(X'6a7573746966792d636f6e74656e74' USING utf8mb4), CONVERT(X'e4b8bbe696b9e59091e585a7e5aeb9e5b08de9bd8a' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae585a7e5aeb9e59ca8e981a9e794a8e5b08de9bd8ae8bbb8e4b88ae79a84e68e92e58897e88887e7a9bae99693e58886e9858de38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae585a7e5aeb9e59ca8e981a9e794a8e5b08de9bd8ae8bbb8e4b88ae79a84e68e92e58897e88887e7a9bae99693e58886e9858de38082e59ca820466c6578626f7820e4b8ade9809ae5b8b8e4bd9ce794a8e696bce4b8bbe8bbb8efbc9b4772696420e4b8ade58987e4bd9ce794a8e696bce8a18ce585a7e8bbb8e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20206a7573746966792d636f6e74656e743a2073706163652d6265747765656e3b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce4b8bbe696b9e59091e585a7e5aeb9e5b08de9bd8ae3808de38082' USING utf8mb4), CONVERT(X'6a7573746966792d636f6e74656e74' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d616c69676e2d332f2370726f706465662d6a7573746966792d636f6e74656e74' USING utf8mb4), CONVERT(X'6373732d616c69676e2d3320454420323032362d31302d3231' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3231' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'6a7573746966792d636f6e74656e74' USING utf8mb4),
display_label = CONVERT(X'e4b8bbe696b9e59091e585a7e5aeb9e5b08de9bd8a' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae585a7e5aeb9e59ca8e981a9e794a8e5b08de9bd8ae8bbb8e4b88ae79a84e68e92e58897e88887e7a9bae99693e58886e9858de38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae585a7e5aeb9e59ca8e981a9e794a8e5b08de9bd8ae8bbb8e4b88ae79a84e68e92e58897e88887e7a9bae99693e58886e9858de38082e59ca820466c6578626f7820e4b8ade9809ae5b8b8e4bd9ce794a8e696bce4b8bbe8bbb8efbc9b4772696420e4b8ade58987e4bd9ce794a8e696bce8a18ce585a7e8bbb8e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20206a7573746966792d636f6e74656e743a2073706163652d6265747765656e3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce4b8bbe696b9e59091e585a7e5aeb9e5b08de9bd8ae3808de38082' USING utf8mb4),
sort_key = CONVERT(X'6a7573746966792d636f6e74656e74' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d616c69676e2d332f2370726f706465662d6a7573746966792d636f6e74656e74' USING utf8mb4),
source_version = CONVERT(X'6373732d616c69676e2d3320454420323032362d31302d3231' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3231' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d6a7573746966792d636f6e74656e74' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'6a7573746966792d636f6e74656e74' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d616c69676e2d6974656d73' USING utf8mb4), CONVERT(X'616c69676e2d6974656d73' USING utf8mb4), CONVERT(X'e9a085e79baee5b08de9bd8a' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae5aeb9e599a8e4b8ade9a085e79baee79a84e9a090e8a8ade5b08de9bd8ae696b9e5bc8fe38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae5aeb9e599a8e4b8ade9a085e79baee79a84e9a090e8a8ade5b08de9bd8ae696b9e5bc8fe38082e59ca820466c6578626f7820e4b8ade9809ae5b8b8e4bd9ce794a8e696bce4baa4e58f89e8bbb8efbc9be58fafe4bdbfe794a82063656e746572e380817374726574636820e7ad89e580bce38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020616c69676e2d6974656d733a2063656e7465723b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce9a085e79baee5b08de9bd8ae3808de38082' USING utf8mb4), CONVERT(X'616c69676e2d6974656d73' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d616c69676e2d332f2370726f706465662d616c69676e2d6974656d73' USING utf8mb4), CONVERT(X'6373732d616c69676e2d3320454420323032362d31302d3231' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3231' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'616c69676e2d6974656d73' USING utf8mb4),
display_label = CONVERT(X'e9a085e79baee5b08de9bd8a' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae5aeb9e599a8e4b8ade9a085e79baee79a84e9a090e8a8ade5b08de9bd8ae696b9e5bc8fe38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae5aeb9e599a8e4b8ade9a085e79baee79a84e9a090e8a8ade5b08de9bd8ae696b9e5bc8fe38082e59ca820466c6578626f7820e4b8ade9809ae5b8b8e4bd9ce794a8e696bce4baa4e58f89e8bbb8efbc9be58fafe4bdbfe794a82063656e746572e380817374726574636820e7ad89e580bce38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020616c69676e2d6974656d733a2063656e7465723b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce9a085e79baee5b08de9bd8ae3808de38082' USING utf8mb4),
sort_key = CONVERT(X'616c69676e2d6974656d73' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d616c69676e2d332f2370726f706465662d616c69676e2d6974656d73' USING utf8mb4),
source_version = CONVERT(X'6373732d616c69676e2d3320454420323032362d31302d3231' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3231' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d616c69676e2d6974656d73' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'616c69676e2d6974656d73' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d616c69676e2d73656c66' USING utf8mb4), CONVERT(X'616c69676e2d73656c66' USING utf8mb4), CONVERT(X'e596aee4b880e9a085e79baee5b08de9bd8a' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae596aee4b880e9a085e79baee79a84e5b08de9bd8ae696b9e5bc8fe38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae596aee4b880e9a085e79baee79a84e5b08de9bd8ae696b9e5bc8fe38082e58fafe8a686e5afabe5aeb9e599a820616c69676e2d6974656d7320e782bae8a9b2e9a085e79baee68f90e4be9be79a84e9a090e8a8ade580bce38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020616c69676e2d73656c663a2063656e7465723b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce596aee4b880e9a085e79baee5b08de9bd8ae3808de38082' USING utf8mb4), CONVERT(X'616c69676e2d73656c66' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d616c69676e2d332f2370726f706465662d616c69676e2d73656c66' USING utf8mb4), CONVERT(X'6373732d616c69676e2d3320454420323032362d31302d3231' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3231' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'616c69676e2d73656c66' USING utf8mb4),
display_label = CONVERT(X'e596aee4b880e9a085e79baee5b08de9bd8a' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae596aee4b880e9a085e79baee79a84e5b08de9bd8ae696b9e5bc8fe38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae596aee4b880e9a085e79baee79a84e5b08de9bd8ae696b9e5bc8fe38082e58fafe8a686e5afabe5aeb9e599a820616c69676e2d6974656d7320e782bae8a9b2e9a085e79baee68f90e4be9be79a84e9a090e8a8ade580bce38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020616c69676e2d73656c663a2063656e7465723b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce596aee4b880e9a085e79baee5b08de9bd8ae3808de38082' USING utf8mb4),
sort_key = CONVERT(X'616c69676e2d73656c66' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d616c69676e2d332f2370726f706465662d616c69676e2d73656c66' USING utf8mb4),
source_version = CONVERT(X'6373732d616c69676e2d3320454420323032362d31302d3231' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3231' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d616c69676e2d73656c66' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'616c69676e2d73656c66' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d616c69676e2d636f6e74656e74' USING utf8mb4), CONVERT(X'616c69676e2d636f6e74656e74' USING utf8mb4), CONVERT(X'e5a49ae8a18ce585a7e5aeb9e5b08de9bd8a' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae585a7e5aeb9e59ca8e981a9e794a8e5b08de9bd8ae8bbb8e4b88ae79a84e695b4e9ab94e58886e9858de696b9e5bc8fe38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae585a7e5aeb9e59ca8e981a9e794a8e5b08de9bd8ae8bbb8e4b88ae79a84e695b4e9ab94e58886e9858de696b9e5bc8fe38082e59ca8e5a49ae8a18c20466c6578626f7820e4b8ade58fafe58886e9858de59084e8a18ce79a84e4baa4e58f89e8bbb8e7a9bae99693e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020616c69676e2d636f6e74656e743a2073706163652d6265747765656e3b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5a49ae8a18ce585a7e5aeb9e5b08de9bd8ae3808de38082' USING utf8mb4), CONVERT(X'616c69676e2d636f6e74656e74' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d616c69676e2d332f2370726f706465662d616c69676e2d636f6e74656e74' USING utf8mb4), CONVERT(X'6373732d616c69676e2d3320454420323032362d31302d3231' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3231' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'616c69676e2d636f6e74656e74' USING utf8mb4),
display_label = CONVERT(X'e5a49ae8a18ce585a7e5aeb9e5b08de9bd8a' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae585a7e5aeb9e59ca8e981a9e794a8e5b08de9bd8ae8bbb8e4b88ae79a84e695b4e9ab94e58886e9858de696b9e5bc8fe38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae585a7e5aeb9e59ca8e981a9e794a8e5b08de9bd8ae8bbb8e4b88ae79a84e695b4e9ab94e58886e9858de696b9e5bc8fe38082e59ca8e5a49ae8a18c20466c6578626f7820e4b8ade58fafe58886e9858de59084e8a18ce79a84e4baa4e58f89e8bbb8e7a9bae99693e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020616c69676e2d636f6e74656e743a2073706163652d6265747765656e3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5a49ae8a18ce585a7e5aeb9e5b08de9bd8ae3808de38082' USING utf8mb4),
sort_key = CONVERT(X'616c69676e2d636f6e74656e74' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d616c69676e2d332f2370726f706465662d616c69676e2d636f6e74656e74' USING utf8mb4),
source_version = CONVERT(X'6373732d616c69676e2d3320454420323032362d31302d3231' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3231' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d616c69676e2d636f6e74656e74' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'616c69676e2d636f6e74656e74' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d6f72646572' USING utf8mb4), CONVERT(X'6f72646572' USING utf8mb4), CONVERT(X'e68e92e58897e9a086e5ba8f' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae5bd88e680a7e68896e6a0bce7b79ae9a085e79baee79a84e8a696e8a6bae68e92e58897e9a086e5ba8fe38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae5bd88e680a7e68896e6a0bce7b79ae9a085e79baee79a84e8a696e8a6bae68e92e58897e9a086e5ba8fe38082e4b88de69c83e694b9e8ae8ae69687e4bbb6e4b8ade79a84e8aa9ee6848fe9a086e5ba8fefbc8ce98db5e79ba4e88887e8bc94e58aa9e7a791e68a80e996b1e8ae80e9a086e5ba8fe58fafe883bde4bb8de4be9de58e9fe5a78be7a2bce38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20206f726465723a20313b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce68e92e58897e9a086e5ba8fe3808de38082' USING utf8mb4), CONVERT(X'6f72646572' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d646973706c61792d342f2370726f706465662d6f72646572' USING utf8mb4), CONVERT(X'6373732d646973706c61792d3420454420323032362d30362d3035' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'6f72646572' USING utf8mb4),
display_label = CONVERT(X'e68e92e58897e9a086e5ba8f' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae5bd88e680a7e68896e6a0bce7b79ae9a085e79baee79a84e8a696e8a6bae68e92e58897e9a086e5ba8fe38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae5bd88e680a7e68896e6a0bce7b79ae9a085e79baee79a84e8a696e8a6bae68e92e58897e9a086e5ba8fe38082e4b88de69c83e694b9e8ae8ae69687e4bbb6e4b8ade79a84e8aa9ee6848fe9a086e5ba8fefbc8ce98db5e79ba4e88887e8bc94e58aa9e7a791e68a80e996b1e8ae80e9a086e5ba8fe58fafe883bde4bb8de4be9de58e9fe5a78be7a2bce38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20206f726465723a20313b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce68e92e58897e9a086e5ba8fe3808de38082' USING utf8mb4),
sort_key = CONVERT(X'6f72646572' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d646973706c61792d342f2370726f706465662d6f72646572' USING utf8mb4),
source_version = CONVERT(X'6373732d646973706c61792d3420454420323032362d30362d3035' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d6f72646572' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'6f72646572' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d676170' USING utf8mb4), CONVERT(X'676170' USING utf8mb4), CONVERT(X'e9a085e79baee99693e99a94' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58897e88887e6ac84e4b98be99693e79a84e99693e99a94e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58897e88887e6ac84e4b98be99693e79a84e99693e99a94e38082e58fafe794a8e696bc2047726964e38081466c6578626f7820e7ad89e68e92e78988efbc9be4b88de69c83e59ca8e5aeb9e599a8e69c80e5a496e581b4e9a18de5a496e58aa0e585a5e99693e99a94e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20206761703a20313670783b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce9a085e79baee99693e99a94e3808de38082' USING utf8mb4), CONVERT(X'676170' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d676170732d312f2370726f706465662d676170' USING utf8mb4), CONVERT(X'6373732d676170732d3120454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3036' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'676170' USING utf8mb4),
display_label = CONVERT(X'e9a085e79baee99693e99a94' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae58897e88887e6ac84e4b98be99693e79a84e99693e99a94e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae58897e88887e6ac84e4b98be99693e79a84e99693e99a94e38082e58fafe794a8e696bc2047726964e38081466c6578626f7820e7ad89e68e92e78988efbc9be4b88de69c83e59ca8e5aeb9e599a8e69c80e5a496e581b4e9a18de5a496e58aa0e585a5e99693e99a94e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20206761703a20313670783b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce9a085e79baee99693e99a94e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'676170' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d676170732d312f2370726f706465662d676170' USING utf8mb4),
source_version = CONVERT(X'6373732d676170732d3120454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3036' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d676170' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'676170' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d726f772d676170' USING utf8mb4), CONVERT(X'726f772d676170' USING utf8mb4), CONVERT(X'e58897e99693e99a94' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae79bb8e984b0e58897e4b98be99693e79a84e99693e99a94e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae79bb8e984b0e58897e4b98be99693e79a84e99693e99a94e38082e981a9e794a8e79a84e696b9e59091e88887e68e92e78988e696b9e5bc8fe69c89e9979ce38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020726f772d6761703a20313270783b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce58897e99693e99a94e3808de38082' USING utf8mb4), CONVERT(X'726f772d676170' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d676170732d312f2370726f706465662d726f772d676170' USING utf8mb4), CONVERT(X'6373732d676170732d3120454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3036' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'726f772d676170' USING utf8mb4),
display_label = CONVERT(X'e58897e99693e99a94' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae79bb8e984b0e58897e4b98be99693e79a84e99693e99a94e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae79bb8e984b0e58897e4b98be99693e79a84e99693e99a94e38082e981a9e794a8e79a84e696b9e59091e88887e68e92e78988e696b9e5bc8fe69c89e9979ce38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020726f772d6761703a20313270783b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce58897e99693e99a94e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'726f772d676170' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d676170732d312f2370726f706465662d726f772d676170' USING utf8mb4),
source_version = CONVERT(X'6373732d676170732d3120454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3036' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d726f772d676170' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'726f772d676170' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d636f6c756d6e2d676170' USING utf8mb4), CONVERT(X'636f6c756d6e2d676170' USING utf8mb4), CONVERT(X'e6ac84e99693e99a94' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae79bb8e984b0e6ac84e4b98be99693e79a84e99693e99a94e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae79bb8e984b0e6ac84e4b98be99693e79a84e99693e99a94e38082e58fafe794a8e696bce5a49ae6ac84e380814772696420e8888720466c6578626f7820e7ad89e68e92e78988e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020636f6c756d6e2d6761703a20323070783b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce6ac84e99693e99a94e3808de38082' USING utf8mb4), CONVERT(X'636f6c756d6e2d676170' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d676170732d312f2370726f706465662d636f6c756d6e2d676170' USING utf8mb4), CONVERT(X'6373732d676170732d3120454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3036' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'636f6c756d6e2d676170' USING utf8mb4),
display_label = CONVERT(X'e6ac84e99693e99a94' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae79bb8e984b0e6ac84e4b98be99693e79a84e99693e99a94e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae79bb8e984b0e6ac84e4b98be99693e79a84e99693e99a94e38082e58fafe794a8e696bce5a49ae6ac84e380814772696420e8888720466c6578626f7820e7ad89e68e92e78988e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020636f6c756d6e2d6761703a20323070783b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce6ac84e99693e99a94e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'636f6c756d6e2d676170' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d676170732d312f2370726f706465662d636f6c756d6e2d676170' USING utf8mb4),
source_version = CONVERT(X'6373732d676170732d3120454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3036' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d636f6c756d6e2d676170' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'636f6c756d6e2d676170' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d677269642d74656d706c6174652d636f6c756d6e73' USING utf8mb4), CONVERT(X'677269642d74656d706c6174652d636f6c756d6e73' USING utf8mb4), CONVERT(X'e6a0bce7b79ae6ac84e8bb8ce98193' USING utf8mb4), CONVERT(X'e5ae9ae7bea9e6a0bce7b79ae5aeb9e599a8e79a84e6988ee7a2bae6ac84e8bb8ce98193e5b0bae5afb8e38082' USING utf8mb4), CONVERT(X'e5ae9ae7bea9e6a0bce7b79ae5aeb9e599a8e79a84e6988ee7a2bae6ac84e8bb8ce98193e5b0bae5afb8e38082e58fafe4bdbfe794a8206672e38081e995b7e5baa6e38081726570656174282920e88887206d696e6d6178282920e7ad89e5afabe6b395e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020677269642d74656d706c6174652d636f6c756d6e733a2072657065617428332c206d696e6d617828302c2031667229293b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce6a0bce7b79ae6ac84e8bb8ce98193e3808de38082' USING utf8mb4), CONVERT(X'677269642d74656d706c6174652d636f6c756d6e73' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d677269642d322f2370726f706465662d677269642d74656d706c6174652d636f6c756d6e73' USING utf8mb4), CONVERT(X'6373732d677269642d3220435220323032332d31302d3330' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3334' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'677269642d74656d706c6174652d636f6c756d6e73' USING utf8mb4),
display_label = CONVERT(X'e6a0bce7b79ae6ac84e8bb8ce98193' USING utf8mb4),
summary = CONVERT(X'e5ae9ae7bea9e6a0bce7b79ae5aeb9e599a8e79a84e6988ee7a2bae6ac84e8bb8ce98193e5b0bae5afb8e38082' USING utf8mb4),
description = CONVERT(X'e5ae9ae7bea9e6a0bce7b79ae5aeb9e599a8e79a84e6988ee7a2bae6ac84e8bb8ce98193e5b0bae5afb8e38082e58fafe4bdbfe794a8206672e38081e995b7e5baa6e38081726570656174282920e88887206d696e6d6178282920e7ad89e5afabe6b395e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020677269642d74656d706c6174652d636f6c756d6e733a2072657065617428332c206d696e6d617828302c2031667229293b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce6a0bce7b79ae6ac84e8bb8ce98193e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'677269642d74656d706c6174652d636f6c756d6e73' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d677269642d322f2370726f706465662d677269642d74656d706c6174652d636f6c756d6e73' USING utf8mb4),
source_version = CONVERT(X'6373732d677269642d3220435220323032332d31302d3330' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3334' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d677269642d74656d706c6174652d636f6c756d6e73' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'677269642d74656d706c6174652d636f6c756d6e73' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d677269642d74656d706c6174652d726f7773' USING utf8mb4), CONVERT(X'677269642d74656d706c6174652d726f7773' USING utf8mb4), CONVERT(X'e6a0bce7b79ae58897e8bb8ce98193' USING utf8mb4), CONVERT(X'e5ae9ae7bea9e6a0bce7b79ae5aeb9e599a8e79a84e6988ee7a2bae58897e8bb8ce98193e5b0bae5afb8e38082' USING utf8mb4), CONVERT(X'e5ae9ae7bea9e6a0bce7b79ae5aeb9e599a8e79a84e6988ee7a2bae58897e8bb8ce98193e5b0bae5afb8e38082e58fafe782bae4b88de5908ce58897e58886e588a5e68c87e5ae9ae59bbae5ae9ae68896e58fafe4bcb8e7b8aee79a84e5b0bae5afb8e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020677269642d74656d706c6174652d726f77733a206175746f20316672206175746f3b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce6a0bce7b79ae58897e8bb8ce98193e3808de38082' USING utf8mb4), CONVERT(X'677269642d74656d706c6174652d726f7773' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d677269642d322f2370726f706465662d677269642d74656d706c6174652d726f7773' USING utf8mb4), CONVERT(X'6373732d677269642d3220435220323032332d31302d3330' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3334' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'677269642d74656d706c6174652d726f7773' USING utf8mb4),
display_label = CONVERT(X'e6a0bce7b79ae58897e8bb8ce98193' USING utf8mb4),
summary = CONVERT(X'e5ae9ae7bea9e6a0bce7b79ae5aeb9e599a8e79a84e6988ee7a2bae58897e8bb8ce98193e5b0bae5afb8e38082' USING utf8mb4),
description = CONVERT(X'e5ae9ae7bea9e6a0bce7b79ae5aeb9e599a8e79a84e6988ee7a2bae58897e8bb8ce98193e5b0bae5afb8e38082e58fafe782bae4b88de5908ce58897e58886e588a5e68c87e5ae9ae59bbae5ae9ae68896e58fafe4bcb8e7b8aee79a84e5b0bae5afb8e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020677269642d74656d706c6174652d726f77733a206175746f20316672206175746f3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce6a0bce7b79ae58897e8bb8ce98193e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'677269642d74656d706c6174652d726f7773' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d677269642d322f2370726f706465662d677269642d74656d706c6174652d726f7773' USING utf8mb4),
source_version = CONVERT(X'6373732d677269642d3220435220323032332d31302d3330' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3334' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d677269642d74656d706c6174652d726f7773' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'677269642d74656d706c6174652d726f7773' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d677269642d74656d706c6174652d6172656173' USING utf8mb4), CONVERT(X'677269642d74656d706c6174652d6172656173' USING utf8mb4), CONVERT(X'e6a0bce7b79ae591bde5908de58d80e59f9f' USING utf8mb4), CONVERT(X'e4bba5e69687e5ad97e6a8a1e69dbfe5ae9ae7bea9e591bde5908de6a0bce7b79ae58d80e59f9fe38082' USING utf8mb4), CONVERT(X'e4bba5e69687e5ad97e6a8a1e69dbfe5ae9ae7bea9e591bde5908de6a0bce7b79ae58d80e59f9fe38082e5908ce5908de6a0bce5ad90e5bf85e9a088e5bda2e68890e79fa9e5bda2efbc8ce9a085e79baee58fafe794a820677269642d6172656120e694bee585a5e591bde5908de58d80e59f9fe38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020677269642d74656d706c6174652d61726561733a20226865616465722068656164657222202273696465626172206d61696e223b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce6a0bce7b79ae591bde5908de58d80e59f9fe3808de38082' USING utf8mb4), CONVERT(X'677269642d74656d706c6174652d6172656173' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d677269642d322f2370726f706465662d677269642d74656d706c6174652d6172656173' USING utf8mb4), CONVERT(X'6373732d677269642d3220435220323032332d31302d3330' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3334' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'677269642d74656d706c6174652d6172656173' USING utf8mb4),
display_label = CONVERT(X'e6a0bce7b79ae591bde5908de58d80e59f9f' USING utf8mb4),
summary = CONVERT(X'e4bba5e69687e5ad97e6a8a1e69dbfe5ae9ae7bea9e591bde5908de6a0bce7b79ae58d80e59f9fe38082' USING utf8mb4),
description = CONVERT(X'e4bba5e69687e5ad97e6a8a1e69dbfe5ae9ae7bea9e591bde5908de6a0bce7b79ae58d80e59f9fe38082e5908ce5908de6a0bce5ad90e5bf85e9a088e5bda2e68890e79fa9e5bda2efbc8ce9a085e79baee58fafe794a820677269642d6172656120e694bee585a5e591bde5908de58d80e59f9fe38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020677269642d74656d706c6174652d61726561733a20226865616465722068656164657222202273696465626172206d61696e223b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce6a0bce7b79ae591bde5908de58d80e59f9fe3808de38082' USING utf8mb4),
sort_key = CONVERT(X'677269642d74656d706c6174652d6172656173' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d677269642d322f2370726f706465662d677269642d74656d706c6174652d6172656173' USING utf8mb4),
source_version = CONVERT(X'6373732d677269642d3220435220323032332d31302d3330' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3334' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d677269642d74656d706c6174652d6172656173' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'677269642d74656d706c6174652d6172656173' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d677269642d636f6c756d6e' USING utf8mb4), CONVERT(X'677269642d636f6c756d6e' USING utf8mb4), CONVERT(X'e6a0bce7b79ae6ac84e4bd8de7bdae' USING utf8mb4), CONVERT(X'e4bba5e7b0a1e5afabe68c87e5ae9ae6a0bce7b79ae9a085e79baee79a84e6ac84e8b5b7e9bb9ee88887e7b582e9bb9ee38082' USING utf8mb4), CONVERT(X'e4bba5e7b0a1e5afabe68c87e5ae9ae6a0bce7b79ae9a085e79baee79a84e6ac84e8b5b7e9bb9ee88887e7b582e9bb9ee38082e58fafe4bdbfe794a8e6a0bce7b79ae7b7a8e8999fe38081e5908de7a8b1e68896207370616e20e8b7a8e8b68ae8bb8ce98193e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020677269642d636f6c756d6e3a2031202f20333b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce6a0bce7b79ae6ac84e4bd8de7bdaee3808de38082' USING utf8mb4), CONVERT(X'677269642d636f6c756d6e' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d677269642d322f2370726f706465662d677269642d636f6c756d6e' USING utf8mb4), CONVERT(X'6373732d677269642d3220435220323032332d31302d3330' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3334' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'677269642d636f6c756d6e' USING utf8mb4),
display_label = CONVERT(X'e6a0bce7b79ae6ac84e4bd8de7bdae' USING utf8mb4),
summary = CONVERT(X'e4bba5e7b0a1e5afabe68c87e5ae9ae6a0bce7b79ae9a085e79baee79a84e6ac84e8b5b7e9bb9ee88887e7b582e9bb9ee38082' USING utf8mb4),
description = CONVERT(X'e4bba5e7b0a1e5afabe68c87e5ae9ae6a0bce7b79ae9a085e79baee79a84e6ac84e8b5b7e9bb9ee88887e7b582e9bb9ee38082e58fafe4bdbfe794a8e6a0bce7b79ae7b7a8e8999fe38081e5908de7a8b1e68896207370616e20e8b7a8e8b68ae8bb8ce98193e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020677269642d636f6c756d6e3a2031202f20333b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce6a0bce7b79ae6ac84e4bd8de7bdaee3808de38082' USING utf8mb4),
sort_key = CONVERT(X'677269642d636f6c756d6e' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d677269642d322f2370726f706465662d677269642d636f6c756d6e' USING utf8mb4),
source_version = CONVERT(X'6373732d677269642d3220435220323032332d31302d3330' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3334' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d677269642d636f6c756d6e' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'677269642d636f6c756d6e' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d677269642d726f77' USING utf8mb4), CONVERT(X'677269642d726f77' USING utf8mb4), CONVERT(X'e6a0bce7b79ae58897e4bd8de7bdae' USING utf8mb4), CONVERT(X'e4bba5e7b0a1e5afabe68c87e5ae9ae6a0bce7b79ae9a085e79baee79a84e58897e8b5b7e9bb9ee88887e7b582e9bb9ee38082' USING utf8mb4), CONVERT(X'e4bba5e7b0a1e5afabe68c87e5ae9ae6a0bce7b79ae9a085e79baee79a84e58897e8b5b7e9bb9ee88887e7b582e9bb9ee38082e695b8e5ad97e9809ae5b8b8e4bba3e8a1a8e6a0bce7b79ae4bd8de7bdaeefbc8ce4b88de698afe58897e695b8e69cace8baabe38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020677269642d726f773a2031202f207370616e20323b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce6a0bce7b79ae58897e4bd8de7bdaee3808de38082' USING utf8mb4), CONVERT(X'677269642d726f77' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d677269642d322f2370726f706465662d677269642d726f77' USING utf8mb4), CONVERT(X'6373732d677269642d3220435220323032332d31302d3330' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3334' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'677269642d726f77' USING utf8mb4),
display_label = CONVERT(X'e6a0bce7b79ae58897e4bd8de7bdae' USING utf8mb4),
summary = CONVERT(X'e4bba5e7b0a1e5afabe68c87e5ae9ae6a0bce7b79ae9a085e79baee79a84e58897e8b5b7e9bb9ee88887e7b582e9bb9ee38082' USING utf8mb4),
description = CONVERT(X'e4bba5e7b0a1e5afabe68c87e5ae9ae6a0bce7b79ae9a085e79baee79a84e58897e8b5b7e9bb9ee88887e7b582e9bb9ee38082e695b8e5ad97e9809ae5b8b8e4bba3e8a1a8e6a0bce7b79ae4bd8de7bdaeefbc8ce4b88de698afe58897e695b8e69cace8baabe38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020677269642d726f773a2031202f207370616e20323b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce6a0bce7b79ae58897e4bd8de7bdaee3808de38082' USING utf8mb4),
sort_key = CONVERT(X'677269642d726f77' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d677269642d322f2370726f706465662d677269642d726f77' USING utf8mb4),
source_version = CONVERT(X'6373732d677269642d3220435220323032332d31302d3330' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3334' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d677269642d726f77' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'677269642d726f77' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d677269642d61726561' USING utf8mb4), CONVERT(X'677269642d61726561' USING utf8mb4), CONVERT(X'e6a0bce7b79ae58d80e59f9fe4bd8de7bdae' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae6a0bce7b79ae9a085e79baee68980e4bd94e79a84e58d80e59f9fe38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae6a0bce7b79ae9a085e79baee68980e4bd94e79a84e58d80e59f9fe38082e58fafe4bdbfe794a8e591bde5908de58d80e59f9fefbc8ce68896e68c87e5ae9ae58897e88887e6ac84e79a84e8b5b7e8a896e4bd8de7bdaee38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020677269642d617265613a206d61696e3b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce6a0bce7b79ae58d80e59f9fe4bd8de7bdaee3808de38082' USING utf8mb4), CONVERT(X'677269642d61726561' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d677269642d322f2370726f706465662d677269642d61726561' USING utf8mb4), CONVERT(X'6373732d677269642d3220435220323032332d31302d3330' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3334' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'677269642d61726561' USING utf8mb4),
display_label = CONVERT(X'e6a0bce7b79ae58d80e59f9fe4bd8de7bdae' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae6a0bce7b79ae9a085e79baee68980e4bd94e79a84e58d80e59f9fe38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae6a0bce7b79ae9a085e79baee68980e4bd94e79a84e58d80e59f9fe38082e58fafe4bdbfe794a8e591bde5908de58d80e59f9fefbc8ce68896e68c87e5ae9ae58897e88887e6ac84e79a84e8b5b7e8a896e4bd8de7bdaee38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020677269642d617265613a206d61696e3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce6a0bce7b79ae58d80e59f9fe4bd8de7bdaee3808de38082' USING utf8mb4),
sort_key = CONVERT(X'677269642d61726561' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d677269642d322f2370726f706465662d677269642d61726561' USING utf8mb4),
source_version = CONVERT(X'6373732d677269642d3220435220323032332d31302d3330' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3334' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d677269642d61726561' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'677269642d61726561' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d677269642d6175746f2d666c6f77' USING utf8mb4), CONVERT(X'677269642d6175746f2d666c6f77' USING utf8mb4), CONVERT(X'e6a0bce7b79ae887aae58b95e694bee7bdae' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae887aae58b95e694bee7bdaee6a0bce7b79ae9a085e79baee79a84e696b9e59091e88887e5a1abe8a39ce696b9e5bc8fe38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae887aae58b95e694bee7bdaee6a0bce7b79ae9a085e79baee79a84e696b9e59091e88887e5a1abe8a39ce696b9e5bc8fe3808264656e736520e58fafe5a1abe8a39ce58588e5898de7a9bae99a99efbc8ce4bd86e58fafe883bde4bdbfe8a696e8a6bae9a086e5ba8fe88887e69687e4bbb6e9a086e5ba8fe4b88de5908ce38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020677269642d6175746f2d666c6f773a20726f773b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce6a0bce7b79ae887aae58b95e694bee7bdaee3808de38082' USING utf8mb4), CONVERT(X'677269642d6175746f2d666c6f77' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d677269642d322f2370726f706465662d677269642d6175746f2d666c6f77' USING utf8mb4), CONVERT(X'6373732d677269642d3220435220323032332d31302d3330' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3334' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'677269642d6175746f2d666c6f77' USING utf8mb4),
display_label = CONVERT(X'e6a0bce7b79ae887aae58b95e694bee7bdae' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae887aae58b95e694bee7bdaee6a0bce7b79ae9a085e79baee79a84e696b9e59091e88887e5a1abe8a39ce696b9e5bc8fe38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae887aae58b95e694bee7bdaee6a0bce7b79ae9a085e79baee79a84e696b9e59091e88887e5a1abe8a39ce696b9e5bc8fe3808264656e736520e58fafe5a1abe8a39ce58588e5898de7a9bae99a99efbc8ce4bd86e58fafe883bde4bdbfe8a696e8a6bae9a086e5ba8fe88887e69687e4bbb6e9a086e5ba8fe4b88de5908ce38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020677269642d6175746f2d666c6f773a20726f773b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce6a0bce7b79ae887aae58b95e694bee7bdaee3808de38082' USING utf8mb4),
sort_key = CONVERT(X'677269642d6175746f2d666c6f77' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d677269642d322f2370726f706465662d677269642d6175746f2d666c6f77' USING utf8mb4),
source_version = CONVERT(X'6373732d677269642d3220435220323032332d31302d3330' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3334' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d677269642d6175746f2d666c6f77' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'677269642d6175746f2d666c6f77' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d677269642d6175746f2d726f7773' USING utf8mb4), CONVERT(X'677269642d6175746f2d726f7773' USING utf8mb4), CONVERT(X'e99ab1e590abe6a0bce7b79ae58897e5b0bae5afb8' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae99ab1e590abe6a0bce7b79ae58897e79a84e8bb8ce98193e5b0bae5afb8e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae99ab1e590abe6a0bce7b79ae58897e79a84e8bb8ce98193e5b0bae5afb8e38082e795b6e9a085e79baee8b685e587bae6988ee7a2bae58897e8bb8ce98193e69982efbc8ce58fafe794a8e6ada4e5b1ace680a7e68ea7e588b6e887aae58b95e5bbbae7ab8be79a84e58897e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020677269642d6175746f2d726f77733a206d696e6d61782831303070782c206175746f293b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce99ab1e590abe6a0bce7b79ae58897e5b0bae5afb8e3808de38082' USING utf8mb4), CONVERT(X'677269642d6175746f2d726f7773' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d677269642d322f2370726f706465662d677269642d6175746f2d726f7773' USING utf8mb4), CONVERT(X'6373732d677269642d3220435220323032332d31302d3330' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3334' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'677269642d6175746f2d726f7773' USING utf8mb4),
display_label = CONVERT(X'e99ab1e590abe6a0bce7b79ae58897e5b0bae5afb8' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae99ab1e590abe6a0bce7b79ae58897e79a84e8bb8ce98193e5b0bae5afb8e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae99ab1e590abe6a0bce7b79ae58897e79a84e8bb8ce98193e5b0bae5afb8e38082e795b6e9a085e79baee8b685e587bae6988ee7a2bae58897e8bb8ce98193e69982efbc8ce58fafe794a8e6ada4e5b1ace680a7e68ea7e588b6e887aae58b95e5bbbae7ab8be79a84e58897e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020677269642d6175746f2d726f77733a206d696e6d61782831303070782c206175746f293b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce99ab1e590abe6a0bce7b79ae58897e5b0bae5afb8e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'677269642d6175746f2d726f7773' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d677269642d322f2370726f706465662d677269642d6175746f2d726f7773' USING utf8mb4),
source_version = CONVERT(X'6373732d677269642d3220435220323032332d31302d3330' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3334' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d677269642d6175746f2d726f7773' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'677269642d6175746f2d726f7773' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d706c6163652d6974656d73' USING utf8mb4), CONVERT(X'706c6163652d6974656d73' USING utf8mb4), CONVERT(X'e99b99e8bbb8e9a085e79baee5b08de9bd8a' USING utf8mb4), CONVERT(X'e4bba5e7b0a1e5afabe8a8ade5ae9a20616c69676e2d6974656d7320e88887206a7573746966792d6974656d73e38082' USING utf8mb4), CONVERT(X'e4bba5e7b0a1e5afabe8a8ade5ae9a20616c69676e2d6974656d7320e88887206a7573746966792d6974656d73e38082e5b8b8e794a8e696bc204772696420e8ae93e9a085e79baee59ca8e585a9e5808be696b9e59091e5b08de9bd8ae38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020706c6163652d6974656d733a2063656e7465723b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce99b99e8bbb8e9a085e79baee5b08de9bd8ae3808de38082' USING utf8mb4), CONVERT(X'706c6163652d6974656d73' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d616c69676e2d332f2370726f706465662d706c6163652d6974656d73' USING utf8mb4), CONVERT(X'6373732d616c69676e2d3320454420323032362d31302d3231' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3231' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'706c6163652d6974656d73' USING utf8mb4),
display_label = CONVERT(X'e99b99e8bbb8e9a085e79baee5b08de9bd8a' USING utf8mb4),
summary = CONVERT(X'e4bba5e7b0a1e5afabe8a8ade5ae9a20616c69676e2d6974656d7320e88887206a7573746966792d6974656d73e38082' USING utf8mb4),
description = CONVERT(X'e4bba5e7b0a1e5afabe8a8ade5ae9a20616c69676e2d6974656d7320e88887206a7573746966792d6974656d73e38082e5b8b8e794a8e696bc204772696420e8ae93e9a085e79baee59ca8e585a9e5808be696b9e59091e5b08de9bd8ae38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020706c6163652d6974656d733a2063656e7465723b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce99b99e8bbb8e9a085e79baee5b08de9bd8ae3808de38082' USING utf8mb4),
sort_key = CONVERT(X'706c6163652d6974656d73' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d616c69676e2d332f2370726f706465662d706c6163652d6974656d73' USING utf8mb4),
source_version = CONVERT(X'6373732d616c69676e2d3320454420323032362d31302d3231' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3231' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d706c6163652d6974656d73' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'706c6163652d6974656d73' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d6a7573746966792d6974656d73' USING utf8mb4), CONVERT(X'6a7573746966792d6974656d73' USING utf8mb4), CONVERT(X'e8a18ce585a7e8bbb8e9a085e79baee5b08de9bd8a' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae9a085e79baee59ca8e585b6e5b08de9bd8ae5aeb9e599a8e4b8ade79a84e9a090e8a8ade8a18ce585a7e8bbb8e5b08de9bd8ae696b9e5bc8fe38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae9a085e79baee59ca8e585b6e5b08de9bd8ae5aeb9e599a8e4b8ade79a84e9a090e8a8ade8a18ce585a7e8bbb8e5b08de9bd8ae696b9e5bc8fe38082e5b8b8e794a8e696bc2047726964efbc9be4b88de4bba5e6ada4e5b1ace680a7e5b08de9bd8a20466c6578626f7820e4b8bbe8bbb8e9a085e79baee38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20206a7573746966792d6974656d733a2063656e7465723b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8a18ce585a7e8bbb8e9a085e79baee5b08de9bd8ae3808de38082' USING utf8mb4), CONVERT(X'6a7573746966792d6974656d73' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d616c69676e2d332f2370726f706465662d6a7573746966792d6974656d73' USING utf8mb4), CONVERT(X'6373732d616c69676e2d3320454420323032362d31302d3231' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3231' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'6a7573746966792d6974656d73' USING utf8mb4),
display_label = CONVERT(X'e8a18ce585a7e8bbb8e9a085e79baee5b08de9bd8a' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae9a085e79baee59ca8e585b6e5b08de9bd8ae5aeb9e599a8e4b8ade79a84e9a090e8a8ade8a18ce585a7e8bbb8e5b08de9bd8ae696b9e5bc8fe38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae9a085e79baee59ca8e585b6e5b08de9bd8ae5aeb9e599a8e4b8ade79a84e9a090e8a8ade8a18ce585a7e8bbb8e5b08de9bd8ae696b9e5bc8fe38082e5b8b8e794a8e696bc2047726964efbc9be4b88de4bba5e6ada4e5b1ace680a7e5b08de9bd8a20466c6578626f7820e4b8bbe8bbb8e9a085e79baee38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20206a7573746966792d6974656d733a2063656e7465723b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8a18ce585a7e8bbb8e9a085e79baee5b08de9bd8ae3808de38082' USING utf8mb4),
sort_key = CONVERT(X'6a7573746966792d6974656d73' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d616c69676e2d332f2370726f706465662d6a7573746966792d6974656d73' USING utf8mb4),
source_version = CONVERT(X'6373732d616c69676e2d3320454420323032362d31302d3231' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3231' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d6a7573746966792d6974656d73' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'6a7573746966792d6974656d73' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d6f626a6563742d666974' USING utf8mb4), CONVERT(X'6f626a6563742d666974' USING utf8mb4), CONVERT(X'e69bbfe68f9be585a7e5aeb9e7b8aee694be' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae59c96e78987e68896e5bdb1e78987e7ad89e69bbfe68f9be585a7e5aeb9e5a682e4bd95e694bee585a5e585a7e5aeb9e79b92e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae59c96e78987e68896e5bdb1e78987e7ad89e69bbfe68f9be585a7e5aeb9e5a682e4bd95e694bee585a5e585a7e5aeb9e79b92e38082636f76657220e4bf9de68c81e6af94e4be8be5a1abe6bbbfe4b894e58fafe883bde8a381e58887efbc9b636f6e7461696e20e4bf9de68c81e6af94e4be8be5ae8ce695b4e5aeb9e7b48de38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20206f626a6563742d6669743a20636f7665723b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce69bbfe68f9be585a7e5aeb9e7b8aee694bee3808de38082' USING utf8mb4), CONVERT(X'6f626a6563742d666974' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d696d616765732d342f2370726f706465662d6f626a6563742d666974' USING utf8mb4), CONVERT(X'6373732d696d616765732d3420454420323032362d31312d3033' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3435' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'6f626a6563742d666974' USING utf8mb4),
display_label = CONVERT(X'e69bbfe68f9be585a7e5aeb9e7b8aee694be' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae59c96e78987e68896e5bdb1e78987e7ad89e69bbfe68f9be585a7e5aeb9e5a682e4bd95e694bee585a5e585a7e5aeb9e79b92e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae59c96e78987e68896e5bdb1e78987e7ad89e69bbfe68f9be585a7e5aeb9e5a682e4bd95e694bee585a5e585a7e5aeb9e79b92e38082636f76657220e4bf9de68c81e6af94e4be8be5a1abe6bbbfe4b894e58fafe883bde8a381e58887efbc9b636f6e7461696e20e4bf9de68c81e6af94e4be8be5ae8ce695b4e5aeb9e7b48de38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20206f626a6563742d6669743a20636f7665723b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce69bbfe68f9be585a7e5aeb9e7b8aee694bee3808de38082' USING utf8mb4),
sort_key = CONVERT(X'6f626a6563742d666974' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d696d616765732d342f2370726f706465662d6f626a6563742d666974' USING utf8mb4),
source_version = CONVERT(X'6373732d696d616765732d3420454420323032362d31312d3033' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3435' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d6f626a6563742d666974' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'6f626a6563742d666974' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d6f626a6563742d706f736974696f6e' USING utf8mb4), CONVERT(X'6f626a6563742d706f736974696f6e' USING utf8mb4), CONVERT(X'e69bbfe68f9be585a7e5aeb9e4bd8de7bdae' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae59c96e78987e68896e5bdb1e78987e7ad89e69bbfe68f9be585a7e5aeb9e59ca8e585a7e5aeb9e79b92e4b8ade79a84e4bd8de7bdaee38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae59c96e78987e68896e5bdb1e78987e7ad89e69bbfe68f9be585a7e5aeb9e59ca8e585a7e5aeb9e79b92e4b8ade79a84e4bd8de7bdaee38082e5b8b8e690ade9858d206f626a6563742d66697420e8aabfe695b4e8a381e58887e79a84e8a696e8a6bae4b8ade5bf83e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20206f626a6563742d706f736974696f6e3a2063656e7465723b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce69bbfe68f9be585a7e5aeb9e4bd8de7bdaee3808de38082' USING utf8mb4), CONVERT(X'6f626a6563742d706f736974696f6e' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d696d616765732d332f2370726f706465662d6f626a6563742d706f736974696f6e' USING utf8mb4), CONVERT(X'6373732d696d616765732d3320454420323032362d31302d3038' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3434' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'6f626a6563742d706f736974696f6e' USING utf8mb4),
display_label = CONVERT(X'e69bbfe68f9be585a7e5aeb9e4bd8de7bdae' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae59c96e78987e68896e5bdb1e78987e7ad89e69bbfe68f9be585a7e5aeb9e59ca8e585a7e5aeb9e79b92e4b8ade79a84e4bd8de7bdaee38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae59c96e78987e68896e5bdb1e78987e7ad89e69bbfe68f9be585a7e5aeb9e59ca8e585a7e5aeb9e79b92e4b8ade79a84e4bd8de7bdaee38082e5b8b8e690ade9858d206f626a6563742d66697420e8aabfe695b4e8a381e58887e79a84e8a696e8a6bae4b8ade5bf83e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20206f626a6563742d706f736974696f6e3a2063656e7465723b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce69bbfe68f9be585a7e5aeb9e4bd8de7bdaee3808de38082' USING utf8mb4),
sort_key = CONVERT(X'6f626a6563742d706f736974696f6e' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d696d616765732d332f2370726f706465662d6f626a6563742d706f736974696f6e' USING utf8mb4),
source_version = CONVERT(X'6373732d696d616765732d3320454420323032362d31302d3038' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3434' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d6f626a6563742d706f736974696f6e' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'6f626a6563742d706f736974696f6e' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d7472616e73666f726d' USING utf8mb4), CONVERT(X'7472616e73666f726d' USING utf8mb4), CONVERT(X'e5b9bee4bd95e8ae8ae5bda2' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae5b9b3e7a7bbe38081e6978be8bd89e38081e7b8aee694bee7ad89e8ae8ae5bda2e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae5b9b3e7a7bbe38081e6978be8bd89e38081e7b8aee694bee7ad89e8ae8ae5bda2e38082e58fafe4b8b2e68ea5e5a49ae5808be8ae8ae5bda2e587bde5bc8fefbc8ce9a086e5ba8fe69c83e5bdb1e99fbfe69c80e7b582e7b590e69e9ce38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20207472616e73666f726d3a207472616e736c61746559282d327078293b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5b9bee4bd95e8ae8ae5bda2e3808de38082' USING utf8mb4), CONVERT(X'7472616e73666f726d' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d7472616e73666f726d732d312f2370726f706465662d7472616e73666f726d' USING utf8mb4), CONVERT(X'6373732d7472616e73666f726d732d3120454420323032352d31312d3330' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3130' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'7472616e73666f726d' USING utf8mb4),
display_label = CONVERT(X'e5b9bee4bd95e8ae8ae5bda2' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae5b9b3e7a7bbe38081e6978be8bd89e38081e7b8aee694bee7ad89e8ae8ae5bda2e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae5b9b3e7a7bbe38081e6978be8bd89e38081e7b8aee694bee7ad89e8ae8ae5bda2e38082e58fafe4b8b2e68ea5e5a49ae5808be8ae8ae5bda2e587bde5bc8fefbc8ce9a086e5ba8fe69c83e5bdb1e99fbfe69c80e7b582e7b590e69e9ce38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20207472616e73666f726d3a207472616e736c61746559282d327078293b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce5b9bee4bd95e8ae8ae5bda2e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'7472616e73666f726d' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d7472616e73666f726d732d312f2370726f706465662d7472616e73666f726d' USING utf8mb4),
source_version = CONVERT(X'6373732d7472616e73666f726d732d3120454420323032352d31312d3330' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3130' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d7472616e73666f726d' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'7472616e73666f726d' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d7472616e73666f726d2d6f726967696e' USING utf8mb4), CONVERT(X'7472616e73666f726d2d6f726967696e' USING utf8mb4), CONVERT(X'e8ae8ae5bda2e59fbae6ba96e9bb9e' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae8ae8ae5bda2e4bdbfe794a8e79a84e59fbae6ba96e9bb9ee38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae8ae8ae5bda2e4bdbfe794a8e79a84e59fbae6ba96e9bb9ee38082e6978be8bd89e68896e7b8aee694bee69982e58fafe68c87e5ae9ae4b8ade5bf83e38081e8a792e890bde68896e585b6e4bb96e4bd8de7bdaee38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20207472616e73666f726d2d6f726967696e3a2063656e74657220626f74746f6d3b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8ae8ae5bda2e59fbae6ba96e9bb9ee3808de38082' USING utf8mb4), CONVERT(X'7472616e73666f726d2d6f726967696e' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d7472616e73666f726d732d312f2370726f706465662d7472616e73666f726d2d6f726967696e' USING utf8mb4), CONVERT(X'6373732d7472616e73666f726d732d3120454420323032352d31312d3330' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3130' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'7472616e73666f726d2d6f726967696e' USING utf8mb4),
display_label = CONVERT(X'e8ae8ae5bda2e59fbae6ba96e9bb9e' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae8ae8ae5bda2e4bdbfe794a8e79a84e59fbae6ba96e9bb9ee38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae8ae8ae5bda2e4bdbfe794a8e79a84e59fbae6ba96e9bb9ee38082e6978be8bd89e68896e7b8aee694bee69982e58fafe68c87e5ae9ae4b8ade5bf83e38081e8a792e890bde68896e585b6e4bb96e4bd8de7bdaee38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20207472616e73666f726d2d6f726967696e3a2063656e74657220626f74746f6d3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8ae8ae5bda2e59fbae6ba96e9bb9ee3808de38082' USING utf8mb4),
sort_key = CONVERT(X'7472616e73666f726d2d6f726967696e' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d7472616e73666f726d732d312f2370726f706465662d7472616e73666f726d2d6f726967696e' USING utf8mb4),
source_version = CONVERT(X'6373732d7472616e73666f726d732d3120454420323032352d31312d3330' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3130' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d7472616e73666f726d2d6f726967696e' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'7472616e73666f726d2d6f726967696e' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d7472616e736974696f6e' USING utf8mb4), CONVERT(X'7472616e736974696f6e' USING utf8mb4), CONVERT(X'e8bd89e5a0b4e7b0a1e5afab' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae5b1ace680a7e580bce694b9e8ae8ae69982e79a84e8bd89e5a0b4e69588e69e9ce38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae5b1ace680a7e580bce694b9e8ae8ae69982e79a84e8bd89e5a0b4e69588e69e9ce38082e58fafe68c87e5ae9ae79baee6a899e5b1ace680a7e38081e68c81e7ba8ce69982e99693e38081e69982e99693e587bde5bc8fe88887e5bbb6e981b2efbc8ce5a49ae7b584e8a8ade5ae9ae4bba5e98097e8999fe58886e99a94e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20207472616e736974696f6e3a206f706163697479203230306d7320656173653b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8bd89e5a0b4e7b0a1e5afabe3808de38082' USING utf8mb4), CONVERT(X'7472616e736974696f6e' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d7472616e736974696f6e732d312f2370726f706465662d7472616e736974696f6e' USING utf8mb4), CONVERT(X'6373732d7472616e736974696f6e732d3120574420323032362d31302d3038' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3130' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'7472616e736974696f6e' USING utf8mb4),
display_label = CONVERT(X'e8bd89e5a0b4e7b0a1e5afab' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae5b1ace680a7e580bce694b9e8ae8ae69982e79a84e8bd89e5a0b4e69588e69e9ce38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae5b1ace680a7e580bce694b9e8ae8ae69982e79a84e8bd89e5a0b4e69588e69e9ce38082e58fafe68c87e5ae9ae79baee6a899e5b1ace680a7e38081e68c81e7ba8ce69982e99693e38081e69982e99693e587bde5bc8fe88887e5bbb6e981b2efbc8ce5a49ae7b584e8a8ade5ae9ae4bba5e98097e8999fe58886e99a94e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20207472616e736974696f6e3a206f706163697479203230306d7320656173653b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8bd89e5a0b4e7b0a1e5afabe3808de38082' USING utf8mb4),
sort_key = CONVERT(X'7472616e736974696f6e' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d7472616e736974696f6e732d312f2370726f706465662d7472616e736974696f6e' USING utf8mb4),
source_version = CONVERT(X'6373732d7472616e736974696f6e732d3120574420323032362d31302d3038' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3130' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d7472616e736974696f6e' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'7472616e736974696f6e' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d7472616e736974696f6e2d70726f7065727479' USING utf8mb4), CONVERT(X'7472616e736974696f6e2d70726f7065727479' USING utf8mb4), CONVERT(X'e8bd89e5a0b4e79baee6a899e5b1ace680a7' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae593aae4ba9be5b1ace680a7e580bce79a84e694b9e8ae8ae8a681e5a597e794a8e8bd89e5a0b4e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae593aae4ba9be5b1ace680a7e580bce79a84e694b9e8ae8ae8a681e5a597e794a8e8bd89e5a0b4e38082e4b88de698afe6af8fe5808be5b1ace680a7e68896e580bce983bde883bde4bba5e79bb8e5908ce696b9e5bc8fe5b9b3e6bb91e68f92e580bce38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20207472616e736974696f6e2d70726f70657274793a206f7061636974792c207472616e73666f726d3b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8bd89e5a0b4e79baee6a899e5b1ace680a7e3808de38082' USING utf8mb4), CONVERT(X'7472616e736974696f6e2d70726f7065727479' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d7472616e736974696f6e732d312f2370726f706465662d7472616e736974696f6e2d70726f7065727479' USING utf8mb4), CONVERT(X'6373732d7472616e736974696f6e732d3120574420323032362d31302d3038' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3130' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'7472616e736974696f6e2d70726f7065727479' USING utf8mb4),
display_label = CONVERT(X'e8bd89e5a0b4e79baee6a899e5b1ace680a7' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae593aae4ba9be5b1ace680a7e580bce79a84e694b9e8ae8ae8a681e5a597e794a8e8bd89e5a0b4e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae593aae4ba9be5b1ace680a7e580bce79a84e694b9e8ae8ae8a681e5a597e794a8e8bd89e5a0b4e38082e4b88de698afe6af8fe5808be5b1ace680a7e68896e580bce983bde883bde4bba5e79bb8e5908ce696b9e5bc8fe5b9b3e6bb91e68f92e580bce38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20207472616e736974696f6e2d70726f70657274793a206f7061636974792c207472616e73666f726d3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8bd89e5a0b4e79baee6a899e5b1ace680a7e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'7472616e736974696f6e2d70726f7065727479' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d7472616e736974696f6e732d312f2370726f706465662d7472616e736974696f6e2d70726f7065727479' USING utf8mb4),
source_version = CONVERT(X'6373732d7472616e736974696f6e732d3120574420323032362d31302d3038' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3130' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d7472616e736974696f6e2d70726f7065727479' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'7472616e736974696f6e2d70726f7065727479' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d7472616e736974696f6e2d6475726174696f6e' USING utf8mb4), CONVERT(X'7472616e736974696f6e2d6475726174696f6e' USING utf8mb4), CONVERT(X'e8bd89e5a0b4e68c81e7ba8ce69982e99693' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae8bd89e5a0b4e5ae8ce68890e68980e99c80e79a84e69982e99693e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae8bd89e5a0b4e5ae8ce68890e68980e99c80e79a84e69982e99693e38082e4bba5207320e68896206d7320e68c87e5ae9aefbc8ce58fafe68f90e4be9be98097e8999fe58886e99a94e79a84e69982e99693e6b885e596aee38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20207472616e736974696f6e2d6475726174696f6e3a203230306d733b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8bd89e5a0b4e68c81e7ba8ce69982e99693e3808de38082' USING utf8mb4), CONVERT(X'7472616e736974696f6e2d6475726174696f6e' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d7472616e736974696f6e732d312f2370726f706465662d7472616e736974696f6e2d6475726174696f6e' USING utf8mb4), CONVERT(X'6373732d7472616e736974696f6e732d3120574420323032362d31302d3038' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3130' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'7472616e736974696f6e2d6475726174696f6e' USING utf8mb4),
display_label = CONVERT(X'e8bd89e5a0b4e68c81e7ba8ce69982e99693' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae8bd89e5a0b4e5ae8ce68890e68980e99c80e79a84e69982e99693e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae8bd89e5a0b4e5ae8ce68890e68980e99c80e79a84e69982e99693e38082e4bba5207320e68896206d7320e68c87e5ae9aefbc8ce58fafe68f90e4be9be98097e8999fe58886e99a94e79a84e69982e99693e6b885e596aee38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20207472616e736974696f6e2d6475726174696f6e3a203230306d733b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8bd89e5a0b4e68c81e7ba8ce69982e99693e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'7472616e736974696f6e2d6475726174696f6e' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d7472616e736974696f6e732d312f2370726f706465662d7472616e736974696f6e2d6475726174696f6e' USING utf8mb4),
source_version = CONVERT(X'6373732d7472616e736974696f6e732d3120574420323032362d31302d3038' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3130' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d7472616e736974696f6e2d6475726174696f6e' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'7472616e736974696f6e2d6475726174696f6e' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d7472616e736974696f6e2d74696d696e672d66756e6374696f6e' USING utf8mb4), CONVERT(X'7472616e736974696f6e2d74696d696e672d66756e6374696f6e' USING utf8mb4), CONVERT(X'e8bd89e5a0b4e69982e99693e587bde5bc8f' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae8bd89e5a0b4e99aa8e69982e99693e68ea8e980b2e79a84e9809fe5baa6e69bb2e7b79ae38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae8bd89e5a0b4e99aa8e69982e99693e68ea8e980b2e79a84e9809fe5baa6e69bb2e7b79ae38082e58fafe4bdbfe794a82065617365e380816c696e656172e3808163756269632d62657a696572282920e7ad89e5afabe6b395e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20207472616e736974696f6e2d74696d696e672d66756e6374696f6e3a20656173652d696e2d6f75743b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8bd89e5a0b4e69982e99693e587bde5bc8fe3808de38082' USING utf8mb4), CONVERT(X'7472616e736974696f6e2d74696d696e672d66756e6374696f6e' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d7472616e736974696f6e732d312f2370726f706465662d7472616e736974696f6e2d74696d696e672d66756e6374696f6e' USING utf8mb4), CONVERT(X'6373732d7472616e736974696f6e732d3120574420323032362d31302d3038' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3130' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'7472616e736974696f6e2d74696d696e672d66756e6374696f6e' USING utf8mb4),
display_label = CONVERT(X'e8bd89e5a0b4e69982e99693e587bde5bc8f' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae8bd89e5a0b4e99aa8e69982e99693e68ea8e980b2e79a84e9809fe5baa6e69bb2e7b79ae38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae8bd89e5a0b4e99aa8e69982e99693e68ea8e980b2e79a84e9809fe5baa6e69bb2e7b79ae38082e58fafe4bdbfe794a82065617365e380816c696e656172e3808163756269632d62657a696572282920e7ad89e5afabe6b395e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20207472616e736974696f6e2d74696d696e672d66756e6374696f6e3a20656173652d696e2d6f75743b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8bd89e5a0b4e69982e99693e587bde5bc8fe3808de38082' USING utf8mb4),
sort_key = CONVERT(X'7472616e736974696f6e2d74696d696e672d66756e6374696f6e' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d7472616e736974696f6e732d312f2370726f706465662d7472616e736974696f6e2d74696d696e672d66756e6374696f6e' USING utf8mb4),
source_version = CONVERT(X'6373732d7472616e736974696f6e732d3120574420323032362d31302d3038' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3130' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d7472616e736974696f6e2d74696d696e672d66756e6374696f6e' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'7472616e736974696f6e2d74696d696e672d66756e6374696f6e' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d616e696d6174696f6e' USING utf8mb4), CONVERT(X'616e696d6174696f6e' USING utf8mb4), CONVERT(X'e58b95e795abe7b0a1e5afab' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae9979ce98db5e5bdb1e6a0bce58b95e795abe58f8ae585b6e692ade694bee696b9e5bc8fe38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae9979ce98db5e5bdb1e6a0bce58b95e795abe58f8ae585b6e692ade694bee696b9e5bc8fe38082e5b8b8e690ade9858d20406b65796672616d657320e5ae9ae7bea9e58b95e795abe585a7e5aeb9efbc9be58fafe68c87e5ae9ae5908de7a8b1e38081e69982e99693e38081e6aca1e695b8e7ad89e8a8ade5ae9ae38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020616e696d6174696f6e3a2066616465203173206561736520626f74683b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce58b95e795abe7b0a1e5afabe3808de38082' USING utf8mb4), CONVERT(X'616e696d6174696f6e' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d616e696d6174696f6e732d312f2370726f706465662d616e696d6174696f6e' USING utf8mb4), CONVERT(X'6373732d616e696d6174696f6e732d3120454420323032362d30392d3133' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3236' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'616e696d6174696f6e' USING utf8mb4),
display_label = CONVERT(X'e58b95e795abe7b0a1e5afab' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae9979ce98db5e5bdb1e6a0bce58b95e795abe58f8ae585b6e692ade694bee696b9e5bc8fe38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae9979ce98db5e5bdb1e6a0bce58b95e795abe58f8ae585b6e692ade694bee696b9e5bc8fe38082e5b8b8e690ade9858d20406b65796672616d657320e5ae9ae7bea9e58b95e795abe585a7e5aeb9efbc9be58fafe68c87e5ae9ae5908de7a8b1e38081e69982e99693e38081e6aca1e695b8e7ad89e8a8ade5ae9ae38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020616e696d6174696f6e3a2066616465203173206561736520626f74683b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce58b95e795abe7b0a1e5afabe3808de38082' USING utf8mb4),
sort_key = CONVERT(X'616e696d6174696f6e' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d616e696d6174696f6e732d312f2370726f706465662d616e696d6174696f6e' USING utf8mb4),
source_version = CONVERT(X'6373732d616e696d6174696f6e732d3120454420323032362d30392d3133' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3236' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d616e696d6174696f6e' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'616e696d6174696f6e' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d616e696d6174696f6e2d6e616d65' USING utf8mb4), CONVERT(X'616e696d6174696f6e2d6e616d65' USING utf8mb4), CONVERT(X'e58b95e795abe5908de7a8b1' USING utf8mb4), CONVERT(X'e68c87e5ae9ae8a681e4bdbfe794a8e79a84e9979ce98db5e5bdb1e6a0bce58b95e795abe5908de7a8b1e38082' USING utf8mb4), CONVERT(X'e68c87e5ae9ae8a681e4bdbfe794a8e79a84e9979ce98db5e5bdb1e6a0bce58b95e795abe5908de7a8b1e38082e5908de7a8b1e5b08de6878920406b65796672616d6573efbc8c6e6f6e6520e8a1a8e7a4bae4b88de5a597e794a8e8a9b2e58b95e795abe38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020616e696d6174696f6e2d6e616d653a20666164653b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce58b95e795abe5908de7a8b1e3808de38082' USING utf8mb4), CONVERT(X'616e696d6174696f6e2d6e616d65' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d616e696d6174696f6e732d312f2370726f706465662d616e696d6174696f6e2d6e616d65' USING utf8mb4), CONVERT(X'6373732d616e696d6174696f6e732d3120454420323032362d30392d3133' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3236' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'616e696d6174696f6e2d6e616d65' USING utf8mb4),
display_label = CONVERT(X'e58b95e795abe5908de7a8b1' USING utf8mb4),
summary = CONVERT(X'e68c87e5ae9ae8a681e4bdbfe794a8e79a84e9979ce98db5e5bdb1e6a0bce58b95e795abe5908de7a8b1e38082' USING utf8mb4),
description = CONVERT(X'e68c87e5ae9ae8a681e4bdbfe794a8e79a84e9979ce98db5e5bdb1e6a0bce58b95e795abe5908de7a8b1e38082e5908de7a8b1e5b08de6878920406b65796672616d6573efbc8c6e6f6e6520e8a1a8e7a4bae4b88de5a597e794a8e8a9b2e58b95e795abe38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020616e696d6174696f6e2d6e616d653a20666164653b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce58b95e795abe5908de7a8b1e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'616e696d6174696f6e2d6e616d65' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d616e696d6174696f6e732d312f2370726f706465662d616e696d6174696f6e2d6e616d65' USING utf8mb4),
source_version = CONVERT(X'6373732d616e696d6174696f6e732d3120454420323032362d30392d3133' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3236' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d616e696d6174696f6e2d6e616d65' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'616e696d6174696f6e2d6e616d65' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d616e696d6174696f6e2d6475726174696f6e' USING utf8mb4), CONVERT(X'616e696d6174696f6e2d6475726174696f6e' USING utf8mb4), CONVERT(X'e58b95e795abe68c81e7ba8ce69982e99693' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58b95e795abe596aee6aca1e5beaae792b0e79a84e68c81e7ba8ce69982e99693e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58b95e795abe596aee6aca1e5beaae792b0e79a84e68c81e7ba8ce69982e99693e38082e58fafe794a8207320e68896206d7320e68c87e5ae9aefbc8ce4b8a6e58fafe782bae5a49ae5808be58b95e795abe58886e588a5e8a8ade5ae9ae38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020616e696d6174696f6e2d6475726174696f6e3a2031733b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce58b95e795abe68c81e7ba8ce69982e99693e3808de38082' USING utf8mb4), CONVERT(X'616e696d6174696f6e2d6475726174696f6e' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d616e696d6174696f6e732d322f2370726f706465662d616e696d6174696f6e2d6475726174696f6e' USING utf8mb4), CONVERT(X'6373732d616e696d6174696f6e732d3220454420323032362d30382d3138' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3237' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'616e696d6174696f6e2d6475726174696f6e' USING utf8mb4),
display_label = CONVERT(X'e58b95e795abe68c81e7ba8ce69982e99693' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae58b95e795abe596aee6aca1e5beaae792b0e79a84e68c81e7ba8ce69982e99693e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae58b95e795abe596aee6aca1e5beaae792b0e79a84e68c81e7ba8ce69982e99693e38082e58fafe794a8207320e68896206d7320e68c87e5ae9aefbc8ce4b8a6e58fafe782bae5a49ae5808be58b95e795abe58886e588a5e8a8ade5ae9ae38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020616e696d6174696f6e2d6475726174696f6e3a2031733b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce58b95e795abe68c81e7ba8ce69982e99693e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'616e696d6174696f6e2d6475726174696f6e' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d616e696d6174696f6e732d322f2370726f706465662d616e696d6174696f6e2d6475726174696f6e' USING utf8mb4),
source_version = CONVERT(X'6373732d616e696d6174696f6e732d3220454420323032362d30382d3138' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3237' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d616e696d6174696f6e2d6475726174696f6e' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'616e696d6174696f6e2d6475726174696f6e' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d616e696d6174696f6e2d697465726174696f6e2d636f756e74' USING utf8mb4), CONVERT(X'616e696d6174696f6e2d697465726174696f6e2d636f756e74' USING utf8mb4), CONVERT(X'e58b95e795abe9878de8a487e6aca1e695b8' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58b95e795abe9878de8a487e692ade694bee79a84e6aca1e695b8e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58b95e795abe9878de8a487e692ade694bee79a84e6aca1e695b8e38082e58fafe4bdbfe794a8e99d9ee8b2a0e695b8e6889620696e66696e697465e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020616e696d6174696f6e2d697465726174696f6e2d636f756e743a20696e66696e6974653b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce58b95e795abe9878de8a487e6aca1e695b8e3808de38082' USING utf8mb4), CONVERT(X'616e696d6174696f6e2d697465726174696f6e2d636f756e74' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d616e696d6174696f6e732d312f2370726f706465662d616e696d6174696f6e2d697465726174696f6e2d636f756e74' USING utf8mb4), CONVERT(X'6373732d616e696d6174696f6e732d3120454420323032362d30392d3133' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3236' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'616e696d6174696f6e2d697465726174696f6e2d636f756e74' USING utf8mb4),
display_label = CONVERT(X'e58b95e795abe9878de8a487e6aca1e695b8' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae58b95e795abe9878de8a487e692ade694bee79a84e6aca1e695b8e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae58b95e795abe9878de8a487e692ade694bee79a84e6aca1e695b8e38082e58fafe4bdbfe794a8e99d9ee8b2a0e695b8e6889620696e66696e697465e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020616e696d6174696f6e2d697465726174696f6e2d636f756e743a20696e66696e6974653b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce58b95e795abe9878de8a487e6aca1e695b8e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'616e696d6174696f6e2d697465726174696f6e2d636f756e74' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d616e696d6174696f6e732d312f2370726f706465662d616e696d6174696f6e2d697465726174696f6e2d636f756e74' USING utf8mb4),
source_version = CONVERT(X'6373732d616e696d6174696f6e732d3120454420323032362d30392d3133' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3236' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d616e696d6174696f6e2d697465726174696f6e2d636f756e74' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'616e696d6174696f6e2d697465726174696f6e2d636f756e74' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d637572736f72' USING utf8mb4), CONVERT(X'637572736f72' USING utf8mb4), CONVERT(X'e6bb91e9bca0e6b8b8e6a899' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae6b8b8e6a899e7a7bbe588b0e58583e7b4a0e4b88ae696b9e69982e4bdbfe794a8e79a84e5a496e8a780e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae6b8b8e6a899e7a7bbe588b0e58583e7b4a0e4b88ae696b9e69982e4bdbfe794a8e79a84e5a496e8a780e38082706f696e74657220e5b8b8e794a8e696bce58fafe9bb9ee6938ae9a085e79baeefbc8ce4bd86e4b88de69c83e887aae8a18ce8ae93e58583e7b4a0e585b7e69c89e68c89e98895e79a84e8aa9ee6848fe88887e8a18ce782bae38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020637572736f723a20706f696e7465723b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce6bb91e9bca0e6b8b8e6a899e3808de38082' USING utf8mb4), CONVERT(X'637572736f72' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d75692d342f2370726f706465662d637572736f72' USING utf8mb4), CONVERT(X'6373732d75692d3420574420323032362d31302d3135' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3137' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'637572736f72' USING utf8mb4),
display_label = CONVERT(X'e6bb91e9bca0e6b8b8e6a899' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae6b8b8e6a899e7a7bbe588b0e58583e7b4a0e4b88ae696b9e69982e4bdbfe794a8e79a84e5a496e8a780e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae6b8b8e6a899e7a7bbe588b0e58583e7b4a0e4b88ae696b9e69982e4bdbfe794a8e79a84e5a496e8a780e38082706f696e74657220e5b8b8e794a8e696bce58fafe9bb9ee6938ae9a085e79baeefbc8ce4bd86e4b88de69c83e887aae8a18ce8ae93e58583e7b4a0e585b7e69c89e68c89e98895e79a84e8aa9ee6848fe88887e8a18ce782bae38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020637572736f723a20706f696e7465723b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce6bb91e9bca0e6b8b8e6a899e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'637572736f72' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d75692d342f2370726f706465662d637572736f72' USING utf8mb4),
source_version = CONVERT(X'6373732d75692d3420574420323032362d31302d3135' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3137' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d637572736f72' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'637572736f72' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d706f696e7465722d6576656e7473' USING utf8mb4), CONVERT(X'706f696e7465722d6576656e7473' USING utf8mb4), CONVERT(X'e68c87e6a899e4ba8be4bbb6e591bde4b8ad' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e698afe590a6e58fafe68890e782bae68c87e6a899e4ba8be4bbb6e591bde4b8ade79a84e79baee6a899e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e698afe590a6e58fafe68890e782bae68c87e6a899e4ba8be4bbb6e591bde4b8ade79a84e79baee6a899e380826e6f6e6520e4b88de69c83e887aae58b95e58f96e6b688e98db5e79ba4e784a6e9bb9ee68896e7a7bbe999a4e58583e7b4a0e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020706f696e7465722d6576656e74733a206e6f6e653b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce68c87e6a899e4ba8be4bbb6e591bde4b8ade3808de38082' USING utf8mb4), CONVERT(X'706f696e7465722d6576656e7473' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d75692d342f2370726f706465662d706f696e7465722d6576656e7473' USING utf8mb4), CONVERT(X'6373732d75692d3420574420323032362d31302d3135' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3137' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'706f696e7465722d6576656e7473' USING utf8mb4),
display_label = CONVERT(X'e68c87e6a899e4ba8be4bbb6e591bde4b8ad' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e698afe590a6e58fafe68890e782bae68c87e6a899e4ba8be4bbb6e591bde4b8ade79a84e79baee6a899e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e698afe590a6e58fafe68890e782bae68c87e6a899e4ba8be4bbb6e591bde4b8ade79a84e79baee6a899e380826e6f6e6520e4b88de69c83e887aae58b95e58f96e6b688e98db5e79ba4e784a6e9bb9ee68896e7a7bbe999a4e58583e7b4a0e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020706f696e7465722d6576656e74733a206e6f6e653b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce68c87e6a899e4ba8be4bbb6e591bde4b8ade3808de38082' USING utf8mb4),
sort_key = CONVERT(X'706f696e7465722d6576656e7473' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d75692d342f2370726f706465662d706f696e7465722d6576656e7473' USING utf8mb4),
source_version = CONVERT(X'6373732d75692d3420574420323032362d31302d3135' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3137' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d706f696e7465722d6576656e7473' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'706f696e7465722d6576656e7473' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d757365722d73656c656374' USING utf8mb4), CONVERT(X'757365722d73656c656374' USING utf8mb4), CONVERT(X'e69687e5ad97e981b8e58f96' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae4bdbfe794a8e88085e698afe590a6e58f8ae5a682e4bd95e981b8e58f96e69687e5ad97e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae4bdbfe794a8e88085e698afe590a6e58f8ae5a682e4bd95e981b8e58f96e69687e5ad97e380826e6f6e6520e58fafe99990e588b6e981b8e58f96efbc8ce4bd86e4b88de68789e794a8e4be86e58f96e4bba3e8b387e69699e4bf9de8adb7e68eaae696bde38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020757365722d73656c6563743a206e6f6e653b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce69687e5ad97e981b8e58f96e3808de38082' USING utf8mb4), CONVERT(X'757365722d73656c656374' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d75692d342f2370726f706465662d757365722d73656c656374' USING utf8mb4), CONVERT(X'6373732d75692d3420574420323032362d31302d3135' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3137' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'757365722d73656c656374' USING utf8mb4),
display_label = CONVERT(X'e69687e5ad97e981b8e58f96' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae4bdbfe794a8e88085e698afe590a6e58f8ae5a682e4bd95e981b8e58f96e69687e5ad97e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae4bdbfe794a8e88085e698afe590a6e58f8ae5a682e4bd95e981b8e58f96e69687e5ad97e380826e6f6e6520e58fafe99990e588b6e981b8e58f96efbc8ce4bd86e4b88de68789e794a8e4be86e58f96e4bba3e8b387e69699e4bf9de8adb7e68eaae696bde38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020757365722d73656c6563743a206e6f6e653b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce69687e5ad97e981b8e58f96e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'757365722d73656c656374' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d75692d342f2370726f706465662d757365722d73656c656374' USING utf8mb4),
source_version = CONVERT(X'6373732d75692d3420574420323032362d31302d3135' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3137' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d757365722d73656c656374' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'757365722d73656c656374' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d726573697a65' USING utf8mb4), CONVERT(X'726573697a65' USING utf8mb4), CONVERT(X'e4bdbfe794a8e88085e8aabfe695b4e5b0bae5afb8' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e698afe590a6e58581e8a8b1e4bdbfe794a8e88085e68b96e69bb3e8aabfe695b4e5b0bae5afb8e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58583e7b4a0e698afe590a6e58581e8a8b1e4bdbfe794a8e88085e68b96e69bb3e8aabfe695b4e5b0bae5afb8e38082e5b8b8e8a68be696bce69687e5ad97e8bcb8e585a5e58d80efbc8ce698afe590a6e981a9e794a8e4b99fe58f97e58583e7b4a0e88887206f766572666c6f7720e7ad89e6a29de4bbb6e5bdb1e99fbfe38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020726573697a653a20766572746963616c3b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce4bdbfe794a8e88085e8aabfe695b4e5b0bae5afb8e3808de38082' USING utf8mb4), CONVERT(X'726573697a65' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d75692d342f2370726f706465662d726573697a65' USING utf8mb4), CONVERT(X'6373732d75692d3420574420323032362d31302d3135' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3137' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'726573697a65' USING utf8mb4),
display_label = CONVERT(X'e4bdbfe794a8e88085e8aabfe695b4e5b0bae5afb8' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e698afe590a6e58581e8a8b1e4bdbfe794a8e88085e68b96e69bb3e8aabfe695b4e5b0bae5afb8e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae58583e7b4a0e698afe590a6e58581e8a8b1e4bdbfe794a8e88085e68b96e69bb3e8aabfe695b4e5b0bae5afb8e38082e5b8b8e8a68be696bce69687e5ad97e8bcb8e585a5e58d80efbc8ce698afe590a6e981a9e794a8e4b99fe58f97e58583e7b4a0e88887206f766572666c6f7720e7ad89e6a29de4bbb6e5bdb1e99fbfe38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020726573697a653a20766572746963616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce4bdbfe794a8e88085e8aabfe695b4e5b0bae5afb8e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'726573697a65' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d75692d342f2370726f706465662d726573697a65' USING utf8mb4),
source_version = CONVERT(X'6373732d75692d3420574420323032362d31302d3135' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3137' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d726573697a65' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'726573697a65' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d66696c746572' USING utf8mb4), CONVERT(X'66696c746572' USING utf8mb4), CONVERT(X'e8a696e8a6bae6bfbee98fa1' USING utf8mb4), CONVERT(X'e5b08de58583e7b4a0e7b9aae8a3bde7b590e69e9ce5a597e794a8e6a8a1e7b38ae38081e4baaee5baa6e7ad89e6bfbee98fa1e38082' USING utf8mb4), CONVERT(X'e5b08de58583e7b4a0e7b9aae8a3bde7b590e69e9ce5a597e794a8e6a8a1e7b38ae38081e4baaee5baa6e7ad89e6bfbee98fa1e38082e58fafe4b8b2e68ea520626c75722829e380816272696768746e657373282920e7ad89e587bde5bc8fe38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a202066696c7465723a206272696768746e65737328302e3935293b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8a696e8a6bae6bfbee98fa1e3808de38082' USING utf8mb4), CONVERT(X'66696c746572' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f66696c7465722d656666656374732d312f2370726f706465662d66696c746572' USING utf8mb4), CONVERT(X'66696c7465722d656666656374732d3120454420323032362d30392d3232' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3033' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'66696c746572' USING utf8mb4),
display_label = CONVERT(X'e8a696e8a6bae6bfbee98fa1' USING utf8mb4),
summary = CONVERT(X'e5b08de58583e7b4a0e7b9aae8a3bde7b590e69e9ce5a597e794a8e6a8a1e7b38ae38081e4baaee5baa6e7ad89e6bfbee98fa1e38082' USING utf8mb4),
description = CONVERT(X'e5b08de58583e7b4a0e7b9aae8a3bde7b590e69e9ce5a597e794a8e6a8a1e7b38ae38081e4baaee5baa6e7ad89e6bfbee98fa1e38082e58fafe4b8b2e68ea520626c75722829e380816272696768746e657373282920e7ad89e587bde5bc8fe38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a202066696c7465723a206272696768746e65737328302e3935293b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8a696e8a6bae6bfbee98fa1e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'66696c746572' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f66696c7465722d656666656374732d312f2370726f706465662d66696c746572' USING utf8mb4),
source_version = CONVERT(X'66696c7465722d656666656374732d3120454420323032362d30392d3232' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3033' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d66696c746572' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'66696c746572' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d6c6973742d7374796c65' USING utf8mb4), CONVERT(X'6c6973742d7374796c65' USING utf8mb4), CONVERT(X'e6b885e596aee6a899e8a898e7b0a1e5afab' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae6b885e596aee6a899e8a898e79a84e9a19ee59e8be38081e4bd8de7bdaee88887e59c96e78987e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae6b885e596aee6a899e8a898e79a84e9a19ee59e8be38081e4bd8de7bdaee88887e59c96e78987e38082e5b8b8e794a8e696bc20756ce380816f6c20e68896e585b7e69c89206c6973742d6974656d20e9a1afe7a4bae696b9e5bc8fe79a84e58583e7b4a0e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20206c6973742d7374796c653a2073717561726520696e736964653b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce6b885e596aee6a899e8a898e7b0a1e5afabe3808de38082' USING utf8mb4), CONVERT(X'6c6973742d7374796c65' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6c697374732d332f2370726f706465662d6c6973742d7374796c65' USING utf8mb4), CONVERT(X'6373732d6c697374732d3320454420323032362d30342d3238' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3133' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'6c6973742d7374796c65' USING utf8mb4),
display_label = CONVERT(X'e6b885e596aee6a899e8a898e7b0a1e5afab' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae6b885e596aee6a899e8a898e79a84e9a19ee59e8be38081e4bd8de7bdaee88887e59c96e78987e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae6b885e596aee6a899e8a898e79a84e9a19ee59e8be38081e4bd8de7bdaee88887e59c96e78987e38082e5b8b8e794a8e696bc20756ce380816f6c20e68896e585b7e69c89206c6973742d6974656d20e9a1afe7a4bae696b9e5bc8fe79a84e58583e7b4a0e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20206c6973742d7374796c653a2073717561726520696e736964653b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce6b885e596aee6a899e8a898e7b0a1e5afabe3808de38082' USING utf8mb4),
sort_key = CONVERT(X'6c6973742d7374796c65' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6c697374732d332f2370726f706465662d6c6973742d7374796c65' USING utf8mb4),
source_version = CONVERT(X'6373732d6c697374732d3320454420323032362d30342d3238' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3133' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d6c6973742d7374796c65' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'6c6973742d7374796c65' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d6c6973742d7374796c652d74797065' USING utf8mb4), CONVERT(X'6c6973742d7374796c652d74797065' USING utf8mb4), CONVERT(X'e6b885e596aee6a899e8a898e9a19ee59e8b' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae6b885e596aee9a085e79baee79a84e6a899e8a898e6a8a3e5bc8fe38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae6b885e596aee9a085e79baee79a84e6a899e8a898e6a8a3e5bc8fe38082e4be8be5a6822064697363e38081646563696d616ce3808173717561726520e68896206e6f6e65e38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20206c6973742d7374796c652d747970653a20646563696d616c3b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce6b885e596aee6a899e8a898e9a19ee59e8be3808de38082' USING utf8mb4), CONVERT(X'6c6973742d7374796c652d74797065' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6c697374732d332f2370726f706465662d6c6973742d7374796c652d74797065' USING utf8mb4), CONVERT(X'6373732d6c697374732d3320454420323032362d30342d3238' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3133' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'6c6973742d7374796c652d74797065' USING utf8mb4),
display_label = CONVERT(X'e6b885e596aee6a899e8a898e9a19ee59e8b' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae6b885e596aee9a085e79baee79a84e6a899e8a898e6a8a3e5bc8fe38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae6b885e596aee9a085e79baee79a84e6a899e8a898e6a8a3e5bc8fe38082e4be8be5a6822064697363e38081646563696d616ce3808173717561726520e68896206e6f6e65e38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20206c6973742d7374796c652d747970653a20646563696d616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce6b885e596aee6a899e8a898e9a19ee59e8be3808de38082' USING utf8mb4),
sort_key = CONVERT(X'6c6973742d7374796c652d74797065' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6c697374732d332f2370726f706465662d6c6973742d7374796c652d74797065' USING utf8mb4),
source_version = CONVERT(X'6373732d6c697374732d3320454420323032362d30342d3238' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3133' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d6c6973742d7374796c652d74797065' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'6c6973742d7374796c652d74797065' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d626f726465722d636f6c6c61707365' USING utf8mb4), CONVERT(X'626f726465722d636f6c6c61707365' USING utf8mb4), CONVERT(X'e8a1a8e6a0bce9828ae6a186e59088e4bdb5' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae8a1a8e6a0bce79bb8e984b0e584b2e5ad98e6a0bce79a84e9828ae6a186e698afe590a6e59088e4bdb5e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae8a1a8e6a0bce79bb8e984b0e584b2e5ad98e6a0bce79a84e9828ae6a186e698afe590a6e59088e4bdb5e38082636f6c6c6170736520e8888720736570617261746520e4bdbfe794a8e4b88de5908ce79a84e8a1a8e6a0bce9828ae6a186e6a8a1e59e8be38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a2020626f726465722d636f6c6c617073653a20636f6c6c617073653b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8a1a8e6a0bce9828ae6a186e59088e4bdb5e3808de38082' USING utf8mb4), CONVERT(X'626f726465722d636f6c6c61707365' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f637373322f2370726f706465662d626f726465722d636f6c6c61707365' USING utf8mb4), CONVERT(X'6373733220454420323032352d31322d3330' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3530' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'626f726465722d636f6c6c61707365' USING utf8mb4),
display_label = CONVERT(X'e8a1a8e6a0bce9828ae6a186e59088e4bdb5' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae8a1a8e6a0bce79bb8e984b0e584b2e5ad98e6a0bce79a84e9828ae6a186e698afe590a6e59088e4bdb5e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae8a1a8e6a0bce79bb8e984b0e584b2e5ad98e6a0bce79a84e9828ae6a186e698afe590a6e59088e4bdb5e38082636f6c6c6170736520e8888720736570617261746520e4bdbfe794a8e4b88de5908ce79a84e8a1a8e6a0bce9828ae6a186e6a8a1e59e8be38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a2020626f726465722d636f6c6c617073653a20636f6c6c617073653b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8a1a8e6a0bce9828ae6a186e59088e4bdb5e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'626f726465722d636f6c6c61707365' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f637373322f2370726f706465662d626f726465722d636f6c6c61707365' USING utf8mb4),
source_version = CONVERT(X'6373733220454420323032352d31322d3330' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3530' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d626f726465722d636f6c6c61707365' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'626f726465722d636f6c6c61707365' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d7461626c652d6c61796f7574' USING utf8mb4), CONVERT(X'7461626c652d6c61796f7574' USING utf8mb4), CONVERT(X'e8a1a8e6a0bce68e92e78988e6bc94e7ae97e6b395' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae8a1a8e6a0bce6ac84e5aface68ea1e794a8e79a84e68e92e78988e696b9e5bc8fe38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae8a1a8e6a0bce6ac84e5aface68ea1e794a8e79a84e68e92e78988e696b9e5bc8fe38082666978656420e88887206175746f20e5b08de6ac84e5aface58f8ae585a7e5aeb9e79a84e89995e79086e4b88de5908cefbc9b666978656420e79a84e981a9e794a8e6a29de4bbb6e4b99fe88887e8a1a8e6a0bce5aface5baa6e69c89e9979ce38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20207461626c652d6c61796f75743a2066697865643b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8a1a8e6a0bce68e92e78988e6bc94e7ae97e6b395e3808de38082' USING utf8mb4), CONVERT(X'7461626c652d6c61796f7574' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f637373322f2370726f706465662d7461626c652d6c61796f7574' USING utf8mb4), CONVERT(X'6373733220454420323032352d31322d3330' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3530' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'7461626c652d6c61796f7574' USING utf8mb4),
display_label = CONVERT(X'e8a1a8e6a0bce68e92e78988e6bc94e7ae97e6b395' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae8a1a8e6a0bce6ac84e5aface68ea1e794a8e79a84e68e92e78988e696b9e5bc8fe38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae8a1a8e6a0bce6ac84e5aface68ea1e794a8e79a84e68e92e78988e696b9e5bc8fe38082666978656420e88887206175746f20e5b08de6ac84e5aface58f8ae585a7e5aeb9e79a84e89995e79086e4b88de5908cefbc9b666978656420e79a84e981a9e794a8e6a29de4bbb6e4b99fe88887e8a1a8e6a0bce5aface5baa6e69c89e9979ce38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20207461626c652d6c61796f75743a2066697865643b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce8a1a8e6a0bce68e92e78988e6bc94e7ae97e6b395e3808de38082' USING utf8mb4),
sort_key = CONVERT(X'7461626c652d6c61796f7574' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f637373322f2370726f706465662d7461626c652d6c61796f7574' USING utf8mb4),
source_version = CONVERT(X'6373733220454420323032352d31322d3330' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3530' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d7461626c652d6c61796f7574' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'7461626c652d6c61796f7574' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d7363726f6c6c2d6265686176696f72' USING utf8mb4), CONVERT(X'7363726f6c6c2d6265686176696f72' USING utf8mb4), CONVERT(X'e68db2e58b95e8a18ce782ba' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae789b9e5ae9ae7a88be5bc8fe68896e5b08ee8a6bde8a7b8e799bce68db2e58b95e69982e79a84e7a7bbe58b95e696b9e5bc8fe38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae789b9e5ae9ae7a88be5bc8fe68896e5b08ee8a6bde8a7b8e799bce68db2e58b95e69982e79a84e7a7bbe58b95e696b9e5bc8fe38082736d6f6f746820e68f90e4be9be5b9b3e6bb91e68db2e58b95efbc8ce4b88de69c83e68ea7e588b6e68980e69c89e4bdbfe794a8e88085e6898be58b95e68db2e58b95e8a18ce782bae38082' USING utf8mb4), CONVERT(X'2e6578616d706c65207b0a20207363726f6c6c2d6265686176696f723a20736d6f6f74683b0a7d' USING utf8mb4), CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce68db2e58b95e8a18ce782bae3808de38082' USING utf8mb4), CONVERT(X'7363726f6c6c2d6265686176696f72' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6f766572666c6f772d332f2370726f706465662d7363726f6c6c2d6265686176696f72' USING utf8mb4), CONVERT(X'6373732d6f766572666c6f772d3320454420323032362d30382d3133' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3532' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'7363726f6c6c2d6265686176696f72' USING utf8mb4),
display_label = CONVERT(X'e68db2e58b95e8a18ce782ba' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae789b9e5ae9ae7a88be5bc8fe68896e5b08ee8a6bde8a7b8e799bce68db2e58b95e69982e79a84e7a7bbe58b95e696b9e5bc8fe38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae789b9e5ae9ae7a88be5bc8fe68896e5b08ee8a6bde8a7b8e799bce68db2e58b95e69982e79a84e7a7bbe58b95e696b9e5bc8fe38082736d6f6f746820e68f90e4be9be5b9b3e6bb91e68db2e58b95efbc8ce4b88de69c83e68ea7e588b6e68980e69c89e4bdbfe794a8e88085e6898be58b95e68db2e58b95e8a18ce782bae38082' USING utf8mb4),
example_code = CONVERT(X'2e6578616d706c65207b0a20207363726f6c6c2d6265686176696f723a20736d6f6f74683b0a7d' USING utf8mb4),
example_description = CONVERT(X'e59ca8202e6578616d706c6520e79a84e6a8a3e5bc8fe8a68fe58987e4b8ade8a8ade5ae9ae3808ce68db2e58b95e8a18ce782bae3808de38082' USING utf8mb4),
sort_key = CONVERT(X'7363726f6c6c2d6265686176696f72' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6f766572666c6f772d332f2370726f706465662d7363726f6c6c2d6265686176696f72' USING utf8mb4),
source_version = CONVERT(X'6373732d6f766572666c6f772d3320454420323032362d30382d3133' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3532' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d7363726f6c6c2d6265686176696f72' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6e616d65' USING utf8mb4),
                    CONVERT(X'7363726f6c6c2d6265686176696f72' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'70726f70657274696573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'70726f70657274792d637573746f6d' USING utf8mb4), CONVERT(X'2d2d2a' USING utf8mb4), CONVERT(X'e887aae8a882e5b1ace680a7' USING utf8mb4), CONVERT(X'e4bba5202d2d20e9968be9a0ade79a84e5908de7a8b1e5aea3e5918ae58fafe9878de8a487e4bdbfe794a8e79a84e887aae8a882e5b1ace680a7e38082' USING utf8mb4), CONVERT(X'e4bba5202d2d20e9968be9a0ade79a84e5908de7a8b1e5aea3e5918ae58fafe9878de8a487e4bdbfe794a8e79a84e887aae8a882e5b1ace680a7e38082e5908de7a8b1e58d80e58886e5a4a7e5b08fe5afabefbc8ce9809ae5b8b8e9808fe9818e20766172282920e59ca8e5b1ace680a7e580bce4b8ade58f96e794a8efbc9be4b99fe58fafe690ade9858d204070726f706572747920e8a8bbe5868ae8aa9ee6b395e88887e7b9bce689bfe8a8ade5ae9ae38082' USING utf8mb4), CONVERT(X'3a726f6f74207b0a20202d2d6272616e643a207465616c3b0a20202d2d73706163696e673a20313670783b0a7d0a2e63617264207b0a2020636f6c6f723a20766172282d2d6272616e64293b0a202070616464696e673a20766172282d2d73706163696e67293b0a7d' USING utf8mb4), CONVERT(X'e5aea3e5918ae4b8bbe9a18ce9a18fe889b2e88887e99693e8b79defbc8ce4b8a6e59ca8e58da1e78987e6a8a3e5bc8fe4b8ade58f96e794a8e38082' USING utf8mb4), CONVERT(X'2d2d2a' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d7661726961626c65732d322f2370726f706465662d' USING utf8mb4), CONVERT(X'6373732d7661726961626c65732d3220454420323032362d31302d3039' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3130' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'2d2d2a' USING utf8mb4),
display_label = CONVERT(X'e887aae8a882e5b1ace680a7' USING utf8mb4),
summary = CONVERT(X'e4bba5202d2d20e9968be9a0ade79a84e5908de7a8b1e5aea3e5918ae58fafe9878de8a487e4bdbfe794a8e79a84e887aae8a882e5b1ace680a7e38082' USING utf8mb4),
description = CONVERT(X'e4bba5202d2d20e9968be9a0ade79a84e5908de7a8b1e5aea3e5918ae58fafe9878de8a487e4bdbfe794a8e79a84e887aae8a882e5b1ace680a7e38082e5908de7a8b1e58d80e58886e5a4a7e5b08fe5afabefbc8ce9809ae5b8b8e9808fe9818e20766172282920e59ca8e5b1ace680a7e580bce4b8ade58f96e794a8efbc9be4b99fe58fafe690ade9858d204070726f706572747920e8a8bbe5868ae8aa9ee6b395e88887e7b9bce689bfe8a8ade5ae9ae38082' USING utf8mb4),
example_code = CONVERT(X'3a726f6f74207b0a20202d2d6272616e643a207465616c3b0a20202d2d73706163696e673a20313670783b0a7d0a2e63617264207b0a2020636f6c6f723a20766172282d2d6272616e64293b0a202070616464696e673a20766172282d2d73706163696e67293b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5aea3e5918ae4b8bbe9a18ce9a18fe889b2e88887e99693e8b79defbc8ce4b8a6e59ca8e58da1e78987e6a8a3e5bc8fe4b8ade58f96e794a8e38082' USING utf8mb4),
sort_key = CONVERT(X'2d2d2a' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d7661726961626c65732d322f2370726f706465662d' USING utf8mb4),
source_version = CONVERT(X'6373732d7661726961626c65732d3220454420323032362d31302d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3130' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'70726f70657274792d637573746f6d' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70726f70657274795f6b696e64' USING utf8mb4),
                    CONVERT(X'637573746f6d' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'66756e6374696f6e73' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'66756e6374696f6e2d766172' USING utf8mb4), CONVERT(X'7661722829' USING utf8mb4), CONVERT(X'e887aae8a882e5b1ace680a7e58f96e580bc' USING utf8mb4), CONVERT(X'e58f96e794a8e887aae8a882e5b1ace680a7e79a84e580bcefbc8ce4b8a6e58fafe68f90e4be9be58299e68fb4e580bce38082' USING utf8mb4), CONVERT(X'e58f96e794a8e887aae8a882e5b1ace680a7e79a84e580bcefbc8ce4b8a6e58fafe68f90e4be9be58299e68fb4e580bce38082e7acace4b880e5808be58f83e695b8e698afe887aae8a882e5b1ace680a7e5908de7a8b1efbc9be98097e8999fe5be8ce58fafe68f90e4be9be58299e68fb4e580bcefbc8ce4b99fe58fafe5b7a2e78b80e4bdbfe794a8207661722829e38082' USING utf8mb4), CONVERT(X'2e63617264207b0a2020636f6c6f723a20766172282d2d6272616e642c207465616c293b0a202070616464696e673a20766172282d2d73706163696e672c20766172282d2d64656661756c742d73706163696e672c203136707829293b0a7d' USING utf8mb4), CONVERT(X'e58f96e794a8e4b8bbe9a18ce9a18fe889b2e88887e99693e8b79defbc8ce69caae58f96e5be97e69c89e69588e580bce69982e4bdbfe794a8e58299e68fb4e580bce38082' USING utf8mb4), CONVERT(X'7661722829' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d7661726961626c65732d322f2366756e636465662d766172' USING utf8mb4), CONVERT(X'6373732d7661726961626c65732d3220454420323032362d31302d3039' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3130' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'7661722829' USING utf8mb4),
display_label = CONVERT(X'e887aae8a882e5b1ace680a7e58f96e580bc' USING utf8mb4),
summary = CONVERT(X'e58f96e794a8e887aae8a882e5b1ace680a7e79a84e580bcefbc8ce4b8a6e58fafe68f90e4be9be58299e68fb4e580bce38082' USING utf8mb4),
description = CONVERT(X'e58f96e794a8e887aae8a882e5b1ace680a7e79a84e580bcefbc8ce4b8a6e58fafe68f90e4be9be58299e68fb4e580bce38082e7acace4b880e5808be58f83e695b8e698afe887aae8a882e5b1ace680a7e5908de7a8b1efbc9be98097e8999fe5be8ce58fafe68f90e4be9be58299e68fb4e580bcefbc8ce4b99fe58fafe5b7a2e78b80e4bdbfe794a8207661722829e38082' USING utf8mb4),
example_code = CONVERT(X'2e63617264207b0a2020636f6c6f723a20766172282d2d6272616e642c207465616c293b0a202070616464696e673a20766172282d2d73706163696e672c20766172282d2d64656661756c742d73706163696e672c203136707829293b0a7d' USING utf8mb4),
example_description = CONVERT(X'e58f96e794a8e4b8bbe9a18ce9a18fe889b2e88887e99693e8b79defbc8ce69caae58f96e5be97e69c89e69588e580bce69982e4bdbfe794a8e58299e68fb4e580bce38082' USING utf8mb4),
sort_key = CONVERT(X'7661722829' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d7661726961626c65732d322f2366756e636465662d766172' USING utf8mb4),
source_version = CONVERT(X'6373732d7661726961626c65732d3220454420323032362d31302d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3130' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'66756e6374696f6e2d766172' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'66756e6374696f6e5f6e616d65' USING utf8mb4),
                    CONVERT(X'766172' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d74797065' USING utf8mb4), CONVERT(X'656c656d656e74' USING utf8mb4), CONVERT(X'e58583e7b4a0e9a19ee59e8be981b8e69387e599a8' USING utf8mb4), CONVERT(X'e4be9de58583e7b4a0e5908de7a8b1e981b8e58f96e58583e7b4a0e38082' USING utf8mb4), CONVERT(X'e4be9de58583e7b4a0e5908de7a8b1e981b8e58f96e58583e7b4a0e38082e4be8be5a682207020e981b8e58f96e6aeb5e890bde58583e7b4a0efbc9be5908de7a8b1e79a84e5a4a7e5b08fe5afabe89995e79086e4b99fe58f97e69687e4bbb6e8aa9ee8a880e5bdb1e99fbfe38082' USING utf8mb4), CONVERT(X'70207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'656c656d656e74' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f23747970652d73656c6563746f7273' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'656c656d656e74' USING utf8mb4),
display_label = CONVERT(X'e58583e7b4a0e9a19ee59e8be981b8e69387e599a8' USING utf8mb4),
summary = CONVERT(X'e4be9de58583e7b4a0e5908de7a8b1e981b8e58f96e58583e7b4a0e38082' USING utf8mb4),
description = CONVERT(X'e4be9de58583e7b4a0e5908de7a8b1e981b8e58f96e58583e7b4a0e38082e4be8be5a682207020e981b8e58f96e6aeb5e890bde58583e7b4a0efbc9be5908de7a8b1e79a84e5a4a7e5b08fe5afabe89995e79086e4b99fe58f97e69687e4bbb6e8aa9ee8a880e5bdb1e99fbfe38082' USING utf8mb4),
example_code = CONVERT(X'70207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'656c656d656e74' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f23747970652d73656c6563746f7273' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d74797065' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'73656c6563746f725f6b696e64' USING utf8mb4),
                    CONVERT(X'74797065' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d636c617373' USING utf8mb4), CONVERT(X'2e636c617373' USING utf8mb4), CONVERT(X'e9a19ee588a5e981b8e69387e599a8' USING utf8mb4), CONVERT(X'e981b8e58f96e585b7e69c89e68c87e5ae9a20636c61737320e79a84e58583e7b4a0e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e585b7e69c89e68c87e5ae9a20636c61737320e79a84e58583e7b4a0e38082e5908ce4b880e5808be58583e7b4a0e58fafe4bba5e69c89e5a49ae5808be9a19ee588a5efbc9be5afa6e99a9be9a19ee588a5e5908de7a8b1e794b1e4bdbfe794a8e88085e887aae8a18ce591bde5908de38082' USING utf8mb4), CONVERT(X'2e63617264207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'2e636c617373' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f23636c6173732d68746d6c' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'2e636c617373' USING utf8mb4),
display_label = CONVERT(X'e9a19ee588a5e981b8e69387e599a8' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e585b7e69c89e68c87e5ae9a20636c61737320e79a84e58583e7b4a0e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e585b7e69c89e68c87e5ae9a20636c61737320e79a84e58583e7b4a0e38082e5908ce4b880e5808be58583e7b4a0e58fafe4bba5e69c89e5a49ae5808be9a19ee588a5efbc9be5afa6e99a9be9a19ee588a5e5908de7a8b1e794b1e4bdbfe794a8e88085e887aae8a18ce591bde5908de38082' USING utf8mb4),
example_code = CONVERT(X'2e63617264207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'2e636c617373' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f23636c6173732d68746d6c' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d636c617373' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'73656c6563746f725f6b696e64' USING utf8mb4),
                    CONVERT(X'636c617373' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d6964' USING utf8mb4), CONVERT(X'236964' USING utf8mb4), CONVERT(X'e8ad98e588a5e7a2bce981b8e69387e599a8' USING utf8mb4), CONVERT(X'e981b8e58f96e585b7e69c89e68c87e5ae9a20696420e79a84e58583e7b4a0e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e585b7e69c89e68c87e5ae9a20696420e79a84e58583e7b4a0e38082e5908ce4b880e4bbbd2048544d4c20e69687e4bbb6e79a8420696420e68789e4bf9de68c81e594afe4b880e38082' USING utf8mb4), CONVERT(X'236d61696e207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'236964' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f2369642d73656c6563746f7273' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'236964' USING utf8mb4),
display_label = CONVERT(X'e8ad98e588a5e7a2bce981b8e69387e599a8' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e585b7e69c89e68c87e5ae9a20696420e79a84e58583e7b4a0e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e585b7e69c89e68c87e5ae9a20696420e79a84e58583e7b4a0e38082e5908ce4b880e4bbbd2048544d4c20e69687e4bbb6e79a8420696420e68789e4bf9de68c81e594afe4b880e38082' USING utf8mb4),
example_code = CONVERT(X'236d61696e207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'236964' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f2369642d73656c6563746f7273' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d6964' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'73656c6563746f725f6b696e64' USING utf8mb4),
                    CONVERT(X'6964' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d617474726962757465' USING utf8mb4), CONVERT(X'5b617474725d' USING utf8mb4), CONVERT(X'e5b1ace680a7e981b8e69387e599a8' USING utf8mb4), CONVERT(X'e4be9de58583e7b4a0e698afe590a6e585b7e69c89e68c87e5ae9ae5b1ace680a7e68896e7aca6e59088e5b1ace680a7e580bce6a29de4bbb6e4be86e981b8e58f96e38082' USING utf8mb4), CONVERT(X'e4be9de58583e7b4a0e698afe590a6e585b7e69c89e68c87e5ae9ae5b1ace680a7e68896e7aca6e59088e5b1ace680a7e580bce6a29de4bbb6e4be86e981b8e58f96e38082e58c85e590ab205b617474725de380815b617474723d76616c75655de380815b617474727e3d76616c75655d20e7ad89e5afabe6b395efbc9be5ae83e58091e79a84e6af94e5b08de6a29de4bbb6e4b88de5908ce38082' USING utf8mb4), CONVERT(X'5b747970653d22656d61696c225d207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'5b617474725d' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f236174747269627574652d73656c6563746f7273' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'5b617474725d' USING utf8mb4),
display_label = CONVERT(X'e5b1ace680a7e981b8e69387e599a8' USING utf8mb4),
summary = CONVERT(X'e4be9de58583e7b4a0e698afe590a6e585b7e69c89e68c87e5ae9ae5b1ace680a7e68896e7aca6e59088e5b1ace680a7e580bce6a29de4bbb6e4be86e981b8e58f96e38082' USING utf8mb4),
description = CONVERT(X'e4be9de58583e7b4a0e698afe590a6e585b7e69c89e68c87e5ae9ae5b1ace680a7e68896e7aca6e59088e5b1ace680a7e580bce6a29de4bbb6e4be86e981b8e58f96e38082e58c85e590ab205b617474725de380815b617474723d76616c75655de380815b617474727e3d76616c75655d20e7ad89e5afabe6b395efbc9be5ae83e58091e79a84e6af94e5b08de6a29de4bbb6e4b88de5908ce38082' USING utf8mb4),
example_code = CONVERT(X'5b747970653d22656d61696c225d207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'5b617474725d' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f236174747269627574652d73656c6563746f7273' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d617474726962757465' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'73656c6563746f725f6b696e64' USING utf8mb4),
                    CONVERT(X'617474726962757465' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d64657363656e64616e74' USING utf8mb4), CONVERT(X'412042' USING utf8mb4), CONVERT(X'e5be8ce4bba3e7b590e59088e7aca6' USING utf8mb4), CONVERT(X'e981b8e58f96e4bd8de696bce68c87e5ae9ae7a596e58588e58583e7b4a0e4b98be585a7e79a84e5be8ce4bba3e58583e7b4a0e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e4bd8de696bce68c87e5ae9ae7a596e58588e58583e7b4a0e4b98be585a7e79a84e5be8ce4bba3e58583e7b4a0e38082e4bba5e7a9bae799bde58886e99a94e585a9e581b4e981b8e69387e599a8efbc8ce5be8ce4bba3e4b88de99990e696bce79bb4e68ea5e5ad90e58583e7b4a0e38082' USING utf8mb4), CONVERT(X'2e636172642070207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'612062' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f2364657363656e64616e742d636f6d62696e61746f7273' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'412042' USING utf8mb4),
display_label = CONVERT(X'e5be8ce4bba3e7b590e59088e7aca6' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e4bd8de696bce68c87e5ae9ae7a596e58588e58583e7b4a0e4b98be585a7e79a84e5be8ce4bba3e58583e7b4a0e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e4bd8de696bce68c87e5ae9ae7a596e58588e58583e7b4a0e4b98be585a7e79a84e5be8ce4bba3e58583e7b4a0e38082e4bba5e7a9bae799bde58886e99a94e585a9e581b4e981b8e69387e599a8efbc8ce5be8ce4bba3e4b88de99990e696bce79bb4e68ea5e5ad90e58583e7b4a0e38082' USING utf8mb4),
example_code = CONVERT(X'2e636172642070207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'612062' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f2364657363656e64616e742d636f6d62696e61746f7273' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d64657363656e64616e74' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'73656c6563746f725f6b696e64' USING utf8mb4),
                    CONVERT(X'64657363656e64616e74' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d756e6976657273616c' USING utf8mb4), CONVERT(X'2a' USING utf8mb4), CONVERT(X'e585a8e7a8b1e981b8e69387e599a8' USING utf8mb4), CONVERT(X'e981b8e58f96e7aca6e59088e591bde5908de7a9bae99693e6a29de4bbb6e79a84e68980e69c89e58583e7b4a0e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e7aca6e59088e591bde5908de7a9bae99693e6a29de4bbb6e79a84e68980e69c89e58583e7b4a0e38082e5b8b8e794a8e696bce695b4e9ab94e8a8ade5ae9ae79b92e6a8a1e59e8befbc9be4b88de4bba3e8a1a8e69c83e981b8e58f96e581bde58583e7b4a0e38082' USING utf8mb4), CONVERT(X'2a207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'2a' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d332f2378' USING utf8mb4), CONVERT(X'73656c6563746f72732d3320435220323032362d31302d3135' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3137' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'2a' USING utf8mb4),
display_label = CONVERT(X'e585a8e7a8b1e981b8e69387e599a8' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e7aca6e59088e591bde5908de7a9bae99693e6a29de4bbb6e79a84e68980e69c89e58583e7b4a0e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e7aca6e59088e591bde5908de7a9bae99693e6a29de4bbb6e79a84e68980e69c89e58583e7b4a0e38082e5b8b8e794a8e696bce695b4e9ab94e8a8ade5ae9ae79b92e6a8a1e59e8befbc9be4b88de4bba3e8a1a8e69c83e981b8e58f96e581bde58583e7b4a0e38082' USING utf8mb4),
example_code = CONVERT(X'2a207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'2a' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d332f2378' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3320435220323032362d31302d3135' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3137' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d756e6976657273616c' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'73656c6563746f725f6b696e64' USING utf8mb4),
                    CONVERT(X'756e6976657273616c' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d6368696c64' USING utf8mb4), CONVERT(X'3e' USING utf8mb4), CONVERT(X'e5ad90e58583e7b4a0e7b590e59088e7aca6' USING utf8mb4), CONVERT(X'e981b8e58f96e68c87e5ae9ae58583e7b4a0e79a84e79bb4e68ea5e5ad90e58583e7b4a0e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e68c87e5ae9ae58583e7b4a0e79a84e79bb4e68ea5e5ad90e58583e7b4a0e38082e88887e7a9bae799bde5be8ce4bba3e7b590e59088e7aca6e4b88de5908cefbc8ce5ae83e58faae6af94e5b08de4b88be4b880e5b1a4e38082' USING utf8mb4), CONVERT(X'2e6d656e75203e206c69207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3e' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f2373656c6563746f726465662d6368696c64' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3e' USING utf8mb4),
display_label = CONVERT(X'e5ad90e58583e7b4a0e7b590e59088e7aca6' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e68c87e5ae9ae58583e7b4a0e79a84e79bb4e68ea5e5ad90e58583e7b4a0e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e68c87e5ae9ae58583e7b4a0e79a84e79bb4e68ea5e5ad90e58583e7b4a0e38082e88887e7a9bae799bde5be8ce4bba3e7b590e59088e7aca6e4b88de5908cefbc8ce5ae83e58faae6af94e5b08de4b88be4b880e5b1a4e38082' USING utf8mb4),
example_code = CONVERT(X'2e6d656e75203e206c69207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3e' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f2373656c6563746f726465662d6368696c64' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d6368696c64' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'73656c6563746f725f6b696e64' USING utf8mb4),
                    CONVERT(X'6368696c64' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d61646a6163656e742d7369626c696e67' USING utf8mb4), CONVERT(X'2b' USING utf8mb4), CONVERT(X'e79bb8e984b0e58584e5bc9fe7b590e59088e7aca6' USING utf8mb4), CONVERT(X'e981b8e58f96e7b78ae68ea5e59ca8e68c87e5ae9ae58583e7b4a0e5be8ce696b9e79a84e58584e5bc9fe58583e7b4a0e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e7b78ae68ea5e59ca8e68c87e5ae9ae58583e7b4a0e5be8ce696b9e79a84e58584e5bc9fe58583e7b4a0e38082e585a9e5808be58583e7b4a0e5bf85e9a088e69c89e585b1e5908ce788b6e58583e7b4a0efbc9be6af94e5b08de58583e7b4a0e69982e5bfbde795a5e69687e5ad97e7af80e9bb9ee38082' USING utf8mb4), CONVERT(X'6832202b2070207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'2b' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f2373656c6563746f726465662d61646a6163656e74' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'2b' USING utf8mb4),
display_label = CONVERT(X'e79bb8e984b0e58584e5bc9fe7b590e59088e7aca6' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e7b78ae68ea5e59ca8e68c87e5ae9ae58583e7b4a0e5be8ce696b9e79a84e58584e5bc9fe58583e7b4a0e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e7b78ae68ea5e59ca8e68c87e5ae9ae58583e7b4a0e5be8ce696b9e79a84e58584e5bc9fe58583e7b4a0e38082e585a9e5808be58583e7b4a0e5bf85e9a088e69c89e585b1e5908ce788b6e58583e7b4a0efbc9be6af94e5b08de58583e7b4a0e69982e5bfbde795a5e69687e5ad97e7af80e9bb9ee38082' USING utf8mb4),
example_code = CONVERT(X'6832202b2070207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'2b' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f2373656c6563746f726465662d61646a6163656e74' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d61646a6163656e742d7369626c696e67' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'73656c6563746f725f6b696e64' USING utf8mb4),
                    CONVERT(X'61646a6163656e742d7369626c696e67' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d67656e6572616c2d7369626c696e67' USING utf8mb4), CONVERT(X'7e' USING utf8mb4), CONVERT(X'e5be8ce7ba8ce58584e5bc9fe7b590e59088e7aca6' USING utf8mb4), CONVERT(X'e981b8e58f96e68c87e5ae9ae58583e7b4a0e5be8ce696b9e7aca6e59088e6a29de4bbb6e79a84e58584e5bc9fe58583e7b4a0e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e68c87e5ae9ae58583e7b4a0e5be8ce696b9e7aca6e59088e6a29de4bbb6e79a84e58584e5bc9fe58583e7b4a0e38082e4b88de5bf85e7b78ae68ea5e79bb8e984b0efbc8ce4bd86e5bf85e9a088e4bd8de696bce5908ce4b880e788b6e58583e7b4a0e4b98be4b88be38082' USING utf8mb4), CONVERT(X'6832207e2070207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'7e' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f2373656c6563746f726465662d7369626c696e67' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'7e' USING utf8mb4),
display_label = CONVERT(X'e5be8ce7ba8ce58584e5bc9fe7b590e59088e7aca6' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e68c87e5ae9ae58583e7b4a0e5be8ce696b9e7aca6e59088e6a29de4bbb6e79a84e58584e5bc9fe58583e7b4a0e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e68c87e5ae9ae58583e7b4a0e5be8ce696b9e7aca6e59088e6a29de4bbb6e79a84e58584e5bc9fe58583e7b4a0e38082e4b88de5bf85e7b78ae68ea5e79bb8e984b0efbc8ce4bd86e5bf85e9a088e4bd8de696bce5908ce4b880e788b6e58583e7b4a0e4b98be4b88be38082' USING utf8mb4),
example_code = CONVERT(X'6832207e2070207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'7e' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f2373656c6563746f726465662d7369626c696e67' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d67656e6572616c2d7369626c696e67' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'73656c6563746f725f6b696e64' USING utf8mb4),
                    CONVERT(X'67656e6572616c2d7369626c696e67' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d6e657374696e67' USING utf8mb4), CONVERT(X'26' USING utf8mb4), CONVERT(X'e5b7a2e78b80e981b8e69387e599a8' USING utf8mb4), CONVERT(X'e59ca8e5b7a2e78b80e6a8a3e5bc8fe8a68fe58987e4b8ade58f83e785a7e788b6e5b1a4e981b8e69387e599a8e38082' USING utf8mb4), CONVERT(X'e59ca8e5b7a2e78b80e6a8a3e5bc8fe8a68fe58987e4b8ade58f83e785a7e788b6e5b1a4e981b8e69387e599a8e38082e5b8b8e794a8e696bce8a39ce4b88ae78b80e6858be68896e7b584e59088e5ad90e8a68fe58987efbc8ce4b88de698afe5ad97e4b8b2e79bb4e68ea5e68bbce68ea5e79a84e5898de7bdaee89995e79086e599a8e8aa9ee6b395e38082' USING utf8mb4), CONVERT(X'2e63617264207b0a2020263a686f766572207b206f7061636974793a20302e393b207d0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'26' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6e657374696e672d312f2373656c6563746f726465662d' USING utf8mb4), CONVERT(X'6373732d6e657374696e672d3120454420323032362d31302d3038' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3137' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'26' USING utf8mb4),
display_label = CONVERT(X'e5b7a2e78b80e981b8e69387e599a8' USING utf8mb4),
summary = CONVERT(X'e59ca8e5b7a2e78b80e6a8a3e5bc8fe8a68fe58987e4b8ade58f83e785a7e788b6e5b1a4e981b8e69387e599a8e38082' USING utf8mb4),
description = CONVERT(X'e59ca8e5b7a2e78b80e6a8a3e5bc8fe8a68fe58987e4b8ade58f83e785a7e788b6e5b1a4e981b8e69387e599a8e38082e5b8b8e794a8e696bce8a39ce4b88ae78b80e6858be68896e7b584e59088e5ad90e8a68fe58987efbc8ce4b88de698afe5ad97e4b8b2e79bb4e68ea5e68bbce68ea5e79a84e5898de7bdaee89995e79086e599a8e8aa9ee6b395e38082' USING utf8mb4),
example_code = CONVERT(X'2e63617264207b0a2020263a686f766572207b206f7061636974793a20302e393b207d0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'26' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6e657374696e672d312f2373656c6563746f726465662d' USING utf8mb4),
source_version = CONVERT(X'6373732d6e657374696e672d3120454420323032362d31302d3038' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3137' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d6e657374696e67' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'73656c6563746f725f6b696e64' USING utf8mb4),
                    CONVERT(X'6e657374696e67' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d686f766572' USING utf8mb4), CONVERT(X'3a686f766572' USING utf8mb4), CONVERT(X'e68c87e6a899e687b8e5819c' USING utf8mb4), CONVERT(X'e981b8e58f96e4bdbfe794a8e88085e4bba5e68c87e6a899e687b8e5819ce79a84e58583e7b4a0e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e4bdbfe794a8e88085e4bba5e68c87e6a899e687b8e5819ce79a84e58583e7b4a0e38082e8a7b8e68ea7e8a39de7bdaee4b88de4b880e5ae9ae585b7e69c89e696b9e4bebfe68896e68c81e7ba8ce58fafe794a8e79a84e687b8e5819ce6938de4bd9ce38082' USING utf8mb4), CONVERT(X'627574746f6e3a686f766572207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a686f766572' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f23686f7665722d70736575646f' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a686f766572' USING utf8mb4),
display_label = CONVERT(X'e68c87e6a899e687b8e5819c' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e4bdbfe794a8e88085e4bba5e68c87e6a899e687b8e5819ce79a84e58583e7b4a0e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e4bdbfe794a8e88085e4bba5e68c87e6a899e687b8e5819ce79a84e58583e7b4a0e38082e8a7b8e68ea7e8a39de7bdaee4b88de4b880e5ae9ae585b7e69c89e696b9e4bebfe68896e68c81e7ba8ce58fafe794a8e79a84e687b8e5819ce6938de4bd9ce38082' USING utf8mb4),
example_code = CONVERT(X'627574746f6e3a686f766572207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a686f766572' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f23686f7665722d70736575646f' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d686f766572' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f636c6173735f6e616d65' USING utf8mb4),
                    CONVERT(X'686f766572' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d616374697665' USING utf8mb4), CONVERT(X'3a616374697665' USING utf8mb4), CONVERT(X'e5959fe58b95e78b80e6858b' USING utf8mb4), CONVERT(X'e981b8e58f96e6ada3e8a2abe4bdbfe794a8e88085e5959fe58b95e79a84e58583e7b4a0e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e6ada3e8a2abe4bdbfe794a8e88085e5959fe58b95e79a84e58583e7b4a0e38082e4be8be5a682e4bba5e6bb91e9bca0e68c89e4bd8fe68c89e98895e79a84e69c9fe99693efbc9be5ae83e4b88de698afe68c81e7ba8ce981b8e58f96e79a84e9a081e7b1a4e78b80e6858be38082' USING utf8mb4), CONVERT(X'627574746f6e3a616374697665207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a616374697665' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f236163746976652d70736575646f' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a616374697665' USING utf8mb4),
display_label = CONVERT(X'e5959fe58b95e78b80e6858b' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e6ada3e8a2abe4bdbfe794a8e88085e5959fe58b95e79a84e58583e7b4a0e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e6ada3e8a2abe4bdbfe794a8e88085e5959fe58b95e79a84e58583e7b4a0e38082e4be8be5a682e4bba5e6bb91e9bca0e68c89e4bd8fe68c89e98895e79a84e69c9fe99693efbc9be5ae83e4b88de698afe68c81e7ba8ce981b8e58f96e79a84e9a081e7b1a4e78b80e6858be38082' USING utf8mb4),
example_code = CONVERT(X'627574746f6e3a616374697665207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a616374697665' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f236163746976652d70736575646f' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d616374697665' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f636c6173735f6e616d65' USING utf8mb4),
                    CONVERT(X'616374697665' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d666f637573' USING utf8mb4), CONVERT(X'3a666f637573' USING utf8mb4), CONVERT(X'e58f96e5be97e784a6e9bb9e' USING utf8mb4), CONVERT(X'e981b8e58f96e79baee5898de58f96e5be97e8bcb8e585a5e784a6e9bb9ee79a84e58583e7b4a0e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e79baee5898de58f96e5be97e8bcb8e585a5e784a6e9bb9ee79a84e58583e7b4a0e38082e784a6e9bb9ee58fafe4bba5e4be86e887aae98db5e79ba4e38081e68c87e6a899e6938de4bd9ce68896e7a88be5bc8fe38082' USING utf8mb4), CONVERT(X'696e7075743a666f637573207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a666f637573' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f23666f6375732d70736575646f' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a666f637573' USING utf8mb4),
display_label = CONVERT(X'e58f96e5be97e784a6e9bb9e' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e79baee5898de58f96e5be97e8bcb8e585a5e784a6e9bb9ee79a84e58583e7b4a0e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e79baee5898de58f96e5be97e8bcb8e585a5e784a6e9bb9ee79a84e58583e7b4a0e38082e784a6e9bb9ee58fafe4bba5e4be86e887aae98db5e79ba4e38081e68c87e6a899e6938de4bd9ce68896e7a88be5bc8fe38082' USING utf8mb4),
example_code = CONVERT(X'696e7075743a666f637573207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a666f637573' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f23666f6375732d70736575646f' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d666f637573' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f636c6173735f6e616d65' USING utf8mb4),
                    CONVERT(X'666f637573' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d666f6375732d76697369626c65' USING utf8mb4), CONVERT(X'3a666f6375732d76697369626c65' USING utf8mb4), CONVERT(X'e58fafe8a68be784a6e9bb9ee68f90e7a4ba' USING utf8mb4), CONVERT(X'e981b8e58f96e7808fe8a6bde599a8e588a4e5ae9ae68789e9a1afe7a4bae784a6e9bb9ee68f90e7a4bae79a84e784a6e9bb9ee58583e7b4a0e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e7808fe8a6bde599a8e588a4e5ae9ae68789e9a1afe7a4bae784a6e9bb9ee68f90e7a4bae79a84e784a6e9bb9ee58583e7b4a0e38082e5b8b8e794a8e696bce68f90e4be9be98db5e79ba4e5b08ee8a6bde69982e6b885e6a59ae79a84e5a496e6a186e38082' USING utf8mb4), CONVERT(X'627574746f6e3a666f6375732d76697369626c65207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a666f6375732d76697369626c65' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f23666f6375732d76697369626c652d70736575646f' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a666f6375732d76697369626c65' USING utf8mb4),
display_label = CONVERT(X'e58fafe8a68be784a6e9bb9ee68f90e7a4ba' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e7808fe8a6bde599a8e588a4e5ae9ae68789e9a1afe7a4bae784a6e9bb9ee68f90e7a4bae79a84e784a6e9bb9ee58583e7b4a0e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e7808fe8a6bde599a8e588a4e5ae9ae68789e9a1afe7a4bae784a6e9bb9ee68f90e7a4bae79a84e784a6e9bb9ee58583e7b4a0e38082e5b8b8e794a8e696bce68f90e4be9be98db5e79ba4e5b08ee8a6bde69982e6b885e6a59ae79a84e5a496e6a186e38082' USING utf8mb4),
example_code = CONVERT(X'627574746f6e3a666f6375732d76697369626c65207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a666f6375732d76697369626c65' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f23666f6375732d76697369626c652d70736575646f' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d666f6375732d76697369626c65' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f636c6173735f6e616d65' USING utf8mb4),
                    CONVERT(X'666f6375732d76697369626c65' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d666f6375732d77697468696e' USING utf8mb4), CONVERT(X'3a666f6375732d77697468696e' USING utf8mb4), CONVERT(X'e585a7e983a8e585b7e69c89e784a6e9bb9e' USING utf8mb4), CONVERT(X'e981b8e58f96e69cace8baabe68896e585b6e5be8ce4bba3e585b7e69c89e784a6e9bb9ee79a84e58583e7b4a0e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e69cace8baabe68896e585b6e5be8ce4bba3e585b7e69c89e784a6e9bb9ee79a84e58583e7b4a0e38082e58fafe59ca8e8a1a8e596aee6ac84e4bd8de58f96e5be97e784a6e9bb9ee69982e5bcb7e8aabfe695b4e7b584e5aeb9e599a8e38082' USING utf8mb4), CONVERT(X'2e6669656c643a666f6375732d77697468696e207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a666f6375732d77697468696e' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f23666f6375732d77697468696e2d70736575646f' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a666f6375732d77697468696e' USING utf8mb4),
display_label = CONVERT(X'e585a7e983a8e585b7e69c89e784a6e9bb9e' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e69cace8baabe68896e585b6e5be8ce4bba3e585b7e69c89e784a6e9bb9ee79a84e58583e7b4a0e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e69cace8baabe68896e585b6e5be8ce4bba3e585b7e69c89e784a6e9bb9ee79a84e58583e7b4a0e38082e58fafe59ca8e8a1a8e596aee6ac84e4bd8de58f96e5be97e784a6e9bb9ee69982e5bcb7e8aabfe695b4e7b584e5aeb9e599a8e38082' USING utf8mb4),
example_code = CONVERT(X'2e6669656c643a666f6375732d77697468696e207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a666f6375732d77697468696e' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f23666f6375732d77697468696e2d70736575646f' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d666f6375732d77697468696e' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f636c6173735f6e616d65' USING utf8mb4),
                    CONVERT(X'666f6375732d77697468696e' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d6c696e6b' USING utf8mb4), CONVERT(X'3a6c696e6b' USING utf8mb4), CONVERT(X'e69caae980a0e8a8aae980a3e7b590' USING utf8mb4), CONVERT(X'e981b8e58f96e5b09ae69caae980a0e8a8aae79a84e8b685e980a3e7b590e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e5b09ae69caae980a0e8a8aae79a84e8b685e980a3e7b590e38082e9809ae5b8b8e88887203a7669736974656420e690ade9858de8a8ade5ae9ae980a3e7b590e5a496e8a780e38082' USING utf8mb4), CONVERT(X'613a6c696e6b207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a6c696e6b' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f236c696e6b2d70736575646f' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a6c696e6b' USING utf8mb4),
display_label = CONVERT(X'e69caae980a0e8a8aae980a3e7b590' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e5b09ae69caae980a0e8a8aae79a84e8b685e980a3e7b590e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e5b09ae69caae980a0e8a8aae79a84e8b685e980a3e7b590e38082e9809ae5b8b8e88887203a7669736974656420e690ade9858de8a8ade5ae9ae980a3e7b590e5a496e8a780e38082' USING utf8mb4),
example_code = CONVERT(X'613a6c696e6b207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a6c696e6b' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f236c696e6b2d70736575646f' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d6c696e6b' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f636c6173735f6e616d65' USING utf8mb4),
                    CONVERT(X'6c696e6b' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d76697369746564' USING utf8mb4), CONVERT(X'3a76697369746564' USING utf8mb4), CONVERT(X'e5b7b2e980a0e8a8aae980a3e7b590' USING utf8mb4), CONVERT(X'e981b8e58f96e4bdbfe794a8e88085e5b7b2e980a0e8a8aae79a84e8b685e980a3e7b590e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e4bdbfe794a8e88085e5b7b2e980a0e8a8aae79a84e8b685e980a3e7b590e38082e59fbae696bce99ab1e7a781efbc8ce7808fe8a6bde599a8e69c83e99990e588b6e58fafe794a8e696bce5b7b2e980a0e8a8aae980a3e7b590e79a84e6a8a3e5bc8fe58f8ae8b387e8a88ae8ae80e58f96e38082' USING utf8mb4), CONVERT(X'613a76697369746564207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a76697369746564' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f23766973697465642d70736575646f' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a76697369746564' USING utf8mb4),
display_label = CONVERT(X'e5b7b2e980a0e8a8aae980a3e7b590' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e4bdbfe794a8e88085e5b7b2e980a0e8a8aae79a84e8b685e980a3e7b590e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e4bdbfe794a8e88085e5b7b2e980a0e8a8aae79a84e8b685e980a3e7b590e38082e59fbae696bce99ab1e7a781efbc8ce7808fe8a6bde599a8e69c83e99990e588b6e58fafe794a8e696bce5b7b2e980a0e8a8aae980a3e7b590e79a84e6a8a3e5bc8fe58f8ae8b387e8a88ae8ae80e58f96e38082' USING utf8mb4),
example_code = CONVERT(X'613a76697369746564207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a76697369746564' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f23766973697465642d70736575646f' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d76697369746564' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f636c6173735f6e616d65' USING utf8mb4),
                    CONVERT(X'76697369746564' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d66697273742d6368696c64' USING utf8mb4), CONVERT(X'3a66697273742d6368696c64' USING utf8mb4), CONVERT(X'e7acace4b880e5808be5ad90e58583e7b4a0' USING utf8mb4), CONVERT(X'e981b8e58f96e59ca8e58584e5bc9fe58583e7b4a0e4b8ade4bd8de696bce7acace4b880e5808be4bd8de7bdaee79a84e58583e7b4a0e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e59ca8e58584e5bc9fe58583e7b4a0e4b8ade4bd8de696bce7acace4b880e5808be4bd8de7bdaee79a84e58583e7b4a0e38082e4bd8de7bdaee4be9de58583e7b4a0e8a888e7ae97efbc8ce4b88de58faae6af94e8bc83e5908ce4b880e7a8aee9a19ee59e8be38082' USING utf8mb4), CONVERT(X'6c693a66697273742d6368696c64207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a66697273742d6368696c64' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f2366697273742d6368696c642d70736575646f' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a66697273742d6368696c64' USING utf8mb4),
display_label = CONVERT(X'e7acace4b880e5808be5ad90e58583e7b4a0' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e59ca8e58584e5bc9fe58583e7b4a0e4b8ade4bd8de696bce7acace4b880e5808be4bd8de7bdaee79a84e58583e7b4a0e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e59ca8e58584e5bc9fe58583e7b4a0e4b8ade4bd8de696bce7acace4b880e5808be4bd8de7bdaee79a84e58583e7b4a0e38082e4bd8de7bdaee4be9de58583e7b4a0e8a888e7ae97efbc8ce4b88de58faae6af94e8bc83e5908ce4b880e7a8aee9a19ee59e8be38082' USING utf8mb4),
example_code = CONVERT(X'6c693a66697273742d6368696c64207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a66697273742d6368696c64' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f2366697273742d6368696c642d70736575646f' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d66697273742d6368696c64' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f636c6173735f6e616d65' USING utf8mb4),
                    CONVERT(X'66697273742d6368696c64' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d6c6173742d6368696c64' USING utf8mb4), CONVERT(X'3a6c6173742d6368696c64' USING utf8mb4), CONVERT(X'e69c80e5be8ce4b880e5808be5ad90e58583e7b4a0' USING utf8mb4), CONVERT(X'e981b8e58f96e59ca8e58584e5bc9fe58583e7b4a0e4b8ade4bd8de696bce69c80e5be8ce4b880e5808be4bd8de7bdaee79a84e58583e7b4a0e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e59ca8e58584e5bc9fe58583e7b4a0e4b8ade4bd8de696bce69c80e5be8ce4b880e5808be4bd8de7bdaee79a84e58583e7b4a0e38082e69687e5ad97e88887e8a8bbe8a7a3e7af80e9bb9ee4b88de58897e585a5e58583e7b4a0e4bd8de7bdaee38082' USING utf8mb4), CONVERT(X'6c693a6c6173742d6368696c64207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a6c6173742d6368696c64' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f236c6173742d6368696c642d70736575646f' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a6c6173742d6368696c64' USING utf8mb4),
display_label = CONVERT(X'e69c80e5be8ce4b880e5808be5ad90e58583e7b4a0' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e59ca8e58584e5bc9fe58583e7b4a0e4b8ade4bd8de696bce69c80e5be8ce4b880e5808be4bd8de7bdaee79a84e58583e7b4a0e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e59ca8e58584e5bc9fe58583e7b4a0e4b8ade4bd8de696bce69c80e5be8ce4b880e5808be4bd8de7bdaee79a84e58583e7b4a0e38082e69687e5ad97e88887e8a8bbe8a7a3e7af80e9bb9ee4b88de58897e585a5e58583e7b4a0e4bd8de7bdaee38082' USING utf8mb4),
example_code = CONVERT(X'6c693a6c6173742d6368696c64207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a6c6173742d6368696c64' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f236c6173742d6368696c642d70736575646f' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d6c6173742d6368696c64' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f636c6173735f6e616d65' USING utf8mb4),
                    CONVERT(X'6c6173742d6368696c64' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d6f6e6c792d6368696c64' USING utf8mb4), CONVERT(X'3a6f6e6c792d6368696c64' USING utf8mb4), CONVERT(X'e594afe4b880e5ad90e58583e7b4a0' USING utf8mb4), CONVERT(X'e981b8e58f96e6b292e69c89e585b6e4bb96e58584e5bc9fe58583e7b4a0e79a84e58583e7b4a0e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e6b292e69c89e585b6e4bb96e58584e5bc9fe58583e7b4a0e79a84e58583e7b4a0e38082e4b88de8a681e6b182e788b6e58583e7b4a0e585a7e5ae8ce585a8e6b292e69c89e69687e5ad97e7af80e9bb9ee38082' USING utf8mb4), CONVERT(X'703a6f6e6c792d6368696c64207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a6f6e6c792d6368696c64' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f236f6e6c792d6368696c642d70736575646f' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a6f6e6c792d6368696c64' USING utf8mb4),
display_label = CONVERT(X'e594afe4b880e5ad90e58583e7b4a0' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e6b292e69c89e585b6e4bb96e58584e5bc9fe58583e7b4a0e79a84e58583e7b4a0e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e6b292e69c89e585b6e4bb96e58584e5bc9fe58583e7b4a0e79a84e58583e7b4a0e38082e4b88de8a681e6b182e788b6e58583e7b4a0e585a7e5ae8ce585a8e6b292e69c89e69687e5ad97e7af80e9bb9ee38082' USING utf8mb4),
example_code = CONVERT(X'703a6f6e6c792d6368696c64207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a6f6e6c792d6368696c64' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f236f6e6c792d6368696c642d70736575646f' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d6f6e6c792d6368696c64' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f636c6173735f6e616d65' USING utf8mb4),
                    CONVERT(X'6f6e6c792d6368696c64' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d6e74682d6368696c64' USING utf8mb4), CONVERT(X'3a6e74682d6368696c642829' USING utf8mb4), CONVERT(X'e5ad90e58583e7b4a0e4bd8de7bdaee6af94e5b08d' USING utf8mb4), CONVERT(X'e4be9de58584e5bc9fe58583e7b4a0e4bd8de7bdaee585ace5bc8fe981b8e58f96e58583e7b4a0e38082' USING utf8mb4), CONVERT(X'e4be9de58584e5bc9fe58583e7b4a0e4bd8de7bdaee585ace5bc8fe981b8e58f96e58583e7b4a0e38082e58fafe4bdbfe794a8206f6464e380816576656ee38081416e2b42efbc8ce4b8a6e58fafe794a8206f6620e981b8e69387e599a8e6b885e596aee99990e588b6e4bd8de7bdaee6af94e5b08de79a84e5b08de8b1a1e38082' USING utf8mb4), CONVERT(X'6c693a6e74682d6368696c6428326e29207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a6e74682d6368696c642829' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f236e74682d6368696c642d70736575646f' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a6e74682d6368696c642829' USING utf8mb4),
display_label = CONVERT(X'e5ad90e58583e7b4a0e4bd8de7bdaee6af94e5b08d' USING utf8mb4),
summary = CONVERT(X'e4be9de58584e5bc9fe58583e7b4a0e4bd8de7bdaee585ace5bc8fe981b8e58f96e58583e7b4a0e38082' USING utf8mb4),
description = CONVERT(X'e4be9de58584e5bc9fe58583e7b4a0e4bd8de7bdaee585ace5bc8fe981b8e58f96e58583e7b4a0e38082e58fafe4bdbfe794a8206f6464e380816576656ee38081416e2b42efbc8ce4b8a6e58fafe794a8206f6620e981b8e69387e599a8e6b885e596aee99990e588b6e4bd8de7bdaee6af94e5b08de79a84e5b08de8b1a1e38082' USING utf8mb4),
example_code = CONVERT(X'6c693a6e74682d6368696c6428326e29207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a6e74682d6368696c642829' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f236e74682d6368696c642d70736575646f' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d6e74682d6368696c64' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f636c6173735f6e616d65' USING utf8mb4),
                    CONVERT(X'6e74682d6368696c64' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d6e74682d6c6173742d6368696c64' USING utf8mb4), CONVERT(X'3a6e74682d6c6173742d6368696c642829' USING utf8mb4), CONVERT(X'e58f8de59091e5ad90e58583e7b4a0e4bd8de7bdaee6af94e5b08d' USING utf8mb4), CONVERT(X'e794b1e69c80e5be8ce4b880e5808be58584e5bc9fe58583e7b4a0e9968be5a78be8a888e7ae97e4bd8de7bdaee4b8a6e981b8e58f96e38082' USING utf8mb4), CONVERT(X'e794b1e69c80e5be8ce4b880e5808be58584e5bc9fe58583e7b4a0e9968be5a78be8a888e7ae97e4bd8de7bdaee4b8a6e981b8e58f96e38082e58fafe4bdbfe794a820416e2b4220e7ad89e585ace5bc8fe38082' USING utf8mb4), CONVERT(X'6c693a6e74682d6c6173742d6368696c64283229207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a6e74682d6c6173742d6368696c642829' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f236e74682d6c6173742d6368696c642d70736575646f' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a6e74682d6c6173742d6368696c642829' USING utf8mb4),
display_label = CONVERT(X'e58f8de59091e5ad90e58583e7b4a0e4bd8de7bdaee6af94e5b08d' USING utf8mb4),
summary = CONVERT(X'e794b1e69c80e5be8ce4b880e5808be58584e5bc9fe58583e7b4a0e9968be5a78be8a888e7ae97e4bd8de7bdaee4b8a6e981b8e58f96e38082' USING utf8mb4),
description = CONVERT(X'e794b1e69c80e5be8ce4b880e5808be58584e5bc9fe58583e7b4a0e9968be5a78be8a888e7ae97e4bd8de7bdaee4b8a6e981b8e58f96e38082e58fafe4bdbfe794a820416e2b4220e7ad89e585ace5bc8fe38082' USING utf8mb4),
example_code = CONVERT(X'6c693a6e74682d6c6173742d6368696c64283229207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a6e74682d6c6173742d6368696c642829' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f236e74682d6c6173742d6368696c642d70736575646f' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d6e74682d6c6173742d6368696c64' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f636c6173735f6e616d65' USING utf8mb4),
                    CONVERT(X'6e74682d6c6173742d6368696c64' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d66697273742d6f662d74797065' USING utf8mb4), CONVERT(X'3a66697273742d6f662d74797065' USING utf8mb4), CONVERT(X'e5908ce9a19ee59e8be7acace4b880e5808be58583e7b4a0' USING utf8mb4), CONVERT(X'e981b8e58f96e5908ce4b880e58583e7b4a0e9a19ee59e8be58584e5bc9fe4b8ade79a84e7acace4b880e5808be58583e7b4a0e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e5908ce4b880e58583e7b4a0e9a19ee59e8be58584e5bc9fe4b8ade79a84e7acace4b880e5808be58583e7b4a0e38082e88887203a66697273742d6368696c6420e4b88de5908cefbc8ce5ae83e58faae6af94e8bc83e5908ce9a19ee59e8be58583e7b4a0e38082' USING utf8mb4), CONVERT(X'703a66697273742d6f662d74797065207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a66697273742d6f662d74797065' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f2366697273742d6f662d747970652d70736575646f' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a66697273742d6f662d74797065' USING utf8mb4),
display_label = CONVERT(X'e5908ce9a19ee59e8be7acace4b880e5808be58583e7b4a0' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e5908ce4b880e58583e7b4a0e9a19ee59e8be58584e5bc9fe4b8ade79a84e7acace4b880e5808be58583e7b4a0e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e5908ce4b880e58583e7b4a0e9a19ee59e8be58584e5bc9fe4b8ade79a84e7acace4b880e5808be58583e7b4a0e38082e88887203a66697273742d6368696c6420e4b88de5908cefbc8ce5ae83e58faae6af94e8bc83e5908ce9a19ee59e8be58583e7b4a0e38082' USING utf8mb4),
example_code = CONVERT(X'703a66697273742d6f662d74797065207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a66697273742d6f662d74797065' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f2366697273742d6f662d747970652d70736575646f' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d66697273742d6f662d74797065' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f636c6173735f6e616d65' USING utf8mb4),
                    CONVERT(X'66697273742d6f662d74797065' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d6c6173742d6f662d74797065' USING utf8mb4), CONVERT(X'3a6c6173742d6f662d74797065' USING utf8mb4), CONVERT(X'e5908ce9a19ee59e8be69c80e5be8ce4b880e5808be58583e7b4a0' USING utf8mb4), CONVERT(X'e981b8e58f96e5908ce4b880e58583e7b4a0e9a19ee59e8be58584e5bc9fe4b8ade79a84e69c80e5be8ce4b880e5808be58583e7b4a0e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e5908ce4b880e58583e7b4a0e9a19ee59e8be58584e5bc9fe4b8ade79a84e69c80e5be8ce4b880e5808be58583e7b4a0e38082e58fafe794a8e696bce5bcb7e8aabfe58d80e5a18ae4b8ade79a84e69c80e5be8ce4b880e6aeb5e69687e5ad97e38082' USING utf8mb4), CONVERT(X'703a6c6173742d6f662d74797065207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a6c6173742d6f662d74797065' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f236c6173742d6f662d747970652d70736575646f' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a6c6173742d6f662d74797065' USING utf8mb4),
display_label = CONVERT(X'e5908ce9a19ee59e8be69c80e5be8ce4b880e5808be58583e7b4a0' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e5908ce4b880e58583e7b4a0e9a19ee59e8be58584e5bc9fe4b8ade79a84e69c80e5be8ce4b880e5808be58583e7b4a0e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e5908ce4b880e58583e7b4a0e9a19ee59e8be58584e5bc9fe4b8ade79a84e69c80e5be8ce4b880e5808be58583e7b4a0e38082e58fafe794a8e696bce5bcb7e8aabfe58d80e5a18ae4b8ade79a84e69c80e5be8ce4b880e6aeb5e69687e5ad97e38082' USING utf8mb4),
example_code = CONVERT(X'703a6c6173742d6f662d74797065207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a6c6173742d6f662d74797065' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f236c6173742d6f662d747970652d70736575646f' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d6c6173742d6f662d74797065' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f636c6173735f6e616d65' USING utf8mb4),
                    CONVERT(X'6c6173742d6f662d74797065' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d6e74682d6f662d74797065' USING utf8mb4), CONVERT(X'3a6e74682d6f662d747970652829' USING utf8mb4), CONVERT(X'e5908ce9a19ee59e8be4bd8de7bdaee6af94e5b08d' USING utf8mb4), CONVERT(X'e4be9de5908ce4b880e58583e7b4a0e9a19ee59e8be79a84e58584e5bc9fe4bd8de7bdaee981b8e58f96e58583e7b4a0e38082' USING utf8mb4), CONVERT(X'e4be9de5908ce4b880e58583e7b4a0e9a19ee59e8be79a84e58584e5bc9fe4bd8de7bdaee981b8e58f96e58583e7b4a0e38082e4bdbfe794a820416e2b4220e7ad89e585ace5bc8fefbc8ce88887e9a19ee588a5e5908de7a8b1e698afe590a6e79bb8e5908ce784a1e9979ce38082' USING utf8mb4), CONVERT(X'703a6e74682d6f662d74797065283229207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a6e74682d6f662d747970652829' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f236e74682d6f662d747970652d70736575646f' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a6e74682d6f662d747970652829' USING utf8mb4),
display_label = CONVERT(X'e5908ce9a19ee59e8be4bd8de7bdaee6af94e5b08d' USING utf8mb4),
summary = CONVERT(X'e4be9de5908ce4b880e58583e7b4a0e9a19ee59e8be79a84e58584e5bc9fe4bd8de7bdaee981b8e58f96e58583e7b4a0e38082' USING utf8mb4),
description = CONVERT(X'e4be9de5908ce4b880e58583e7b4a0e9a19ee59e8be79a84e58584e5bc9fe4bd8de7bdaee981b8e58f96e58583e7b4a0e38082e4bdbfe794a820416e2b4220e7ad89e585ace5bc8fefbc8ce88887e9a19ee588a5e5908de7a8b1e698afe590a6e79bb8e5908ce784a1e9979ce38082' USING utf8mb4),
example_code = CONVERT(X'703a6e74682d6f662d74797065283229207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a6e74682d6f662d747970652829' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f236e74682d6f662d747970652d70736575646f' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d6e74682d6f662d74797065' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f636c6173735f6e616d65' USING utf8mb4),
                    CONVERT(X'6e74682d6f662d74797065' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d726f6f74' USING utf8mb4), CONVERT(X'3a726f6f74' USING utf8mb4), CONVERT(X'e69687e4bbb6e6a0b9e58583e7b4a0' USING utf8mb4), CONVERT(X'e981b8e58f96e69687e4bbb6e79a84e6a0b9e58583e7b4a0e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e69687e4bbb6e79a84e6a0b9e58583e7b4a0e38082e59ca82048544d4c20e69687e4bbb6e4b8ade9809ae5b8b8e698af2068746d6cefbc8ce5b8b8e794a8e696bce5aea3e5918ae585a8e59f9fe887aae8a882e5b1ace680a7e38082' USING utf8mb4), CONVERT(X'3a726f6f74207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a726f6f74' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f23726f6f742d70736575646f' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a726f6f74' USING utf8mb4),
display_label = CONVERT(X'e69687e4bbb6e6a0b9e58583e7b4a0' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e69687e4bbb6e79a84e6a0b9e58583e7b4a0e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e69687e4bbb6e79a84e6a0b9e58583e7b4a0e38082e59ca82048544d4c20e69687e4bbb6e4b8ade9809ae5b8b8e698af2068746d6cefbc8ce5b8b8e794a8e696bce5aea3e5918ae585a8e59f9fe887aae8a882e5b1ace680a7e38082' USING utf8mb4),
example_code = CONVERT(X'3a726f6f74207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a726f6f74' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f23726f6f742d70736575646f' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d726f6f74' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f636c6173735f6e616d65' USING utf8mb4),
                    CONVERT(X'726f6f74' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d656d707479' USING utf8mb4), CONVERT(X'3a656d707479' USING utf8mb4), CONVERT(X'e7a9bae58583e7b4a0e78b80e6858b' USING utf8mb4), CONVERT(X'e4be9de8a68fe7af84e79a84e7a9bae585a7e5aeb9e6a29de4bbb6e981b8e58f96e58583e7b4a0e38082' USING utf8mb4), CONVERT(X'e4be9de8a68fe7af84e79a84e7a9bae585a7e5aeb9e6a29de4bbb6e981b8e58f96e58583e7b4a0e38082e7a9bae799bde69687e5ad97e698afe590a6e5bdb1e99fbfe6af94e5b08defbc8ce99c80e6b3a8e6848fe8a68fe7af84e78988e69cace88887e7808fe8a6bde599a8e5afa6e4bd9ce5b7aee795b0efbc9be69c80e79bb4e68ea5e79a84e4be8be5ad90e698afe6b292e69c89e4bbbbe4bd95e585a7e5aeb9e79a84e58583e7b4a0e38082' USING utf8mb4), CONVERT(X'703a656d707479207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a656d707479' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f23656d7074792d70736575646f' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a656d707479' USING utf8mb4),
display_label = CONVERT(X'e7a9bae58583e7b4a0e78b80e6858b' USING utf8mb4),
summary = CONVERT(X'e4be9de8a68fe7af84e79a84e7a9bae585a7e5aeb9e6a29de4bbb6e981b8e58f96e58583e7b4a0e38082' USING utf8mb4),
description = CONVERT(X'e4be9de8a68fe7af84e79a84e7a9bae585a7e5aeb9e6a29de4bbb6e981b8e58f96e58583e7b4a0e38082e7a9bae799bde69687e5ad97e698afe590a6e5bdb1e99fbfe6af94e5b08defbc8ce99c80e6b3a8e6848fe8a68fe7af84e78988e69cace88887e7808fe8a6bde599a8e5afa6e4bd9ce5b7aee795b0efbc9be69c80e79bb4e68ea5e79a84e4be8be5ad90e698afe6b292e69c89e4bbbbe4bd95e585a7e5aeb9e79a84e58583e7b4a0e38082' USING utf8mb4),
example_code = CONVERT(X'703a656d707479207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a656d707479' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f23656d7074792d70736575646f' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d656d707479' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f636c6173735f6e616d65' USING utf8mb4),
                    CONVERT(X'656d707479' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d636865636b6564' USING utf8mb4), CONVERT(X'3a636865636b6564' USING utf8mb4), CONVERT(X'e58bbee981b8e78b80e6858b' USING utf8mb4), CONVERT(X'e981b8e58f96e5b7b2e58bbee981b8e68896e981b8e58f96e79a84e981a9e794a8e8a1a8e596aee68ea7e588b6e9a085e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e5b7b2e58bbee981b8e68896e981b8e58f96e79a84e981a9e794a8e8a1a8e596aee68ea7e588b6e9a085e38082e4be8be5a68220636865636b626f78e38081726164696f20e88887e5b7b2e981b8e58f96e79a84206f7074696f6ee38082' USING utf8mb4), CONVERT(X'696e7075743a636865636b6564207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a636865636b6564' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f23636865636b65642d70736575646f' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a636865636b6564' USING utf8mb4),
display_label = CONVERT(X'e58bbee981b8e78b80e6858b' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e5b7b2e58bbee981b8e68896e981b8e58f96e79a84e981a9e794a8e8a1a8e596aee68ea7e588b6e9a085e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e5b7b2e58bbee981b8e68896e981b8e58f96e79a84e981a9e794a8e8a1a8e596aee68ea7e588b6e9a085e38082e4be8be5a68220636865636b626f78e38081726164696f20e88887e5b7b2e981b8e58f96e79a84206f7074696f6ee38082' USING utf8mb4),
example_code = CONVERT(X'696e7075743a636865636b6564207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a636865636b6564' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f23636865636b65642d70736575646f' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d636865636b6564' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f636c6173735f6e616d65' USING utf8mb4),
                    CONVERT(X'636865636b6564' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d64697361626c6564' USING utf8mb4), CONVERT(X'3a64697361626c6564' USING utf8mb4), CONVERT(X'e5819ce794a8e78b80e6858b' USING utf8mb4), CONVERT(X'e981b8e58f96e89995e696bce5819ce794a8e78b80e6858be79a84e981a9e794a8e58583e7b4a0e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e89995e696bce5819ce794a8e78b80e6858be79a84e981a9e794a8e58583e7b4a0e38082e5ae83e4b88de698afe6aaa2e69fa5e68980e69c89e58583e7b4a0e698afe590a6e4bbbbe6848fe5b8b6e69c892064697361626c656420e5ad97e6a8a3e38082' USING utf8mb4), CONVERT(X'627574746f6e3a64697361626c6564207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a64697361626c6564' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f2364697361626c65642d70736575646f' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a64697361626c6564' USING utf8mb4),
display_label = CONVERT(X'e5819ce794a8e78b80e6858b' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e89995e696bce5819ce794a8e78b80e6858be79a84e981a9e794a8e58583e7b4a0e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e89995e696bce5819ce794a8e78b80e6858be79a84e981a9e794a8e58583e7b4a0e38082e5ae83e4b88de698afe6aaa2e69fa5e68980e69c89e58583e7b4a0e698afe590a6e4bbbbe6848fe5b8b6e69c892064697361626c656420e5ad97e6a8a3e38082' USING utf8mb4),
example_code = CONVERT(X'627574746f6e3a64697361626c6564207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a64697361626c6564' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f2364697361626c65642d70736575646f' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d64697361626c6564' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f636c6173735f6e616d65' USING utf8mb4),
                    CONVERT(X'64697361626c6564' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d656e61626c6564' USING utf8mb4), CONVERT(X'3a656e61626c6564' USING utf8mb4), CONVERT(X'e58fafe794a8e78b80e6858b' USING utf8mb4), CONVERT(X'e981b8e58f96e89995e696bce58fafe794a8e78b80e6858be79a84e981a9e794a8e58583e7b4a0e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e89995e696bce58fafe794a8e78b80e6858be79a84e981a9e794a8e58583e7b4a0e38082e5b8b8e794a8e696bce4be9de698afe590a6e5819ce794a8e8aabfe695b4e8a1a8e596aee68ea7e588b6e9a085e5a496e8a780e38082' USING utf8mb4), CONVERT(X'696e7075743a656e61626c6564207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a656e61626c6564' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f23656e61626c65642d70736575646f' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a656e61626c6564' USING utf8mb4),
display_label = CONVERT(X'e58fafe794a8e78b80e6858b' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e89995e696bce58fafe794a8e78b80e6858be79a84e981a9e794a8e58583e7b4a0e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e89995e696bce58fafe794a8e78b80e6858be79a84e981a9e794a8e58583e7b4a0e38082e5b8b8e794a8e696bce4be9de698afe590a6e5819ce794a8e8aabfe695b4e8a1a8e596aee68ea7e588b6e9a085e5a496e8a780e38082' USING utf8mb4),
example_code = CONVERT(X'696e7075743a656e61626c6564207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a656e61626c6564' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f23656e61626c65642d70736575646f' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d656e61626c6564' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f636c6173735f6e616d65' USING utf8mb4),
                    CONVERT(X'656e61626c6564' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d7265717569726564' USING utf8mb4), CONVERT(X'3a7265717569726564' USING utf8mb4), CONVERT(X'e5bf85e5a1abe78b80e6858b' USING utf8mb4), CONVERT(X'e981b8e58f96e5bf85e9a088e5a1abe5afabe79a84e981a9e794a8e8a1a8e596aee58583e7b4a0e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e5bf85e9a088e5a1abe5afabe79a84e981a9e794a8e8a1a8e596aee58583e7b4a0e38082e9809ae5b8b8e5b08de687892048544d4c20726571756972656420e7b484e69d9fe38082' USING utf8mb4), CONVERT(X'696e7075743a7265717569726564207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a7265717569726564' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f2372657175697265642d70736575646f' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a7265717569726564' USING utf8mb4),
display_label = CONVERT(X'e5bf85e5a1abe78b80e6858b' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e5bf85e9a088e5a1abe5afabe79a84e981a9e794a8e8a1a8e596aee58583e7b4a0e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e5bf85e9a088e5a1abe5afabe79a84e981a9e794a8e8a1a8e596aee58583e7b4a0e38082e9809ae5b8b8e5b08de687892048544d4c20726571756972656420e7b484e69d9fe38082' USING utf8mb4),
example_code = CONVERT(X'696e7075743a7265717569726564207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a7265717569726564' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f2372657175697265642d70736575646f' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d7265717569726564' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f636c6173735f6e616d65' USING utf8mb4),
                    CONVERT(X'7265717569726564' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d6f7074696f6e616c' USING utf8mb4), CONVERT(X'3a6f7074696f6e616c' USING utf8mb4), CONVERT(X'e99d9ee5bf85e5a1abe78b80e6858b' USING utf8mb4), CONVERT(X'e981b8e58f96e4b88de585b7e69c89e5bf85e5a1abe8a681e6b182e79a84e981a9e794a8e8a1a8e596aee58583e7b4a0e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e4b88de585b7e69c89e5bf85e5a1abe8a681e6b182e79a84e981a9e794a8e8a1a8e596aee58583e7b4a0e38082e5ae83e4b88de698afe68980e69c89e69caae5b8b620726571756972656420e5b1ace680a7e79a84e4bbbbe6848fe58583e7b4a0e38082' USING utf8mb4), CONVERT(X'696e7075743a6f7074696f6e616c207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a6f7074696f6e616c' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f236f7074696f6e616c2d70736575646f' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a6f7074696f6e616c' USING utf8mb4),
display_label = CONVERT(X'e99d9ee5bf85e5a1abe78b80e6858b' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e4b88de585b7e69c89e5bf85e5a1abe8a681e6b182e79a84e981a9e794a8e8a1a8e596aee58583e7b4a0e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e4b88de585b7e69c89e5bf85e5a1abe8a681e6b182e79a84e981a9e794a8e8a1a8e596aee58583e7b4a0e38082e5ae83e4b88de698afe68980e69c89e69caae5b8b620726571756972656420e5b1ace680a7e79a84e4bbbbe6848fe58583e7b4a0e38082' USING utf8mb4),
example_code = CONVERT(X'696e7075743a6f7074696f6e616c207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a6f7074696f6e616c' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f236f7074696f6e616c2d70736575646f' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d6f7074696f6e616c' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f636c6173735f6e616d65' USING utf8mb4),
                    CONVERT(X'6f7074696f6e616c' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d76616c6964' USING utf8mb4), CONVERT(X'3a76616c6964' USING utf8mb4), CONVERT(X'e9a997e8ad89e69c89e69588e78b80e6858b' USING utf8mb4), CONVERT(X'e981b8e58f96e7aca6e59088e79bb8e9979ce8b387e69699e9a997e8ad89e6a29de4bbb6e79a84e981a9e794a8e58583e7b4a0e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e7aca6e59088e79bb8e9979ce8b387e69699e9a997e8ad89e6a29de4bbb6e79a84e981a9e794a8e58583e7b4a0e38082e9a997e8ad89e6a29de4bbb6e58fafe4be86e887aae8bcb8e585a5e9a19ee59e8be58f8ae8a1a8e596aee7b484e69d9fe38082' USING utf8mb4), CONVERT(X'696e7075743a76616c6964207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a76616c6964' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f2376616c69642d70736575646f' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a76616c6964' USING utf8mb4),
display_label = CONVERT(X'e9a997e8ad89e69c89e69588e78b80e6858b' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e7aca6e59088e79bb8e9979ce8b387e69699e9a997e8ad89e6a29de4bbb6e79a84e981a9e794a8e58583e7b4a0e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e7aca6e59088e79bb8e9979ce8b387e69699e9a997e8ad89e6a29de4bbb6e79a84e981a9e794a8e58583e7b4a0e38082e9a997e8ad89e6a29de4bbb6e58fafe4be86e887aae8bcb8e585a5e9a19ee59e8be58f8ae8a1a8e596aee7b484e69d9fe38082' USING utf8mb4),
example_code = CONVERT(X'696e7075743a76616c6964207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a76616c6964' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f2376616c69642d70736575646f' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d76616c6964' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f636c6173735f6e616d65' USING utf8mb4),
                    CONVERT(X'76616c6964' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d696e76616c6964' USING utf8mb4), CONVERT(X'3a696e76616c6964' USING utf8mb4), CONVERT(X'e9a997e8ad89e784a1e69588e78b80e6858b' USING utf8mb4), CONVERT(X'e981b8e58f96e69caae7aca6e59088e79bb8e9979ce8b387e69699e9a997e8ad89e6a29de4bbb6e79a84e981a9e794a8e58583e7b4a0e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e69caae7aca6e59088e79bb8e9979ce8b387e69699e9a997e8ad89e6a29de4bbb6e79a84e981a9e794a8e58583e7b4a0e38082e698afe590a6e59ca8e4ba92e58b95e5898de5b0b1e9a1afe7a4bae98cafe8aaa4e6a8a3e5bc8fefbc8ce99c80e9858de59088e794a2e59381e79a84e8a1a8e596aee8a8ade8a888e38082' USING utf8mb4), CONVERT(X'696e7075743a696e76616c6964207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a696e76616c6964' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f23696e76616c69642d70736575646f' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a696e76616c6964' USING utf8mb4),
display_label = CONVERT(X'e9a997e8ad89e784a1e69588e78b80e6858b' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e69caae7aca6e59088e79bb8e9979ce8b387e69699e9a997e8ad89e6a29de4bbb6e79a84e981a9e794a8e58583e7b4a0e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e69caae7aca6e59088e79bb8e9979ce8b387e69699e9a997e8ad89e6a29de4bbb6e79a84e981a9e794a8e58583e7b4a0e38082e698afe590a6e59ca8e4ba92e58b95e5898de5b0b1e9a1afe7a4bae98cafe8aaa4e6a8a3e5bc8fefbc8ce99c80e9858de59088e794a2e59381e79a84e8a1a8e596aee8a8ade8a888e38082' USING utf8mb4),
example_code = CONVERT(X'696e7075743a696e76616c6964207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a696e76616c6964' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f23696e76616c69642d70736575646f' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d696e76616c6964' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f636c6173735f6e616d65' USING utf8mb4),
                    CONVERT(X'696e76616c6964' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d746172676574' USING utf8mb4), CONVERT(X'3a746172676574' USING utf8mb4), CONVERT(X'e7b6b2e59d80e79baee6a899e58583e7b4a0' USING utf8mb4), CONVERT(X'e981b8e58f96e79baee5898de7b6b2e59d80e78987e6aeb5e8ad98e588a5e79a84e79baee6a899e58583e7b4a0e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e79baee5898de7b6b2e59d80e78987e6aeb5e8ad98e588a5e79a84e79baee6a899e58583e7b4a0e38082e4be8be5a682e7b6b2e59d80e7b590e5b0bee782ba2023696e74726f20e69982efbc8ce5b08de68789e588b0e79bb8e5908c20696420e79a84e58583e7b4a0e38082' USING utf8mb4), CONVERT(X'73656374696f6e3a746172676574207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a746172676574' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f237461726765742d70736575646f' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a746172676574' USING utf8mb4),
display_label = CONVERT(X'e7b6b2e59d80e79baee6a899e58583e7b4a0' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e79baee5898de7b6b2e59d80e78987e6aeb5e8ad98e588a5e79a84e79baee6a899e58583e7b4a0e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e79baee5898de7b6b2e59d80e78987e6aeb5e8ad98e588a5e79a84e79baee6a899e58583e7b4a0e38082e4be8be5a682e7b6b2e59d80e7b590e5b0bee782ba2023696e74726f20e69982efbc8ce5b08de68789e588b0e79bb8e5908c20696420e79a84e58583e7b4a0e38082' USING utf8mb4),
example_code = CONVERT(X'73656374696f6e3a746172676574207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a746172676574' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f237461726765742d70736575646f' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d746172676574' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f636c6173735f6e616d65' USING utf8mb4),
                    CONVERT(X'746172676574' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d6e6f74' USING utf8mb4), CONVERT(X'3a6e6f742829' USING utf8mb4), CONVERT(X'e590a6e5ae9ae6af94e5b08d' USING utf8mb4), CONVERT(X'e981b8e58f96e4b88de7aca6e59088e58f83e695b8e981b8e69387e599a8e6b885e596aee79a84e58583e7b4a0e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e4b88de7aca6e59088e58f83e695b8e981b8e69387e599a8e6b885e596aee79a84e58583e7b4a0e38082e58f83e695b8e794a8e696bce68e92e999a4e6a29de4bbb6efbc8ce4b8a6e69c83e4be9de8a68fe58987e5bdb1e99fbfe981b8e69387e599a8e6ac8ae9878de38082' USING utf8mb4), CONVERT(X'627574746f6e3a6e6f74283a64697361626c656429207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a6e6f742829' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f236e65676174696f6e2d70736575646f' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a6e6f742829' USING utf8mb4),
display_label = CONVERT(X'e590a6e5ae9ae6af94e5b08d' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e4b88de7aca6e59088e58f83e695b8e981b8e69387e599a8e6b885e596aee79a84e58583e7b4a0e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e4b88de7aca6e59088e58f83e695b8e981b8e69387e599a8e6b885e596aee79a84e58583e7b4a0e38082e58f83e695b8e794a8e696bce68e92e999a4e6a29de4bbb6efbc8ce4b8a6e69c83e4be9de8a68fe58987e5bdb1e99fbfe981b8e69387e599a8e6ac8ae9878de38082' USING utf8mb4),
example_code = CONVERT(X'627574746f6e3a6e6f74283a64697361626c656429207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a6e6f742829' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f236e65676174696f6e2d70736575646f' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d6e6f74' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f636c6173735f6e616d65' USING utf8mb4),
                    CONVERT(X'6e6f74' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d6973' USING utf8mb4), CONVERT(X'3a69732829' USING utf8mb4), CONVERT(X'e4bbbbe4b880e6a29de4bbb6e6af94e5b08d' USING utf8mb4), CONVERT(X'e981b8e58f96e7aca6e59088e58f83e695b8e981b8e69387e599a8e6b885e596aee4b8ade4bbbbe4b880e6a29de4bbb6e79a84e58583e7b4a0e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e7aca6e59088e58f83e695b8e981b8e69387e599a8e6b885e596aee4b8ade4bbbbe4b880e6a29de4bbb6e79a84e58583e7b4a0e38082e58fafe7b8aee79fade9878de8a487e981b8e69387e599a8efbc9be6ac8ae9878de58f96e6b1bae696bce58f83e695b8e4b8ade79a84e981b8e69387e599a8e38082' USING utf8mb4), CONVERT(X'3a69732868312c20683229207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a69732829' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f236d6174636865732d70736575646f' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a69732829' USING utf8mb4),
display_label = CONVERT(X'e4bbbbe4b880e6a29de4bbb6e6af94e5b08d' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e7aca6e59088e58f83e695b8e981b8e69387e599a8e6b885e596aee4b8ade4bbbbe4b880e6a29de4bbb6e79a84e58583e7b4a0e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e7aca6e59088e58f83e695b8e981b8e69387e599a8e6b885e596aee4b8ade4bbbbe4b880e6a29de4bbb6e79a84e58583e7b4a0e38082e58fafe7b8aee79fade9878de8a487e981b8e69387e599a8efbc9be6ac8ae9878de58f96e6b1bae696bce58f83e695b8e4b8ade79a84e981b8e69387e599a8e38082' USING utf8mb4),
example_code = CONVERT(X'3a69732868312c20683229207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a69732829' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f236d6174636865732d70736575646f' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d6973' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f636c6173735f6e616d65' USING utf8mb4),
                    CONVERT(X'6973' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d7768657265' USING utf8mb4), CONVERT(X'3a77686572652829' USING utf8mb4), CONVERT(X'e99bb6e6ac8ae9878de6a29de4bbb6e6af94e5b08d' USING utf8mb4), CONVERT(X'e981b8e58f96e7aca6e59088e58f83e695b8e4b8ade4bbbbe4b880e6a29de4bbb6e79a84e58583e7b4a0efbc8ce4b894e6ada4e983a8e58886e6ac8ae9878de782bae99bb6e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e7aca6e59088e58f83e695b8e4b8ade4bbbbe4b880e6a29de4bbb6e79a84e58583e7b4a0efbc8ce4b894e6ada4e983a8e58886e6ac8ae9878de782bae99bb6e38082e981a9e59088e692b0e5afabe5aeb9e69893e8a2abe585b6e4bb96e6a8a3e5bc8fe8a686e5afabe79a84e9a090e8a8ade8a68fe58987e38082' USING utf8mb4), CONVERT(X'3a77686572652868312c20683229207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a77686572652829' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f2377686572652d70736575646f' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a77686572652829' USING utf8mb4),
display_label = CONVERT(X'e99bb6e6ac8ae9878de6a29de4bbb6e6af94e5b08d' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e7aca6e59088e58f83e695b8e4b8ade4bbbbe4b880e6a29de4bbb6e79a84e58583e7b4a0efbc8ce4b894e6ada4e983a8e58886e6ac8ae9878de782bae99bb6e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e7aca6e59088e58f83e695b8e4b8ade4bbbbe4b880e6a29de4bbb6e79a84e58583e7b4a0efbc8ce4b894e6ada4e983a8e58886e6ac8ae9878de782bae99bb6e38082e981a9e59088e692b0e5afabe5aeb9e69893e8a2abe585b6e4bb96e6a8a3e5bc8fe8a686e5afabe79a84e9a090e8a8ade8a68fe58987e38082' USING utf8mb4),
example_code = CONVERT(X'3a77686572652868312c20683229207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a77686572652829' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f2377686572652d70736575646f' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d7768657265' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f636c6173735f6e616d65' USING utf8mb4),
                    CONVERT(X'7768657265' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d686173' USING utf8mb4), CONVERT(X'3a6861732829' USING utf8mb4), CONVERT(X'e9979ce881afe6a29de4bbb6e6af94e5b08d' USING utf8mb4), CONVERT(X'e4be9de79bb8e5b08de981b8e69387e599a8e68980e68f8fe8bfb0e79a84e9979ce4bf82e981b8e58f96e58583e7b4a0e38082' USING utf8mb4), CONVERT(X'e4be9de79bb8e5b08de981b8e69387e599a8e68980e68f8fe8bfb0e79a84e9979ce4bf82e981b8e58f96e58583e7b4a0e38082e4be8be5a682e981b8e58f96e585a7e983a8e585b7e69c89e59c96e78987e79a84e58da1e78987efbc9be4b88de58faae99990e696bce79bb4e68ea5e5ad90e58583e7b4a0e38082' USING utf8mb4), CONVERT(X'2e636172643a68617328696d6729207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a6861732829' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f236861732d70736575646f' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a6861732829' USING utf8mb4),
display_label = CONVERT(X'e9979ce881afe6a29de4bbb6e6af94e5b08d' USING utf8mb4),
summary = CONVERT(X'e4be9de79bb8e5b08de981b8e69387e599a8e68980e68f8fe8bfb0e79a84e9979ce4bf82e981b8e58f96e58583e7b4a0e38082' USING utf8mb4),
description = CONVERT(X'e4be9de79bb8e5b08de981b8e69387e599a8e68980e68f8fe8bfb0e79a84e9979ce4bf82e981b8e58f96e58583e7b4a0e38082e4be8be5a682e981b8e58f96e585a7e983a8e585b7e69c89e59c96e78987e79a84e58da1e78987efbc9be4b88de58faae99990e696bce79bb4e68ea5e5ad90e58583e7b4a0e38082' USING utf8mb4),
example_code = CONVERT(X'2e636172643a68617328696d6729207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a6861732829' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f236861732d70736575646f' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d686173' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f636c6173735f6e616d65' USING utf8mb4),
                    CONVERT(X'686173' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d6c616e67' USING utf8mb4), CONVERT(X'3a6c616e672829' USING utf8mb4), CONVERT(X'e585a7e5aeb9e8aa9ee8a880e6af94e5b08d' USING utf8mb4), CONVERT(X'e4be9de58583e7b4a0e79a84e585a7e5aeb9e8aa9ee8a880e981b8e58f96e58583e7b4a0e38082' USING utf8mb4), CONVERT(X'e4be9de58583e7b4a0e79a84e585a7e5aeb9e8aa9ee8a880e981b8e58f96e58583e7b4a0e38082e8aa9ee8a880e58fafe7b9bce689bfe887aae7a596e58588efbc9be4b88de7ad89e5908ce696bce58faae6aaa2e69fa5e58583e7b4a0e887aae8baabe698afe590a6e69c89206c616e6720e5b1ace680a7e38082' USING utf8mb4), CONVERT(X'703a6c616e67287a6829207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a6c616e672829' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f236c616e672d70736575646f' USING utf8mb4), CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a6c616e672829' USING utf8mb4),
display_label = CONVERT(X'e585a7e5aeb9e8aa9ee8a880e6af94e5b08d' USING utf8mb4),
summary = CONVERT(X'e4be9de58583e7b4a0e79a84e585a7e5aeb9e8aa9ee8a880e981b8e58f96e58583e7b4a0e38082' USING utf8mb4),
description = CONVERT(X'e4be9de58583e7b4a0e79a84e585a7e5aeb9e8aa9ee8a880e981b8e58f96e58583e7b4a0e38082e8aa9ee8a880e58fafe7b9bce689bfe887aae7a596e58588efbc9be4b88de7ad89e5908ce696bce58faae6aaa2e69fa5e58583e7b4a0e887aae8baabe698afe590a6e69c89206c616e6720e5b1ace680a7e38082' USING utf8mb4),
example_code = CONVERT(X'703a6c616e67287a6829207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a6c616e672829' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f73656c6563746f72732d342f236c616e672d70736575646f' USING utf8mb4),
source_version = CONVERT(X'73656c6563746f72732d3420454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3139' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d636c6173732d6c616e67' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f636c6173735f6e616d65' USING utf8mb4),
                    CONVERT(X'6c616e67' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d656c656d656e742d6265666f7265' USING utf8mb4), CONVERT(X'3a3a6265666f7265' USING utf8mb4), CONVERT(X'e5898de7bdaee581bde58583e7b4a0' USING utf8mb4), CONVERT(X'e981b8e58f96e58583e7b4a0e585a7e5aeb9e4b98be5898de794a2e7949fe79a84e581bde58583e7b4a0e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e58583e7b4a0e585a7e5aeb9e4b98be5898de794a2e7949fe79a84e581bde58583e7b4a0e38082e5b8b8e690ade9858d20636f6e74656e7420e794a2e7949fe8a39de9a3bee585a7e5aeb9efbc8ce4b88de69c83e59ca8e58e9fe5a78b2048544d4c20e4b8ade696b0e5a29ee79c9fe6ada3e79a84e58583e7b4a0e38082' USING utf8mb4), CONVERT(X'2e636172643a3a6265666f7265207b0a2020636f6e74656e743a2022223b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a3a6265666f7265' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d70736575646f2d342f2373656c6563746f726465662d6265666f7265' USING utf8mb4), CONVERT(X'6373732d70736575646f2d3420454420323032362d31302d3135' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3236' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a3a6265666f7265' USING utf8mb4),
display_label = CONVERT(X'e5898de7bdaee581bde58583e7b4a0' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e58583e7b4a0e585a7e5aeb9e4b98be5898de794a2e7949fe79a84e581bde58583e7b4a0e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e58583e7b4a0e585a7e5aeb9e4b98be5898de794a2e7949fe79a84e581bde58583e7b4a0e38082e5b8b8e690ade9858d20636f6e74656e7420e794a2e7949fe8a39de9a3bee585a7e5aeb9efbc8ce4b88de69c83e59ca8e58e9fe5a78b2048544d4c20e4b8ade696b0e5a29ee79c9fe6ada3e79a84e58583e7b4a0e38082' USING utf8mb4),
example_code = CONVERT(X'2e636172643a3a6265666f7265207b0a2020636f6e74656e743a2022223b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a3a6265666f7265' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d70736575646f2d342f2373656c6563746f726465662d6265666f7265' USING utf8mb4),
source_version = CONVERT(X'6373732d70736575646f2d3420454420323032362d31302d3135' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3236' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d656c656d656e742d6265666f7265' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f656c656d656e745f6e616d65' USING utf8mb4),
                    CONVERT(X'6265666f7265' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d656c656d656e742d6166746572' USING utf8mb4), CONVERT(X'3a3a6166746572' USING utf8mb4), CONVERT(X'e5be8ce7bdaee581bde58583e7b4a0' USING utf8mb4), CONVERT(X'e981b8e58f96e58583e7b4a0e585a7e5aeb9e4b98be5be8ce794a2e7949fe79a84e581bde58583e7b4a0e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e58583e7b4a0e585a7e5aeb9e4b98be5be8ce794a2e7949fe79a84e581bde58583e7b4a0e38082e5b8b8e690ade9858d20636f6e74656e7420e694bee7bdaee59c96e7a4bae68896e8a39de9a3bee38082' USING utf8mb4), CONVERT(X'2e636172643a3a6166746572207b0a2020636f6e74656e743a2022223b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a3a6166746572' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d70736575646f2d342f2373656c6563746f726465662d6166746572' USING utf8mb4), CONVERT(X'6373732d70736575646f2d3420454420323032362d31302d3135' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3236' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a3a6166746572' USING utf8mb4),
display_label = CONVERT(X'e5be8ce7bdaee581bde58583e7b4a0' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e58583e7b4a0e585a7e5aeb9e4b98be5be8ce794a2e7949fe79a84e581bde58583e7b4a0e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e58583e7b4a0e585a7e5aeb9e4b98be5be8ce794a2e7949fe79a84e581bde58583e7b4a0e38082e5b8b8e690ade9858d20636f6e74656e7420e694bee7bdaee59c96e7a4bae68896e8a39de9a3bee38082' USING utf8mb4),
example_code = CONVERT(X'2e636172643a3a6166746572207b0a2020636f6e74656e743a2022223b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a3a6166746572' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d70736575646f2d342f2373656c6563746f726465662d6166746572' USING utf8mb4),
source_version = CONVERT(X'6373732d70736575646f2d3420454420323032362d31302d3135' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3236' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d656c656d656e742d6166746572' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f656c656d656e745f6e616d65' USING utf8mb4),
                    CONVERT(X'6166746572' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d656c656d656e742d66697273742d6c696e65' USING utf8mb4), CONVERT(X'3a3a66697273742d6c696e65' USING utf8mb4), CONVERT(X'e7acace4b880e8a18ce581bde58583e7b4a0' USING utf8mb4), CONVERT(X'e981b8e58f96e58d80e5a18ae7acace4b880e5808be6a0bce5bc8fe58c96e8a18ce79a84e69687e5ad97e983a8e58886e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e58d80e5a18ae7acace4b880e5808be6a0bce5bc8fe58c96e8a18ce79a84e69687e5ad97e983a8e58886e38082e981a9e794a8e79a84e6a8a3e5bc8fe5b1ace680a7e69c89e99990efbc8ce7acace4b880e8a18ce7af84e59c8de4b99fe69c83e99aa8e68e92e78988e694b9e8ae8ae38082' USING utf8mb4), CONVERT(X'703a3a66697273742d6c696e65207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a3a66697273742d6c696e65' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d70736575646f2d342f2373656c6563746f726465662d66697273742d6c696e65' USING utf8mb4), CONVERT(X'6373732d70736575646f2d3420454420323032362d31302d3135' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3236' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a3a66697273742d6c696e65' USING utf8mb4),
display_label = CONVERT(X'e7acace4b880e8a18ce581bde58583e7b4a0' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e58d80e5a18ae7acace4b880e5808be6a0bce5bc8fe58c96e8a18ce79a84e69687e5ad97e983a8e58886e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e58d80e5a18ae7acace4b880e5808be6a0bce5bc8fe58c96e8a18ce79a84e69687e5ad97e983a8e58886e38082e981a9e794a8e79a84e6a8a3e5bc8fe5b1ace680a7e69c89e99990efbc8ce7acace4b880e8a18ce7af84e59c8de4b99fe69c83e99aa8e68e92e78988e694b9e8ae8ae38082' USING utf8mb4),
example_code = CONVERT(X'703a3a66697273742d6c696e65207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a3a66697273742d6c696e65' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d70736575646f2d342f2373656c6563746f726465662d66697273742d6c696e65' USING utf8mb4),
source_version = CONVERT(X'6373732d70736575646f2d3420454420323032362d31302d3135' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3236' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d656c656d656e742d66697273742d6c696e65' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f656c656d656e745f6e616d65' USING utf8mb4),
                    CONVERT(X'66697273742d6c696e65' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d656c656d656e742d66697273742d6c6574746572' USING utf8mb4), CONVERT(X'3a3a66697273742d6c6574746572' USING utf8mb4), CONVERT(X'e9a696e5ad97e581bde58583e7b4a0' USING utf8mb4), CONVERT(X'e981b8e58f96e58d80e5a18ae7acace4b880e5808be6a0bce5bc8fe58c96e8a18ce79a84e9a696e5ad97e983a8e58886e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e58d80e5a18ae7acace4b880e5808be6a0bce5bc8fe58c96e8a18ce79a84e9a696e5ad97e983a8e58886e38082e5b8b8e794a8e696bce9a696e5ad97e694bee5a4a7e7ad89e68e92e78988efbc8ce981a9e794a8e6a29de4bbb6e88887e6a899e9bb9ee89995e79086e69c89e5b088e99680e8a68fe58987e38082' USING utf8mb4), CONVERT(X'703a3a66697273742d6c6574746572207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a3a66697273742d6c6574746572' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d70736575646f2d342f2373656c6563746f726465662d66697273742d6c6574746572' USING utf8mb4), CONVERT(X'6373732d70736575646f2d3420454420323032362d31302d3135' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3236' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a3a66697273742d6c6574746572' USING utf8mb4),
display_label = CONVERT(X'e9a696e5ad97e581bde58583e7b4a0' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e58d80e5a18ae7acace4b880e5808be6a0bce5bc8fe58c96e8a18ce79a84e9a696e5ad97e983a8e58886e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e58d80e5a18ae7acace4b880e5808be6a0bce5bc8fe58c96e8a18ce79a84e9a696e5ad97e983a8e58886e38082e5b8b8e794a8e696bce9a696e5ad97e694bee5a4a7e7ad89e68e92e78988efbc8ce981a9e794a8e6a29de4bbb6e88887e6a899e9bb9ee89995e79086e69c89e5b088e99680e8a68fe58987e38082' USING utf8mb4),
example_code = CONVERT(X'703a3a66697273742d6c6574746572207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a3a66697273742d6c6574746572' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d70736575646f2d342f2373656c6563746f726465662d66697273742d6c6574746572' USING utf8mb4),
source_version = CONVERT(X'6373732d70736575646f2d3420454420323032362d31302d3135' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3236' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d656c656d656e742d66697273742d6c6574746572' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f656c656d656e745f6e616d65' USING utf8mb4),
                    CONVERT(X'66697273742d6c6574746572' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d656c656d656e742d73656c656374696f6e' USING utf8mb4), CONVERT(X'3a3a73656c656374696f6e' USING utf8mb4), CONVERT(X'e981b8e58f96e69687e5ad97e581bde58583e7b4a0' USING utf8mb4), CONVERT(X'e981b8e58f96e4bdbfe794a8e88085e58f8de799bde981b8e58f96e79a84e585a7e5aeb9e983a8e58886e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e4bdbfe794a8e88085e58f8de799bde981b8e58f96e79a84e585a7e5aeb9e983a8e58886e38082e58fafe8a8ade5ae9ae79a84e6a8a3e5bc8fe58f97e99990efbc8ce5b8b8e794a8e696bce8aabfe695b4e981b8e58f96e585a7e5aeb9e79a84e5898de699afe88887e8838ce699afe889b2e38082' USING utf8mb4), CONVERT(X'3a3a73656c656374696f6e207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a3a73656c656374696f6e' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d70736575646f2d342f2373656c6563746f726465662d73656c656374696f6e' USING utf8mb4), CONVERT(X'6373732d70736575646f2d3420454420323032362d31302d3135' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3236' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a3a73656c656374696f6e' USING utf8mb4),
display_label = CONVERT(X'e981b8e58f96e69687e5ad97e581bde58583e7b4a0' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e4bdbfe794a8e88085e58f8de799bde981b8e58f96e79a84e585a7e5aeb9e983a8e58886e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e4bdbfe794a8e88085e58f8de799bde981b8e58f96e79a84e585a7e5aeb9e983a8e58886e38082e58fafe8a8ade5ae9ae79a84e6a8a3e5bc8fe58f97e99990efbc8ce5b8b8e794a8e696bce8aabfe695b4e981b8e58f96e585a7e5aeb9e79a84e5898de699afe88887e8838ce699afe889b2e38082' USING utf8mb4),
example_code = CONVERT(X'3a3a73656c656374696f6e207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a3a73656c656374696f6e' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d70736575646f2d342f2373656c6563746f726465662d73656c656374696f6e' USING utf8mb4),
source_version = CONVERT(X'6373732d70736575646f2d3420454420323032362d31302d3135' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3236' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d656c656d656e742d73656c656374696f6e' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f656c656d656e745f6e616d65' USING utf8mb4),
                    CONVERT(X'73656c656374696f6e' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d656c656d656e742d706c616365686f6c646572' USING utf8mb4), CONVERT(X'3a3a706c616365686f6c646572' USING utf8mb4), CONVERT(X'e8bcb8e585a5e68f90e7a4bae581bde58583e7b4a0' USING utf8mb4), CONVERT(X'e981b8e58f96e8bcb8e585a5e6a186e4b8ade79a8420706c616365686f6c64657220e68f90e7a4bae69687e5ad97e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e8bcb8e585a5e6a186e4b8ade79a8420706c616365686f6c64657220e68f90e7a4bae69687e5ad97e38082e88887e4bdbfe794a8e88085e5afa6e99a9be8bcb8e585a5e79a84e580bce4b88de5908cefbc8ce68f90e7a4bae69687e5ad97e4b88de68789e58f96e4bba3e6ac84e4bd8de6a899e7b1a4e38082' USING utf8mb4), CONVERT(X'696e7075743a3a706c616365686f6c646572207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a3a706c616365686f6c646572' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d666f726d732d312f2373656c6563746f726465662d706c616365686f6c646572' USING utf8mb4), CONVERT(X'6373732d666f726d732d3120454420323032362d31302d3038' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3231' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a3a706c616365686f6c646572' USING utf8mb4),
display_label = CONVERT(X'e8bcb8e585a5e68f90e7a4bae581bde58583e7b4a0' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e8bcb8e585a5e6a186e4b8ade79a8420706c616365686f6c64657220e68f90e7a4bae69687e5ad97e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e8bcb8e585a5e6a186e4b8ade79a8420706c616365686f6c64657220e68f90e7a4bae69687e5ad97e38082e88887e4bdbfe794a8e88085e5afa6e99a9be8bcb8e585a5e79a84e580bce4b88de5908cefbc8ce68f90e7a4bae69687e5ad97e4b88de68789e58f96e4bba3e6ac84e4bd8de6a899e7b1a4e38082' USING utf8mb4),
example_code = CONVERT(X'696e7075743a3a706c616365686f6c646572207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a3a706c616365686f6c646572' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d666f726d732d312f2373656c6563746f726465662d706c616365686f6c646572' USING utf8mb4),
source_version = CONVERT(X'6373732d666f726d732d3120454420323032362d31302d3038' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3231' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d656c656d656e742d706c616365686f6c646572' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f656c656d656e745f6e616d65' USING utf8mb4),
                    CONVERT(X'706c616365686f6c646572' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d656c656d656e742d6d61726b6572' USING utf8mb4), CONVERT(X'3a3a6d61726b6572' USING utf8mb4), CONVERT(X'e6b885e596aee6a899e8a898e581bde58583e7b4a0' USING utf8mb4), CONVERT(X'e981b8e58f96e6b885e596aee9a085e79baee79a84e6a899e8a898e79b92e5ad90e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e6b885e596aee9a085e79baee79a84e6a899e8a898e79b92e5ad90e38082e58fafe8aabfe695b4e6b885e596aee59c93e9bb9ee68896e7b7a8e8999fe79a84e983a8e58886e6a8a3e5bc8fe38082' USING utf8mb4), CONVERT(X'6c693a3a6d61726b6572207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a3a6d61726b6572' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d70736575646f2d342f2373656c6563746f726465662d6d61726b6572' USING utf8mb4), CONVERT(X'6373732d70736575646f2d3420454420323032362d31302d3135' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3236' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a3a6d61726b6572' USING utf8mb4),
display_label = CONVERT(X'e6b885e596aee6a899e8a898e581bde58583e7b4a0' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e6b885e596aee9a085e79baee79a84e6a899e8a898e79b92e5ad90e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e6b885e596aee9a085e79baee79a84e6a899e8a898e79b92e5ad90e38082e58fafe8aabfe695b4e6b885e596aee59c93e9bb9ee68896e7b7a8e8999fe79a84e983a8e58886e6a8a3e5bc8fe38082' USING utf8mb4),
example_code = CONVERT(X'6c693a3a6d61726b6572207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a3a6d61726b6572' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d70736575646f2d342f2373656c6563746f726465662d6d61726b6572' USING utf8mb4),
source_version = CONVERT(X'6373732d70736575646f2d3420454420323032362d31302d3135' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3236' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d656c656d656e742d6d61726b6572' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f656c656d656e745f6e616d65' USING utf8mb4),
                    CONVERT(X'6d61726b6572' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d656c656d656e742d6261636b64726f70' USING utf8mb4), CONVERT(X'3a3a6261636b64726f70' USING utf8mb4), CONVERT(X'e8838ce699afe5b995e581bde58583e7b4a0' USING utf8mb4), CONVERT(X'e981b8e58f96e9a082e5b1a4e9a1afe7a4bae58583e7b4a0e68980e794a2e7949fe79a84e8838ce699afe5b995e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e9a082e5b1a4e9a1afe7a4bae58583e7b4a0e68980e794a2e7949fe79a84e8838ce699afe5b995e38082e4be8be5a682e4bba52073686f774d6f64616c282920e9968be5959fe79a84e58e9fe7949f206469616c6f67efbc8ce585b6e8838ce699afe5b995e58fafe596aee78da8e8a8ade5ae9ae6a8a3e5bc8fe38082' USING utf8mb4), CONVERT(X'6469616c6f673a3a6261636b64726f70207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a3a6261636b64726f70' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d706f736974696f6e2d342f2373656c6563746f726465662d6261636b64726f70' USING utf8mb4), CONVERT(X'6373732d706f736974696f6e2d3420454420323032352d31322d3235' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3533' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a3a6261636b64726f70' USING utf8mb4),
display_label = CONVERT(X'e8838ce699afe5b995e581bde58583e7b4a0' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e9a082e5b1a4e9a1afe7a4bae58583e7b4a0e68980e794a2e7949fe79a84e8838ce699afe5b995e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e9a082e5b1a4e9a1afe7a4bae58583e7b4a0e68980e794a2e7949fe79a84e8838ce699afe5b995e38082e4be8be5a682e4bba52073686f774d6f64616c282920e9968be5959fe79a84e58e9fe7949f206469616c6f67efbc8ce585b6e8838ce699afe5b995e58fafe596aee78da8e8a8ade5ae9ae6a8a3e5bc8fe38082' USING utf8mb4),
example_code = CONVERT(X'6469616c6f673a3a6261636b64726f70207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a3a6261636b64726f70' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d706f736974696f6e2d342f2373656c6563746f726465662d6261636b64726f70' USING utf8mb4),
source_version = CONVERT(X'6373732d706f736974696f6e2d3420454420323032352d31322d3235' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3533' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d656c656d656e742d6261636b64726f70' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f656c656d656e745f6e616d65' USING utf8mb4),
                    CONVERT(X'6261636b64726f70' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'73656c6563746f7273' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'73656c6563746f722d70736575646f2d656c656d656e742d66696c652d73656c6563746f722d627574746f6e' USING utf8mb4), CONVERT(X'3a3a66696c652d73656c6563746f722d627574746f6e' USING utf8mb4), CONVERT(X'e6aa94e6a188e981b8e58f96e68c89e98895e581bde58583e7b4a0' USING utf8mb4), CONVERT(X'e981b8e58f96e6aa94e6a188e8bcb8e585a5e68ea7e588b6e9a085e585a7e79a84e981b8e6aa94e68c89e98895e38082' USING utf8mb4), CONVERT(X'e981b8e58f96e6aa94e6a188e8bcb8e585a5e68ea7e588b6e9a085e585a7e79a84e981b8e6aa94e68c89e98895e38082e58fafe9879de5b08d20696e70757420747970653d66696c6520e79a84e585a7e5bbbae68c89e98895e8a8ade5ae9ae6a8a3e5bc8fe38082' USING utf8mb4), CONVERT(X'696e7075743a3a66696c652d73656c6563746f722d627574746f6e207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4), CONVERT(X'3a3a66696c652d73656c6563746f722d627574746f6e' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d666f726d732d312f2373656c6563746f726465662d66696c652d73656c6563746f722d627574746f6e' USING utf8mb4), CONVERT(X'6373732d666f726d732d3120454420323032362d31302d3038' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3231' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'3a3a66696c652d73656c6563746f722d627574746f6e' USING utf8mb4),
display_label = CONVERT(X'e6aa94e6a188e981b8e58f96e68c89e98895e581bde58583e7b4a0' USING utf8mb4),
summary = CONVERT(X'e981b8e58f96e6aa94e6a188e8bcb8e585a5e68ea7e588b6e9a085e585a7e79a84e981b8e6aa94e68c89e98895e38082' USING utf8mb4),
description = CONVERT(X'e981b8e58f96e6aa94e6a188e8bcb8e585a5e68ea7e588b6e9a085e585a7e79a84e981b8e6aa94e68c89e98895e38082e58fafe9879de5b08d20696e70757420747970653d66696c6520e79a84e585a7e5bbbae68c89e98895e8a8ade5ae9ae6a8a3e5bc8fe38082' USING utf8mb4),
example_code = CONVERT(X'696e7075743a3a66696c652d73656c6563746f722d627574746f6e207b0a2020636f6c6f723a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e5b087e7aca6e59088e981b8e69387e599a8e6a29de4bbb6e79a84e585a7e5aeb9e8a8ade782bae99d92e7b6a0e889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'3a3a66696c652d73656c6563746f722d627574746f6e' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d666f726d732d312f2373656c6563746f726465662d66696c652d73656c6563746f722d627574746f6e' USING utf8mb4),
source_version = CONVERT(X'6373732d666f726d732d3120454420323032362d31302d3038' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3231' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'73656c6563746f722d70736575646f2d656c656d656e742d66696c652d73656c6563746f722d627574746f6e' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'70736575646f5f656c656d656e745f6e616d65' USING utf8mb4),
                    CONVERT(X'66696c652d73656c6563746f722d627574746f6e' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'61742d72756c6573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'61742d72756c652d6d65646961' USING utf8mb4), CONVERT(X'406d65646961' USING utf8mb4), CONVERT(X'e5aa92e9ab94e6a29de4bbb6e8a68fe58987' USING utf8mb4), CONVERT(X'e4be9de5aa92e9ab94e69fa5e8a9a2e6a29de4bbb6e5a597e794a8e6a8a3e5bc8fe38082' USING utf8mb4), CONVERT(X'e4be9de5aa92e9ab94e69fa5e8a9a2e6a29de4bbb6e5a597e794a8e6a8a3e5bc8fe38082e58fafe4be9de8a696e7aa97e5aface5baa6e38081e8bcb8e587bae5aa92e9ab94e68896e4bdbfe794a8e88085e5818fe5a5bde7ad89e6a29de4bbb6e8aabfe695b4e585a7e5aeb9e38082' USING utf8mb4), CONVERT(X'406d6564696120286d61782d77696474683a20363430707829207b0a20202e63617264207b2070616464696e673a20313270783b207d0a7d' USING utf8mb4), CONVERT(X'e7a4bae7af8420406d6564696120e8a68fe58987e79a84e59fbae69cace5afabe6b395e38082' USING utf8mb4), CONVERT(X'406d65646961' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d636f6e646974696f6e616c2d332f2361742d72756c656465662d6d65646961' USING utf8mb4), CONVERT(X'6373732d636f6e646974696f6e616c2d3320454420323032362d31302d3038' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3433' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'406d65646961' USING utf8mb4),
display_label = CONVERT(X'e5aa92e9ab94e6a29de4bbb6e8a68fe58987' USING utf8mb4),
summary = CONVERT(X'e4be9de5aa92e9ab94e69fa5e8a9a2e6a29de4bbb6e5a597e794a8e6a8a3e5bc8fe38082' USING utf8mb4),
description = CONVERT(X'e4be9de5aa92e9ab94e69fa5e8a9a2e6a29de4bbb6e5a597e794a8e6a8a3e5bc8fe38082e58fafe4be9de8a696e7aa97e5aface5baa6e38081e8bcb8e587bae5aa92e9ab94e68896e4bdbfe794a8e88085e5818fe5a5bde7ad89e6a29de4bbb6e8aabfe695b4e585a7e5aeb9e38082' USING utf8mb4),
example_code = CONVERT(X'406d6564696120286d61782d77696474683a20363430707829207b0a20202e63617264207b2070616464696e673a20313270783b207d0a7d' USING utf8mb4),
example_description = CONVERT(X'e7a4bae7af8420406d6564696120e8a68fe58987e79a84e59fbae69cace5afabe6b395e38082' USING utf8mb4),
sort_key = CONVERT(X'406d65646961' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d636f6e646974696f6e616c2d332f2361742d72756c656465662d6d65646961' USING utf8mb4),
source_version = CONVERT(X'6373732d636f6e646974696f6e616c2d3320454420323032362d31302d3038' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3433' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'61742d72756c652d6d65646961' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'61745f72756c655f6e616d65' USING utf8mb4),
                    CONVERT(X'6d65646961' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'61742d72756c6573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'61742d72756c652d737570706f727473' USING utf8mb4), CONVERT(X'40737570706f727473' USING utf8mb4), CONVERT(X'e58a9fe883bde694afe68fb4e6a29de4bbb6' USING utf8mb4), CONVERT(X'e4be9de7808fe8a6bde599a8e698afe590a6e694afe68fb4e68c87e5ae9a2043535320e58a9fe883bde5a597e794a8e6a8a3e5bc8fe38082' USING utf8mb4), CONVERT(X'e4be9de7808fe8a6bde599a8e698afe590a6e694afe68fb4e68c87e5ae9a2043535320e58a9fe883bde5a597e794a8e6a8a3e5bc8fe38082e6a29de4bbb6e58fafe4bba5e6b8ace8a9a6e5b1ace680a7e5aea3e5918ae68896e981b8e69387e599a8e7ad89e58a9fe883bdefbc8ce4b88de7ad89e5908ce696bce581b5e6b8ace789b9e5ae9ae7808fe8a6bde599a8e5908de7a8b1e38082' USING utf8mb4), CONVERT(X'40737570706f7274732028646973706c61793a206772696429207b0a20202e6361726473207b20646973706c61793a20677269643b207d0a7d' USING utf8mb4), CONVERT(X'e7a4bae7af842040737570706f72747320e8a68fe58987e79a84e59fbae69cace5afabe6b395e38082' USING utf8mb4), CONVERT(X'40737570706f727473' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d636f6e646974696f6e616c2d332f2361742d72756c656465662d737570706f727473' USING utf8mb4), CONVERT(X'6373732d636f6e646974696f6e616c2d3320454420323032362d31302d3038' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3433' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'40737570706f727473' USING utf8mb4),
display_label = CONVERT(X'e58a9fe883bde694afe68fb4e6a29de4bbb6' USING utf8mb4),
summary = CONVERT(X'e4be9de7808fe8a6bde599a8e698afe590a6e694afe68fb4e68c87e5ae9a2043535320e58a9fe883bde5a597e794a8e6a8a3e5bc8fe38082' USING utf8mb4),
description = CONVERT(X'e4be9de7808fe8a6bde599a8e698afe590a6e694afe68fb4e68c87e5ae9a2043535320e58a9fe883bde5a597e794a8e6a8a3e5bc8fe38082e6a29de4bbb6e58fafe4bba5e6b8ace8a9a6e5b1ace680a7e5aea3e5918ae68896e981b8e69387e599a8e7ad89e58a9fe883bdefbc8ce4b88de7ad89e5908ce696bce581b5e6b8ace789b9e5ae9ae7808fe8a6bde599a8e5908de7a8b1e38082' USING utf8mb4),
example_code = CONVERT(X'40737570706f7274732028646973706c61793a206772696429207b0a20202e6361726473207b20646973706c61793a20677269643b207d0a7d' USING utf8mb4),
example_description = CONVERT(X'e7a4bae7af842040737570706f72747320e8a68fe58987e79a84e59fbae69cace5afabe6b395e38082' USING utf8mb4),
sort_key = CONVERT(X'40737570706f727473' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d636f6e646974696f6e616c2d332f2361742d72756c656465662d737570706f727473' USING utf8mb4),
source_version = CONVERT(X'6373732d636f6e646974696f6e616c2d3320454420323032362d31302d3038' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3433' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'61742d72756c652d737570706f727473' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'61745f72756c655f6e616d65' USING utf8mb4),
                    CONVERT(X'737570706f727473' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'61742d72756c6573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'61742d72756c652d696d706f7274' USING utf8mb4), CONVERT(X'40696d706f7274' USING utf8mb4), CONVERT(X'e58cafe585a5e6a8a3e5bc8fe8a1a8' USING utf8mb4), CONVERT(X'e58cafe585a5e58fa6e4b880e4bbbde6a8a3e5bc8fe8a1a8e38082' USING utf8mb4), CONVERT(X'e58cafe585a5e58fa6e4b880e4bbbde6a8a3e5bc8fe8a1a8e38082e5bf85e9a088e981b5e5ae88e6a8a3e5bc8fe8a1a8e4b8ade79a84e4bd8de7bdaee99990e588b6efbc8ce4b8a6e58fafe99984e58aa0e5aa92e9ab94e6a29de4bbb6e688962063617363616465206c61796572e38082' USING utf8mb4), CONVERT(X'40696d706f72742075726c28227468656d652e63737322293b' USING utf8mb4), CONVERT(X'e7a4bae7af842040696d706f727420e8a68fe58987e79a84e59fbae69cace5afabe6b395e38082' USING utf8mb4), CONVERT(X'40696d706f7274' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d636173636164652d362f2361742d72756c656465662d696d706f7274' USING utf8mb4), CONVERT(X'6373732d636173636164652d3620454420323032362d30342d3238' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3433' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'40696d706f7274' USING utf8mb4),
display_label = CONVERT(X'e58cafe585a5e6a8a3e5bc8fe8a1a8' USING utf8mb4),
summary = CONVERT(X'e58cafe585a5e58fa6e4b880e4bbbde6a8a3e5bc8fe8a1a8e38082' USING utf8mb4),
description = CONVERT(X'e58cafe585a5e58fa6e4b880e4bbbde6a8a3e5bc8fe8a1a8e38082e5bf85e9a088e981b5e5ae88e6a8a3e5bc8fe8a1a8e4b8ade79a84e4bd8de7bdaee99990e588b6efbc8ce4b8a6e58fafe99984e58aa0e5aa92e9ab94e6a29de4bbb6e688962063617363616465206c61796572e38082' USING utf8mb4),
example_code = CONVERT(X'40696d706f72742075726c28227468656d652e63737322293b' USING utf8mb4),
example_description = CONVERT(X'e7a4bae7af842040696d706f727420e8a68fe58987e79a84e59fbae69cace5afabe6b395e38082' USING utf8mb4),
sort_key = CONVERT(X'40696d706f7274' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d636173636164652d362f2361742d72756c656465662d696d706f7274' USING utf8mb4),
source_version = CONVERT(X'6373732d636173636164652d3620454420323032362d30342d3238' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3433' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'61742d72756c652d696d706f7274' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'61745f72756c655f6e616d65' USING utf8mb4),
                    CONVERT(X'696d706f7274' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'61742d72756c6573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'61742d72756c652d63686172736574' USING utf8mb4), CONVERT(X'4063686172736574' USING utf8mb4), CONVERT(X'e6a8a3e5bc8fe8a1a8e7b7a8e7a2bce5aea3e5918a' USING utf8mb4), CONVERT(X'e4bba5e789b9e5ae9ae79a84e6aa94e6a188e9968be9a0ade6a0bce5bc8fe5aea3e5918ae6a8a3e5bc8fe8a1a8e7b7a8e7a2bce38082' USING utf8mb4), CONVERT(X'e4bba5e789b9e5ae9ae79a84e6aa94e6a188e9968be9a0ade6a0bce5bc8fe5aea3e5918ae6a8a3e5bc8fe8a1a8e7b7a8e7a2bce38082e5ae83e58f83e88887e8a7a3e7a2bcefbc8ce4b88de698afe4b880e888ace69c83e4bf9de79599e59ca82043535320e8aa9ee6b395e6a8b9e4b8ade79a842061742d72756c65efbc9be5bf85e9a088e4bd8de696bce6aa94e6a188e9968be9a0adefbc8ce4bdbfe794a8e99b99e5bc95e8999fe7ad89e8a68fe5ae9ae6a0bce5bc8fe38082' USING utf8mb4), CONVERT(X'406368617273657420225554462d38223b0a2e63617264207b20636f6c6f723a207465616c3b207d' USING utf8mb4), CONVERT(X'e7a4bae7af8420406368617273657420e8a68fe58987e79a84e59fbae69cace5afabe6b395e38082' USING utf8mb4), CONVERT(X'4063686172736574' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d73796e7461782d332f2361742d72756c656465662d63686172736574' USING utf8mb4), CONVERT(X'6373732d73796e7461782d3320454420323032362d31302d3230' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3337' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'4063686172736574' USING utf8mb4),
display_label = CONVERT(X'e6a8a3e5bc8fe8a1a8e7b7a8e7a2bce5aea3e5918a' USING utf8mb4),
summary = CONVERT(X'e4bba5e789b9e5ae9ae79a84e6aa94e6a188e9968be9a0ade6a0bce5bc8fe5aea3e5918ae6a8a3e5bc8fe8a1a8e7b7a8e7a2bce38082' USING utf8mb4),
description = CONVERT(X'e4bba5e789b9e5ae9ae79a84e6aa94e6a188e9968be9a0ade6a0bce5bc8fe5aea3e5918ae6a8a3e5bc8fe8a1a8e7b7a8e7a2bce38082e5ae83e58f83e88887e8a7a3e7a2bcefbc8ce4b88de698afe4b880e888ace69c83e4bf9de79599e59ca82043535320e8aa9ee6b395e6a8b9e4b8ade79a842061742d72756c65efbc9be5bf85e9a088e4bd8de696bce6aa94e6a188e9968be9a0adefbc8ce4bdbfe794a8e99b99e5bc95e8999fe7ad89e8a68fe5ae9ae6a0bce5bc8fe38082' USING utf8mb4),
example_code = CONVERT(X'406368617273657420225554462d38223b0a2e63617264207b20636f6c6f723a207465616c3b207d' USING utf8mb4),
example_description = CONVERT(X'e7a4bae7af8420406368617273657420e8a68fe58987e79a84e59fbae69cace5afabe6b395e38082' USING utf8mb4),
sort_key = CONVERT(X'4063686172736574' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d73796e7461782d332f2361742d72756c656465662d63686172736574' USING utf8mb4),
source_version = CONVERT(X'6373732d73796e7461782d3320454420323032362d31302d3230' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3337' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'61742d72756c652d63686172736574' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'61745f72756c655f6e616d65' USING utf8mb4),
                    CONVERT(X'63686172736574' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'61742d72756c6573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'61742d72756c652d666f6e742d66616365' USING utf8mb4), CONVERT(X'40666f6e742d66616365' USING utf8mb4), CONVERT(X'e887aae8a882e5ad97e59e8be4be86e6ba90' USING utf8mb4), CONVERT(X'e5ae9ae7bea9e58fafe4be9be6a8a3e5bc8fe4bdbfe794a8e79a84e5ad97e59e8be4be86e6ba90e88887e5ad97e59e8be68f8fe8bfb0e38082' USING utf8mb4), CONVERT(X'e5ae9ae7bea9e58fafe4be9be6a8a3e5bc8fe4bdbfe794a8e79a84e5ad97e59e8be4be86e6ba90e88887e5ad97e59e8be68f8fe8bfb0e38082e58d80e5a18ae585a7e79a8420666f6e742d66616d696c79e3808173726320e7ad89e698afe5ad97e59e8be68f8fe8bfb0e7aca6efbc8ce4b88de698afe5a597e794a8e59ca8e58583e7b4a0e4b88ae79a84e4b880e888ace5b1ace680a7e5aea3e5918ae38082' USING utf8mb4), CONVERT(X'40666f6e742d66616365207b0a2020666f6e742d66616d696c793a20224578616d706c65223b0a20207372633a2075726c28226578616d706c652e776f666632222920666f726d61742822776f66663222293b0a7d' USING utf8mb4), CONVERT(X'e7a4bae7af842040666f6e742d6661636520e8a68fe58987e79a84e59fbae69cace5afabe6b395e38082' USING utf8mb4), CONVERT(X'40666f6e742d66616365' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d666f6e74732d352f2361742d666f6e742d666163652d72756c65' USING utf8mb4), CONVERT(X'6373732d666f6e74732d3520454420323032362d31312d3034' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3333' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'40666f6e742d66616365' USING utf8mb4),
display_label = CONVERT(X'e887aae8a882e5ad97e59e8be4be86e6ba90' USING utf8mb4),
summary = CONVERT(X'e5ae9ae7bea9e58fafe4be9be6a8a3e5bc8fe4bdbfe794a8e79a84e5ad97e59e8be4be86e6ba90e88887e5ad97e59e8be68f8fe8bfb0e38082' USING utf8mb4),
description = CONVERT(X'e5ae9ae7bea9e58fafe4be9be6a8a3e5bc8fe4bdbfe794a8e79a84e5ad97e59e8be4be86e6ba90e88887e5ad97e59e8be68f8fe8bfb0e38082e58d80e5a18ae585a7e79a8420666f6e742d66616d696c79e3808173726320e7ad89e698afe5ad97e59e8be68f8fe8bfb0e7aca6efbc8ce4b88de698afe5a597e794a8e59ca8e58583e7b4a0e4b88ae79a84e4b880e888ace5b1ace680a7e5aea3e5918ae38082' USING utf8mb4),
example_code = CONVERT(X'40666f6e742d66616365207b0a2020666f6e742d66616d696c793a20224578616d706c65223b0a20207372633a2075726c28226578616d706c652e776f666632222920666f726d61742822776f66663222293b0a7d' USING utf8mb4),
example_description = CONVERT(X'e7a4bae7af842040666f6e742d6661636520e8a68fe58987e79a84e59fbae69cace5afabe6b395e38082' USING utf8mb4),
sort_key = CONVERT(X'40666f6e742d66616365' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d666f6e74732d352f2361742d666f6e742d666163652d72756c65' USING utf8mb4),
source_version = CONVERT(X'6373732d666f6e74732d3520454420323032362d31312d3034' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3333' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'61742d72756c652d666f6e742d66616365' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'61745f72756c655f6e616d65' USING utf8mb4),
                    CONVERT(X'666f6e742d66616365' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'61742d72756c6573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'61742d72756c652d6b65796672616d6573' USING utf8mb4), CONVERT(X'406b65796672616d6573' USING utf8mb4), CONVERT(X'e9979ce98db5e5bdb1e6a0bce58b95e795ab' USING utf8mb4), CONVERT(X'e5ae9ae7bea9e58b95e795abe4b88de5908ce980b2e5baa6e79a84e6a8a3e5bc8fe38082' USING utf8mb4), CONVERT(X'e5ae9ae7bea9e58b95e795abe4b88de5908ce980b2e5baa6e79a84e6a8a3e5bc8fe38082e58fafe4bdbfe794a82066726f6de38081746f20e68896e799bee58886e6af94e68c87e5ae9ae5bdb1e6a0bcefbc8ce5868de794b120616e696d6174696f6e20e7ad89e5b1ace680a7e5a597e794a8e38082' USING utf8mb4), CONVERT(X'406b65796672616d65732066616465207b0a202066726f6d207b206f7061636974793a20303b207d0a2020746f207b206f7061636974793a20313b207d0a7d' USING utf8mb4), CONVERT(X'e7a4bae7af8420406b65796672616d657320e8a68fe58987e79a84e59fbae69cace5afabe6b395e38082' USING utf8mb4), CONVERT(X'406b65796672616d6573' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d616e696d6174696f6e732d312f2361742d72756c656465662d6b65796672616d6573' USING utf8mb4), CONVERT(X'6373732d616e696d6174696f6e732d3120454420323032362d30392d3133' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3236' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'406b65796672616d6573' USING utf8mb4),
display_label = CONVERT(X'e9979ce98db5e5bdb1e6a0bce58b95e795ab' USING utf8mb4),
summary = CONVERT(X'e5ae9ae7bea9e58b95e795abe4b88de5908ce980b2e5baa6e79a84e6a8a3e5bc8fe38082' USING utf8mb4),
description = CONVERT(X'e5ae9ae7bea9e58b95e795abe4b88de5908ce980b2e5baa6e79a84e6a8a3e5bc8fe38082e58fafe4bdbfe794a82066726f6de38081746f20e68896e799bee58886e6af94e68c87e5ae9ae5bdb1e6a0bcefbc8ce5868de794b120616e696d6174696f6e20e7ad89e5b1ace680a7e5a597e794a8e38082' USING utf8mb4),
example_code = CONVERT(X'406b65796672616d65732066616465207b0a202066726f6d207b206f7061636974793a20303b207d0a2020746f207b206f7061636974793a20313b207d0a7d' USING utf8mb4),
example_description = CONVERT(X'e7a4bae7af8420406b65796672616d657320e8a68fe58987e79a84e59fbae69cace5afabe6b395e38082' USING utf8mb4),
sort_key = CONVERT(X'406b65796672616d6573' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d616e696d6174696f6e732d312f2361742d72756c656465662d6b65796672616d6573' USING utf8mb4),
source_version = CONVERT(X'6373732d616e696d6174696f6e732d3120454420323032362d30392d3133' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3236' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'61742d72756c652d6b65796672616d6573' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'61745f72756c655f6e616d65' USING utf8mb4),
                    CONVERT(X'6b65796672616d6573' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'61742d72756c6573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'61742d72756c652d6c61796572' USING utf8mb4), CONVERT(X'406c61796572' USING utf8mb4), CONVERT(X'e5b1a4e7968ae58886e5b1a4' USING utf8mb4), CONVERT(X'e5bbbae7ab8be68896e68e92e588972043535320e79a84e5b1a4e7968ae58886e5b1a4e38082' USING utf8mb4), CONVERT(X'e5bbbae7ab8be68896e68e92e588972043535320e79a84e5b1a4e7968ae58886e5b1a4e38082e58886e5b1a4e58f83e88887e5b1a4e7968ae584aae58588e9a086e5ba8fefbc8ce58fafe4bdbfe794a8e58d80e5a18ae68896e5908de7a8b1e6b885e596aee5aea3e5918ae38082' USING utf8mb4), CONVERT(X'406c6179657220626173652c20636f6d706f6e656e74733b0a406c6179657220636f6d706f6e656e7473207b0a20202e63617264207b2070616464696e673a20313670783b207d0a7d' USING utf8mb4), CONVERT(X'e7a4bae7af8420406c6179657220e8a68fe58987e79a84e59fbae69cace5afabe6b395e38082' USING utf8mb4), CONVERT(X'406c61796572' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d636173636164652d352f2361742d72756c656465662d6c61796572' USING utf8mb4), CONVERT(X'6373732d636173636164652d3520454420323032362d30342d3133' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35303a3234' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'406c61796572' USING utf8mb4),
display_label = CONVERT(X'e5b1a4e7968ae58886e5b1a4' USING utf8mb4),
summary = CONVERT(X'e5bbbae7ab8be68896e68e92e588972043535320e79a84e5b1a4e7968ae58886e5b1a4e38082' USING utf8mb4),
description = CONVERT(X'e5bbbae7ab8be68896e68e92e588972043535320e79a84e5b1a4e7968ae58886e5b1a4e38082e58886e5b1a4e58f83e88887e5b1a4e7968ae584aae58588e9a086e5ba8fefbc8ce58fafe4bdbfe794a8e58d80e5a18ae68896e5908de7a8b1e6b885e596aee5aea3e5918ae38082' USING utf8mb4),
example_code = CONVERT(X'406c6179657220626173652c20636f6d706f6e656e74733b0a406c6179657220636f6d706f6e656e7473207b0a20202e63617264207b2070616464696e673a20313670783b207d0a7d' USING utf8mb4),
example_description = CONVERT(X'e7a4bae7af8420406c6179657220e8a68fe58987e79a84e59fbae69cace5afabe6b395e38082' USING utf8mb4),
sort_key = CONVERT(X'406c61796572' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d636173636164652d352f2361742d72756c656465662d6c61796572' USING utf8mb4),
source_version = CONVERT(X'6373732d636173636164652d3520454420323032362d30342d3133' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35303a3234' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'61742d72756c652d6c61796572' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'61745f72756c655f6e616d65' USING utf8mb4),
                    CONVERT(X'6c61796572' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'61742d72756c6573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'61742d72756c652d636f6e7461696e6572' USING utf8mb4), CONVERT(X'40636f6e7461696e6572' USING utf8mb4), CONVERT(X'e5aeb9e599a8e6a29de4bbb6e69fa5e8a9a2' USING utf8mb4), CONVERT(X'e4be9de69fa5e8a9a2e5aeb9e599a8e79a84e6a29de4bbb6e5a597e794a8e6a8a3e5bc8fe38082' USING utf8mb4), CONVERT(X'e4be9de69fa5e8a9a2e5aeb9e599a8e79a84e6a29de4bbb6e5a597e794a8e6a8a3e5bc8fe38082e5b0bae5afb8e69fa5e8a9a2e9809ae5b8b8e99c80e8a681e58588e794a820636f6e7461696e65722d7479706520e7ad89e8a8ade5ae9ae981a9e794a8e5aeb9e599a8e38082' USING utf8mb4), CONVERT(X'40636f6e7461696e657220286d696e2d77696474683a20343030707829207b0a20202e63617264207b20646973706c61793a20666c65783b207d0a7d' USING utf8mb4), CONVERT(X'e7a4bae7af842040636f6e7461696e657220e8a68fe58987e79a84e59fbae69cace5afabe6b395e38082' USING utf8mb4), CONVERT(X'40636f6e7461696e6572' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d636f6e646974696f6e616c2d352f2361742d72756c656465662d636f6e7461696e6572' USING utf8mb4), CONVERT(X'6373732d636f6e646974696f6e616c2d3520454420323032362d31312d3130' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3132' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'40636f6e7461696e6572' USING utf8mb4),
display_label = CONVERT(X'e5aeb9e599a8e6a29de4bbb6e69fa5e8a9a2' USING utf8mb4),
summary = CONVERT(X'e4be9de69fa5e8a9a2e5aeb9e599a8e79a84e6a29de4bbb6e5a597e794a8e6a8a3e5bc8fe38082' USING utf8mb4),
description = CONVERT(X'e4be9de69fa5e8a9a2e5aeb9e599a8e79a84e6a29de4bbb6e5a597e794a8e6a8a3e5bc8fe38082e5b0bae5afb8e69fa5e8a9a2e9809ae5b8b8e99c80e8a681e58588e794a820636f6e7461696e65722d7479706520e7ad89e8a8ade5ae9ae981a9e794a8e5aeb9e599a8e38082' USING utf8mb4),
example_code = CONVERT(X'40636f6e7461696e657220286d696e2d77696474683a20343030707829207b0a20202e63617264207b20646973706c61793a20666c65783b207d0a7d' USING utf8mb4),
example_description = CONVERT(X'e7a4bae7af842040636f6e7461696e657220e8a68fe58987e79a84e59fbae69cace5afabe6b395e38082' USING utf8mb4),
sort_key = CONVERT(X'40636f6e7461696e6572' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d636f6e646974696f6e616c2d352f2361742d72756c656465662d636f6e7461696e6572' USING utf8mb4),
source_version = CONVERT(X'6373732d636f6e646974696f6e616c2d3520454420323032362d31312d3130' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3132' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'61742d72756c652d636f6e7461696e6572' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'61745f72756c655f6e616d65' USING utf8mb4),
                    CONVERT(X'636f6e7461696e6572' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'61742d72756c6573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'61742d72756c652d70616765' USING utf8mb4), CONVERT(X'4070616765' USING utf8mb4), CONVERT(X'e58886e9a081e6a8a3e5bc8f' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58897e58db0e68896e585b6e4bb96e58886e9a081e5aa92e9ab94e79a84e9a081e99da2e6a8a3e5bc8fe38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae58897e58db0e68896e585b6e4bb96e58886e9a081e5aa92e9ab94e79a84e9a081e99da2e6a8a3e5bc8fe38082e58d80e5a18ae4b8ade58fafe58c85e590abe9a081e99da2e79bb8e9979ce8a8ade5ae9ae58f8ae9a081e99da2e9828ae8b79de8a68fe58987efbc8ce4b88de698afe4b880e888ace7b6b2e9a081e58583e7b4a0e981b8e69387e599a8e38082' USING utf8mb4), CONVERT(X'4070616765207b0a20206d617267696e3a2032306d6d3b0a7d' USING utf8mb4), CONVERT(X'e7a4bae7af8420407061676520e8a68fe58987e79a84e59fbae69cace5afabe6b395e38082' USING utf8mb4), CONVERT(X'4070616765' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d706167652d332f2361742d72756c656465662d70616765' USING utf8mb4), CONVERT(X'6373732d706167652d3320454420323032362d31302d3231' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35313a3535' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'4070616765' USING utf8mb4),
display_label = CONVERT(X'e58886e9a081e6a8a3e5bc8f' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae58897e58db0e68896e585b6e4bb96e58886e9a081e5aa92e9ab94e79a84e9a081e99da2e6a8a3e5bc8fe38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae58897e58db0e68896e585b6e4bb96e58886e9a081e5aa92e9ab94e79a84e9a081e99da2e6a8a3e5bc8fe38082e58d80e5a18ae4b8ade58fafe58c85e590abe9a081e99da2e79bb8e9979ce8a8ade5ae9ae58f8ae9a081e99da2e9828ae8b79de8a68fe58987efbc8ce4b88de698afe4b880e888ace7b6b2e9a081e58583e7b4a0e981b8e69387e599a8e38082' USING utf8mb4),
example_code = CONVERT(X'4070616765207b0a20206d617267696e3a2032306d6d3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e7a4bae7af8420407061676520e8a68fe58987e79a84e59fbae69cace5afabe6b395e38082' USING utf8mb4),
sort_key = CONVERT(X'4070616765' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d706167652d332f2361742d72756c656465662d70616765' USING utf8mb4),
source_version = CONVERT(X'6373732d706167652d3320454420323032362d31302d3231' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35313a3535' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'61742d72756c652d70616765' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'61745f72756c655f6e616d65' USING utf8mb4),
                    CONVERT(X'70616765' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'61742d72756c6573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'61742d72756c652d6e616d657370616365' USING utf8mb4), CONVERT(X'406e616d657370616365' USING utf8mb4), CONVERT(X'e591bde5908de7a9bae99693e5aea3e5918a' USING utf8mb4), CONVERT(X'e5aea3e5918ae981b8e69387e599a8e4bdbfe794a8e79a84e591bde5908de7a9bae99693e5898de7b6b4e68896e9a090e8a8ade591bde5908de7a9bae99693e38082' USING utf8mb4), CONVERT(X'e5aea3e5918ae981b8e69387e599a8e4bdbfe794a8e79a84e591bde5908de7a9bae99693e5898de7b6b4e68896e9a090e8a8ade591bde5908de7a9bae99693e38082e5b8b8e794a8e696bce590abe69c8920535647e38081584d4c20e7ad89e591bde5908de7a9bae99693e79a84e69687e4bbb6efbc8ce4b894e69c89e6a8a3e5bc8fe8a1a8e4bd8de7bdaee99990e588b6e38082' USING utf8mb4), CONVERT(X'406e616d657370616365207376672075726c2822687474703a2f2f7777772e77332e6f72672f323030302f73766722293b0a7376677c61207b20636f6c6f723a207465616c3b207d' USING utf8mb4), CONVERT(X'e7a4bae7af8420406e616d65737061636520e8a68fe58987e79a84e59fbae69cace5afabe6b395e38082' USING utf8mb4), CONVERT(X'406e616d657370616365' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6e616d657370616365732d332f2361742d72756c656465662d6e616d657370616365' USING utf8mb4), CONVERT(X'6373732d6e616d657370616365732d3320454420323032342d31302d3235' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3434' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'406e616d657370616365' USING utf8mb4),
display_label = CONVERT(X'e591bde5908de7a9bae99693e5aea3e5918a' USING utf8mb4),
summary = CONVERT(X'e5aea3e5918ae981b8e69387e599a8e4bdbfe794a8e79a84e591bde5908de7a9bae99693e5898de7b6b4e68896e9a090e8a8ade591bde5908de7a9bae99693e38082' USING utf8mb4),
description = CONVERT(X'e5aea3e5918ae981b8e69387e599a8e4bdbfe794a8e79a84e591bde5908de7a9bae99693e5898de7b6b4e68896e9a090e8a8ade591bde5908de7a9bae99693e38082e5b8b8e794a8e696bce590abe69c8920535647e38081584d4c20e7ad89e591bde5908de7a9bae99693e79a84e69687e4bbb6efbc8ce4b894e69c89e6a8a3e5bc8fe8a1a8e4bd8de7bdaee99990e588b6e38082' USING utf8mb4),
example_code = CONVERT(X'406e616d657370616365207376672075726c2822687474703a2f2f7777772e77332e6f72672f323030302f73766722293b0a7376677c61207b20636f6c6f723a207465616c3b207d' USING utf8mb4),
example_description = CONVERT(X'e7a4bae7af8420406e616d65737061636520e8a68fe58987e79a84e59fbae69cace5afabe6b395e38082' USING utf8mb4),
sort_key = CONVERT(X'406e616d657370616365' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d6e616d657370616365732d332f2361742d72756c656465662d6e616d657370616365' USING utf8mb4),
source_version = CONVERT(X'6373732d6e616d657370616365732d3320454420323032342d31302d3235' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3434' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'61742d72756c652d6e616d657370616365' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'61745f72756c655f6e616d65' USING utf8mb4),
                    CONVERT(X'6e616d657370616365' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'61742d72756c6573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'61742d72756c652d70726f7065727479' USING utf8mb4), CONVERT(X'4070726f7065727479' USING utf8mb4), CONVERT(X'e8a8bbe5868ae887aae8a882e5b1ace680a7' USING utf8mb4), CONVERT(X'e782bae887aae8a882e5b1ace680a7e5aea3e5918ae8aa9ee6b395e38081e7b9bce689bfe696b9e5bc8fe88887e5889de5a78be580bce7ad89e8a8ade5ae9ae38082' USING utf8mb4), CONVERT(X'e782bae887aae8a882e5b1ace680a7e5aea3e5918ae8aa9ee6b395e38081e7b9bce689bfe696b9e5bc8fe88887e5889de5a78be580bce7ad89e8a8ade5ae9ae38082e58d80e5a18ae4b8ade79a842073796e746178e38081696e68657269747320e8888720696e697469616c2d76616c756520e698afe68f8fe8bfb0e7aca6efbc8ce4b88de698afe4b880e888ace58583e7b4a0e5b1ace680a7e38082' USING utf8mb4), CONVERT(X'4070726f7065727479202d2d6272616e64207b0a202073796e7461783a20223c636f6c6f723e223b0a2020696e6865726974733a2066616c73653b0a2020696e697469616c2d76616c75653a207465616c3b0a7d' USING utf8mb4), CONVERT(X'e7a4bae7af84204070726f706572747920e8a68fe58987e79a84e59fbae69cace5afabe6b395e38082' USING utf8mb4), CONVERT(X'4070726f7065727479' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e6373732d686f7564696e692e6f72672f6373732d70726f706572746965732d76616c7565732d6170692d312f2361742d72756c656465662d70726f7065727479' USING utf8mb4), CONVERT(X'6373732d70726f706572746965732d76616c7565732d6170692d3120454420323032362d31302d3331' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3437' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'4070726f7065727479' USING utf8mb4),
display_label = CONVERT(X'e8a8bbe5868ae887aae8a882e5b1ace680a7' USING utf8mb4),
summary = CONVERT(X'e782bae887aae8a882e5b1ace680a7e5aea3e5918ae8aa9ee6b395e38081e7b9bce689bfe696b9e5bc8fe88887e5889de5a78be580bce7ad89e8a8ade5ae9ae38082' USING utf8mb4),
description = CONVERT(X'e782bae887aae8a882e5b1ace680a7e5aea3e5918ae8aa9ee6b395e38081e7b9bce689bfe696b9e5bc8fe88887e5889de5a78be580bce7ad89e8a8ade5ae9ae38082e58d80e5a18ae4b8ade79a842073796e746178e38081696e68657269747320e8888720696e697469616c2d76616c756520e698afe68f8fe8bfb0e7aca6efbc8ce4b88de698afe4b880e888ace58583e7b4a0e5b1ace680a7e38082' USING utf8mb4),
example_code = CONVERT(X'4070726f7065727479202d2d6272616e64207b0a202073796e7461783a20223c636f6c6f723e223b0a2020696e6865726974733a2066616c73653b0a2020696e697469616c2d76616c75653a207465616c3b0a7d' USING utf8mb4),
example_description = CONVERT(X'e7a4bae7af84204070726f706572747920e8a68fe58987e79a84e59fbae69cace5afabe6b395e38082' USING utf8mb4),
sort_key = CONVERT(X'4070726f7065727479' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e6373732d686f7564696e692e6f72672f6373732d70726f706572746965732d76616c7565732d6170692d312f2361742d72756c656465662d70726f7065727479' USING utf8mb4),
source_version = CONVERT(X'6373732d70726f706572746965732d76616c7565732d6170692d3120454420323032362d31302d3331' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3437' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'61742d72756c652d70726f7065727479' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'61745f72756c655f6e616d65' USING utf8mb4),
                    CONVERT(X'70726f7065727479' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id FROM syntax_categories
                WHERE language = 'css' AND slug = CONVERT(X'61742d72756c6573' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active)
            VALUES (@category_id, CONVERT(X'61742d72756c652d7374617274696e672d7374796c65' USING utf8mb4), CONVERT(X'407374617274696e672d7374796c65' USING utf8mb4), CONVERT(X'e8b5b7e5a78be8bd89e5a0b4e6a8a3e5bc8f' USING utf8mb4), CONVERT(X'e782bae7aca6e59088e6a29de4bbb6e79a84e8bd89e5a0b4e68f90e4be9be8b5b7e5a78be6a8a3e5bc8fe38082' USING utf8mb4), CONVERT(X'e782bae7aca6e59088e6a29de4bbb6e79a84e8bd89e5a0b4e68f90e4be9be8b5b7e5a78be6a8a3e5bc8fe38082e58fafe794a8e696bce58e9fe58588e6b292e69c89e5898de4b880e5808be6a8a3e5bc8fe78b80e6858be79a84e58583e7b4a0efbc8ce4be8be5a682e69f90e4ba9be9a696e6aca1e9a1afe7a4bae79a84e8bd89e5a0b4e68385e6b381e38082' USING utf8mb4), CONVERT(X'407374617274696e672d7374796c65207b0a20202e6e6f74696365207b206f7061636974793a20303b207d0a7d' USING utf8mb4), CONVERT(X'e7a4bae7af8420407374617274696e672d7374796c6520e8a68fe58987e79a84e59fbae69cace5afabe6b395e38082' USING utf8mb4), CONVERT(X'407374617274696e672d7374796c65' USING utf8mb4), CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d7472616e736974696f6e732d322f2361742d72756c656465662d7374617274696e672d7374796c65' USING utf8mb4), CONVERT(X'6373732d7472616e736974696f6e732d3220454420323032362d30342d3232' USING utf8mb4), CONVERT(X'323032362d31312d31332030333a35323a3131' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE name = CONVERT(X'407374617274696e672d7374796c65' USING utf8mb4),
display_label = CONVERT(X'e8b5b7e5a78be8bd89e5a0b4e6a8a3e5bc8f' USING utf8mb4),
summary = CONVERT(X'e782bae7aca6e59088e6a29de4bbb6e79a84e8bd89e5a0b4e68f90e4be9be8b5b7e5a78be6a8a3e5bc8fe38082' USING utf8mb4),
description = CONVERT(X'e782bae7aca6e59088e6a29de4bbb6e79a84e8bd89e5a0b4e68f90e4be9be8b5b7e5a78be6a8a3e5bc8fe38082e58fafe794a8e696bce58e9fe58588e6b292e69c89e5898de4b880e5808be6a8a3e5bc8fe78b80e6858be79a84e58583e7b4a0efbc8ce4be8be5a682e69f90e4ba9be9a696e6aca1e9a1afe7a4bae79a84e8bd89e5a0b4e68385e6b381e38082' USING utf8mb4),
example_code = CONVERT(X'407374617274696e672d7374796c65207b0a20202e6e6f74696365207b206f7061636974793a20303b207d0a7d' USING utf8mb4),
example_description = CONVERT(X'e7a4bae7af8420407374617274696e672d7374796c6520e8a68fe58987e79a84e59fbae69cace5afabe6b395e38082' USING utf8mb4),
sort_key = CONVERT(X'407374617274696e672d7374796c65' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f6472616674732e63737377672e6f72672f6373732d7472616e736974696f6e732d322f2361742d72756c656465662d7374617274696e672d7374796c65' USING utf8mb4),
source_version = CONVERT(X'6373732d7472616e736974696f6e732d3220454420323032362d30342d3232' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31332030333a35323a3131' USING utf8mb4), is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'61742d72756c652d7374617274696e672d7374796c65' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules SET is_active = 0
            WHERE syntax_id = @syntax_id AND analyzer = 'css_parser';
            
-- @statement

            INSERT INTO syntax_detection_rules
                (syntax_id, analyzer, rule_type, match_value, is_active)
            VALUES (@syntax_id, 'css_parser', CONVERT(X'61745f72756c655f6e616d65' USING utf8mb4),
                    CONVERT(X'7374617274696e672d7374796c65' USING utf8mb4), 1)
            ON DUPLICATE KEY UPDATE is_active = 1;
            
