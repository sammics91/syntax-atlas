-- syntax-atlas generated migration v1
-- Migration: 007_html_elements.sql; no member records included.

-- @statement
SET NAMES utf8mb4;
-- @statement

            INSERT INTO syntax_categories (
                language, slug, name, display_order
            )
            VALUES (
                'html',
                CONVERT(X'646f63756d656e742d656c656d656e74' USING utf8mb4),
                CONVERT(X'e69687e4bbb6e6a0b9e58583e7b4a0' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'e69687e4bbb6e6a0b9e58583e7b4a0' USING utf8mb4),
                display_order = 1;
            
-- @statement

            INSERT INTO syntax_categories (
                language, slug, name, display_order
            )
            VALUES (
                'html',
                CONVERT(X'646f63756d656e742d6d65746164617461' USING utf8mb4),
                CONVERT(X'e69687e4bbb6e4b8ade7b9bce8b387e69699' USING utf8mb4),
                5
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'e69687e4bbb6e4b8ade7b9bce8b387e69699' USING utf8mb4),
                display_order = 5;
            
-- @statement

            INSERT INTO syntax_categories (
                language, slug, name, display_order
            )
            VALUES (
                'html',
                CONVERT(X'73656374696f6e73' USING utf8mb4),
                CONVERT(X'e69687e4bbb6e58d80e6aeb5' USING utf8mb4),
                8
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'e69687e4bbb6e58d80e6aeb5' USING utf8mb4),
                display_order = 8;
            
-- @statement

            INSERT INTO syntax_categories (
                language, slug, name, display_order
            )
            VALUES (
                'html',
                CONVERT(X'67726f7570696e672d636f6e74656e74' USING utf8mb4),
                CONVERT(X'e585a7e5aeb9e58886e7b584' USING utf8mb4),
                10
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'e585a7e5aeb9e58886e7b584' USING utf8mb4),
                display_order = 10;
            
-- @statement

            INSERT INTO syntax_categories (
                language, slug, name, display_order
            )
            VALUES (
                'html',
                CONVERT(X'746578742d6c6576656c2d73656d616e74696373' USING utf8mb4),
                CONVERT(X'e69687e5ad97e5b1a4e7b49ae8aa9ee6848f' USING utf8mb4),
                20
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'e69687e5ad97e5b1a4e7b49ae8aa9ee6848f' USING utf8mb4),
                display_order = 20;
            
-- @statement

            INSERT INTO syntax_categories (
                language, slug, name, display_order
            )
            VALUES (
                'html',
                CONVERT(X'6564697473' USING utf8mb4),
                CONVERT(X'e7b7a8e8bcafe6a899e8a898' USING utf8mb4),
                25
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'e7b7a8e8bcafe6a899e8a898' USING utf8mb4),
                display_order = 25;
            
-- @statement

            INSERT INTO syntax_categories (
                language, slug, name, display_order
            )
            VALUES (
                'html',
                CONVERT(X'656d6265646465642d636f6e74656e74' USING utf8mb4),
                CONVERT(X'e5b58ce585a5e585a7e5aeb9' USING utf8mb4),
                30
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'e5b58ce585a5e585a7e5aeb9' USING utf8mb4),
                display_order = 30;
            
-- @statement

            INSERT INTO syntax_categories (
                language, slug, name, display_order
            )
            VALUES (
                'html',
                CONVERT(X'746162756c61722d64617461' USING utf8mb4),
                CONVERT(X'e8a1a8e6a0bce8b387e69699' USING utf8mb4),
                40
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'e8a1a8e6a0bce8b387e69699' USING utf8mb4),
                display_order = 40;
            
-- @statement

            INSERT INTO syntax_categories (
                language, slug, name, display_order
            )
            VALUES (
                'html',
                CONVERT(X'666f726d73' USING utf8mb4),
                CONVERT(X'e8a1a8e596ae' USING utf8mb4),
                50
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'e8a1a8e596ae' USING utf8mb4),
                display_order = 50;
            
-- @statement

            INSERT INTO syntax_categories (
                language, slug, name, display_order
            )
            VALUES (
                'html',
                CONVERT(X'696e7465726163746976652d656c656d656e7473' USING utf8mb4),
                CONVERT(X'e4ba92e58b95e58583e7b4a0' USING utf8mb4),
                60
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'e4ba92e58b95e58583e7b4a0' USING utf8mb4),
                display_order = 60;
            
-- @statement

            INSERT INTO syntax_categories (
                language, slug, name, display_order
            )
            VALUES (
                'html',
                CONVERT(X'736372697074696e67' USING utf8mb4),
                CONVERT(X'e68c87e4bba4e7a2bce88887e7af84e69cac' USING utf8mb4),
                70
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'e68c87e4bba4e7a2bce88887e7af84e69cac' USING utf8mb4),
                display_order = 70;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'646f63756d656e742d656c656d656e74' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d68746d6c' USING utf8mb4), CONVERT(X'3c68746d6c3e' USING utf8mb4), CONVERT(X'e69687e4bbb6e6a0b9e58583e7b4a0' USING utf8mb4), CONVERT(X'e8a1a8e7a4ba2048544d4c20e69687e4bbb6e79a84e6a0b9e58583e7b4a0e38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4ba2048544d4c20e69687e4bbb6e79a84e6a0b9e58583e7b4a0e38082e4b880e888ace69687e4bbb6e59ca8e585b6e4b8ade694bee7bdae206865616420e8888720626f6479efbc9b6c616e6720e58fafe8aaaae6988ee69687e4bbb6e79a84e4b8bbe8a681e8aa9ee8a880e38082444f435459504520e698afe78da8e7ab8be5aea3e5918aefbc8ce4b88de5b1ace696bc2068746d6c20e58583e7b4a0e38082' USING utf8mb4), CONVERT(X'3c21646f63747970652068746d6c3e0a3c68746d6c206c616e673d227a682d48616e74223e0a20203c686561643e3c7469746c653ee8aa9ee6b395e5adb8e7bf923c2f7469746c653e3c2f686561643e0a20203c626f64793e3c703ee6ada1e8bf8ee5adb8e7bf922048544d4ce380823c2f703e3c2f626f64793e0a3c2f68746d6c3e' USING utf8mb4), CONVERT(X'e5bbbae7ab8be4bba5e7b981e9ab94e4b8ade69687e782bae4b8bbe8a681e8aa9ee8a880e79a842048544d4c20e69687e4bbb6e38082' USING utf8mb4), CONVERT(X'68746d6c' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656d616e746963732e68746d6c237468652d68746d6c2d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c68746d6c3e' USING utf8mb4),
display_label = CONVERT(X'e69687e4bbb6e6a0b9e58583e7b4a0' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4ba2048544d4c20e69687e4bbb6e79a84e6a0b9e58583e7b4a0e38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4ba2048544d4c20e69687e4bbb6e79a84e6a0b9e58583e7b4a0e38082e4b880e888ace69687e4bbb6e59ca8e585b6e4b8ade694bee7bdae206865616420e8888720626f6479efbc9b6c616e6720e58fafe8aaaae6988ee69687e4bbb6e79a84e4b8bbe8a681e8aa9ee8a880e38082444f435459504520e698afe78da8e7ab8be5aea3e5918aefbc8ce4b88de5b1ace696bc2068746d6c20e58583e7b4a0e38082' USING utf8mb4),
example_code = CONVERT(X'3c21646f63747970652068746d6c3e0a3c68746d6c206c616e673d227a682d48616e74223e0a20203c686561643e3c7469746c653ee8aa9ee6b395e5adb8e7bf923c2f7469746c653e3c2f686561643e0a20203c626f64793e3c703ee6ada1e8bf8ee5adb8e7bf922048544d4ce380823c2f703e3c2f626f64793e0a3c2f68746d6c3e' USING utf8mb4),
example_description = CONVERT(X'e5bbbae7ab8be4bba5e7b981e9ab94e4b8ade69687e782bae4b8bbe8a681e8aa9ee8a880e79a842048544d4c20e69687e4bbb6e38082' USING utf8mb4),
sort_key = CONVERT(X'68746d6c' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656d616e746963732e68746d6c237468652d68746d6c2d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d68746d6c' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'68746d6c' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'646f63756d656e742d6d65746164617461' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d68656164' USING utf8mb4), CONVERT(X'3c686561643e' USING utf8mb4), CONVERT(X'e69687e4bbb6e8b387e8a88ae58d80' USING utf8mb4), CONVERT(X'e58c85e590abe69687e4bbb6e6a899e9a18ce38081e7b7a8e7a2bce38081e6a8a3e5bc8fe88887e585b6e4bb96e4b8ade7b9bce8b387e69699e38082' USING utf8mb4), CONVERT(X'e58c85e590abe69687e4bbb6e6a899e9a18ce38081e7b7a8e7a2bce38081e6a8a3e5bc8fe88887e585b6e4bb96e4b8ade7b9bce8b387e69699e38082e5ae83e4b88de698afe9a081e99da2e4b88ae696b9e58fafe8a68be79a84e6a899e9a0adefbc9be58fafe8a68be79a84e4bb8be7b4b9e58d80e59f9fe68789e4bdbfe794a820686561646572e38082e4b880e888ace69687e4bbb6e5b087206865616420e694bee59ca820626f647920e4b98be5898de38082' USING utf8mb4), CONVERT(X'3c686561643e0a20203c6d65746120636861727365743d227574662d38223e0a20203c7469746c653e53796e7461782041746c61733c2f7469746c653e0a3c2f686561643e' USING utf8mb4), CONVERT(X'e59ca8e69687e4bbb6e8b387e8a88ae58d80e8a8ade5ae9ae7b7a8e7a2bce88887e58886e9a081e6a899e9a18ce38082' USING utf8mb4), CONVERT(X'68656164' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656d616e746963732e68746d6c237468652d686561642d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c686561643e' USING utf8mb4),
display_label = CONVERT(X'e69687e4bbb6e8b387e8a88ae58d80' USING utf8mb4),
summary = CONVERT(X'e58c85e590abe69687e4bbb6e6a899e9a18ce38081e7b7a8e7a2bce38081e6a8a3e5bc8fe88887e585b6e4bb96e4b8ade7b9bce8b387e69699e38082' USING utf8mb4),
description = CONVERT(X'e58c85e590abe69687e4bbb6e6a899e9a18ce38081e7b7a8e7a2bce38081e6a8a3e5bc8fe88887e585b6e4bb96e4b8ade7b9bce8b387e69699e38082e5ae83e4b88de698afe9a081e99da2e4b88ae696b9e58fafe8a68be79a84e6a899e9a0adefbc9be58fafe8a68be79a84e4bb8be7b4b9e58d80e59f9fe68789e4bdbfe794a820686561646572e38082e4b880e888ace69687e4bbb6e5b087206865616420e694bee59ca820626f647920e4b98be5898de38082' USING utf8mb4),
example_code = CONVERT(X'3c686561643e0a20203c6d65746120636861727365743d227574662d38223e0a20203c7469746c653e53796e7461782041746c61733c2f7469746c653e0a3c2f686561643e' USING utf8mb4),
example_description = CONVERT(X'e59ca8e69687e4bbb6e8b387e8a88ae58d80e8a8ade5ae9ae7b7a8e7a2bce88887e58886e9a081e6a899e9a18ce38082' USING utf8mb4),
sort_key = CONVERT(X'68656164' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656d616e746963732e68746d6c237468652d686561642d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d68656164' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'68656164' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'646f63756d656e742d6d65746164617461' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d7469746c65' USING utf8mb4), CONVERT(X'3c7469746c653e' USING utf8mb4), CONVERT(X'e69687e4bbb6e6a899e9a18c' USING utf8mb4), CONVERT(X'e5ae9ae7bea9e69687e4bbb6e79a84e6a899e9a18ce38082' USING utf8mb4), CONVERT(X'e5ae9ae7bea9e69687e4bbb6e79a84e6a899e9a18ce38082e9809ae5b8b8e9a1afe7a4bae59ca8e7808fe8a6bde599a8e58886e9a081e68896e69bb8e7b1a4e5908de7a8b1efbc8ce694bee59ca8206865616420e4b8adefbc9be5ae83e88887e9a081e99da2e585a7e5aeb9e4b8ade79a8420683120e6a899e9a18ce794a8e98094e4b88de5908ce38082' USING utf8mb4), CONVERT(X'3c686561643e0a20203c7469746c653ee8aa9ee6b395e8beade585b820e280942053796e7461782041746c61733c2f7469746c653e0a3c2f686561643e' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae7808fe8a6bde599a8e58886e9a081e4bdbfe794a8e79a84e6a899e9a18ce38082' USING utf8mb4), CONVERT(X'7469746c65' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656d616e746963732e68746d6c237468652d7469746c652d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c7469746c653e' USING utf8mb4),
display_label = CONVERT(X'e69687e4bbb6e6a899e9a18c' USING utf8mb4),
summary = CONVERT(X'e5ae9ae7bea9e69687e4bbb6e79a84e6a899e9a18ce38082' USING utf8mb4),
description = CONVERT(X'e5ae9ae7bea9e69687e4bbb6e79a84e6a899e9a18ce38082e9809ae5b8b8e9a1afe7a4bae59ca8e7808fe8a6bde599a8e58886e9a081e68896e69bb8e7b1a4e5908de7a8b1efbc8ce694bee59ca8206865616420e4b8adefbc9be5ae83e88887e9a081e99da2e585a7e5aeb9e4b8ade79a8420683120e6a899e9a18ce794a8e98094e4b88de5908ce38082' USING utf8mb4),
example_code = CONVERT(X'3c686561643e0a20203c7469746c653ee8aa9ee6b395e8beade585b820e280942053796e7461782041746c61733c2f7469746c653e0a3c2f686561643e' USING utf8mb4),
example_description = CONVERT(X'e8a8ade5ae9ae7808fe8a6bde599a8e58886e9a081e4bdbfe794a8e79a84e6a899e9a18ce38082' USING utf8mb4),
sort_key = CONVERT(X'7469746c65' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656d616e746963732e68746d6c237468652d7469746c652d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d7469746c65' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'7469746c65' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'646f63756d656e742d6d65746164617461' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d62617365' USING utf8mb4), CONVERT(X'3c626173653e' USING utf8mb4), CONVERT(X'e59fbae6ba96e7b6b2e59d80' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae69687e4bbb6e79bb8e5b08de7b6b2e59d80e8a7a3e69e90e69982e79a84e59fbae6ba96e7b6b2e59d80efbc8ce68896e980a3e7b590e79a84e9a090e8a8ade79baee6a899e38082' USING utf8mb4), CONVERT(X'e8a8ade5ae9ae69687e4bbb6e79bb8e5b08de7b6b2e59d80e8a7a3e69e90e69982e79a84e59fbae6ba96e7b6b2e59d80efbc8ce68896e980a3e7b590e79a84e9a090e8a8ade79baee6a899e38082e694bee59ca8206865616420e4b8adefbc9b6872656620e69c83e5bdb1e99fbfe69687e4bbb6e585a7e79a84e79bb8e5b08de980a3e7b590efbc8ce68789e59ca8e99c80e8a681e8a9b2e59fbae6ba96e79a84e7b6b2e59d80e4b98be5898de5aea3e5918ae380826261736520e698afe7a9bae58583e7b4a0efbc8ce4b88de5afabe7b590e69d9fe6a899e7b1a4e38082' USING utf8mb4), CONVERT(X'3c686561643e0a20203c7469746c653ee69599e5adb83c2f7469746c653e0a20203c6261736520687265663d2268747470733a2f2f6578616d706c652e636f6d2f7475746f7269616c732f223e0a3c2f686561643e' USING utf8mb4), CONVERT(X'e4bdbfe79bb8e5b08de7b6b2e59d80e4bba5207475746f7269616c7320e79baee98c84e782bae59fbae6ba96e8a7a3e69e90e38082' USING utf8mb4), CONVERT(X'62617365' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656d616e746963732e68746d6c237468652d626173652d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c626173653e' USING utf8mb4),
display_label = CONVERT(X'e59fbae6ba96e7b6b2e59d80' USING utf8mb4),
summary = CONVERT(X'e8a8ade5ae9ae69687e4bbb6e79bb8e5b08de7b6b2e59d80e8a7a3e69e90e69982e79a84e59fbae6ba96e7b6b2e59d80efbc8ce68896e980a3e7b590e79a84e9a090e8a8ade79baee6a899e38082' USING utf8mb4),
description = CONVERT(X'e8a8ade5ae9ae69687e4bbb6e79bb8e5b08de7b6b2e59d80e8a7a3e69e90e69982e79a84e59fbae6ba96e7b6b2e59d80efbc8ce68896e980a3e7b590e79a84e9a090e8a8ade79baee6a899e38082e694bee59ca8206865616420e4b8adefbc9b6872656620e69c83e5bdb1e99fbfe69687e4bbb6e585a7e79a84e79bb8e5b08de980a3e7b590efbc8ce68789e59ca8e99c80e8a681e8a9b2e59fbae6ba96e79a84e7b6b2e59d80e4b98be5898de5aea3e5918ae380826261736520e698afe7a9bae58583e7b4a0efbc8ce4b88de5afabe7b590e69d9fe6a899e7b1a4e38082' USING utf8mb4),
example_code = CONVERT(X'3c686561643e0a20203c7469746c653ee69599e5adb83c2f7469746c653e0a20203c6261736520687265663d2268747470733a2f2f6578616d706c652e636f6d2f7475746f7269616c732f223e0a3c2f686561643e' USING utf8mb4),
example_description = CONVERT(X'e4bdbfe79bb8e5b08de7b6b2e59d80e4bba5207475746f7269616c7320e79baee98c84e782bae59fbae6ba96e8a7a3e69e90e38082' USING utf8mb4),
sort_key = CONVERT(X'62617365' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656d616e746963732e68746d6c237468652d626173652d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d62617365' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'62617365' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'646f63756d656e742d6d65746164617461' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d6c696e6b' USING utf8mb4), CONVERT(X'3c6c696e6b3e' USING utf8mb4), CONVERT(X'e5a496e983a8e8b387e6ba90e9979ce881af' USING utf8mb4), CONVERT(X'e68f8fe8bfb0e69687e4bbb6e88887e5a496e983a8e8b387e6ba90e4b98be99693e79a84e9979ce4bf82e38082' USING utf8mb4), CONVERT(X'e68f8fe8bfb0e69687e4bbb6e88887e5a496e983a8e8b387e6ba90e4b98be99693e79a84e9979ce4bf82e38082e5b8b8e794a82072656c20e88887206872656620e8bc89e585a5e6a8a3e5bc8fe8a1a8e68896e68c87e5ae9ae59c96e7a4bae38082e5ae83e4b88de698afe8ae93e4bdbfe794a8e88085e9bb9ee6938ae79a84e8b685e980a3e7b590efbc9b6c696e6b20e698afe7a9bae58583e7b4a0e38082' USING utf8mb4), CONVERT(X'3c686561643e0a20203c7469746c653ee9a696e9a0813c2f7469746c653e0a20203c6c696e6b2072656c3d227374796c6573686565742220687265663d222f7374796c65732e637373223e0a3c2f686561643e' USING utf8mb4), CONVERT(X'e782bae69687e4bbb6e68c87e5ae9ae5a496e983a82043535320e6a8a3e5bc8fe8a1a8e38082' USING utf8mb4), CONVERT(X'6c696e6b' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656d616e746963732e68746d6c237468652d6c696e6b2d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c6c696e6b3e' USING utf8mb4),
display_label = CONVERT(X'e5a496e983a8e8b387e6ba90e9979ce881af' USING utf8mb4),
summary = CONVERT(X'e68f8fe8bfb0e69687e4bbb6e88887e5a496e983a8e8b387e6ba90e4b98be99693e79a84e9979ce4bf82e38082' USING utf8mb4),
description = CONVERT(X'e68f8fe8bfb0e69687e4bbb6e88887e5a496e983a8e8b387e6ba90e4b98be99693e79a84e9979ce4bf82e38082e5b8b8e794a82072656c20e88887206872656620e8bc89e585a5e6a8a3e5bc8fe8a1a8e68896e68c87e5ae9ae59c96e7a4bae38082e5ae83e4b88de698afe8ae93e4bdbfe794a8e88085e9bb9ee6938ae79a84e8b685e980a3e7b590efbc9b6c696e6b20e698afe7a9bae58583e7b4a0e38082' USING utf8mb4),
example_code = CONVERT(X'3c686561643e0a20203c7469746c653ee9a696e9a0813c2f7469746c653e0a20203c6c696e6b2072656c3d227374796c6573686565742220687265663d222f7374796c65732e637373223e0a3c2f686561643e' USING utf8mb4),
example_description = CONVERT(X'e782bae69687e4bbb6e68c87e5ae9ae5a496e983a82043535320e6a8a3e5bc8fe8a1a8e38082' USING utf8mb4),
sort_key = CONVERT(X'6c696e6b' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656d616e746963732e68746d6c237468652d6c696e6b2d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d6c696e6b' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'6c696e6b' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'646f63756d656e742d6d65746164617461' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d6d657461' USING utf8mb4), CONVERT(X'3c6d6574613e' USING utf8mb4), CONVERT(X'e4b8ade7b9bce8b387e69699' USING utf8mb4), CONVERT(X'e68f90e4be9be69687e4bbb6e7b7a8e7a2bce38081e68f8fe8bfb0e58f8ae585b6e4bb96e4b8ade7b9bce8b387e69699e38082' USING utf8mb4), CONVERT(X'e68f90e4be9be69687e4bbb6e7b7a8e7a2bce38081e68f8fe8bfb0e58f8ae585b6e4bb96e4b8ade7b9bce8b387e69699e38082e4be9d2063686172736574e380816e616d6520e6889620687474702d657175697620e7ad89e5b1ace680a7e8a1a8e98194e4b88de5908ce8b387e8a88ae380826368617273657420e5aea3e5918ae68789e79ba1e697a9e587bae78fbee59ca8e69687e4bbb6e4b8adefbc9b6d65746120e698afe7a9bae58583e7b4a0e38082' USING utf8mb4), CONVERT(X'3c686561643e0a20203c6d65746120636861727365743d227574662d38223e0a20203c6d657461206e616d653d226465736372697074696f6e2220636f6e74656e743d22e69fa5e996b1e88887e58886e69e90e7a88be5bc8fe8aa9ee6b395223e0a20203c7469746c653e53796e7461782041746c61733c2f7469746c653e0a3c2f686561643e' USING utf8mb4), CONVERT(X'e5aea3e5918a205554462d3820e7b7a8e7a2bce88887e69687e4bbb6e68f8fe8bfb0e38082' USING utf8mb4), CONVERT(X'6d657461' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656d616e746963732e68746d6c237468652d6d6574612d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c6d6574613e' USING utf8mb4),
display_label = CONVERT(X'e4b8ade7b9bce8b387e69699' USING utf8mb4),
summary = CONVERT(X'e68f90e4be9be69687e4bbb6e7b7a8e7a2bce38081e68f8fe8bfb0e58f8ae585b6e4bb96e4b8ade7b9bce8b387e69699e38082' USING utf8mb4),
description = CONVERT(X'e68f90e4be9be69687e4bbb6e7b7a8e7a2bce38081e68f8fe8bfb0e58f8ae585b6e4bb96e4b8ade7b9bce8b387e69699e38082e4be9d2063686172736574e380816e616d6520e6889620687474702d657175697620e7ad89e5b1ace680a7e8a1a8e98194e4b88de5908ce8b387e8a88ae380826368617273657420e5aea3e5918ae68789e79ba1e697a9e587bae78fbee59ca8e69687e4bbb6e4b8adefbc9b6d65746120e698afe7a9bae58583e7b4a0e38082' USING utf8mb4),
example_code = CONVERT(X'3c686561643e0a20203c6d65746120636861727365743d227574662d38223e0a20203c6d657461206e616d653d226465736372697074696f6e2220636f6e74656e743d22e69fa5e996b1e88887e58886e69e90e7a88be5bc8fe8aa9ee6b395223e0a20203c7469746c653e53796e7461782041746c61733c2f7469746c653e0a3c2f686561643e' USING utf8mb4),
example_description = CONVERT(X'e5aea3e5918a205554462d3820e7b7a8e7a2bce88887e69687e4bbb6e68f8fe8bfb0e38082' USING utf8mb4),
sort_key = CONVERT(X'6d657461' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656d616e746963732e68746d6c237468652d6d6574612d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d6d657461' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'6d657461' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'646f63756d656e742d6d65746164617461' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d7374796c65' USING utf8mb4), CONVERT(X'3c7374796c653e' USING utf8mb4), CONVERT(X'e585a7e5b58ce6a8a3e5bc8f' USING utf8mb4), CONVERT(X'e59ca8e69687e4bbb6e4b8ade694bee7bdae2043535320e6a8a3e5bc8fe8a68fe58987e38082' USING utf8mb4), CONVERT(X'e59ca8e69687e4bbb6e4b8ade694bee7bdae2043535320e6a8a3e5bc8fe8a68fe58987e38082e9809ae5b8b8e694bee59ca8206865616420e4b8ade380827374796c6520e585a7e79a84e585a7e5aeb9e698afe6a8a3e5bc8fe69687e5ad97efbc8ce4b88de698af2048544d4c20e5ad90e58583e7b4a0efbc9be69cace6aca1e58583e7b4a0e58886e69e90e4b88de8a7a3e69e90e585b6e4b8ade79a8420435353e38082' USING utf8mb4), CONVERT(X'3c686561643e0a20203c7469746c653ee7af84e4be8b3c2f7469746c653e0a20203c7374796c653e0a2020202070207b20636f6c6f723a207465616c3b207d0a20203c2f7374796c653e0a3c2f686561643e' USING utf8mb4), CONVERT(X'e4bba5e585a7e5b58c2043535320e8a8ade5ae9ae6aeb5e890bde69687e5ad97e9a18fe889b2e38082' USING utf8mb4), CONVERT(X'7374796c65' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656d616e746963732e68746d6c237468652d7374796c652d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c7374796c653e' USING utf8mb4),
display_label = CONVERT(X'e585a7e5b58ce6a8a3e5bc8f' USING utf8mb4),
summary = CONVERT(X'e59ca8e69687e4bbb6e4b8ade694bee7bdae2043535320e6a8a3e5bc8fe8a68fe58987e38082' USING utf8mb4),
description = CONVERT(X'e59ca8e69687e4bbb6e4b8ade694bee7bdae2043535320e6a8a3e5bc8fe8a68fe58987e38082e9809ae5b8b8e694bee59ca8206865616420e4b8ade380827374796c6520e585a7e79a84e585a7e5aeb9e698afe6a8a3e5bc8fe69687e5ad97efbc8ce4b88de698af2048544d4c20e5ad90e58583e7b4a0efbc9be69cace6aca1e58583e7b4a0e58886e69e90e4b88de8a7a3e69e90e585b6e4b8ade79a8420435353e38082' USING utf8mb4),
example_code = CONVERT(X'3c686561643e0a20203c7469746c653ee7af84e4be8b3c2f7469746c653e0a20203c7374796c653e0a2020202070207b20636f6c6f723a207465616c3b207d0a20203c2f7374796c653e0a3c2f686561643e' USING utf8mb4),
example_description = CONVERT(X'e4bba5e585a7e5b58c2043535320e8a8ade5ae9ae6aeb5e890bde69687e5ad97e9a18fe889b2e38082' USING utf8mb4),
sort_key = CONVERT(X'7374796c65' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656d616e746963732e68746d6c237468652d7374796c652d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d7374796c65' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'7374796c65' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'73656374696f6e73' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d626f6479' USING utf8mb4), CONVERT(X'3c626f64793e' USING utf8mb4), CONVERT(X'e69687e4bbb6e585a7e5aeb9e58d80' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae69687e4bbb6e79a84e4b8bbe8a681e585a7e5aeb9e38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae69687e4bbb6e79a84e4b8bbe8a681e585a7e5aeb9e38082e4b880e888ac2048544d4c20e69687e4bbb6e58faae69c89e4b880e5808b20626f6479efbc8ce58c85e590abe6aeb5e890bde38081e5b08ee8a6bde38081e8a1a8e596aee7ad89e9a081e99da2e585a7e5aeb9efbc9be5ae83e88887e68f8fe8bfb0e69687e4bbb6e8b387e8a88ae79a84206865616420e4b88de5908ce38082' USING utf8mb4), CONVERT(X'3c626f64793e0a20203c68313ee8aa9ee6b395e8beade585b83c2f68313e0a20203c703ee68ea2e7b4a22048544d4c20e58583e7b4a0e380823c2f703e0a3c2f626f64793e' USING utf8mb4), CONVERT(X'e694bee7bdaee9a081e99da2e6a899e9a18ce88887e4bb8be7b4b9e69687e5ad97e38082' USING utf8mb4), CONVERT(X'626f6479' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656374696f6e732e68746d6c237468652d626f64792d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c626f64793e' USING utf8mb4),
display_label = CONVERT(X'e69687e4bbb6e585a7e5aeb9e58d80' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae69687e4bbb6e79a84e4b8bbe8a681e585a7e5aeb9e38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae69687e4bbb6e79a84e4b8bbe8a681e585a7e5aeb9e38082e4b880e888ac2048544d4c20e69687e4bbb6e58faae69c89e4b880e5808b20626f6479efbc8ce58c85e590abe6aeb5e890bde38081e5b08ee8a6bde38081e8a1a8e596aee7ad89e9a081e99da2e585a7e5aeb9efbc9be5ae83e88887e68f8fe8bfb0e69687e4bbb6e8b387e8a88ae79a84206865616420e4b88de5908ce38082' USING utf8mb4),
example_code = CONVERT(X'3c626f64793e0a20203c68313ee8aa9ee6b395e8beade585b83c2f68313e0a20203c703ee68ea2e7b4a22048544d4c20e58583e7b4a0e380823c2f703e0a3c2f626f64793e' USING utf8mb4),
example_description = CONVERT(X'e694bee7bdaee9a081e99da2e6a899e9a18ce88887e4bb8be7b4b9e69687e5ad97e38082' USING utf8mb4),
sort_key = CONVERT(X'626f6479' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656374696f6e732e68746d6c237468652d626f64792d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d626f6479' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'626f6479' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'73656374696f6e73' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d61727469636c65' USING utf8mb4), CONVERT(X'3c61727469636c653e' USING utf8mb4), CONVERT(X'e78da8e7ab8be69687e7aba0' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae58fafe78da8e7ab8be79086e8a7a3e68896e9878de8a487e4bdbfe794a8e79a84e585a7e5aeb9e38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae58fafe78da8e7ab8be79086e8a7a3e68896e9878de8a487e4bdbfe794a8e79a84e585a7e5aeb9e38082e981a9e59088e69687e7aba0e38081e8ab96e5a387e8b2bce69687e68896e78da8e7ab8be8a995e8ab96efbc8ce9809ae5b8b8e69c89e887aae5b7b1e79a84e6a899e9a18cefbc9be4b88de698afe68980e69c89e5a496e6a186e68896e58da1e78987e983bde5bf85e9a088e4bdbfe794a82061727469636c65e38082' USING utf8mb4), CONVERT(X'3c61727469636c653e0a20203c68323e48544d4c20e585a5e996803c2f68323e0a20203c703ee5be9ee58583e7b4a0e88887e5b1ace680a7e9968be5a78be5adb8e7bf92e380823c2f703e0a3c2f61727469636c653e' USING utf8mb4), CONVERT(X'e6a899e7a4bae4b880e7af87e58fafe78da8e7ab8be996b1e8ae80e79a84e585a5e99680e69687e7aba0e38082' USING utf8mb4), CONVERT(X'61727469636c65' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656374696f6e732e68746d6c237468652d61727469636c652d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c61727469636c653e' USING utf8mb4),
display_label = CONVERT(X'e78da8e7ab8be69687e7aba0' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae58fafe78da8e7ab8be79086e8a7a3e68896e9878de8a487e4bdbfe794a8e79a84e585a7e5aeb9e38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae58fafe78da8e7ab8be79086e8a7a3e68896e9878de8a487e4bdbfe794a8e79a84e585a7e5aeb9e38082e981a9e59088e69687e7aba0e38081e8ab96e5a387e8b2bce69687e68896e78da8e7ab8be8a995e8ab96efbc8ce9809ae5b8b8e69c89e887aae5b7b1e79a84e6a899e9a18cefbc9be4b88de698afe68980e69c89e5a496e6a186e68896e58da1e78987e983bde5bf85e9a088e4bdbfe794a82061727469636c65e38082' USING utf8mb4),
example_code = CONVERT(X'3c61727469636c653e0a20203c68323e48544d4c20e585a5e996803c2f68323e0a20203c703ee5be9ee58583e7b4a0e88887e5b1ace680a7e9968be5a78be5adb8e7bf92e380823c2f703e0a3c2f61727469636c653e' USING utf8mb4),
example_description = CONVERT(X'e6a899e7a4bae4b880e7af87e58fafe78da8e7ab8be996b1e8ae80e79a84e585a5e99680e69687e7aba0e38082' USING utf8mb4),
sort_key = CONVERT(X'61727469636c65' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656374696f6e732e68746d6c237468652d61727469636c652d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d61727469636c65' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'61727469636c65' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'73656374696f6e73' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d73656374696f6e' USING utf8mb4), CONVERT(X'3c73656374696f6e3e' USING utf8mb4), CONVERT(X'e4b8bbe9a18ce58d80e6aeb5' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae69687e4bbb6e4b8ade585b7e69c89e585b1e5908ce4b8bbe9a18ce79a84e58d80e6aeb5e38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae69687e4bbb6e4b8ade585b7e69c89e585b1e5908ce4b8bbe9a18ce79a84e58d80e6aeb5e38082e9809ae5b8b8e585b7e69c89e6a899e9a18cefbc9be88ba5e58faae698afe782bae4ba86e6a8a3e5bc8fe68896e68e92e78988e58886e7b584e8808ce6b292e69c89e58d80e6aeb5e8aa9ee6848fefbc8ce68789e4bdbfe794a820646976e38082' USING utf8mb4), CONVERT(X'3c73656374696f6e3e0a20203c68323ee5adb8e7bf92e79baee6a8993c2f68323e0a20203c703ee4ba86e8a7a3e6aeb5e890bde88887e980a3e7b590e380823c2f703e0a3c2f73656374696f6e3e' USING utf8mb4), CONVERT(X'e4bba5e6a899e9a18ce88887e585a7e5aeb9e7b584e68890e5adb8e7bf92e79baee6a899e58d80e6aeb5e38082' USING utf8mb4), CONVERT(X'73656374696f6e' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656374696f6e732e68746d6c237468652d73656374696f6e2d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c73656374696f6e3e' USING utf8mb4),
display_label = CONVERT(X'e4b8bbe9a18ce58d80e6aeb5' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae69687e4bbb6e4b8ade585b7e69c89e585b1e5908ce4b8bbe9a18ce79a84e58d80e6aeb5e38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae69687e4bbb6e4b8ade585b7e69c89e585b1e5908ce4b8bbe9a18ce79a84e58d80e6aeb5e38082e9809ae5b8b8e585b7e69c89e6a899e9a18cefbc9be88ba5e58faae698afe782bae4ba86e6a8a3e5bc8fe68896e68e92e78988e58886e7b584e8808ce6b292e69c89e58d80e6aeb5e8aa9ee6848fefbc8ce68789e4bdbfe794a820646976e38082' USING utf8mb4),
example_code = CONVERT(X'3c73656374696f6e3e0a20203c68323ee5adb8e7bf92e79baee6a8993c2f68323e0a20203c703ee4ba86e8a7a3e6aeb5e890bde88887e980a3e7b590e380823c2f703e0a3c2f73656374696f6e3e' USING utf8mb4),
example_description = CONVERT(X'e4bba5e6a899e9a18ce88887e585a7e5aeb9e7b584e68890e5adb8e7bf92e79baee6a899e58d80e6aeb5e38082' USING utf8mb4),
sort_key = CONVERT(X'73656374696f6e' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656374696f6e732e68746d6c237468652d73656374696f6e2d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d73656374696f6e' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'73656374696f6e' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'73656374696f6e73' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d6e6176' USING utf8mb4), CONVERT(X'3c6e61763e' USING utf8mb4), CONVERT(X'e5b08ee8a6bde58d80e59f9f' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae4b8bbe8a681e79a84e9a081e99da2e68896e7ab99e585a7e5b08ee8a6bde980a3e7b590e58d80e59f9fe38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae4b8bbe8a681e79a84e9a081e99da2e68896e7ab99e585a7e5b08ee8a6bde980a3e7b590e58d80e59f9fe38082e58fafe794a8e696bce4b8bbe981b8e596aee68896e7aba0e7af80e79baee98c84efbc9be4b88de99c80e8a681e68a8ae69687e4bbb6e585a7e6af8fe4b880e7b584e980a3e7b590e983bde6a899e782ba206e6176e38082' USING utf8mb4), CONVERT(X'3c6e617620617269612d6c6162656c3d22e4b8bbe981b8e596ae223e0a20203c6120687265663d222f223ee9a696e9a0813c2f613e0a20203c6120687265663d222f64696374696f6e617279223ee8aa9ee6b395e8beade585b83c2f613e0a3c2f6e61763e' USING utf8mb4), CONVERT(X'e782bae4b8bbe981b8e596aee980a3e7b590e68f90e4be9be5b08ee8a6bde8aa9ee6848fe38082' USING utf8mb4), CONVERT(X'6e6176' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656374696f6e732e68746d6c237468652d6e61762d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c6e61763e' USING utf8mb4),
display_label = CONVERT(X'e5b08ee8a6bde58d80e59f9f' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae4b8bbe8a681e79a84e9a081e99da2e68896e7ab99e585a7e5b08ee8a6bde980a3e7b590e58d80e59f9fe38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae4b8bbe8a681e79a84e9a081e99da2e68896e7ab99e585a7e5b08ee8a6bde980a3e7b590e58d80e59f9fe38082e58fafe794a8e696bce4b8bbe981b8e596aee68896e7aba0e7af80e79baee98c84efbc9be4b88de99c80e8a681e68a8ae69687e4bbb6e585a7e6af8fe4b880e7b584e980a3e7b590e983bde6a899e782ba206e6176e38082' USING utf8mb4),
example_code = CONVERT(X'3c6e617620617269612d6c6162656c3d22e4b8bbe981b8e596ae223e0a20203c6120687265663d222f223ee9a696e9a0813c2f613e0a20203c6120687265663d222f64696374696f6e617279223ee8aa9ee6b395e8beade585b83c2f613e0a3c2f6e61763e' USING utf8mb4),
example_description = CONVERT(X'e782bae4b8bbe981b8e596aee980a3e7b590e68f90e4be9be5b08ee8a6bde8aa9ee6848fe38082' USING utf8mb4),
sort_key = CONVERT(X'6e6176' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656374696f6e732e68746d6c237468652d6e61762d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d6e6176' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'6e6176' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'73656374696f6e73' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d6173696465' USING utf8mb4), CONVERT(X'3c61736964653e' USING utf8mb4), CONVERT(X'e8a39ce58585e585a7e5aeb9' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae88887e591a8e59c8de585a7e5aeb9e99693e68ea5e79bb8e9979ce38081e58fafe78da8e7ab8be79c8be5be85e79a84e8a39ce58585e585a7e5aeb9e38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae88887e591a8e59c8de585a7e5aeb9e99693e68ea5e79bb8e9979ce38081e58fafe78da8e7ab8be79c8be5be85e79a84e8a39ce58585e585a7e5aeb9e38082e58fafe794a8e696bce69781e8a8bbe38081e79bb8e9979ce8b387e8a88ae68896e581b4e6ac84efbc9be8aa9ee6848fe794b1e585a7e5aeb9e9979ce4bf82e6b1bae5ae9aefbc8ce4b88de794b1e5ae83e698afe590a6e4bd8de696bce795abe99da2e581b4e9828ae6b1bae5ae9ae38082' USING utf8mb4), CONVERT(X'3c61736964653e0a20203c68323ee5bbb6e4bcb8e996b1e8ae803c2f68323e0a20203c6120687265663d222f6775696465223e48544d4c20e5adb8e7bf92e68c87e58d973c2f613e0a3c2f61736964653e' USING utf8mb4), CONVERT(X'e68f90e4be9be4b8bbe585a7e5aeb9e4bba5e5a496e79a84e5bbb6e4bcb8e996b1e8ae80e38082' USING utf8mb4), CONVERT(X'6173696465' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656374696f6e732e68746d6c237468652d61736964652d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c61736964653e' USING utf8mb4),
display_label = CONVERT(X'e8a39ce58585e585a7e5aeb9' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae88887e591a8e59c8de585a7e5aeb9e99693e68ea5e79bb8e9979ce38081e58fafe78da8e7ab8be79c8be5be85e79a84e8a39ce58585e585a7e5aeb9e38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae88887e591a8e59c8de585a7e5aeb9e99693e68ea5e79bb8e9979ce38081e58fafe78da8e7ab8be79c8be5be85e79a84e8a39ce58585e585a7e5aeb9e38082e58fafe794a8e696bce69781e8a8bbe38081e79bb8e9979ce8b387e8a88ae68896e581b4e6ac84efbc9be8aa9ee6848fe794b1e585a7e5aeb9e9979ce4bf82e6b1bae5ae9aefbc8ce4b88de794b1e5ae83e698afe590a6e4bd8de696bce795abe99da2e581b4e9828ae6b1bae5ae9ae38082' USING utf8mb4),
example_code = CONVERT(X'3c61736964653e0a20203c68323ee5bbb6e4bcb8e996b1e8ae803c2f68323e0a20203c6120687265663d222f6775696465223e48544d4c20e5adb8e7bf92e68c87e58d973c2f613e0a3c2f61736964653e' USING utf8mb4),
example_description = CONVERT(X'e68f90e4be9be4b8bbe585a7e5aeb9e4bba5e5a496e79a84e5bbb6e4bcb8e996b1e8ae80e38082' USING utf8mb4),
sort_key = CONVERT(X'6173696465' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656374696f6e732e68746d6c237468652d61736964652d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d6173696465' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'6173696465' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'73656374696f6e73' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d6831' USING utf8mb4), CONVERT(X'3c68313e' USING utf8mb4), CONVERT(X'e7acace4b880e7b49ae6a899e9a18c' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae7acace4b880e7b49ae79a84e58d80e6aeb5e6a899e9a18ce38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae7acace4b880e7b49ae79a84e58d80e6aeb5e6a899e9a18ce38082e981a9e59088e69687e4bbb6e79a84e4b8bbe8a681e6a899e9a18cefbc9be6a899e9a18ce5b1a4e7b49ae68789e4be9de585a7e5aeb9e7b590e6a78be981b8e69387efbc8ce5ad97e9ab94e5a4a7e5b08fe58987e4baa4e7b5a620435353e38082' USING utf8mb4), CONVERT(X'3c68313ee68891e79a84e8aa9ee6b395e5adb8e7bf92e7ad86e8a8983c2f68313e' USING utf8mb4), CONVERT(X'e6a899e7a4bae69687e4bbb6e79a84e4b8bbe8a681e6a899e9a18ce38082' USING utf8mb4), CONVERT(X'6831' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656374696f6e732e68746d6c237468652d68312c2d68322c2d68332c2d68342c2d68352c2d616e642d68362d656c656d656e7473' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c68313e' USING utf8mb4),
display_label = CONVERT(X'e7acace4b880e7b49ae6a899e9a18c' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae7acace4b880e7b49ae79a84e58d80e6aeb5e6a899e9a18ce38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae7acace4b880e7b49ae79a84e58d80e6aeb5e6a899e9a18ce38082e981a9e59088e69687e4bbb6e79a84e4b8bbe8a681e6a899e9a18cefbc9be6a899e9a18ce5b1a4e7b49ae68789e4be9de585a7e5aeb9e7b590e6a78be981b8e69387efbc8ce5ad97e9ab94e5a4a7e5b08fe58987e4baa4e7b5a620435353e38082' USING utf8mb4),
example_code = CONVERT(X'3c68313ee68891e79a84e8aa9ee6b395e5adb8e7bf92e7ad86e8a8983c2f68313e' USING utf8mb4),
example_description = CONVERT(X'e6a899e7a4bae69687e4bbb6e79a84e4b8bbe8a681e6a899e9a18ce38082' USING utf8mb4),
sort_key = CONVERT(X'6831' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656374696f6e732e68746d6c237468652d68312c2d68322c2d68332c2d68342c2d68352c2d616e642d68362d656c656d656e7473' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d6831' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'6831' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'73656374696f6e73' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d6832' USING utf8mb4), CONVERT(X'3c68323e' USING utf8mb4), CONVERT(X'e7acace4ba8ce7b49ae6a899e9a18c' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae7acace4ba8ce7b49ae79a84e58d80e6aeb5e6a899e9a18ce38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae7acace4ba8ce7b49ae79a84e58d80e6aeb5e6a899e9a18ce38082e9809ae5b8b8e794a8e696bce4b8bbe8a681e6a899e9a18ce4b98be4b88be79a84e7aba0e7af80efbc9be4bdbfe794a8e5b1a4e7b49ae5bbbae7ab8be6b885e6a59ae79a84e585a7e5aeb9e7b590e6a78be38082' USING utf8mb4), CONVERT(X'3c68313e48544d4c20e7ad86e8a8983c2f68313e0a3c68323ee69687e5ad97e88887e980a3e7b5903c2f68323e' USING utf8mb4), CONVERT(X'e5bbbae7ab8be4b8bbe9a18ce4b98be4b88be79a84e7acace4ba8ce7b49ae7aba0e7af80e38082' USING utf8mb4), CONVERT(X'6832' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656374696f6e732e68746d6c237468652d68312c2d68322c2d68332c2d68342c2d68352c2d616e642d68362d656c656d656e7473' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c68323e' USING utf8mb4),
display_label = CONVERT(X'e7acace4ba8ce7b49ae6a899e9a18c' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae7acace4ba8ce7b49ae79a84e58d80e6aeb5e6a899e9a18ce38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae7acace4ba8ce7b49ae79a84e58d80e6aeb5e6a899e9a18ce38082e9809ae5b8b8e794a8e696bce4b8bbe8a681e6a899e9a18ce4b98be4b88be79a84e7aba0e7af80efbc9be4bdbfe794a8e5b1a4e7b49ae5bbbae7ab8be6b885e6a59ae79a84e585a7e5aeb9e7b590e6a78be38082' USING utf8mb4),
example_code = CONVERT(X'3c68313e48544d4c20e7ad86e8a8983c2f68313e0a3c68323ee69687e5ad97e88887e980a3e7b5903c2f68323e' USING utf8mb4),
example_description = CONVERT(X'e5bbbae7ab8be4b8bbe9a18ce4b98be4b88be79a84e7acace4ba8ce7b49ae7aba0e7af80e38082' USING utf8mb4),
sort_key = CONVERT(X'6832' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656374696f6e732e68746d6c237468652d68312c2d68322c2d68332c2d68342c2d68352c2d616e642d68362d656c656d656e7473' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d6832' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'6832' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'73656374696f6e73' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d6833' USING utf8mb4), CONVERT(X'3c68333e' USING utf8mb4), CONVERT(X'e7acace4b889e7b49ae6a899e9a18c' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae7acace4b889e7b49ae79a84e58d80e6aeb5e6a899e9a18ce38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae7acace4b889e7b49ae79a84e58d80e6aeb5e6a899e9a18ce38082e9809ae5b8b8e7b4b0e58886e7acace4ba8ce7b49ae7aba0e7af80efbc9be4b88de68789e58faae59ba0e782bae9a090e8a8ade5ad97e9ab94e5a4a7e5b08fe8808ce981b8e794a8e38082' USING utf8mb4), CONVERT(X'3c68323ee8a1a8e596ae3c2f68323e0a3c68333ee69687e5ad97e8bcb8e585a5e6ac84e4bd8d3c2f68333e' USING utf8mb4), CONVERT(X'e7b4b0e58886e8a1a8e596aee7aba0e7af80e79a84e585a7e5aeb9e38082' USING utf8mb4), CONVERT(X'6833' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656374696f6e732e68746d6c237468652d68312c2d68322c2d68332c2d68342c2d68352c2d616e642d68362d656c656d656e7473' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c68333e' USING utf8mb4),
display_label = CONVERT(X'e7acace4b889e7b49ae6a899e9a18c' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae7acace4b889e7b49ae79a84e58d80e6aeb5e6a899e9a18ce38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae7acace4b889e7b49ae79a84e58d80e6aeb5e6a899e9a18ce38082e9809ae5b8b8e7b4b0e58886e7acace4ba8ce7b49ae7aba0e7af80efbc9be4b88de68789e58faae59ba0e782bae9a090e8a8ade5ad97e9ab94e5a4a7e5b08fe8808ce981b8e794a8e38082' USING utf8mb4),
example_code = CONVERT(X'3c68323ee8a1a8e596ae3c2f68323e0a3c68333ee69687e5ad97e8bcb8e585a5e6ac84e4bd8d3c2f68333e' USING utf8mb4),
example_description = CONVERT(X'e7b4b0e58886e8a1a8e596aee7aba0e7af80e79a84e585a7e5aeb9e38082' USING utf8mb4),
sort_key = CONVERT(X'6833' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656374696f6e732e68746d6c237468652d68312c2d68322c2d68332c2d68342c2d68352c2d616e642d68362d656c656d656e7473' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d6833' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'6833' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'73656374696f6e73' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d6834' USING utf8mb4), CONVERT(X'3c68343e' USING utf8mb4), CONVERT(X'e7acace59b9be7b49ae6a899e9a18c' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae7acace59b9be7b49ae79a84e58d80e6aeb5e6a899e9a18ce38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae7acace59b9be7b49ae79a84e58d80e6aeb5e6a899e9a18ce38082e9809ae5b8b8e7b4b0e58886e7acace4b889e7b49ae7aba0e7af80efbc8ce68789e8ae93e8ae80e88085e883bde794b1e5898de5be8ce6a899e9a18ce79086e8a7a3e5b1a4e7b49ae9979ce4bf82e38082' USING utf8mb4), CONVERT(X'3c68333ee8bcb8e585a5e9a997e8ad893c2f68333e0a3c68343ee5bf85e5a1abe6ac84e4bd8d3c2f68343e' USING utf8mb4), CONVERT(X'e59ca8e8bcb8e585a5e9a997e8ad89e4b98be4b88be5bbbae7ab8be5bf85e5a1abe6ac84e4bd8de5ad90e9a18ce38082' USING utf8mb4), CONVERT(X'6834' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656374696f6e732e68746d6c237468652d68312c2d68322c2d68332c2d68342c2d68352c2d616e642d68362d656c656d656e7473' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c68343e' USING utf8mb4),
display_label = CONVERT(X'e7acace59b9be7b49ae6a899e9a18c' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae7acace59b9be7b49ae79a84e58d80e6aeb5e6a899e9a18ce38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae7acace59b9be7b49ae79a84e58d80e6aeb5e6a899e9a18ce38082e9809ae5b8b8e7b4b0e58886e7acace4b889e7b49ae7aba0e7af80efbc8ce68789e8ae93e8ae80e88085e883bde794b1e5898de5be8ce6a899e9a18ce79086e8a7a3e5b1a4e7b49ae9979ce4bf82e38082' USING utf8mb4),
example_code = CONVERT(X'3c68333ee8bcb8e585a5e9a997e8ad893c2f68333e0a3c68343ee5bf85e5a1abe6ac84e4bd8d3c2f68343e' USING utf8mb4),
example_description = CONVERT(X'e59ca8e8bcb8e585a5e9a997e8ad89e4b98be4b88be5bbbae7ab8be5bf85e5a1abe6ac84e4bd8de5ad90e9a18ce38082' USING utf8mb4),
sort_key = CONVERT(X'6834' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656374696f6e732e68746d6c237468652d68312c2d68322c2d68332c2d68342c2d68352c2d616e642d68362d656c656d656e7473' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d6834' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'6834' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'73656374696f6e73' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d6835' USING utf8mb4), CONVERT(X'3c68353e' USING utf8mb4), CONVERT(X'e7acace4ba94e7b49ae6a899e9a18c' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae7acace4ba94e7b49ae79a84e58d80e6aeb5e6a899e9a18ce38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae7acace4ba94e7b49ae79a84e58d80e6aeb5e6a899e9a18ce38082e794a8e696bce69bb4e6b7b1e4b880e5b1a4e79a84e585a7e5aeb9e7b590e6a78befbc9be68789e69c89e5afa6e99a9be7aba0e7af80e99c80e8a681efbc8ce8808ce99d9ee596aee7b494e4bd9ce782bae5b08fe5ad97e6a8a3e5bc8fe38082' USING utf8mb4), CONVERT(X'3c68343ee69687e5ad97e6ac84e4bd8de8a68fe589873c2f68343e0a3c68353ee995b7e5baa6e99990e588b63c2f68353e' USING utf8mb4), CONVERT(X'e980b2e4b880e6ada5e7b4b0e58886e69687e5ad97e6ac84e4bd8de8a68fe58987e38082' USING utf8mb4), CONVERT(X'6835' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656374696f6e732e68746d6c237468652d68312c2d68322c2d68332c2d68342c2d68352c2d616e642d68362d656c656d656e7473' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c68353e' USING utf8mb4),
display_label = CONVERT(X'e7acace4ba94e7b49ae6a899e9a18c' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae7acace4ba94e7b49ae79a84e58d80e6aeb5e6a899e9a18ce38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae7acace4ba94e7b49ae79a84e58d80e6aeb5e6a899e9a18ce38082e794a8e696bce69bb4e6b7b1e4b880e5b1a4e79a84e585a7e5aeb9e7b590e6a78befbc9be68789e69c89e5afa6e99a9be7aba0e7af80e99c80e8a681efbc8ce8808ce99d9ee596aee7b494e4bd9ce782bae5b08fe5ad97e6a8a3e5bc8fe38082' USING utf8mb4),
example_code = CONVERT(X'3c68343ee69687e5ad97e6ac84e4bd8de8a68fe589873c2f68343e0a3c68353ee995b7e5baa6e99990e588b63c2f68353e' USING utf8mb4),
example_description = CONVERT(X'e980b2e4b880e6ada5e7b4b0e58886e69687e5ad97e6ac84e4bd8de8a68fe58987e38082' USING utf8mb4),
sort_key = CONVERT(X'6835' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656374696f6e732e68746d6c237468652d68312c2d68322c2d68332c2d68342c2d68352c2d616e642d68362d656c656d656e7473' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d6835' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'6835' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'73656374696f6e73' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d6836' USING utf8mb4), CONVERT(X'3c68363e' USING utf8mb4), CONVERT(X'e7acace585ade7b49ae6a899e9a18c' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae7acace585ade7b49ae79a84e58d80e6aeb5e6a899e9a18ce38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae7acace585ade7b49ae79a84e58d80e6aeb5e6a899e9a18ce38082e698af2048544d4c20e5ae9ae7bea9e4b8ade5b1a4e7b49ae69c80e6b7b1e79a84e6a899e9a18ce58583e7b4a0efbc8ce4bb8de784b6e585b7e69c89e6a899e9a18ce8aa9ee6848fe38082' USING utf8mb4), CONVERT(X'3c68353ee995b7e5baa6e99990e588b63c2f68353e0a3c68363ee9828ae7958ce6a188e4be8b3c2f68363e' USING utf8mb4), CONVERT(X'e6a899e7a4bae6b7b1e5b1a4e7aba0e7af80e4b8ade79a84e9828ae7958ce6a188e4be8be38082' USING utf8mb4), CONVERT(X'6836' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656374696f6e732e68746d6c237468652d68312c2d68322c2d68332c2d68342c2d68352c2d616e642d68362d656c656d656e7473' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c68363e' USING utf8mb4),
display_label = CONVERT(X'e7acace585ade7b49ae6a899e9a18c' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae7acace585ade7b49ae79a84e58d80e6aeb5e6a899e9a18ce38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae7acace585ade7b49ae79a84e58d80e6aeb5e6a899e9a18ce38082e698af2048544d4c20e5ae9ae7bea9e4b8ade5b1a4e7b49ae69c80e6b7b1e79a84e6a899e9a18ce58583e7b4a0efbc8ce4bb8de784b6e585b7e69c89e6a899e9a18ce8aa9ee6848fe38082' USING utf8mb4),
example_code = CONVERT(X'3c68353ee995b7e5baa6e99990e588b63c2f68353e0a3c68363ee9828ae7958ce6a188e4be8b3c2f68363e' USING utf8mb4),
example_description = CONVERT(X'e6a899e7a4bae6b7b1e5b1a4e7aba0e7af80e4b8ade79a84e9828ae7958ce6a188e4be8be38082' USING utf8mb4),
sort_key = CONVERT(X'6836' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656374696f6e732e68746d6c237468652d68312c2d68322c2d68332c2d68342c2d68352c2d616e642d68362d656c656d656e7473' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d6836' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'6836' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'73656374696f6e73' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d6867726f7570' USING utf8mb4), CONVERT(X'3c6867726f75703e' USING utf8mb4), CONVERT(X'e6a899e9a18ce7bea4e7b584' USING utf8mb4), CONVERT(X'e5b087e4b880e5808be6a899e9a18ce88887e79bb8e9979ce589afe6a899e9a18ce68896e6a899e8aa9ee7b584e68890e7bea4e7b584e38082' USING utf8mb4), CONVERT(X'e5b087e4b880e5808be6a899e9a18ce88887e79bb8e9979ce589afe6a899e9a18ce68896e6a899e8aa9ee7b584e68890e7bea4e7b584e38082e58fafe58c85e590abe4b880e5808b20683120e887b3206836efbc8ce4bba5e58f8ae4bd9ce782bae589afe6a899e38081e69bbfe4bba3e6a899e9a18ce68896e6a899e8aa9ee79a842070efbc9be4b88de698afe794a8e4be86e58c85e4bd8fe4bbbbe6848fe5a49ae5808be6a899e9a18ce5b1a4e7b49ae38082' USING utf8mb4), CONVERT(X'3c6867726f75703e0a20203c68313e53796e7461782041746c61733c2f68313e0a20203c703ee68891e79a84e8aa9ee6b395e8b6b3e8b7a13c2f703e0a3c2f6867726f75703e' USING utf8mb4), CONVERT(X'e5b087e7b6b2e7ab99e5908de7a8b1e88887e589afe6a899e9a18ce694bee59ca8e5908ce4b880e7bea4e7b584e38082' USING utf8mb4), CONVERT(X'6867726f7570' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656374696f6e732e68746d6c237468652d6867726f75702d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c6867726f75703e' USING utf8mb4),
display_label = CONVERT(X'e6a899e9a18ce7bea4e7b584' USING utf8mb4),
summary = CONVERT(X'e5b087e4b880e5808be6a899e9a18ce88887e79bb8e9979ce589afe6a899e9a18ce68896e6a899e8aa9ee7b584e68890e7bea4e7b584e38082' USING utf8mb4),
description = CONVERT(X'e5b087e4b880e5808be6a899e9a18ce88887e79bb8e9979ce589afe6a899e9a18ce68896e6a899e8aa9ee7b584e68890e7bea4e7b584e38082e58fafe58c85e590abe4b880e5808b20683120e887b3206836efbc8ce4bba5e58f8ae4bd9ce782bae589afe6a899e38081e69bbfe4bba3e6a899e9a18ce68896e6a899e8aa9ee79a842070efbc9be4b88de698afe794a8e4be86e58c85e4bd8fe4bbbbe6848fe5a49ae5808be6a899e9a18ce5b1a4e7b49ae38082' USING utf8mb4),
example_code = CONVERT(X'3c6867726f75703e0a20203c68313e53796e7461782041746c61733c2f68313e0a20203c703ee68891e79a84e8aa9ee6b395e8b6b3e8b7a13c2f703e0a3c2f6867726f75703e' USING utf8mb4),
example_description = CONVERT(X'e5b087e7b6b2e7ab99e5908de7a8b1e88887e589afe6a899e9a18ce694bee59ca8e5908ce4b880e7bea4e7b584e38082' USING utf8mb4),
sort_key = CONVERT(X'6867726f7570' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656374696f6e732e68746d6c237468652d6867726f75702d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d6867726f7570' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'6867726f7570' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'73656374696f6e73' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d686561646572' USING utf8mb4), CONVERT(X'3c6865616465723e' USING utf8mb4), CONVERT(X'e4bb8be7b4b9e6a899e9a0ad' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae9a081e99da2e68896e58d80e6aeb5e79a84e4bb8be7b4b9e585a7e5aeb9e88887e5b08ee8a6bde8bc94e58aa9e38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae9a081e99da2e68896e58d80e6aeb5e79a84e4bb8be7b4b9e585a7e5aeb9e88887e5b08ee8a6bde8bc94e58aa9e38082e58fafe58c85e590abe6a899e9a18ce38081e6a899e8aa8ce68896e6909ce5b08be4bb8be99da2efbc9be4b88de7ad89e696bc2068656164efbc8ce4b99fe4b88de69c83e59ba0e782bae4bdbfe794a82068656164657220e5b0b1e887aae58b95e59bbae5ae9ae59ca8e795abe99da2e9a082e7abafe38082' USING utf8mb4), CONVERT(X'3c6865616465723e0a20203c68313e53796e7461782041746c61733c2f68313e0a20203c703ee68ea2e7b4a2e4bda0e79a84e7a88be5bc8fe8aa9ee6b395e380823c2f703e0a3c2f6865616465723e' USING utf8mb4), CONVERT(X'e5bbbae7ab8be9a081e99da2e79a84e4bb8be7b4b9e6a899e9a0ade38082' USING utf8mb4), CONVERT(X'686561646572' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656374696f6e732e68746d6c237468652d6865616465722d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c6865616465723e' USING utf8mb4),
display_label = CONVERT(X'e4bb8be7b4b9e6a899e9a0ad' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae9a081e99da2e68896e58d80e6aeb5e79a84e4bb8be7b4b9e585a7e5aeb9e88887e5b08ee8a6bde8bc94e58aa9e38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae9a081e99da2e68896e58d80e6aeb5e79a84e4bb8be7b4b9e585a7e5aeb9e88887e5b08ee8a6bde8bc94e58aa9e38082e58fafe58c85e590abe6a899e9a18ce38081e6a899e8aa8ce68896e6909ce5b08be4bb8be99da2efbc9be4b88de7ad89e696bc2068656164efbc8ce4b99fe4b88de69c83e59ba0e782bae4bdbfe794a82068656164657220e5b0b1e887aae58b95e59bbae5ae9ae59ca8e795abe99da2e9a082e7abafe38082' USING utf8mb4),
example_code = CONVERT(X'3c6865616465723e0a20203c68313e53796e7461782041746c61733c2f68313e0a20203c703ee68ea2e7b4a2e4bda0e79a84e7a88be5bc8fe8aa9ee6b395e380823c2f703e0a3c2f6865616465723e' USING utf8mb4),
example_description = CONVERT(X'e5bbbae7ab8be9a081e99da2e79a84e4bb8be7b4b9e6a899e9a0ade38082' USING utf8mb4),
sort_key = CONVERT(X'686561646572' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656374696f6e732e68746d6c237468652d6865616465722d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d686561646572' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'686561646572' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'73656374696f6e73' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d666f6f746572' USING utf8mb4), CONVERT(X'3c666f6f7465723e' USING utf8mb4), CONVERT(X'e9a081e5b0bee8b387e8a88a' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae68980e5b1ace9a081e99da2e68896e58d80e6aeb5e79a84e4bd9ce88085e38081e78988e6ac8ae58f8ae79bb8e9979ce8b387e8a88ae38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae68980e5b1ace9a081e99da2e68896e58d80e6aeb5e79a84e4bd9ce88085e38081e78988e6ac8ae58f8ae79bb8e9979ce8b387e8a88ae38082e58fafe5b1ace696bce695b4e5808be9a081e99da2efbc8ce4b99fe58fafe5b1ace696bc2061727469636c6520e7ad89e58d80e6aeb5efbc9be4b88de69c83e887aae58b95e5ae9ae4bd8de59ca8e8a696e7aa97e5ba95e983a8e38082' USING utf8mb4), CONVERT(X'3c666f6f7465723e0a20203c703ee8a3bde4bd9ce88085efbc9a52696c65793c2f703e0a3c2f666f6f7465723e' USING utf8mb4), CONVERT(X'e6a899e7a4bae9a081e99da2e79a84e8a3bde4bd9ce88085e8b387e8a88ae38082' USING utf8mb4), CONVERT(X'666f6f746572' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656374696f6e732e68746d6c237468652d666f6f7465722d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c666f6f7465723e' USING utf8mb4),
display_label = CONVERT(X'e9a081e5b0bee8b387e8a88a' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae68980e5b1ace9a081e99da2e68896e58d80e6aeb5e79a84e4bd9ce88085e38081e78988e6ac8ae58f8ae79bb8e9979ce8b387e8a88ae38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae68980e5b1ace9a081e99da2e68896e58d80e6aeb5e79a84e4bd9ce88085e38081e78988e6ac8ae58f8ae79bb8e9979ce8b387e8a88ae38082e58fafe5b1ace696bce695b4e5808be9a081e99da2efbc8ce4b99fe58fafe5b1ace696bc2061727469636c6520e7ad89e58d80e6aeb5efbc9be4b88de69c83e887aae58b95e5ae9ae4bd8de59ca8e8a696e7aa97e5ba95e983a8e38082' USING utf8mb4),
example_code = CONVERT(X'3c666f6f7465723e0a20203c703ee8a3bde4bd9ce88085efbc9a52696c65793c2f703e0a3c2f666f6f7465723e' USING utf8mb4),
example_description = CONVERT(X'e6a899e7a4bae9a081e99da2e79a84e8a3bde4bd9ce88085e8b387e8a88ae38082' USING utf8mb4),
sort_key = CONVERT(X'666f6f746572' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656374696f6e732e68746d6c237468652d666f6f7465722d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d666f6f746572' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'666f6f746572' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'73656374696f6e73' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d61646472657373' USING utf8mb4), CONVERT(X'3c616464726573733e' USING utf8mb4), CONVERT(X'e881afe7b5a1e8b387e8a88a' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae69c80e8bf91e68980e5b1ace69687e7aba0e68896e69687e4bbb6e79a84e881afe7b5a1e8b387e8a88ae38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae69c80e8bf91e68980e5b1ace69687e7aba0e68896e69687e4bbb6e79a84e881afe7b5a1e8b387e8a88ae38082e981a9e59088e4bd9ce88085e5a793e5908de38081e99bbbe5ad90e983b5e4bbb6e68896e585b6e4bb96e881afe7b5a1e696b9e5bc8fefbc9be4b88de698afe4bbbbe4bd95e8a197e98193e59cb0e59d80e68896e4bbbbe6848fe881afe7b5a1e8b387e8a88ae983bde981a9e59088e4bdbfe794a8e38082' USING utf8mb4), CONVERT(X'3c616464726573733e0a2020e4bd9ce88085efbc9a52696c65790a20203c6120687265663d226d61696c746f3a72696c6579406578616d706c652e636f6d223ee881afe7b5a1e4bd9ce880853c2f613e0a3c2f616464726573733e' USING utf8mb4), CONVERT(X'e68f90e4be9be98099e4bbbde69687e4bbb6e4bd9ce88085e79a84e881afe7b5a1e696b9e5bc8fe38082' USING utf8mb4), CONVERT(X'61646472657373' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656374696f6e732e68746d6c237468652d616464726573732d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c616464726573733e' USING utf8mb4),
display_label = CONVERT(X'e881afe7b5a1e8b387e8a88a' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae69c80e8bf91e68980e5b1ace69687e7aba0e68896e69687e4bbb6e79a84e881afe7b5a1e8b387e8a88ae38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae69c80e8bf91e68980e5b1ace69687e7aba0e68896e69687e4bbb6e79a84e881afe7b5a1e8b387e8a88ae38082e981a9e59088e4bd9ce88085e5a793e5908de38081e99bbbe5ad90e983b5e4bbb6e68896e585b6e4bb96e881afe7b5a1e696b9e5bc8fefbc9be4b88de698afe4bbbbe4bd95e8a197e98193e59cb0e59d80e68896e4bbbbe6848fe881afe7b5a1e8b387e8a88ae983bde981a9e59088e4bdbfe794a8e38082' USING utf8mb4),
example_code = CONVERT(X'3c616464726573733e0a2020e4bd9ce88085efbc9a52696c65790a20203c6120687265663d226d61696c746f3a72696c6579406578616d706c652e636f6d223ee881afe7b5a1e4bd9ce880853c2f613e0a3c2f616464726573733e' USING utf8mb4),
example_description = CONVERT(X'e68f90e4be9be98099e4bbbde69687e4bbb6e4bd9ce88085e79a84e881afe7b5a1e696b9e5bc8fe38082' USING utf8mb4),
sort_key = CONVERT(X'61646472657373' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f73656374696f6e732e68746d6c237468652d616464726573732d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d61646472657373' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'61646472657373' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'67726f7570696e672d636f6e74656e74' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d70' USING utf8mb4), CONVERT(X'3c703e' USING utf8mb4), CONVERT(X'e6aeb5e890bd' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae4b880e5808be6aeb5e890bde38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae4b880e5808be6aeb5e890bde38082e9809ae5b8b8e58c85e590abe69687e5ad97e88887e69687e5ad97e5b1a4e7b49ae58583e7b4a0efbc9be4b88de8a681e782bae4ba86e5a29ee58aa0e8a696e8a6bae99693e8b79de8808ce5bbbae7ab8be7a9bae799bde6aeb5e890bdefbc8ce99693e8b79de68789e4baa4e7b5a620435353e38082' USING utf8mb4), CONVERT(X'3c703ee6ada1e8bf8ee4bdbfe794a82053796e7461782041746c6173e380823c2f703e0a3c703ee59ca8e98099e8a3a1e68ea2e7b4a2e7a88be5bc8fe8aa9ee6b395e380823c2f703e' USING utf8mb4), CONVERT(X'e4bdbfe794a8e585a9e5808be58583e7b4a0e8a1a8e7a4bae585a9e6aeb5e69687e5ad97e38082' USING utf8mb4), CONVERT(X'70' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f67726f7570696e672d636f6e74656e742e68746d6c237468652d702d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c703e' USING utf8mb4),
display_label = CONVERT(X'e6aeb5e890bd' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae4b880e5808be6aeb5e890bde38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae4b880e5808be6aeb5e890bde38082e9809ae5b8b8e58c85e590abe69687e5ad97e88887e69687e5ad97e5b1a4e7b49ae58583e7b4a0efbc9be4b88de8a681e782bae4ba86e5a29ee58aa0e8a696e8a6bae99693e8b79de8808ce5bbbae7ab8be7a9bae799bde6aeb5e890bdefbc8ce99693e8b79de68789e4baa4e7b5a620435353e38082' USING utf8mb4),
example_code = CONVERT(X'3c703ee6ada1e8bf8ee4bdbfe794a82053796e7461782041746c6173e380823c2f703e0a3c703ee59ca8e98099e8a3a1e68ea2e7b4a2e7a88be5bc8fe8aa9ee6b395e380823c2f703e' USING utf8mb4),
example_description = CONVERT(X'e4bdbfe794a8e585a9e5808be58583e7b4a0e8a1a8e7a4bae585a9e6aeb5e69687e5ad97e38082' USING utf8mb4),
sort_key = CONVERT(X'70' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f67726f7570696e672d636f6e74656e742e68746d6c237468652d702d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d70' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'70' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'67726f7570696e672d636f6e74656e74' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d6872' USING utf8mb4), CONVERT(X'3c68723e' USING utf8mb4), CONVERT(X'e4b8bbe9a18ce58886e99a94' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae6aeb5e890bde4b98be99693e79a84e4b8bbe9a18ce8bd89e68f9be38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae6aeb5e890bde4b98be99693e79a84e4b8bbe9a18ce8bd89e68f9be38082e4be8be5a682e69585e4ba8be5a0b4e699afe68896e8a88ee8ab96e8a9b1e9a18ce79a84e58887e68f9befbc8ce4b88de58faae698afe8a39de9a3bee7b79aefbc9b687220e698afe7a9bae58583e7b4a0e38082' USING utf8mb4), CONVERT(X'3c703ee7acace4b880e5a4a9e79a84e5adb8e7bf92e7ad86e8a898e380823c2f703e0a3c68723e0a3c703ee7acace4ba8ce5a4a9e9968be5a78be696b0e79a84e7b7b4e7bf92e380823c2f703e' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae585a9e6aeb5e5adb8e7bf92e7ad86e8a898e4b98be99693e79a84e4b8bbe9a18ce8bd89e68f9be38082' USING utf8mb4), CONVERT(X'6872' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f67726f7570696e672d636f6e74656e742e68746d6c237468652d68722d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c68723e' USING utf8mb4),
display_label = CONVERT(X'e4b8bbe9a18ce58886e99a94' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae6aeb5e890bde4b98be99693e79a84e4b8bbe9a18ce8bd89e68f9be38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae6aeb5e890bde4b98be99693e79a84e4b8bbe9a18ce8bd89e68f9be38082e4be8be5a682e69585e4ba8be5a0b4e699afe68896e8a88ee8ab96e8a9b1e9a18ce79a84e58887e68f9befbc8ce4b88de58faae698afe8a39de9a3bee7b79aefbc9b687220e698afe7a9bae58583e7b4a0e38082' USING utf8mb4),
example_code = CONVERT(X'3c703ee7acace4b880e5a4a9e79a84e5adb8e7bf92e7ad86e8a898e380823c2f703e0a3c68723e0a3c703ee7acace4ba8ce5a4a9e9968be5a78be696b0e79a84e7b7b4e7bf92e380823c2f703e' USING utf8mb4),
example_description = CONVERT(X'e8a1a8e7a4bae585a9e6aeb5e5adb8e7bf92e7ad86e8a898e4b98be99693e79a84e4b8bbe9a18ce8bd89e68f9be38082' USING utf8mb4),
sort_key = CONVERT(X'6872' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f67726f7570696e672d636f6e74656e742e68746d6c237468652d68722d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d6872' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'6872' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'67726f7570696e672d636f6e74656e74' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d707265' USING utf8mb4), CONVERT(X'3c7072653e' USING utf8mb4), CONVERT(X'e9a090e58588e6a0bce5bc8fe58c96e69687e5ad97' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae7a9bae799bde88887e68f9be8a18ce585b7e69c89e6848fe7bea9e79a84e69687e5ad97e585a7e5aeb9e38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae7a9bae799bde88887e68f9be8a18ce585b7e69c89e6848fe7bea9e79a84e69687e5ad97e585a7e5aeb9e38082e981a9e59088e7a88be5bc8fe7a2bce68896e69687e5ad97e68e92e78988efbc8ce5b8b8e8888720636f646520e690ade9858defbc9be585a7e5aeb9e4bb8de69c83e8a2abe795b6e4bd9c2048544d4c20e8a7a3e69e90efbc8ce9a1afe7a4bae5b08fe696bce7aca6e8999fe69982e99c80e981a9e795b6e8b7b3e884abe38082' USING utf8mb4), CONVERT(X'3c7072653e3c636f64653e69662073636f7265202667743b3d2036303a0a202020207072696e74282270617373656422293c2f636f64653e3c2f7072653e' USING utf8mb4), CONVERT(X'e4bf9de79599e7a88be5bc8fe7a2bce79a84e68f9be8a18ce88887e7b8aee68e92e38082' USING utf8mb4), CONVERT(X'707265' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f67726f7570696e672d636f6e74656e742e68746d6c237468652d7072652d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c7072653e' USING utf8mb4),
display_label = CONVERT(X'e9a090e58588e6a0bce5bc8fe58c96e69687e5ad97' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae7a9bae799bde88887e68f9be8a18ce585b7e69c89e6848fe7bea9e79a84e69687e5ad97e585a7e5aeb9e38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae7a9bae799bde88887e68f9be8a18ce585b7e69c89e6848fe7bea9e79a84e69687e5ad97e585a7e5aeb9e38082e981a9e59088e7a88be5bc8fe7a2bce68896e69687e5ad97e68e92e78988efbc8ce5b8b8e8888720636f646520e690ade9858defbc9be585a7e5aeb9e4bb8de69c83e8a2abe795b6e4bd9c2048544d4c20e8a7a3e69e90efbc8ce9a1afe7a4bae5b08fe696bce7aca6e8999fe69982e99c80e981a9e795b6e8b7b3e884abe38082' USING utf8mb4),
example_code = CONVERT(X'3c7072653e3c636f64653e69662073636f7265202667743b3d2036303a0a202020207072696e74282270617373656422293c2f636f64653e3c2f7072653e' USING utf8mb4),
example_description = CONVERT(X'e4bf9de79599e7a88be5bc8fe7a2bce79a84e68f9be8a18ce88887e7b8aee68e92e38082' USING utf8mb4),
sort_key = CONVERT(X'707265' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f67726f7570696e672d636f6e74656e742e68746d6c237468652d7072652d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d707265' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'707265' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'67726f7570696e672d636f6e74656e74' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d626c6f636b71756f7465' USING utf8mb4), CONVERT(X'3c626c6f636b71756f74653e' USING utf8mb4), CONVERT(X'e58d80e5a18ae5bc95e794a8' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae5be9ee585b6e4bb96e4be86e6ba90e5bc95e794a8e79a84e4b880e6aeb5e585a7e5aeb9e38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae5be9ee585b6e4bb96e4be86e6ba90e5bc95e794a8e79a84e4b880e6aeb5e585a7e5aeb9e38082e58fafe794a8206369746520e5b1ace680a7e68f90e4be9be4be86e6ba90e7b6b2e59d80efbc9be4bd9ce88085e68896e4be86e6ba90e79a84e7bdb2e5908de9809ae5b8b8e694bee59ca8e5bc95e794a8e585a7e5aeb9e4b98be5a496e38082' USING utf8mb4), CONVERT(X'3c626c6f636b71756f746520636974653d2268747470733a2f2f6578616d706c652e636f6d2f61727469636c65223e0a20203c703ee5adb8e7bf92e4be86e887aae68c81e7ba8ce7b7b4e7bf92e380823c2f703e0a3c2f626c6f636b71756f74653e' USING utf8mb4), CONVERT(X'e6a899e7a4bae4b880e6aeb5e5bc95e794a8e69687e5ad97e58f8ae585b6e4be86e6ba90e7b6b2e59d80e38082' USING utf8mb4), CONVERT(X'626c6f636b71756f7465' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f67726f7570696e672d636f6e74656e742e68746d6c237468652d626c6f636b71756f74652d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c626c6f636b71756f74653e' USING utf8mb4),
display_label = CONVERT(X'e58d80e5a18ae5bc95e794a8' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae5be9ee585b6e4bb96e4be86e6ba90e5bc95e794a8e79a84e4b880e6aeb5e585a7e5aeb9e38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae5be9ee585b6e4bb96e4be86e6ba90e5bc95e794a8e79a84e4b880e6aeb5e585a7e5aeb9e38082e58fafe794a8206369746520e5b1ace680a7e68f90e4be9be4be86e6ba90e7b6b2e59d80efbc9be4bd9ce88085e68896e4be86e6ba90e79a84e7bdb2e5908de9809ae5b8b8e694bee59ca8e5bc95e794a8e585a7e5aeb9e4b98be5a496e38082' USING utf8mb4),
example_code = CONVERT(X'3c626c6f636b71756f746520636974653d2268747470733a2f2f6578616d706c652e636f6d2f61727469636c65223e0a20203c703ee5adb8e7bf92e4be86e887aae68c81e7ba8ce7b7b4e7bf92e380823c2f703e0a3c2f626c6f636b71756f74653e' USING utf8mb4),
example_description = CONVERT(X'e6a899e7a4bae4b880e6aeb5e5bc95e794a8e69687e5ad97e58f8ae585b6e4be86e6ba90e7b6b2e59d80e38082' USING utf8mb4),
sort_key = CONVERT(X'626c6f636b71756f7465' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f67726f7570696e672d636f6e74656e742e68746d6c237468652d626c6f636b71756f74652d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d626c6f636b71756f7465' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'626c6f636b71756f7465' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'67726f7570696e672d636f6e74656e74' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d6f6c' USING utf8mb4), CONVERT(X'3c6f6c3e' USING utf8mb4), CONVERT(X'e69c89e5ba8fe6b885e596ae' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae9a085e79baee9a086e5ba8fe585b7e69c89e6848fe7bea9e79a84e6b885e596aee38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae9a085e79baee9a086e5ba8fe585b7e69c89e6848fe7bea9e79a84e6b885e596aee38082e4bba5206c6920e8a1a8e7a4bae59084e9a085e79baeefbc9be58fafe9808fe9818e207374617274e38081726576657273656420e7ad89e5b1ace680a7e8aabfe695b4e7b7a8e8999fe696b9e5bc8fefbc8ce8808ce99d9ee6898be58b95e68a8ae7b7a8e8999fe5afabe980b2e69687e5ad97e38082' USING utf8mb4), CONVERT(X'3c6f6c3e0a20203c6c693ee8bcb8e585a5e7a88be5bc8fe7a2bc3c2f6c693e0a20203c6c693ee58886e69e90e8aa9ee6b3953c2f6c693e0a20203c6c693ee584b2e5ad98e7b480e98c843c2f6c693e0a3c2f6f6c3e' USING utf8mb4), CONVERT(X'e58897e587bae69c89e58588e5be8ce9a086e5ba8fe79a84e6938de4bd9ce6ada5e9a99fe38082' USING utf8mb4), CONVERT(X'6f6c' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f67726f7570696e672d636f6e74656e742e68746d6c237468652d6f6c2d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c6f6c3e' USING utf8mb4),
display_label = CONVERT(X'e69c89e5ba8fe6b885e596ae' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae9a085e79baee9a086e5ba8fe585b7e69c89e6848fe7bea9e79a84e6b885e596aee38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae9a085e79baee9a086e5ba8fe585b7e69c89e6848fe7bea9e79a84e6b885e596aee38082e4bba5206c6920e8a1a8e7a4bae59084e9a085e79baeefbc9be58fafe9808fe9818e207374617274e38081726576657273656420e7ad89e5b1ace680a7e8aabfe695b4e7b7a8e8999fe696b9e5bc8fefbc8ce8808ce99d9ee6898be58b95e68a8ae7b7a8e8999fe5afabe980b2e69687e5ad97e38082' USING utf8mb4),
example_code = CONVERT(X'3c6f6c3e0a20203c6c693ee8bcb8e585a5e7a88be5bc8fe7a2bc3c2f6c693e0a20203c6c693ee58886e69e90e8aa9ee6b3953c2f6c693e0a20203c6c693ee584b2e5ad98e7b480e98c843c2f6c693e0a3c2f6f6c3e' USING utf8mb4),
example_description = CONVERT(X'e58897e587bae69c89e58588e5be8ce9a086e5ba8fe79a84e6938de4bd9ce6ada5e9a99fe38082' USING utf8mb4),
sort_key = CONVERT(X'6f6c' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f67726f7570696e672d636f6e74656e742e68746d6c237468652d6f6c2d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d6f6c' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'6f6c' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'67726f7570696e672d636f6e74656e74' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d756c' USING utf8mb4), CONVERT(X'3c756c3e' USING utf8mb4), CONVERT(X'e784a1e5ba8fe6b885e596ae' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae9a085e79baee9a086e5ba8fe4b88de5bdb1e99fbfe6848fe7bea9e79a84e6b885e596aee38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae9a085e79baee9a086e5ba8fe4b88de5bdb1e99fbfe6848fe7bea9e79a84e6b885e596aee38082e4bdbfe794a8206c6920e8a1a8e7a4bae59084e9a085e79baeefbc9be6b885e596aee7aca6e8999fe88887e5a496e8a780e58fafe9808fe9818e2043535320e8aabfe695b4e38082' USING utf8mb4), CONVERT(X'3c756c3e0a20203c6c693e507974686f6e3c2f6c693e0a20203c6c693e48544d4c3c2f6c693e0a3c2f756c3e' USING utf8mb4), CONVERT(X'e58897e587bae4b88de8a681e6b182e58588e5be8ce9a086e5ba8fe79a84e8aa9ee8a880e38082' USING utf8mb4), CONVERT(X'756c' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f67726f7570696e672d636f6e74656e742e68746d6c237468652d756c2d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c756c3e' USING utf8mb4),
display_label = CONVERT(X'e784a1e5ba8fe6b885e596ae' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae9a085e79baee9a086e5ba8fe4b88de5bdb1e99fbfe6848fe7bea9e79a84e6b885e596aee38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae9a085e79baee9a086e5ba8fe4b88de5bdb1e99fbfe6848fe7bea9e79a84e6b885e596aee38082e4bdbfe794a8206c6920e8a1a8e7a4bae59084e9a085e79baeefbc9be6b885e596aee7aca6e8999fe88887e5a496e8a780e58fafe9808fe9818e2043535320e8aabfe695b4e38082' USING utf8mb4),
example_code = CONVERT(X'3c756c3e0a20203c6c693e507974686f6e3c2f6c693e0a20203c6c693e48544d4c3c2f6c693e0a3c2f756c3e' USING utf8mb4),
example_description = CONVERT(X'e58897e587bae4b88de8a681e6b182e58588e5be8ce9a086e5ba8fe79a84e8aa9ee8a880e38082' USING utf8mb4),
sort_key = CONVERT(X'756c' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f67726f7570696e672d636f6e74656e742e68746d6c237468652d756c2d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d756c' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'756c' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'67726f7570696e672d636f6e74656e74' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d6d656e75' USING utf8mb4), CONVERT(X'3c6d656e753e' USING utf8mb4), CONVERT(X'e68c87e4bba4e6b885e596ae' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae4bba5e784a1e5ba8fe6b885e596aee7b584e68890e79a84e4bdbfe794a8e88085e6938de4bd9ce68c87e4bba4e38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae4bba5e784a1e5ba8fe6b885e596aee7b584e68890e79a84e4bdbfe794a8e88085e6938de4bd9ce68c87e4bba4e38082e4bdbfe794a8206c6920e58c85e590abe68c89e98895e7ad89e68c87e4bba4e4bb8be99da2efbc8ce8aa9ee6848fe4b88ae58fafe4bd9ce782bae5b7a5e585b7e58897efbc9be5a496e8a780e88887e6938de4bd9ce69588e69e9ce4bb8de99c80e6a8a3e5bc8fe68896e7a88be5bc8fe9858de59088e38082' USING utf8mb4), CONVERT(X'3c6d656e753e0a20203c6c693e3c627574746f6e20747970653d22627574746f6e223ee8a487e8a3bd3c2f627574746f6e3e3c2f6c693e0a20203c6c693e3c627574746f6e20747970653d22627574746f6e223ee8b2bce4b88a3c2f627574746f6e3e3c2f6c693e0a3c2f6d656e753e' USING utf8mb4), CONVERT(X'e794a8e68c87e4bba4e6b885e596aee8a1a8e7a4bae7b7a8e8bcafe5b7a5e585b7e58897efbc9be68c89e98895e58a9fe883bde99c80e58fa6e8a18ce5afa6e4bd9ce38082' USING utf8mb4), CONVERT(X'6d656e75' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f67726f7570696e672d636f6e74656e742e68746d6c237468652d6d656e752d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c6d656e753e' USING utf8mb4),
display_label = CONVERT(X'e68c87e4bba4e6b885e596ae' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae4bba5e784a1e5ba8fe6b885e596aee7b584e68890e79a84e4bdbfe794a8e88085e6938de4bd9ce68c87e4bba4e38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae4bba5e784a1e5ba8fe6b885e596aee7b584e68890e79a84e4bdbfe794a8e88085e6938de4bd9ce68c87e4bba4e38082e4bdbfe794a8206c6920e58c85e590abe68c89e98895e7ad89e68c87e4bba4e4bb8be99da2efbc8ce8aa9ee6848fe4b88ae58fafe4bd9ce782bae5b7a5e585b7e58897efbc9be5a496e8a780e88887e6938de4bd9ce69588e69e9ce4bb8de99c80e6a8a3e5bc8fe68896e7a88be5bc8fe9858de59088e38082' USING utf8mb4),
example_code = CONVERT(X'3c6d656e753e0a20203c6c693e3c627574746f6e20747970653d22627574746f6e223ee8a487e8a3bd3c2f627574746f6e3e3c2f6c693e0a20203c6c693e3c627574746f6e20747970653d22627574746f6e223ee8b2bce4b88a3c2f627574746f6e3e3c2f6c693e0a3c2f6d656e753e' USING utf8mb4),
example_description = CONVERT(X'e794a8e68c87e4bba4e6b885e596aee8a1a8e7a4bae7b7a8e8bcafe5b7a5e585b7e58897efbc9be68c89e98895e58a9fe883bde99c80e58fa6e8a18ce5afa6e4bd9ce38082' USING utf8mb4),
sort_key = CONVERT(X'6d656e75' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f67726f7570696e672d636f6e74656e742e68746d6c237468652d6d656e752d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d6d656e75' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'6d656e75' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'67726f7570696e672d636f6e74656e74' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d6c69' USING utf8mb4), CONVERT(X'3c6c693e' USING utf8mb4), CONVERT(X'e6b885e596aee9a085e79bae' USING utf8mb4), CONVERT(X'e8a1a8e7a4ba206f6ce38081756c20e68896206d656e7520e4b8ade79a84e4b880e5808be9a085e79baee38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4ba206f6ce38081756c20e68896206d656e7520e4b8ade79a84e4b880e5808be9a085e79baee38082e59ca8206f6c20e4b8ade58fafe794a82076616c756520e68c87e5ae9ae8a9b2e9a085e79baee79a84e5ba8fe8999fefbc9be9a085e79baee4b99fe58fafe4bba5e58c85e590abe585b6e4bb96e585a7e5aeb9e68896e5b7a2e78b80e6b885e596aee38082' USING utf8mb4), CONVERT(X'3c756c3e0a20203c6c693ee8aa9ee6b395e8beade585b83c2f6c693e0a20203c6c693ee7a88be5bc8fe7a2bce7b480e98c843c2f6c693e0a3c2f756c3e' USING utf8mb4), CONVERT(X'e5bbbae7ab8be6b885e596aee4b8ade79a84e585a9e5808be9a085e79baee38082' USING utf8mb4), CONVERT(X'6c69' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f67726f7570696e672d636f6e74656e742e68746d6c237468652d6c692d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c6c693e' USING utf8mb4),
display_label = CONVERT(X'e6b885e596aee9a085e79bae' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4ba206f6ce38081756c20e68896206d656e7520e4b8ade79a84e4b880e5808be9a085e79baee38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4ba206f6ce38081756c20e68896206d656e7520e4b8ade79a84e4b880e5808be9a085e79baee38082e59ca8206f6c20e4b8ade58fafe794a82076616c756520e68c87e5ae9ae8a9b2e9a085e79baee79a84e5ba8fe8999fefbc9be9a085e79baee4b99fe58fafe4bba5e58c85e590abe585b6e4bb96e585a7e5aeb9e68896e5b7a2e78b80e6b885e596aee38082' USING utf8mb4),
example_code = CONVERT(X'3c756c3e0a20203c6c693ee8aa9ee6b395e8beade585b83c2f6c693e0a20203c6c693ee7a88be5bc8fe7a2bce7b480e98c843c2f6c693e0a3c2f756c3e' USING utf8mb4),
example_description = CONVERT(X'e5bbbae7ab8be6b885e596aee4b8ade79a84e585a9e5808be9a085e79baee38082' USING utf8mb4),
sort_key = CONVERT(X'6c69' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f67726f7570696e672d636f6e74656e742e68746d6c237468652d6c692d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d6c69' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'6c69' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'67726f7570696e672d636f6e74656e74' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d646c' USING utf8mb4), CONVERT(X'3c646c3e' USING utf8mb4), CONVERT(X'e5908de7a8b1e88887e68f8fe8bfb0e6b885e596ae' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae794b1e5908de7a8b1e58f8ae5b08de68789e68f8fe8bfb0e7b584e68890e79a84e9979ce881afe6b885e596aee38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae794b1e5908de7a8b1e58f8ae5b08de68789e68f8fe8bfb0e7b584e68890e79a84e9979ce881afe6b885e596aee38082e4bdbfe794a820647420e694bee5908de7a8b1e38081646420e694bee68f8fe8bfb0efbc9be4b880e7b584e58fafe69c89e5a49ae5808be5908de7a8b1e68896e68f8fe8bfb0efbc8ce981a9e59088e8a99ee5bd99e8a7a3e9878be68896e4b8ade7b9bce8b387e8a88ae38082' USING utf8mb4), CONVERT(X'3c646c3e0a20203c64743e48544d4c3c2f64743e0a20203c64643ee794a8e696bce68f8fe8bfb0e7b6b2e9a081e585a7e5aeb9e7b590e6a78be79a84e6a899e8a898e8aa9ee8a880e380823c2f64643e0a3c2f646c3e' USING utf8mb4), CONVERT(X'e5bbbae7ab8be5908de8a99ee88887e8aaaae6988ee79a84e5b08de68789e9979ce4bf82e38082' USING utf8mb4), CONVERT(X'646c' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f67726f7570696e672d636f6e74656e742e68746d6c237468652d646c2d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c646c3e' USING utf8mb4),
display_label = CONVERT(X'e5908de7a8b1e88887e68f8fe8bfb0e6b885e596ae' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae794b1e5908de7a8b1e58f8ae5b08de68789e68f8fe8bfb0e7b584e68890e79a84e9979ce881afe6b885e596aee38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae794b1e5908de7a8b1e58f8ae5b08de68789e68f8fe8bfb0e7b584e68890e79a84e9979ce881afe6b885e596aee38082e4bdbfe794a820647420e694bee5908de7a8b1e38081646420e694bee68f8fe8bfb0efbc9be4b880e7b584e58fafe69c89e5a49ae5808be5908de7a8b1e68896e68f8fe8bfb0efbc8ce981a9e59088e8a99ee5bd99e8a7a3e9878be68896e4b8ade7b9bce8b387e8a88ae38082' USING utf8mb4),
example_code = CONVERT(X'3c646c3e0a20203c64743e48544d4c3c2f64743e0a20203c64643ee794a8e696bce68f8fe8bfb0e7b6b2e9a081e585a7e5aeb9e7b590e6a78be79a84e6a899e8a898e8aa9ee8a880e380823c2f64643e0a3c2f646c3e' USING utf8mb4),
example_description = CONVERT(X'e5bbbae7ab8be5908de8a99ee88887e8aaaae6988ee79a84e5b08de68789e9979ce4bf82e38082' USING utf8mb4),
sort_key = CONVERT(X'646c' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f67726f7570696e672d636f6e74656e742e68746d6c237468652d646c2d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d646c' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'646c' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'67726f7570696e672d636f6e74656e74' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d6474' USING utf8mb4), CONVERT(X'3c64743e' USING utf8mb4), CONVERT(X'e5908de7a8b1e9a085e79bae' USING utf8mb4), CONVERT(X'e8a1a8e7a4ba20646c20e6b885e596aee4b8ade79a84e5908de7a8b1e68896e8a193e8aa9ee38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4ba20646c20e6b885e596aee4b8ade79a84e5908de7a8b1e68896e8a193e8aa9ee38082e88887e5908ce7b584e79a8420646420e68f8fe8bfb0e5b08de68789efbc9b647420e69cace8baabe4b88de4bf9de8ad89e5908de7a8b1e698afe6ada3e5bc8fe79a84e5ae9ae7bea9efbc8ce5ae9ae7bea9e5afa6e4be8be58fafe58fa6e5a496e4bdbfe794a82064666ee38082' USING utf8mb4), CONVERT(X'3c646c3e0a20203c64743ee4bd9ce880853c2f64743e0a20203c64643e52696c65793c2f64643e0a3c2f646c3e' USING utf8mb4), CONVERT(X'e4bba520647420e6a899e7a4bae8b387e8a88ae5908de7a8b1e38082' USING utf8mb4), CONVERT(X'6474' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f67726f7570696e672d636f6e74656e742e68746d6c237468652d64742d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c64743e' USING utf8mb4),
display_label = CONVERT(X'e5908de7a8b1e9a085e79bae' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4ba20646c20e6b885e596aee4b8ade79a84e5908de7a8b1e68896e8a193e8aa9ee38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4ba20646c20e6b885e596aee4b8ade79a84e5908de7a8b1e68896e8a193e8aa9ee38082e88887e5908ce7b584e79a8420646420e68f8fe8bfb0e5b08de68789efbc9b647420e69cace8baabe4b88de4bf9de8ad89e5908de7a8b1e698afe6ada3e5bc8fe79a84e5ae9ae7bea9efbc8ce5ae9ae7bea9e5afa6e4be8be58fafe58fa6e5a496e4bdbfe794a82064666ee38082' USING utf8mb4),
example_code = CONVERT(X'3c646c3e0a20203c64743ee4bd9ce880853c2f64743e0a20203c64643e52696c65793c2f64643e0a3c2f646c3e' USING utf8mb4),
example_description = CONVERT(X'e4bba520647420e6a899e7a4bae8b387e8a88ae5908de7a8b1e38082' USING utf8mb4),
sort_key = CONVERT(X'6474' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f67726f7570696e672d636f6e74656e742e68746d6c237468652d64742d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d6474' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'6474' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'67726f7570696e672d636f6e74656e74' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d6464' USING utf8mb4), CONVERT(X'3c64643e' USING utf8mb4), CONVERT(X'e68f8fe8bfb0e9a085e79bae' USING utf8mb4), CONVERT(X'e8a1a8e7a4ba20646c20e6b885e596aee4b8ade5908de7a8b1e68980e5b08de68789e79a84e68f8fe8bfb0e68896e580bce38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4ba20646c20e6b885e596aee4b8ade5908de7a8b1e68980e5b08de68789e79a84e68f8fe8bfb0e68896e580bce38082e9809ae5b8b8e4bd8de696bce5908ce7b584e79a8420647420e4b98be5be8cefbc8ce585a7e5aeb9e58fafe58c85e590abe6aeb5e890bde38081e980a3e7b590e68896e585b6e4bb96e58886e7b584e585a7e5aeb9e38082' USING utf8mb4), CONVERT(X'3c646c3e0a20203c64743ee7b6b2e7ab99e5908de7a8b13c2f64743e0a20203c64643e53796e7461782041746c61733c2f64643e0a3c2f646c3e' USING utf8mb4), CONVERT(X'e4bba520646420e68f90e4be9be5908de7a8b1e5b08de68789e79a84e580bce38082' USING utf8mb4), CONVERT(X'6464' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f67726f7570696e672d636f6e74656e742e68746d6c237468652d64642d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c64643e' USING utf8mb4),
display_label = CONVERT(X'e68f8fe8bfb0e9a085e79bae' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4ba20646c20e6b885e596aee4b8ade5908de7a8b1e68980e5b08de68789e79a84e68f8fe8bfb0e68896e580bce38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4ba20646c20e6b885e596aee4b8ade5908de7a8b1e68980e5b08de68789e79a84e68f8fe8bfb0e68896e580bce38082e9809ae5b8b8e4bd8de696bce5908ce7b584e79a8420647420e4b98be5be8cefbc8ce585a7e5aeb9e58fafe58c85e590abe6aeb5e890bde38081e980a3e7b590e68896e585b6e4bb96e58886e7b584e585a7e5aeb9e38082' USING utf8mb4),
example_code = CONVERT(X'3c646c3e0a20203c64743ee7b6b2e7ab99e5908de7a8b13c2f64743e0a20203c64643e53796e7461782041746c61733c2f64643e0a3c2f646c3e' USING utf8mb4),
example_description = CONVERT(X'e4bba520646420e68f90e4be9be5908de7a8b1e5b08de68789e79a84e580bce38082' USING utf8mb4),
sort_key = CONVERT(X'6464' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f67726f7570696e672d636f6e74656e742e68746d6c237468652d64642d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d6464' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'6464' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'67726f7570696e672d636f6e74656e74' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d666967757265' USING utf8mb4), CONVERT(X'3c6669677572653e' USING utf8mb4), CONVERT(X'e78da8e7ab8be59c96e69687e585a7e5aeb9' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae58fafe4bd9ce782bae4b880e5808be695b4e9ab94e5bc95e794a8e79a84e78da8e7ab8be585a7e5aeb9e38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae58fafe4bd9ce782bae4b880e5808be695b4e9ab94e5bc95e794a8e79a84e78da8e7ab8be585a7e5aeb9e38082e58fafe58c85e590abe59c96e78987e38081e59c96e8a1a8e68896e7a88be5bc8fe7a2bcefbc8ce4b88de99990e696bce59c96e78987efbc9be58fafe4bdbfe794a82066696763617074696f6e20e68f90e4be9be8aaaae6988ee38082' USING utf8mb4), CONVERT(X'3c6669677572653e0a20203c696d67207372633d226469616772616d2e706e672220616c743d2248544d4c20e69687e4bbb6e7b590e6a78be59c96223e0a20203c66696763617074696f6e3ee69687e4bbb6e7b590e6a78be7a4bae6848fe59c963c2f66696763617074696f6e3e0a3c2f6669677572653e' USING utf8mb4), CONVERT(X'e68a8ae59c96e78987e88887e8aaaae6988ee7b584e68890e4b880e5808be78da8e7ab8be585a7e5aeb9e596aee4bd8de38082' USING utf8mb4), CONVERT(X'666967757265' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f67726f7570696e672d636f6e74656e742e68746d6c237468652d6669677572652d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c6669677572653e' USING utf8mb4),
display_label = CONVERT(X'e78da8e7ab8be59c96e69687e585a7e5aeb9' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae58fafe4bd9ce782bae4b880e5808be695b4e9ab94e5bc95e794a8e79a84e78da8e7ab8be585a7e5aeb9e38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae58fafe4bd9ce782bae4b880e5808be695b4e9ab94e5bc95e794a8e79a84e78da8e7ab8be585a7e5aeb9e38082e58fafe58c85e590abe59c96e78987e38081e59c96e8a1a8e68896e7a88be5bc8fe7a2bcefbc8ce4b88de99990e696bce59c96e78987efbc9be58fafe4bdbfe794a82066696763617074696f6e20e68f90e4be9be8aaaae6988ee38082' USING utf8mb4),
example_code = CONVERT(X'3c6669677572653e0a20203c696d67207372633d226469616772616d2e706e672220616c743d2248544d4c20e69687e4bbb6e7b590e6a78be59c96223e0a20203c66696763617074696f6e3ee69687e4bbb6e7b590e6a78be7a4bae6848fe59c963c2f66696763617074696f6e3e0a3c2f6669677572653e' USING utf8mb4),
example_description = CONVERT(X'e68a8ae59c96e78987e88887e8aaaae6988ee7b584e68890e4b880e5808be78da8e7ab8be585a7e5aeb9e596aee4bd8de38082' USING utf8mb4),
sort_key = CONVERT(X'666967757265' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f67726f7570696e672d636f6e74656e742e68746d6c237468652d6669677572652d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d666967757265' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'666967757265' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'67726f7570696e672d636f6e74656e74' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d66696763617074696f6e' USING utf8mb4), CONVERT(X'3c66696763617074696f6e3e' USING utf8mb4), CONVERT(X'e59c96e69687e8aaaae6988e' USING utf8mb4), CONVERT(X'e68f90e4be9be68980e5b1ac2066696775726520e79a84e6a899e9a18ce68896e8aaaae6988ee38082' USING utf8mb4), CONVERT(X'e68f90e4be9be68980e5b1ac2066696775726520e79a84e6a899e9a18ce68896e8aaaae6988ee38082e694bee59ca82066696775726520e79a84e7acace4b880e5808be68896e69c80e5be8ce4b880e5808be5ad90e58583e7b4a0e4bd8de7bdaeefbc9be5908ce4b880e5808b2066696775726520e69c80e5a49ae58c85e590abe4b880e5808b2066696763617074696f6ee38082' USING utf8mb4), CONVERT(X'3c6669677572653e0a20203c7072653e3c636f64653e7072696e74282248656c6c6f22293c2f636f64653e3c2f7072653e0a20203c66696763617074696f6e3ee7acace4b880e5808b20507974686f6e20e7af84e4be8b3c2f66696763617074696f6e3e0a3c2f6669677572653e' USING utf8mb4), CONVERT(X'e782bae78da8e7ab8be59188e78fbee79a84e7a88be5bc8fe7a2bce58aa0e4b88ae8aaaae6988ee38082' USING utf8mb4), CONVERT(X'66696763617074696f6e' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f67726f7570696e672d636f6e74656e742e68746d6c237468652d66696763617074696f6e2d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c66696763617074696f6e3e' USING utf8mb4),
display_label = CONVERT(X'e59c96e69687e8aaaae6988e' USING utf8mb4),
summary = CONVERT(X'e68f90e4be9be68980e5b1ac2066696775726520e79a84e6a899e9a18ce68896e8aaaae6988ee38082' USING utf8mb4),
description = CONVERT(X'e68f90e4be9be68980e5b1ac2066696775726520e79a84e6a899e9a18ce68896e8aaaae6988ee38082e694bee59ca82066696775726520e79a84e7acace4b880e5808be68896e69c80e5be8ce4b880e5808be5ad90e58583e7b4a0e4bd8de7bdaeefbc9be5908ce4b880e5808b2066696775726520e69c80e5a49ae58c85e590abe4b880e5808b2066696763617074696f6ee38082' USING utf8mb4),
example_code = CONVERT(X'3c6669677572653e0a20203c7072653e3c636f64653e7072696e74282248656c6c6f22293c2f636f64653e3c2f7072653e0a20203c66696763617074696f6e3ee7acace4b880e5808b20507974686f6e20e7af84e4be8b3c2f66696763617074696f6e3e0a3c2f6669677572653e' USING utf8mb4),
example_description = CONVERT(X'e782bae78da8e7ab8be59188e78fbee79a84e7a88be5bc8fe7a2bce58aa0e4b88ae8aaaae6988ee38082' USING utf8mb4),
sort_key = CONVERT(X'66696763617074696f6e' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f67726f7570696e672d636f6e74656e742e68746d6c237468652d66696763617074696f6e2d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d66696763617074696f6e' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'66696763617074696f6e' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'67726f7570696e672d636f6e74656e74' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d6d61696e' USING utf8mb4), CONVERT(X'3c6d61696e3e' USING utf8mb4), CONVERT(X'e4b8bbe8a681e585a7e5aeb9' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae69687e4bbb6e4b8bbe9a18ce68896e6a0b8e5bf83e58a9fe883bde79a84e4b8bbe8a681e585a7e5aeb9e38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae69687e4bbb6e4b8bbe9a18ce68896e6a0b8e5bf83e58a9fe883bde79a84e4b8bbe8a681e585a7e5aeb9e38082e4b880e888ace9a081e99da2e4b88de68789e5908ce69982e69c89e5a49ae5808be69caae99ab1e8978fe79a84206d61696eefbc9be9878de8a487e587bae78fbee79a84e7ab99e585a7e4b8bbe981b8e596aee88887e78988e6ac8ae8b387e8a88ae9809ae5b8b8e4b88de5b1ace696bce4b8bbe8a681e585a7e5aeb9e38082' USING utf8mb4), CONVERT(X'3c6d61696e3e0a20203c68313ee8aa9ee6b395e8beade585b83c2f68313e0a20203c703ee59ca8e98099e8a3a1e69fa5e996b1e8aa9ee6b395e8aaaae6988ee380823c2f703e0a3c2f6d61696e3e' USING utf8mb4), CONVERT(X'e6a899e7a4bae9a081e99da2e79a84e6a0b8e5bf83e585a7e5aeb9e58d80e59f9fe38082' USING utf8mb4), CONVERT(X'6d61696e' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f67726f7570696e672d636f6e74656e742e68746d6c237468652d6d61696e2d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c6d61696e3e' USING utf8mb4),
display_label = CONVERT(X'e4b8bbe8a681e585a7e5aeb9' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae69687e4bbb6e4b8bbe9a18ce68896e6a0b8e5bf83e58a9fe883bde79a84e4b8bbe8a681e585a7e5aeb9e38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae69687e4bbb6e4b8bbe9a18ce68896e6a0b8e5bf83e58a9fe883bde79a84e4b8bbe8a681e585a7e5aeb9e38082e4b880e888ace9a081e99da2e4b88de68789e5908ce69982e69c89e5a49ae5808be69caae99ab1e8978fe79a84206d61696eefbc9be9878de8a487e587bae78fbee79a84e7ab99e585a7e4b8bbe981b8e596aee88887e78988e6ac8ae8b387e8a88ae9809ae5b8b8e4b88de5b1ace696bce4b8bbe8a681e585a7e5aeb9e38082' USING utf8mb4),
example_code = CONVERT(X'3c6d61696e3e0a20203c68313ee8aa9ee6b395e8beade585b83c2f68313e0a20203c703ee59ca8e98099e8a3a1e69fa5e996b1e8aa9ee6b395e8aaaae6988ee380823c2f703e0a3c2f6d61696e3e' USING utf8mb4),
example_description = CONVERT(X'e6a899e7a4bae9a081e99da2e79a84e6a0b8e5bf83e585a7e5aeb9e58d80e59f9fe38082' USING utf8mb4),
sort_key = CONVERT(X'6d61696e' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f67726f7570696e672d636f6e74656e742e68746d6c237468652d6d61696e2d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d6d61696e' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'6d61696e' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'67726f7570696e672d636f6e74656e74' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d736561726368' USING utf8mb4), CONVERT(X'3c7365617263683e' USING utf8mb4), CONVERT(X'e6909ce5b08be58d80e59f9f' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae794a8e4be86e6909ce5b08be68896e7afa9e981b8e8b387e8a88ae79a84e585a7e5aeb9e58d80e59f9fe38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae794a8e4be86e6909ce5b08be68896e7afa9e981b8e8b387e8a88ae79a84e585a7e5aeb9e58d80e59f9fe38082e58fafe4bba5e58c85e590abe8a1a8e596aee68896e585b6e4bb96e6909ce5b08be6938de4bd9ce4bb8be99da2efbc9be4b88de68789e58faae59ba0e782bae585a7e5aeb9e698afe6909ce5b08be7b590e69e9cefbc8ce5b0b1e68a8ae7b590e69e9ce58897e8a1a8e585a8e983a8e58c85e980b220736561726368e38082' USING utf8mb4), CONVERT(X'3c7365617263683e0a20203c666f726d20616374696f6e3d222f64696374696f6e617279223e0a202020203c6c6162656c3ee6909ce5b08be8aa9ee6b395203c696e70757420747970653d2273656172636822206e616d653d2271223e3c2f6c6162656c3e0a202020203c627574746f6e20747970653d227375626d6974223ee6909ce5b08b3c2f627574746f6e3e0a20203c2f666f726d3e0a3c2f7365617263683e' USING utf8mb4), CONVERT(X'e6a899e7a4bae8aa9ee6b395e6909ce5b08be4bb8be99da2e79a84e794a8e98094e38082' USING utf8mb4), CONVERT(X'736561726368' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f67726f7570696e672d636f6e74656e742e68746d6c237468652d7365617263682d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c7365617263683e' USING utf8mb4),
display_label = CONVERT(X'e6909ce5b08be58d80e59f9f' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae794a8e4be86e6909ce5b08be68896e7afa9e981b8e8b387e8a88ae79a84e585a7e5aeb9e58d80e59f9fe38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae794a8e4be86e6909ce5b08be68896e7afa9e981b8e8b387e8a88ae79a84e585a7e5aeb9e58d80e59f9fe38082e58fafe4bba5e58c85e590abe8a1a8e596aee68896e585b6e4bb96e6909ce5b08be6938de4bd9ce4bb8be99da2efbc9be4b88de68789e58faae59ba0e782bae585a7e5aeb9e698afe6909ce5b08be7b590e69e9cefbc8ce5b0b1e68a8ae7b590e69e9ce58897e8a1a8e585a8e983a8e58c85e980b220736561726368e38082' USING utf8mb4),
example_code = CONVERT(X'3c7365617263683e0a20203c666f726d20616374696f6e3d222f64696374696f6e617279223e0a202020203c6c6162656c3ee6909ce5b08be8aa9ee6b395203c696e70757420747970653d2273656172636822206e616d653d2271223e3c2f6c6162656c3e0a202020203c627574746f6e20747970653d227375626d6974223ee6909ce5b08b3c2f627574746f6e3e0a20203c2f666f726d3e0a3c2f7365617263683e' USING utf8mb4),
example_description = CONVERT(X'e6a899e7a4bae8aa9ee6b395e6909ce5b08be4bb8be99da2e79a84e794a8e98094e38082' USING utf8mb4),
sort_key = CONVERT(X'736561726368' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f67726f7570696e672d636f6e74656e742e68746d6c237468652d7365617263682d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d736561726368' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'736561726368' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'67726f7570696e672d636f6e74656e74' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d646976' USING utf8mb4), CONVERT(X'3c6469763e' USING utf8mb4), CONVERT(X'e9809ae794a8e5aeb9e599a8' USING utf8mb4), CONVERT(X'e794a8e696bce58886e7b584e585a7e5aeb9efbc8ce69cace8baabe4b88de68f90e4be9be789b9e5ae9ae8aa9ee6848fe38082' USING utf8mb4), CONVERT(X'e794a8e696bce58886e7b584e585a7e5aeb9efbc8ce69cace8baabe4b88de68f90e4be9be789b9e5ae9ae8aa9ee6848fe38082e981a9e59088e690ade9858de6a8a3e5bc8fe68896e7a88be5bc8fe6938de4bd9cefbc9be88ba5e585a7e5aeb9e585b7e69c89e6988ee7a2bae69687e7aba0e38081e58d80e6aeb5e68896e5b08ee8a6bde794a8e98094efbc8ce68789e584aae58588e4bdbfe794a8e79bb8e68789e79a84e8aa9ee6848fe58583e7b4a0e38082' USING utf8mb4), CONVERT(X'3c64697620636c6173733d2270726f66696c65223e0a20203c703ee69c83e593a1e5908de7a8b1efbc9a52696c65793c2f703e0a3c2f6469763e' USING utf8mb4), CONVERT(X'e68a8ae69c83e593a1e8b387e8a88ae694bee980b2e585b1e794a8e5aeb9e599a8e38082' USING utf8mb4), CONVERT(X'646976' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f67726f7570696e672d636f6e74656e742e68746d6c237468652d6469762d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c6469763e' USING utf8mb4),
display_label = CONVERT(X'e9809ae794a8e5aeb9e599a8' USING utf8mb4),
summary = CONVERT(X'e794a8e696bce58886e7b584e585a7e5aeb9efbc8ce69cace8baabe4b88de68f90e4be9be789b9e5ae9ae8aa9ee6848fe38082' USING utf8mb4),
description = CONVERT(X'e794a8e696bce58886e7b584e585a7e5aeb9efbc8ce69cace8baabe4b88de68f90e4be9be789b9e5ae9ae8aa9ee6848fe38082e981a9e59088e690ade9858de6a8a3e5bc8fe68896e7a88be5bc8fe6938de4bd9cefbc9be88ba5e585a7e5aeb9e585b7e69c89e6988ee7a2bae69687e7aba0e38081e58d80e6aeb5e68896e5b08ee8a6bde794a8e98094efbc8ce68789e584aae58588e4bdbfe794a8e79bb8e68789e79a84e8aa9ee6848fe58583e7b4a0e38082' USING utf8mb4),
example_code = CONVERT(X'3c64697620636c6173733d2270726f66696c65223e0a20203c703ee69c83e593a1e5908de7a8b1efbc9a52696c65793c2f703e0a3c2f6469763e' USING utf8mb4),
example_description = CONVERT(X'e68a8ae69c83e593a1e8b387e8a88ae694bee980b2e585b1e794a8e5aeb9e599a8e38082' USING utf8mb4),
sort_key = CONVERT(X'646976' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f67726f7570696e672d636f6e74656e742e68746d6c237468652d6469762d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d646976' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'646976' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746578742d6c6576656c2d73656d616e74696373' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d61' USING utf8mb4), CONVERT(X'3c613e' USING utf8mb4), CONVERT(X'e8b685e980a3e7b590' USING utf8mb4), CONVERT(X'e690ade9858d206872656620e5b1ace680a7e5bbbae7ab8be8b685e980a3e7b590e38082' USING utf8mb4), CONVERT(X'e690ade9858d206872656620e5b1ace680a7e5bbbae7ab8be8b685e980a3e7b590e38082e58fafe68c87e59091e585b6e4bb96e7b6b2e9a081e38081e6aa94e6a188e68896e5908ce9a081e7aba0e7af80efbc9be69caae68f90e4be9b206872656620e69982efbc8ce698afe58e9fe69cace58fafe694bee7bdaee980a3e7b590e79a84e4bd8de7bdaeefbc8ce69cace8baabe4b88de6a78be68890e8b685e980a3e7b590e38082' USING utf8mb4), CONVERT(X'3c6120687265663d2268747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f223e48544d4c20e5ae98e696b9e6a899e6ba963c2f613e' USING utf8mb4), CONVERT(X'e5bbbae7ab8be5898de5be802048544d4c20e5ae98e696b9e6a899e6ba96e79a84e980a3e7b590e38082' USING utf8mb4), CONVERT(X'61' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d612d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c613e' USING utf8mb4),
display_label = CONVERT(X'e8b685e980a3e7b590' USING utf8mb4),
summary = CONVERT(X'e690ade9858d206872656620e5b1ace680a7e5bbbae7ab8be8b685e980a3e7b590e38082' USING utf8mb4),
description = CONVERT(X'e690ade9858d206872656620e5b1ace680a7e5bbbae7ab8be8b685e980a3e7b590e38082e58fafe68c87e59091e585b6e4bb96e7b6b2e9a081e38081e6aa94e6a188e68896e5908ce9a081e7aba0e7af80efbc9be69caae68f90e4be9b206872656620e69982efbc8ce698afe58e9fe69cace58fafe694bee7bdaee980a3e7b590e79a84e4bd8de7bdaeefbc8ce69cace8baabe4b88de6a78be68890e8b685e980a3e7b590e38082' USING utf8mb4),
example_code = CONVERT(X'3c6120687265663d2268747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f223e48544d4c20e5ae98e696b9e6a899e6ba963c2f613e' USING utf8mb4),
example_description = CONVERT(X'e5bbbae7ab8be5898de5be802048544d4c20e5ae98e696b9e6a899e6ba96e79a84e980a3e7b590e38082' USING utf8mb4),
sort_key = CONVERT(X'61' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d612d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d61' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'61' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746578742d6c6576656c2d73656d616e74696373' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d656d' USING utf8mb4), CONVERT(X'3c656d3e' USING utf8mb4), CONVERT(X'e8aa9ee6b0a3e5bcb7e8aabf' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae69687e5ad97e79a84e8aa9ee6b0a3e5bcb7e8aabfe38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae69687e5ad97e79a84e8aa9ee6b0a3e5bcb7e8aabfe38082e5bcb7e8aabfe79a84e4bd8de7bdaee69c83e5bdb1e99fbfe58fa5e5ad90e6848fe6809defbc8ce4b88de58faae698afe6969ce9ab94e69588e69e9cefbc9be9878de8a681e680a7e68789e4bdbfe794a8207374726f6e67efbc8ce7b494e7b2b9e79a84e5a496e8a780e58987e4baa4e7b5a620435353e38082' USING utf8mb4), CONVERT(X'3c703ee8ab8be585883c656d3ee584b2e5ad983c2f656d3ee5868de9979ce99689e9a081e99da2e380823c2f703e' USING utf8mb4), CONVERT(X'e5bcb7e8aabfe58fa5e5ad90e4b8ade79a84e584b2e5ad98e58b95e4bd9ce38082' USING utf8mb4), CONVERT(X'656d' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d656d2d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c656d3e' USING utf8mb4),
display_label = CONVERT(X'e8aa9ee6b0a3e5bcb7e8aabf' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae69687e5ad97e79a84e8aa9ee6b0a3e5bcb7e8aabfe38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae69687e5ad97e79a84e8aa9ee6b0a3e5bcb7e8aabfe38082e5bcb7e8aabfe79a84e4bd8de7bdaee69c83e5bdb1e99fbfe58fa5e5ad90e6848fe6809defbc8ce4b88de58faae698afe6969ce9ab94e69588e69e9cefbc9be9878de8a681e680a7e68789e4bdbfe794a8207374726f6e67efbc8ce7b494e7b2b9e79a84e5a496e8a780e58987e4baa4e7b5a620435353e38082' USING utf8mb4),
example_code = CONVERT(X'3c703ee8ab8be585883c656d3ee584b2e5ad983c2f656d3ee5868de9979ce99689e9a081e99da2e380823c2f703e' USING utf8mb4),
example_description = CONVERT(X'e5bcb7e8aabfe58fa5e5ad90e4b8ade79a84e584b2e5ad98e58b95e4bd9ce38082' USING utf8mb4),
sort_key = CONVERT(X'656d' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d656d2d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d656d' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'656d' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746578742d6c6576656c2d73656d616e74696373' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d7374726f6e67' USING utf8mb4), CONVERT(X'3c7374726f6e673e' USING utf8mb4), CONVERT(X'e9878de8a681e585a7e5aeb9' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae585a7e5aeb9e79a84e9878de8a681e680a7e38081e59ab4e88285e680a7e68896e680a5e8bfabe680a7e38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae585a7e5aeb9e79a84e9878de8a681e680a7e38081e59ab4e88285e680a7e68896e680a5e8bfabe680a7e38082e4b88de58faae698afe7b297e9ab94e69588e69e9cefbc9be88ba5e58faae698afe8a696e8a6bae4b88ae58aa0e7b297efbc8ce68789e4bdbfe794a820435353e38082' USING utf8mb4), CONVERT(X'3c703e3c7374726f6e673ee6b3a8e6848fefbc9a3c2f7374726f6e673ee588aae999a4e5be8ce784a1e6b395e5bea9e58e9fe380823c2f703e' USING utf8mb4), CONVERT(X'e7aa81e9a1afe9878de8a681e79a84e6938de4bd9ce68f90e98692e38082' USING utf8mb4), CONVERT(X'7374726f6e67' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d7374726f6e672d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c7374726f6e673e' USING utf8mb4),
display_label = CONVERT(X'e9878de8a681e585a7e5aeb9' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae585a7e5aeb9e79a84e9878de8a681e680a7e38081e59ab4e88285e680a7e68896e680a5e8bfabe680a7e38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae585a7e5aeb9e79a84e9878de8a681e680a7e38081e59ab4e88285e680a7e68896e680a5e8bfabe680a7e38082e4b88de58faae698afe7b297e9ab94e69588e69e9cefbc9be88ba5e58faae698afe8a696e8a6bae4b88ae58aa0e7b297efbc8ce68789e4bdbfe794a820435353e38082' USING utf8mb4),
example_code = CONVERT(X'3c703e3c7374726f6e673ee6b3a8e6848fefbc9a3c2f7374726f6e673ee588aae999a4e5be8ce784a1e6b395e5bea9e58e9fe380823c2f703e' USING utf8mb4),
example_description = CONVERT(X'e7aa81e9a1afe9878de8a681e79a84e6938de4bd9ce68f90e98692e38082' USING utf8mb4),
sort_key = CONVERT(X'7374726f6e67' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d7374726f6e672d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d7374726f6e67' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'7374726f6e67' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746578742d6c6576656c2d73656d616e74696373' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d736d616c6c' USING utf8mb4), CONVERT(X'3c736d616c6c3e' USING utf8mb4), CONVERT(X'e99984e8a8bbe5b08fe5ad97' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae99984e5b8b6e8a995e8ab96e68896e5b08fe5ad97e8b387e8a88ae38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae99984e5b8b6e8a995e8ab96e68896e5b08fe5ad97e8b387e8a88ae38082e981a9e59088e78988e6ac8ae38081e6b395e5be8be881b2e6988ee68896e7b0a1e79fade8a39ce58585efbc9be4b88de698afe68980e69c89e683b3e7b8aee5b08fe9a1afe7a4bae79a84e69687e5ad97e983bde981a9e59088e4bdbfe794a8e38082' USING utf8mb4), CONVERT(X'3c703ee8a882e996b1e99bbbe5ad90e5a0b1e380823c2f703e0a3c703e3c736d616c6c3ee4bda0e58fafe4bba5e99aa8e69982e58f96e6b688e8a882e996b1e380823c2f736d616c6c3e3c2f703e' USING utf8mb4), CONVERT(X'e68f90e4be9be8a882e996b1e69c8de58b99e79a84e99984e5b8b6e8aaaae6988ee38082' USING utf8mb4), CONVERT(X'736d616c6c' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d736d616c6c2d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c736d616c6c3e' USING utf8mb4),
display_label = CONVERT(X'e99984e8a8bbe5b08fe5ad97' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae99984e5b8b6e8a995e8ab96e68896e5b08fe5ad97e8b387e8a88ae38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae99984e5b8b6e8a995e8ab96e68896e5b08fe5ad97e8b387e8a88ae38082e981a9e59088e78988e6ac8ae38081e6b395e5be8be881b2e6988ee68896e7b0a1e79fade8a39ce58585efbc9be4b88de698afe68980e69c89e683b3e7b8aee5b08fe9a1afe7a4bae79a84e69687e5ad97e983bde981a9e59088e4bdbfe794a8e38082' USING utf8mb4),
example_code = CONVERT(X'3c703ee8a882e996b1e99bbbe5ad90e5a0b1e380823c2f703e0a3c703e3c736d616c6c3ee4bda0e58fafe4bba5e99aa8e69982e58f96e6b688e8a882e996b1e380823c2f736d616c6c3e3c2f703e' USING utf8mb4),
example_description = CONVERT(X'e68f90e4be9be8a882e996b1e69c8de58b99e79a84e99984e5b8b6e8aaaae6988ee38082' USING utf8mb4),
sort_key = CONVERT(X'736d616c6c' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d736d616c6c2d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d736d616c6c' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'736d616c6c' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746578742d6c6576656c2d73656d616e74696373' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d73' USING utf8mb4), CONVERT(X'3c733e' USING utf8mb4), CONVERT(X'e4b88de5868de6ada3e7a2bae79a84e585a7e5aeb9' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae4b88de5868de6ba96e7a2bae68896e4b88de5868de981a9e794a8e79a84e585a7e5aeb9e38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae4b88de5868de6ba96e7a2bae68896e4b88de5868de981a9e794a8e79a84e585a7e5aeb9e38082e4be8be5a682e8888ae583b9e6a0bcefbc9be88ba5e8a681e6a899e8a898e69687e4bbb6e4bfaee8a882e69982e588aae999a4e79a84e585a7e5aeb9efbc8ce68789e4bdbfe794a82064656ce38082' USING utf8mb4), CONVERT(X'3c703e3c733ee58e9fe583b92035303020e585833c2f733eefbc8ce78fbee59ca82033353020e58583e380823c2f703e' USING utf8mb4), CONVERT(X'e6a899e8a898e4b88de5868de981a9e794a8e79a84e58e9fe583b9e38082' USING utf8mb4), CONVERT(X'73' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d732d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c733e' USING utf8mb4),
display_label = CONVERT(X'e4b88de5868de6ada3e7a2bae79a84e585a7e5aeb9' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae4b88de5868de6ba96e7a2bae68896e4b88de5868de981a9e794a8e79a84e585a7e5aeb9e38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae4b88de5868de6ba96e7a2bae68896e4b88de5868de981a9e794a8e79a84e585a7e5aeb9e38082e4be8be5a682e8888ae583b9e6a0bcefbc9be88ba5e8a681e6a899e8a898e69687e4bbb6e4bfaee8a882e69982e588aae999a4e79a84e585a7e5aeb9efbc8ce68789e4bdbfe794a82064656ce38082' USING utf8mb4),
example_code = CONVERT(X'3c703e3c733ee58e9fe583b92035303020e585833c2f733eefbc8ce78fbee59ca82033353020e58583e380823c2f703e' USING utf8mb4),
example_description = CONVERT(X'e6a899e8a898e4b88de5868de981a9e794a8e79a84e58e9fe583b9e38082' USING utf8mb4),
sort_key = CONVERT(X'73' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d732d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d73' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'73' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746578742d6c6576656c2d73656d616e74696373' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d63697465' USING utf8mb4), CONVERT(X'3c636974653e' USING utf8mb4), CONVERT(X'e4bd9ce59381e5908de7a8b1' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae4bd9ce59381e79a84e5908de7a8b1e38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae4bd9ce59381e79a84e5908de7a8b1e38082e58fafe794a8e696bce69bb8e7b18de38081e69687e7aba0e38081e5bdb1e78987e7ad89e4bd9ce59381e6a899e9a18cefbc9be4b88de596aee7b494e4bba3e8a1a8e4bd9ce88085e5a793e5908de68896e4b880e888ace5bc95e69687e38082' USING utf8mb4), CONVERT(X'3c703ee68891e6ada3e59ca8e996b1e8ae803c636974653e48544d4c20e5adb8e7bf92e68c87e58d973c2f636974653ee380823c2f703e' USING utf8mb4), CONVERT(X'e6a899e7a4bae4b880e69cace4bd9ce59381e79a84e5908de7a8b1e38082' USING utf8mb4), CONVERT(X'63697465' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d636974652d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c636974653e' USING utf8mb4),
display_label = CONVERT(X'e4bd9ce59381e5908de7a8b1' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae4bd9ce59381e79a84e5908de7a8b1e38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae4bd9ce59381e79a84e5908de7a8b1e38082e58fafe794a8e696bce69bb8e7b18de38081e69687e7aba0e38081e5bdb1e78987e7ad89e4bd9ce59381e6a899e9a18cefbc9be4b88de596aee7b494e4bba3e8a1a8e4bd9ce88085e5a793e5908de68896e4b880e888ace5bc95e69687e38082' USING utf8mb4),
example_code = CONVERT(X'3c703ee68891e6ada3e59ca8e996b1e8ae803c636974653e48544d4c20e5adb8e7bf92e68c87e58d973c2f636974653ee380823c2f703e' USING utf8mb4),
example_description = CONVERT(X'e6a899e7a4bae4b880e69cace4bd9ce59381e79a84e5908de7a8b1e38082' USING utf8mb4),
sort_key = CONVERT(X'63697465' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d636974652d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d63697465' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'63697465' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746578742d6c6576656c2d73656d616e74696373' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d71' USING utf8mb4), CONVERT(X'3c713e' USING utf8mb4), CONVERT(X'e8a18ce585a7e5bc95e794a8' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae5b58ce59ca8e585b6e4bb96e69687e5ad97e4b8ade79a84e5bc95e794a8e585a7e5aeb9e38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae5b58ce59ca8e585b6e4bb96e69687e5ad97e4b8ade79a84e5bc95e794a8e585a7e5aeb9e38082e58fafe794a8206369746520e5b1ace680a7e8a898e98c84e4be86e6ba90efbc9be5bc95e8999fe9809ae5b8b8e794b1e7808fe8a6bde599a8e88887e6a8a3e5bc8fe89995e79086efbc8ce4b88de5bf85e58fa6e5a496e59ca8e58583e7b4a0e585a7e9878de8a487e8bcb8e585a5e38082' USING utf8mb4), CONVERT(X'3c703ee4bd9ce88085e8aaaaefbc9a3c7120636974653d2268747470733a2f2f6578616d706c652e636f6d2f6775696465223ee7b7b4e7bf92e883bde5b9abe58aa9e79086e8a7a3e380823c2f713e3c2f703e' USING utf8mb4), CONVERT(X'e59ca8e58fa5e5ad90e4b8ade6a899e7a4bae4b880e6aeb5e5bc95e794a8e38082' USING utf8mb4), CONVERT(X'71' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d712d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c713e' USING utf8mb4),
display_label = CONVERT(X'e8a18ce585a7e5bc95e794a8' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae5b58ce59ca8e585b6e4bb96e69687e5ad97e4b8ade79a84e5bc95e794a8e585a7e5aeb9e38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae5b58ce59ca8e585b6e4bb96e69687e5ad97e4b8ade79a84e5bc95e794a8e585a7e5aeb9e38082e58fafe794a8206369746520e5b1ace680a7e8a898e98c84e4be86e6ba90efbc9be5bc95e8999fe9809ae5b8b8e794b1e7808fe8a6bde599a8e88887e6a8a3e5bc8fe89995e79086efbc8ce4b88de5bf85e58fa6e5a496e59ca8e58583e7b4a0e585a7e9878de8a487e8bcb8e585a5e38082' USING utf8mb4),
example_code = CONVERT(X'3c703ee4bd9ce88085e8aaaaefbc9a3c7120636974653d2268747470733a2f2f6578616d706c652e636f6d2f6775696465223ee7b7b4e7bf92e883bde5b9abe58aa9e79086e8a7a3e380823c2f713e3c2f703e' USING utf8mb4),
example_description = CONVERT(X'e59ca8e58fa5e5ad90e4b8ade6a899e7a4bae4b880e6aeb5e5bc95e794a8e38082' USING utf8mb4),
sort_key = CONVERT(X'71' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d712d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d71' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'71' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746578742d6c6576656c2d73656d616e74696373' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d64666e' USING utf8mb4), CONVERT(X'3c64666e3e' USING utf8mb4), CONVERT(X'e8a193e8aa9ee5ae9ae7bea9' USING utf8mb4), CONVERT(X'e6a899e8a898e69f90e5808be8a193e8aa9ee6ada3e59ca8e8a2abe5ae9ae7bea9e79a84e5afa6e4be8be38082' USING utf8mb4), CONVERT(X'e6a899e8a898e69f90e5808be8a193e8aa9ee6ada3e59ca8e8a2abe5ae9ae7bea9e79a84e5afa6e4be8be38082e68980e59ca8e79a84e6aeb5e890bde38081e68f8fe8bfb0e6b885e596aee68896e58d80e6aeb5e68789e68f90e4be9be8a9b2e8a193e8aa9ee79a84e5ae9ae7bea9efbc9be5ae83e69cace8baabe4b88de69c83e887aae58b95e794a2e7949fe8a7a3e9878be38082' USING utf8mb4), CONVERT(X'3c703e3c64666e3ee58583e7b4a03c2f64666e3ee698af2048544d4c20e69687e4bbb6e7b590e6a78be4b8ade79a84e7b584e68890e596aee4bd8de380823c2f703e' USING utf8mb4), CONVERT(X'e68c87e587bae6ada3e59ca8e8a7a3e9878be79a84e8a193e8aa9ee38082' USING utf8mb4), CONVERT(X'64666e' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d64666e2d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c64666e3e' USING utf8mb4),
display_label = CONVERT(X'e8a193e8aa9ee5ae9ae7bea9' USING utf8mb4),
summary = CONVERT(X'e6a899e8a898e69f90e5808be8a193e8aa9ee6ada3e59ca8e8a2abe5ae9ae7bea9e79a84e5afa6e4be8be38082' USING utf8mb4),
description = CONVERT(X'e6a899e8a898e69f90e5808be8a193e8aa9ee6ada3e59ca8e8a2abe5ae9ae7bea9e79a84e5afa6e4be8be38082e68980e59ca8e79a84e6aeb5e890bde38081e68f8fe8bfb0e6b885e596aee68896e58d80e6aeb5e68789e68f90e4be9be8a9b2e8a193e8aa9ee79a84e5ae9ae7bea9efbc9be5ae83e69cace8baabe4b88de69c83e887aae58b95e794a2e7949fe8a7a3e9878be38082' USING utf8mb4),
example_code = CONVERT(X'3c703e3c64666e3ee58583e7b4a03c2f64666e3ee698af2048544d4c20e69687e4bbb6e7b590e6a78be4b8ade79a84e7b584e68890e596aee4bd8de380823c2f703e' USING utf8mb4),
example_description = CONVERT(X'e68c87e587bae6ada3e59ca8e8a7a3e9878be79a84e8a193e8aa9ee38082' USING utf8mb4),
sort_key = CONVERT(X'64666e' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d64666e2d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d64666e' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'64666e' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746578742d6c6576656c2d73656d616e74696373' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d61626272' USING utf8mb4), CONVERT(X'3c616262723e' USING utf8mb4), CONVERT(X'e7b8aee5afab' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae7b8aee5afabe68896e9a696e5ad97e6af8de7b8aee795a5e8aa9ee38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae7b8aee5afabe68896e9a696e5ad97e6af8de7b8aee795a5e8aa9ee38082e88ba5e68f90e4be9b207469746c65efbc8ce585a7e5aeb9e68789e698afe5ae8ce695b4e5b195e9968be5908de7a8b1efbc9be9878de8a681e8b387e8a88ae4b88de68789e58faae4be9de8b3b4e6bb91e9bca0e7a7bbe585a5e6898de79c8be5be97e588b0e38082' USING utf8mb4), CONVERT(X'3c703ee4bdbfe794a8203c61626272207469746c653d22487970657274657874204d61726b7570204c616e6775616765223e48544d4c3c2f616262723e20e5bbbae7ab8be7b6b2e9a081e380823c2f703e' USING utf8mb4), CONVERT(X'e782ba2048544d4c20e7b8aee5afabe68f90e4be9be5ae8ce695b4e5908de7a8b1e38082' USING utf8mb4), CONVERT(X'61626272' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d616262722d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c616262723e' USING utf8mb4),
display_label = CONVERT(X'e7b8aee5afab' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae7b8aee5afabe68896e9a696e5ad97e6af8de7b8aee795a5e8aa9ee38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae7b8aee5afabe68896e9a696e5ad97e6af8de7b8aee795a5e8aa9ee38082e88ba5e68f90e4be9b207469746c65efbc8ce585a7e5aeb9e68789e698afe5ae8ce695b4e5b195e9968be5908de7a8b1efbc9be9878de8a681e8b387e8a88ae4b88de68789e58faae4be9de8b3b4e6bb91e9bca0e7a7bbe585a5e6898de79c8be5be97e588b0e38082' USING utf8mb4),
example_code = CONVERT(X'3c703ee4bdbfe794a8203c61626272207469746c653d22487970657274657874204d61726b7570204c616e6775616765223e48544d4c3c2f616262723e20e5bbbae7ab8be7b6b2e9a081e380823c2f703e' USING utf8mb4),
example_description = CONVERT(X'e782ba2048544d4c20e7b8aee5afabe68f90e4be9be5ae8ce695b4e5908de7a8b1e38082' USING utf8mb4),
sort_key = CONVERT(X'61626272' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d616262722d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d61626272' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'61626272' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746578742d6c6576656c2d73656d616e74696373' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d72756279' USING utf8mb4), CONVERT(X'3c727562793e' USING utf8mb4), CONVERT(X'e69781e8a8bbe6a899e8a898' USING utf8mb4), CONVERT(X'e5b087e69687e5ad97e88887e585b6e69781e8a8bbe7b584e59088e59ca8e4b880e8b5b7e38082' USING utf8mb4), CONVERT(X'e5b087e69687e5ad97e88887e585b6e69781e8a8bbe7b584e59088e59ca8e4b880e8b5b7e38082e5b8b8e794a8e696bce8ae80e99fb3e68896e585b6e4bb96e79fade8a8bbe8a7a3efbc8ce690ade9858d20727420e8a1a8e7a4bae8a8bbe8a7a3e69687e5ad97efbc8ce58fafe4bdbfe794a820727020e68f90e4be9be4b88de694afe68fb4e69982e79a84e68bace8999fe38082' USING utf8mb4), CONVERT(X'3c727562793ee6bca23c72703eefbc883c2f72703e3c72743e68c3a06e3c2f72743e3c72703eefbc893c2f72703e3c2f727562793e' USING utf8mb4), CONVERT(X'e782bae6bca2e5ad97e58aa0e4b88ae8ae80e99fb3e69781e8a8bbe38082' USING utf8mb4), CONVERT(X'72756279' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d727562792d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c727562793e' USING utf8mb4),
display_label = CONVERT(X'e69781e8a8bbe6a899e8a898' USING utf8mb4),
summary = CONVERT(X'e5b087e69687e5ad97e88887e585b6e69781e8a8bbe7b584e59088e59ca8e4b880e8b5b7e38082' USING utf8mb4),
description = CONVERT(X'e5b087e69687e5ad97e88887e585b6e69781e8a8bbe7b584e59088e59ca8e4b880e8b5b7e38082e5b8b8e794a8e696bce8ae80e99fb3e68896e585b6e4bb96e79fade8a8bbe8a7a3efbc8ce690ade9858d20727420e8a1a8e7a4bae8a8bbe8a7a3e69687e5ad97efbc8ce58fafe4bdbfe794a820727020e68f90e4be9be4b88de694afe68fb4e69982e79a84e68bace8999fe38082' USING utf8mb4),
example_code = CONVERT(X'3c727562793ee6bca23c72703eefbc883c2f72703e3c72743e68c3a06e3c2f72743e3c72703eefbc893c2f72703e3c2f727562793e' USING utf8mb4),
example_description = CONVERT(X'e782bae6bca2e5ad97e58aa0e4b88ae8ae80e99fb3e69781e8a8bbe38082' USING utf8mb4),
sort_key = CONVERT(X'72756279' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d727562792d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d72756279' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'72756279' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746578742d6c6576656c2d73656d616e74696373' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d7274' USING utf8mb4), CONVERT(X'3c72743e' USING utf8mb4), CONVERT(X'e69781e8a8bbe69687e5ad97' USING utf8mb4), CONVERT(X'e8a1a8e7a4ba207275627920e4b8ade79a84e69781e8a8bbe585a7e5aeb9e38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4ba207275627920e4b8ade79a84e69781e8a8bbe585a7e5aeb9e38082e4be8be5a682e782bae5898de99da2e79a84e69687e5ad97e68f90e4be9be68bbce99fb3efbc9be68789e694bee59ca8e5b08de68789e79a84207275627920e7b590e6a78be585a7e38082' USING utf8mb4), CONVERT(X'3c727562793ee5ad973c72743e7ac3ac3c2f72743e3c2f727562793e' USING utf8mb4), CONVERT(X'e782bae69687e5ad97e68f90e4be9be8ae80e99fb3e38082' USING utf8mb4), CONVERT(X'7274' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d72742d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c72743e' USING utf8mb4),
display_label = CONVERT(X'e69781e8a8bbe69687e5ad97' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4ba207275627920e4b8ade79a84e69781e8a8bbe585a7e5aeb9e38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4ba207275627920e4b8ade79a84e69781e8a8bbe585a7e5aeb9e38082e4be8be5a682e782bae5898de99da2e79a84e69687e5ad97e68f90e4be9be68bbce99fb3efbc9be68789e694bee59ca8e5b08de68789e79a84207275627920e7b590e6a78be585a7e38082' USING utf8mb4),
example_code = CONVERT(X'3c727562793ee5ad973c72743e7ac3ac3c2f72743e3c2f727562793e' USING utf8mb4),
example_description = CONVERT(X'e782bae69687e5ad97e68f90e4be9be8ae80e99fb3e38082' USING utf8mb4),
sort_key = CONVERT(X'7274' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d72742d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d7274' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'7274' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746578742d6c6576656c2d73656d616e74696373' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d7270' USING utf8mb4), CONVERT(X'3c72703e' USING utf8mb4), CONVERT(X'e69781e8a8bbe58299e68fb4e68bace8999f' USING utf8mb4), CONVERT(X'e68f90e4be9be784a1e6b395e59188e78fbe207275627920e69781e8a8bbe69982e4bdbfe794a8e79a84e68bace8999fe69687e5ad97e38082' USING utf8mb4), CONVERT(X'e68f90e4be9be784a1e6b395e59188e78fbe207275627920e69781e8a8bbe69982e4bdbfe794a8e79a84e68bace8999fe69687e5ad97e38082e694afe68fb4207275627920e79a84e59188e78fbee696b9e5bc8fe9809ae5b8b8e4b88de9a1afe7a4bae98099e4ba9be68bace8999fefbc9be68789e9858de5908820727420e4bdbfe794a8e38082' USING utf8mb4), CONVERT(X'3c727562793ee8aa9e3c72703eefbc883c2f72703e3c72743e79c7943c2f72743e3c72703eefbc893c2f72703e3c2f727562793e' USING utf8mb4), CONVERT(X'e59ca8e8ae80e99fb3e69781e8a8bbe5898de5be8ce68f90e4be9be58299e68fb4e68bace8999fe38082' USING utf8mb4), CONVERT(X'7270' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d72702d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c72703e' USING utf8mb4),
display_label = CONVERT(X'e69781e8a8bbe58299e68fb4e68bace8999f' USING utf8mb4),
summary = CONVERT(X'e68f90e4be9be784a1e6b395e59188e78fbe207275627920e69781e8a8bbe69982e4bdbfe794a8e79a84e68bace8999fe69687e5ad97e38082' USING utf8mb4),
description = CONVERT(X'e68f90e4be9be784a1e6b395e59188e78fbe207275627920e69781e8a8bbe69982e4bdbfe794a8e79a84e68bace8999fe69687e5ad97e38082e694afe68fb4207275627920e79a84e59188e78fbee696b9e5bc8fe9809ae5b8b8e4b88de9a1afe7a4bae98099e4ba9be68bace8999fefbc9be68789e9858de5908820727420e4bdbfe794a8e38082' USING utf8mb4),
example_code = CONVERT(X'3c727562793ee8aa9e3c72703eefbc883c2f72703e3c72743e79c7943c2f72743e3c72703eefbc893c2f72703e3c2f727562793e' USING utf8mb4),
example_description = CONVERT(X'e59ca8e8ae80e99fb3e69781e8a8bbe5898de5be8ce68f90e4be9be58299e68fb4e68bace8999fe38082' USING utf8mb4),
sort_key = CONVERT(X'7270' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d72702d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d7270' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'7270' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746578742d6c6576656c2d73656d616e74696373' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d64617461' USING utf8mb4), CONVERT(X'3c646174613e' USING utf8mb4), CONVERT(X'e6a99fe599a8e58fafe8ae80e8b387e69699' USING utf8mb4), CONVERT(X'e5b087e58fafe8a68be585a7e5aeb9e88887e6a99fe599a8e58fafe8ae80e79a84e580bce5bbbae7ab8be9979ce881afe38082' USING utf8mb4), CONVERT(X'e5b087e58fafe8a68be585a7e5aeb9e88887e6a99fe599a8e58fafe8ae80e79a84e580bce5bbbae7ab8be9979ce881afe38082e9808fe9818e2076616c756520e4bf9de5ad98e7a88be5bc8fe4bdbfe794a8e79a84e580bcefbc9be697a5e69c9fe68896e69982e99693e8b387e69699e9809ae5b8b8e69bb4e981a9e59088e4bdbfe794a82074696d65e38082' USING utf8mb4), CONVERT(X'3c703ee59586e59381efbc9a3c646174612076616c75653d22534b552d303031223ee585a5e99680e69599e69d903c2f646174613e3c2f703e' USING utf8mb4), CONVERT(X'e8ae93e59586e59381e5908de7a8b1e5b08de68789e585a7e983a8e59586e59381e7b7a8e8999fe38082' USING utf8mb4), CONVERT(X'64617461' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d646174612d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c646174613e' USING utf8mb4),
display_label = CONVERT(X'e6a99fe599a8e58fafe8ae80e8b387e69699' USING utf8mb4),
summary = CONVERT(X'e5b087e58fafe8a68be585a7e5aeb9e88887e6a99fe599a8e58fafe8ae80e79a84e580bce5bbbae7ab8be9979ce881afe38082' USING utf8mb4),
description = CONVERT(X'e5b087e58fafe8a68be585a7e5aeb9e88887e6a99fe599a8e58fafe8ae80e79a84e580bce5bbbae7ab8be9979ce881afe38082e9808fe9818e2076616c756520e4bf9de5ad98e7a88be5bc8fe4bdbfe794a8e79a84e580bcefbc9be697a5e69c9fe68896e69982e99693e8b387e69699e9809ae5b8b8e69bb4e981a9e59088e4bdbfe794a82074696d65e38082' USING utf8mb4),
example_code = CONVERT(X'3c703ee59586e59381efbc9a3c646174612076616c75653d22534b552d303031223ee585a5e99680e69599e69d903c2f646174613e3c2f703e' USING utf8mb4),
example_description = CONVERT(X'e8ae93e59586e59381e5908de7a8b1e5b08de68789e585a7e983a8e59586e59381e7b7a8e8999fe38082' USING utf8mb4),
sort_key = CONVERT(X'64617461' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d646174612d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d64617461' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'64617461' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746578742d6c6576656c2d73656d616e74696373' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d74696d65' USING utf8mb4), CONVERT(X'3c74696d653e' USING utf8mb4), CONVERT(X'e697a5e69c9fe88887e69982e99693' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae697a5e69c9fe38081e69982e99693e68896e58581e8a8b1e6a0bce5bc8fe79a84e69982e99693e995b7e5baa6e38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae697a5e69c9fe38081e69982e99693e68896e58581e8a8b1e6a0bce5bc8fe79a84e69982e99693e995b7e5baa6e38082e58fafe794a8206461746574696d6520e68f90e4be9be6a99fe599a8e58fafe8ae80e580bcefbc8ce8ae93e795abe99da2e69687e5ad97e68ea1e794a8e981a9e59088e8ae80e88085e79a84e8a1a8e98194e696b9e5bc8fe38082' USING utf8mb4), CONVERT(X'3c703ee799bce5b883e697a5e69c9fefbc9a3c74696d65206461746574696d653d22323032362d31312d3130223e3230323620e5b9b420313120e69c8820313020e697a53c2f74696d653e3c2f703e' USING utf8mb4), CONVERT(X'e794a8e6a99fe599a8e58fafe8ae80e697a5e69c9fe5b08de68789e4b8ade69687e697a5e69c9fe9a1afe7a4bae38082' USING utf8mb4), CONVERT(X'74696d65' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d74696d652d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c74696d653e' USING utf8mb4),
display_label = CONVERT(X'e697a5e69c9fe88887e69982e99693' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae697a5e69c9fe38081e69982e99693e68896e58581e8a8b1e6a0bce5bc8fe79a84e69982e99693e995b7e5baa6e38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae697a5e69c9fe38081e69982e99693e68896e58581e8a8b1e6a0bce5bc8fe79a84e69982e99693e995b7e5baa6e38082e58fafe794a8206461746574696d6520e68f90e4be9be6a99fe599a8e58fafe8ae80e580bcefbc8ce8ae93e795abe99da2e69687e5ad97e68ea1e794a8e981a9e59088e8ae80e88085e79a84e8a1a8e98194e696b9e5bc8fe38082' USING utf8mb4),
example_code = CONVERT(X'3c703ee799bce5b883e697a5e69c9fefbc9a3c74696d65206461746574696d653d22323032362d31312d3130223e3230323620e5b9b420313120e69c8820313020e697a53c2f74696d653e3c2f703e' USING utf8mb4),
example_description = CONVERT(X'e794a8e6a99fe599a8e58fafe8ae80e697a5e69c9fe5b08de68789e4b8ade69687e697a5e69c9fe9a1afe7a4bae38082' USING utf8mb4),
sort_key = CONVERT(X'74696d65' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d74696d652d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d74696d65' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'74696d65' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746578742d6c6576656c2d73656d616e74696373' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d636f6465' USING utf8mb4), CONVERT(X'3c636f64653e' USING utf8mb4), CONVERT(X'e7a88be5bc8fe7a2bc' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae4b880e6aeb5e99bbbe885a6e7a88be5bc8fe7a2bce38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae4b880e6aeb5e99bbbe885a6e7a88be5bc8fe7a2bce38082e8a18ce585a7e7a88be5bc8fe7a2bce58fafe79bb4e68ea5e4bdbfe794a8efbc9be5a49ae8a18ce4b894e99c80e4bf9de79599e7a9bae799bde69982e690ade9858d20707265efbc8c48544d4c20e789b9e6ae8ae5ad97e58583e4bb8de99c80e8b7b3e884abe38082' USING utf8mb4), CONVERT(X'3c703ee4bdbfe794a8203c636f64653e7072696e74282248656c6c6f22293c2f636f64653e20e8bcb8e587bae69687e5ad97e380823c2f703e' USING utf8mb4), CONVERT(X'e59ca8e58fa5e5ad90e4b8ade9a1afe7a4bae7a88be5bc8fe7a2bce78987e6aeb5e38082' USING utf8mb4), CONVERT(X'636f6465' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d636f64652d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c636f64653e' USING utf8mb4),
display_label = CONVERT(X'e7a88be5bc8fe7a2bc' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae4b880e6aeb5e99bbbe885a6e7a88be5bc8fe7a2bce38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae4b880e6aeb5e99bbbe885a6e7a88be5bc8fe7a2bce38082e8a18ce585a7e7a88be5bc8fe7a2bce58fafe79bb4e68ea5e4bdbfe794a8efbc9be5a49ae8a18ce4b894e99c80e4bf9de79599e7a9bae799bde69982e690ade9858d20707265efbc8c48544d4c20e789b9e6ae8ae5ad97e58583e4bb8de99c80e8b7b3e884abe38082' USING utf8mb4),
example_code = CONVERT(X'3c703ee4bdbfe794a8203c636f64653e7072696e74282248656c6c6f22293c2f636f64653e20e8bcb8e587bae69687e5ad97e380823c2f703e' USING utf8mb4),
example_description = CONVERT(X'e59ca8e58fa5e5ad90e4b8ade9a1afe7a4bae7a88be5bc8fe7a2bce78987e6aeb5e38082' USING utf8mb4),
sort_key = CONVERT(X'636f6465' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d636f64652d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d636f6465' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'636f6465' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746578742d6c6576656c2d73656d616e74696373' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d766172' USING utf8mb4), CONVERT(X'3c7661723e' USING utf8mb4), CONVERT(X'e8ae8ae695b8' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae695b8e5adb8e68896e7a88be5bc8fe8aa9ee5a283e4b8ade79a84e8ae8ae695b8e38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae695b8e5adb8e68896e7a88be5bc8fe8aa9ee5a283e4b8ade79a84e8ae8ae695b8e38082e58fafe4bba5e698afe7aca6e8999fe38081e58f83e695b8e68896e8ae8ae695b8e5908de7a8b1efbc9be5ae83e58faae68f90e4be9be69687e5ad97e8aa9ee6848fefbc8ce4b88de69c83e5aea3e5918ae68896e59fb7e8a18ce8ae8ae695b8e38082' USING utf8mb4), CONVERT(X'3c703ee995b7e696b9e5bda2e99da2e7a98de782ba203c7661723e773c2f7661723e20c397203c7661723e683c2f7661723ee380823c2f703e' USING utf8mb4), CONVERT(X'e6a899e8a898e585ace5bc8fe4b8ade79a84e5aface5baa6e88887e9ab98e5baa6e8ae8ae695b8e38082' USING utf8mb4), CONVERT(X'766172' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d7661722d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c7661723e' USING utf8mb4),
display_label = CONVERT(X'e8ae8ae695b8' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae695b8e5adb8e68896e7a88be5bc8fe8aa9ee5a283e4b8ade79a84e8ae8ae695b8e38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae695b8e5adb8e68896e7a88be5bc8fe8aa9ee5a283e4b8ade79a84e8ae8ae695b8e38082e58fafe4bba5e698afe7aca6e8999fe38081e58f83e695b8e68896e8ae8ae695b8e5908de7a8b1efbc9be5ae83e58faae68f90e4be9be69687e5ad97e8aa9ee6848fefbc8ce4b88de69c83e5aea3e5918ae68896e59fb7e8a18ce8ae8ae695b8e38082' USING utf8mb4),
example_code = CONVERT(X'3c703ee995b7e696b9e5bda2e99da2e7a98de782ba203c7661723e773c2f7661723e20c397203c7661723e683c2f7661723ee380823c2f703e' USING utf8mb4),
example_description = CONVERT(X'e6a899e8a898e585ace5bc8fe4b8ade79a84e5aface5baa6e88887e9ab98e5baa6e8ae8ae695b8e38082' USING utf8mb4),
sort_key = CONVERT(X'766172' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d7661722d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d766172' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'766172' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746578742d6c6576656c2d73656d616e74696373' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d73616d70' USING utf8mb4), CONVERT(X'3c73616d703e' USING utf8mb4), CONVERT(X'e7a88be5bc8fe8bcb8e587ba' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae7a88be5bc8fe68896e99bbbe885a6e7b3bbe7b5b1e79a84e8bcb8e587bae7af84e4be8be38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae7a88be5bc8fe68896e99bbbe885a6e7b3bbe7b5b1e79a84e8bcb8e587bae7af84e4be8be38082e4be8be5a682e7b582e7abafe6a99fe7b590e69e9ce68896e7b3bbe7b5b1e8a88ae681afefbc9be88887e794a8e4be86e6a899e8a898e7a88be5bc8fe7a2bce79a8420636f646520e4b88de5908ce38082' USING utf8mb4), CONVERT(X'3c703ee7b582e7abafe6a99fe9a1afe7a4baefbc9a3c73616d703ee58cafe585a5e5ae8ce688903c2f73616d703e3c2f703e' USING utf8mb4), CONVERT(X'e6a899e8a898e7b3bbe7b5b1e8bcb8e587bae79a84e8a88ae681afe38082' USING utf8mb4), CONVERT(X'73616d70' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d73616d702d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c73616d703e' USING utf8mb4),
display_label = CONVERT(X'e7a88be5bc8fe8bcb8e587ba' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae7a88be5bc8fe68896e99bbbe885a6e7b3bbe7b5b1e79a84e8bcb8e587bae7af84e4be8be38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae7a88be5bc8fe68896e99bbbe885a6e7b3bbe7b5b1e79a84e8bcb8e587bae7af84e4be8be38082e4be8be5a682e7b582e7abafe6a99fe7b590e69e9ce68896e7b3bbe7b5b1e8a88ae681afefbc9be88887e794a8e4be86e6a899e8a898e7a88be5bc8fe7a2bce79a8420636f646520e4b88de5908ce38082' USING utf8mb4),
example_code = CONVERT(X'3c703ee7b582e7abafe6a99fe9a1afe7a4baefbc9a3c73616d703ee58cafe585a5e5ae8ce688903c2f73616d703e3c2f703e' USING utf8mb4),
example_description = CONVERT(X'e6a899e8a898e7b3bbe7b5b1e8bcb8e587bae79a84e8a88ae681afe38082' USING utf8mb4),
sort_key = CONVERT(X'73616d70' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d73616d702d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d73616d70' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'73616d70' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746578742d6c6576656c2d73656d616e74696373' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d6b6264' USING utf8mb4), CONVERT(X'3c6b62643e' USING utf8mb4), CONVERT(X'e4bdbfe794a8e88085e8bcb8e585a5' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae4bdbfe794a8e88085e8bcb8e585a5e79a84e585a7e5aeb9e38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae4bdbfe794a8e88085e8bcb8e585a5e79a84e585a7e5aeb9e38082e5b8b8e794a8e4be86e6a899e7a4bae68c89e98db5efbc8ce4b99fe58fafe4bba3e8a1a8e585b6e4bb96e8bcb8e585a5e696b9e5bc8fefbc9be58fafe5b7a2e78b80e8a1a8e7a4bae68c89e98db5e7b584e59088e38082' USING utf8mb4), CONVERT(X'3c703ee68c89e4b88b203c6b62643e3c6b62643e4374726c3c2f6b62643e202b203c6b62643e533c2f6b62643e3c2f6b62643e20e584b2e5ad98e380823c2f703e' USING utf8mb4), CONVERT(X'e6a899e7a4bae584b2e5ad98e6938de4bd9ce79a84e68c89e98db5e7b584e59088e38082' USING utf8mb4), CONVERT(X'6b6264' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d6b62642d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c6b62643e' USING utf8mb4),
display_label = CONVERT(X'e4bdbfe794a8e88085e8bcb8e585a5' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae4bdbfe794a8e88085e8bcb8e585a5e79a84e585a7e5aeb9e38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae4bdbfe794a8e88085e8bcb8e585a5e79a84e585a7e5aeb9e38082e5b8b8e794a8e4be86e6a899e7a4bae68c89e98db5efbc8ce4b99fe58fafe4bba3e8a1a8e585b6e4bb96e8bcb8e585a5e696b9e5bc8fefbc9be58fafe5b7a2e78b80e8a1a8e7a4bae68c89e98db5e7b584e59088e38082' USING utf8mb4),
example_code = CONVERT(X'3c703ee68c89e4b88b203c6b62643e3c6b62643e4374726c3c2f6b62643e202b203c6b62643e533c2f6b62643e3c2f6b62643e20e584b2e5ad98e380823c2f703e' USING utf8mb4),
example_description = CONVERT(X'e6a899e7a4bae584b2e5ad98e6938de4bd9ce79a84e68c89e98db5e7b584e59088e38082' USING utf8mb4),
sort_key = CONVERT(X'6b6264' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d6b62642d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d6b6264' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'6b6264' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746578742d6c6576656c2d73656d616e74696373' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d737562' USING utf8mb4), CONVERT(X'3c7375623e' USING utf8mb4), CONVERT(X'e4b88be6a899' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae585b7e69c89e69687e5ad97e68896e7aca6e8999fe6848fe7bea9e79a84e4b88be6a899e38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae585b7e69c89e69687e5ad97e68896e7aca6e8999fe6848fe7bea9e79a84e4b88be6a899e38082e981a9e59088e58c96e5adb8e5bc8fe7ad89e685a3e794a8e8a1a8e7a4bae696b9e5bc8fefbc9be596aee7b494e782bae4ba86e4bd8de7bdaee5818fe7a7bbe79a84e8a39de9a3bee69588e69e9ce68789e4bdbfe794a820435353e38082' USING utf8mb4), CONVERT(X'3c703ee6b0b4e79a84e58c96e5adb8e5bc8fe698af20483c7375623e323c2f7375623e4fe380823c2f703e' USING utf8mb4), CONVERT(X'e59188e78fbee58c96e5adb8e5bc8fe4b8ade79a84e4b88be6a899e38082' USING utf8mb4), CONVERT(X'737562' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d7375622d616e642d7375702d656c656d656e7473' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c7375623e' USING utf8mb4),
display_label = CONVERT(X'e4b88be6a899' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae585b7e69c89e69687e5ad97e68896e7aca6e8999fe6848fe7bea9e79a84e4b88be6a899e38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae585b7e69c89e69687e5ad97e68896e7aca6e8999fe6848fe7bea9e79a84e4b88be6a899e38082e981a9e59088e58c96e5adb8e5bc8fe7ad89e685a3e794a8e8a1a8e7a4bae696b9e5bc8fefbc9be596aee7b494e782bae4ba86e4bd8de7bdaee5818fe7a7bbe79a84e8a39de9a3bee69588e69e9ce68789e4bdbfe794a820435353e38082' USING utf8mb4),
example_code = CONVERT(X'3c703ee6b0b4e79a84e58c96e5adb8e5bc8fe698af20483c7375623e323c2f7375623e4fe380823c2f703e' USING utf8mb4),
example_description = CONVERT(X'e59188e78fbee58c96e5adb8e5bc8fe4b8ade79a84e4b88be6a899e38082' USING utf8mb4),
sort_key = CONVERT(X'737562' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d7375622d616e642d7375702d656c656d656e7473' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d737562' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'737562' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746578742d6c6576656c2d73656d616e74696373' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d737570' USING utf8mb4), CONVERT(X'3c7375703e' USING utf8mb4), CONVERT(X'e4b88ae6a899' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae585b7e69c89e69687e5ad97e68896e7aca6e8999fe6848fe7bea9e79a84e4b88ae6a899e38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae585b7e69c89e69687e5ad97e68896e7aca6e8999fe6848fe7bea9e79a84e4b88ae6a899e38082e981a9e59088e68c87e695b8e68896e789b9e5ae9ae685a3e794a8e5afabe6b395efbc9be4b88de68789e58faae794a8e696bce4bbbbe6848fe79a84e8a696e8a6bae4bd8de7bdaee8aabfe695b4e38082' USING utf8mb4), CONVERT(X'3c703ee99da2e7a98de596aee4bd8de782ba206d3c7375703e323c2f7375703ee380823c2f703e' USING utf8mb4), CONVERT(X'e59188e78fbee99da2e7a98de596aee4bd8de79a84e4b88ae6a899e38082' USING utf8mb4), CONVERT(X'737570' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d7375622d616e642d7375702d656c656d656e7473' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c7375703e' USING utf8mb4),
display_label = CONVERT(X'e4b88ae6a899' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae585b7e69c89e69687e5ad97e68896e7aca6e8999fe6848fe7bea9e79a84e4b88ae6a899e38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae585b7e69c89e69687e5ad97e68896e7aca6e8999fe6848fe7bea9e79a84e4b88ae6a899e38082e981a9e59088e68c87e695b8e68896e789b9e5ae9ae685a3e794a8e5afabe6b395efbc9be4b88de68789e58faae794a8e696bce4bbbbe6848fe79a84e8a696e8a6bae4bd8de7bdaee8aabfe695b4e38082' USING utf8mb4),
example_code = CONVERT(X'3c703ee99da2e7a98de596aee4bd8de782ba206d3c7375703e323c2f7375703ee380823c2f703e' USING utf8mb4),
example_description = CONVERT(X'e59188e78fbee99da2e7a98de596aee4bd8de79a84e4b88ae6a899e38082' USING utf8mb4),
sort_key = CONVERT(X'737570' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d7375622d616e642d7375702d656c656d656e7473' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d737570' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'737570' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746578742d6c6576656c2d73656d616e74696373' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d69' USING utf8mb4), CONVERT(X'3c693e' USING utf8mb4), CONVERT(X'e795b0e8b3aae8aa9ee6b0a3e69687e5ad97' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae88887e591a8e59c8de69687e5ad97e4b88de5908ce8aa9ee6b0a3e68896e680a7e8b3aae79a84e69687e5ad97e38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae88887e591a8e59c8de69687e5ad97e4b88de5908ce8aa9ee6b0a3e68896e680a7e8b3aae79a84e69687e5ad97e38082e4be8be5a682e8a193e8aa9ee38081e58886e9a19ee5adb8e5908de7a8b1e38081e5bf83e4b8ade683b3e6b395e68896e585b6e4bb96e685a3e794a8e6a899e8a898efbc9be4b88de596aee7b494e7ad89e696bce6969ce9ab94efbc8ce4b99fe4b88de4bba3e8a1a8e8aa9ee6b0a3e5bcb7e8aabfe38082' USING utf8mb4), CONVERT(X'3c703ee6a48de789a9e5adb8e5908de7a8b1e698af203c69206c616e673d226c61223e43616d656c6c69612073696e656e7369733c2f693ee380823c2f703e' USING utf8mb4), CONVERT(X'e6a899e8a898e88887e4b8ade69687e69598e8bfb0e4b88de5908ce680a7e8b3aae79a84e5adb8e5908de38082' USING utf8mb4), CONVERT(X'69' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d692d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c693e' USING utf8mb4),
display_label = CONVERT(X'e795b0e8b3aae8aa9ee6b0a3e69687e5ad97' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae88887e591a8e59c8de69687e5ad97e4b88de5908ce8aa9ee6b0a3e68896e680a7e8b3aae79a84e69687e5ad97e38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae88887e591a8e59c8de69687e5ad97e4b88de5908ce8aa9ee6b0a3e68896e680a7e8b3aae79a84e69687e5ad97e38082e4be8be5a682e8a193e8aa9ee38081e58886e9a19ee5adb8e5908de7a8b1e38081e5bf83e4b8ade683b3e6b395e68896e585b6e4bb96e685a3e794a8e6a899e8a898efbc9be4b88de596aee7b494e7ad89e696bce6969ce9ab94efbc8ce4b99fe4b88de4bba3e8a1a8e8aa9ee6b0a3e5bcb7e8aabfe38082' USING utf8mb4),
example_code = CONVERT(X'3c703ee6a48de789a9e5adb8e5908de7a8b1e698af203c69206c616e673d226c61223e43616d656c6c69612073696e656e7369733c2f693ee380823c2f703e' USING utf8mb4),
example_description = CONVERT(X'e6a899e8a898e88887e4b8ade69687e69598e8bfb0e4b88de5908ce680a7e8b3aae79a84e5adb8e5908de38082' USING utf8mb4),
sort_key = CONVERT(X'69' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d692d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d69' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'69' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746578742d6c6576656c2d73656d616e74696373' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d62' USING utf8mb4), CONVERT(X'3c623e' USING utf8mb4), CONVERT(X'e5bc95e8b5b7e6b3a8e6848fe79a84e69687e5ad97' USING utf8mb4), CONVERT(X'e8ae93e69687e5ad97e58f97e588b0e6b3a8e6848fefbc8ce4bd86e4b88de8a1a8e7a4bae9a18de5a496e9878de8a681e680a7e68896e4b88de5908ce8aa9ee6b0a3e38082' USING utf8mb4), CONVERT(X'e8ae93e69687e5ad97e58f97e588b0e6b3a8e6848fefbc8ce4bd86e4b88de8a1a8e7a4bae9a18de5a496e9878de8a681e680a7e68896e4b88de5908ce8aa9ee6b0a3e38082e4be8be5a682e69198e8a681e4b8ade79a84e9979ce98db5e5ad97e68896e8a995e8ab96e4b8ade79a84e59586e59381e5908de7a8b1efbc9be596aee7b494e7b297e9ab94e6a8a3e5bc8fe68789e4bdbfe794a820435353e38082' USING utf8mb4), CONVERT(X'3c703ee69cace8aab2e9979ce98db5e5ad97efbc9a3c623ee58583e7b4a03c2f623ee888873c623ee5b1ace680a73c2f623ee380823c2f703e' USING utf8mb4), CONVERT(X'e6a899e7a4bae99c80e8a681e6b3a8e6848fe79a84e9979ce98db5e5ad97e38082' USING utf8mb4), CONVERT(X'62' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d622d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c623e' USING utf8mb4),
display_label = CONVERT(X'e5bc95e8b5b7e6b3a8e6848fe79a84e69687e5ad97' USING utf8mb4),
summary = CONVERT(X'e8ae93e69687e5ad97e58f97e588b0e6b3a8e6848fefbc8ce4bd86e4b88de8a1a8e7a4bae9a18de5a496e9878de8a681e680a7e68896e4b88de5908ce8aa9ee6b0a3e38082' USING utf8mb4),
description = CONVERT(X'e8ae93e69687e5ad97e58f97e588b0e6b3a8e6848fefbc8ce4bd86e4b88de8a1a8e7a4bae9a18de5a496e9878de8a681e680a7e68896e4b88de5908ce8aa9ee6b0a3e38082e4be8be5a682e69198e8a681e4b8ade79a84e9979ce98db5e5ad97e68896e8a995e8ab96e4b8ade79a84e59586e59381e5908de7a8b1efbc9be596aee7b494e7b297e9ab94e6a8a3e5bc8fe68789e4bdbfe794a820435353e38082' USING utf8mb4),
example_code = CONVERT(X'3c703ee69cace8aab2e9979ce98db5e5ad97efbc9a3c623ee58583e7b4a03c2f623ee888873c623ee5b1ace680a73c2f623ee380823c2f703e' USING utf8mb4),
example_description = CONVERT(X'e6a899e7a4bae99c80e8a681e6b3a8e6848fe79a84e9979ce98db5e5ad97e38082' USING utf8mb4),
sort_key = CONVERT(X'62' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d622d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d62' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'62' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746578742d6c6576656c2d73656d616e74696373' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d75' USING utf8mb4), CONVERT(X'3c753e' USING utf8mb4), CONVERT(X'e99d9ee69687e5ad97e8a8bbe8a898' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae5b8b6e69c89e6988ee7a2bae59188e78fbee696b9e5bc8fe79a84e99d9ee69687e5ad97e8a8bbe8a898e38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae5b8b6e69c89e6988ee7a2bae59188e78fbee696b9e5bc8fe79a84e99d9ee69687e5ad97e8a8bbe8a898e38082e4be8be5a682e68bbce5ad97e98cafe8aaa4e6a899e7a4baefbc9be4b88de698afe4b880e888ace79a84e5ba95e7b79ae6a8a3e5bc8fe5b7a5e585b7efbc8ce68789e981bfe5858de88887e8b685e980a3e7b590e5a496e8a780e6b7b7e6b786e38082' USING utf8mb4), CONVERT(X'3c703ee68bbce5ad97e5be85e4bfaee6ada3efbc9a3c753e726563696576653c2f753ee380823c2f703e' USING utf8mb4), CONVERT(X'e6a899e8a898e99c80e8a681e69bb4e6ada3e79a84e68bbce5ad97e38082' USING utf8mb4), CONVERT(X'75' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d752d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c753e' USING utf8mb4),
display_label = CONVERT(X'e99d9ee69687e5ad97e8a8bbe8a898' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae5b8b6e69c89e6988ee7a2bae59188e78fbee696b9e5bc8fe79a84e99d9ee69687e5ad97e8a8bbe8a898e38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae5b8b6e69c89e6988ee7a2bae59188e78fbee696b9e5bc8fe79a84e99d9ee69687e5ad97e8a8bbe8a898e38082e4be8be5a682e68bbce5ad97e98cafe8aaa4e6a899e7a4baefbc9be4b88de698afe4b880e888ace79a84e5ba95e7b79ae6a8a3e5bc8fe5b7a5e585b7efbc8ce68789e981bfe5858de88887e8b685e980a3e7b590e5a496e8a780e6b7b7e6b786e38082' USING utf8mb4),
example_code = CONVERT(X'3c703ee68bbce5ad97e5be85e4bfaee6ada3efbc9a3c753e726563696576653c2f753ee380823c2f703e' USING utf8mb4),
example_description = CONVERT(X'e6a899e8a898e99c80e8a681e69bb4e6ada3e79a84e68bbce5ad97e38082' USING utf8mb4),
sort_key = CONVERT(X'75' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d752d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d75' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'75' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746578742d6c6576656c2d73656d616e74696373' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d6d61726b' USING utf8mb4), CONVERT(X'3c6d61726b3e' USING utf8mb4), CONVERT(X'e9878de9bb9ee6a899e8a898' USING utf8mb4), CONVERT(X'e6a899e7a4bae59ca8e79baee5898de68385e5a283e4b8ade789b9e588a5e79bb8e9979ce79a84e585a7e5aeb9e38082' USING utf8mb4), CONVERT(X'e6a899e7a4bae59ca8e79baee5898de68385e5a283e4b8ade789b9e588a5e79bb8e9979ce79a84e585a7e5aeb9e38082e4be8be5a682e6909ce5b08be591bde4b8ade79a84e69687e5ad97e68896e5bc95e794a8e585a7e5aeb9e4b8ade8a681e68c87e587bae79a84e78987e6aeb5efbc9be4b88de7ad89e696bc207374726f6e6720e79a84e9878de8a681e680a7e8aa9ee6848fe38082' USING utf8mb4), CONVERT(X'3c703ee6909ce5b08be7b590e69e9cefbc9ae5adb8e7bf92203c6d61726b3e48544d4c3c2f6d61726b3e20e58583e7b4a0e380823c2f703e' USING utf8mb4), CONVERT(X'e7aa81e9a1afe6909ce5b08be591bde4b8ade79a84e8a99ee38082' USING utf8mb4), CONVERT(X'6d61726b' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d6d61726b2d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c6d61726b3e' USING utf8mb4),
display_label = CONVERT(X'e9878de9bb9ee6a899e8a898' USING utf8mb4),
summary = CONVERT(X'e6a899e7a4bae59ca8e79baee5898de68385e5a283e4b8ade789b9e588a5e79bb8e9979ce79a84e585a7e5aeb9e38082' USING utf8mb4),
description = CONVERT(X'e6a899e7a4bae59ca8e79baee5898de68385e5a283e4b8ade789b9e588a5e79bb8e9979ce79a84e585a7e5aeb9e38082e4be8be5a682e6909ce5b08be591bde4b8ade79a84e69687e5ad97e68896e5bc95e794a8e585a7e5aeb9e4b8ade8a681e68c87e587bae79a84e78987e6aeb5efbc9be4b88de7ad89e696bc207374726f6e6720e79a84e9878de8a681e680a7e8aa9ee6848fe38082' USING utf8mb4),
example_code = CONVERT(X'3c703ee6909ce5b08be7b590e69e9cefbc9ae5adb8e7bf92203c6d61726b3e48544d4c3c2f6d61726b3e20e58583e7b4a0e380823c2f703e' USING utf8mb4),
example_description = CONVERT(X'e7aa81e9a1afe6909ce5b08be591bde4b8ade79a84e8a99ee38082' USING utf8mb4),
sort_key = CONVERT(X'6d61726b' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d6d61726b2d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d6d61726b' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'6d61726b' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746578742d6c6576656c2d73656d616e74696373' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d626469' USING utf8mb4), CONVERT(X'3c6264693e' USING utf8mb4), CONVERT(X'e99b99e59091e69687e5ad97e99a94e99ba2' USING utf8mb4), CONVERT(X'e5b087e4b880e6aeb5e69687e5ad97e79a84e696b9e59091e680a7e88887e591a8e59c8de69687e5ad97e99a94e99ba2e38082' USING utf8mb4), CONVERT(X'e5b087e4b880e6aeb5e69687e5ad97e79a84e696b9e59091e680a7e88887e591a8e59c8de69687e5ad97e99a94e99ba2e38082e981a9e59088e696b9e59091e69caae79fa5e79a84e4bdbfe794a8e88085e8bcb8e585a5efbc8ce981bfe5858de6b7b7e59088e5b7a6e58fb3e69bb8e5afabe696b9e59091e69982e5bdb1e99fbfe591a8e59c8de6a899e9bb9ee88887e69687e5ad97e9a086e5ba8fe38082' USING utf8mb4), CONVERT(X'3c703ee4bdbfe794a8e88085efbc9a3c6264693ed8b9d984d98a3c2f6264693eefbc8ce6ada1e8bf8ee59b9ee4be86e380823c2f703e' USING utf8mb4), CONVERT(X'e99a94e99ba2e696b9e59091e69caae79fa5e79a84e4bdbfe794a8e88085e5908de7a8b1e38082' USING utf8mb4), CONVERT(X'626469' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d6264692d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c6264693e' USING utf8mb4),
display_label = CONVERT(X'e99b99e59091e69687e5ad97e99a94e99ba2' USING utf8mb4),
summary = CONVERT(X'e5b087e4b880e6aeb5e69687e5ad97e79a84e696b9e59091e680a7e88887e591a8e59c8de69687e5ad97e99a94e99ba2e38082' USING utf8mb4),
description = CONVERT(X'e5b087e4b880e6aeb5e69687e5ad97e79a84e696b9e59091e680a7e88887e591a8e59c8de69687e5ad97e99a94e99ba2e38082e981a9e59088e696b9e59091e69caae79fa5e79a84e4bdbfe794a8e88085e8bcb8e585a5efbc8ce981bfe5858de6b7b7e59088e5b7a6e58fb3e69bb8e5afabe696b9e59091e69982e5bdb1e99fbfe591a8e59c8de6a899e9bb9ee88887e69687e5ad97e9a086e5ba8fe38082' USING utf8mb4),
example_code = CONVERT(X'3c703ee4bdbfe794a8e88085efbc9a3c6264693ed8b9d984d98a3c2f6264693eefbc8ce6ada1e8bf8ee59b9ee4be86e380823c2f703e' USING utf8mb4),
example_description = CONVERT(X'e99a94e99ba2e696b9e59091e69caae79fa5e79a84e4bdbfe794a8e88085e5908de7a8b1e38082' USING utf8mb4),
sort_key = CONVERT(X'626469' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d6264692d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d626469' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'626469' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746578742d6c6576656c2d73656d616e74696373' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d62646f' USING utf8mb4), CONVERT(X'3c62646f3e' USING utf8mb4), CONVERT(X'e69687e5ad97e696b9e59091e8a686e5afab' USING utf8mb4), CONVERT(X'e6988ee7a2bae8a686e5afabe69687e5ad97e79a84e59188e78fbee696b9e59091e38082' USING utf8mb4), CONVERT(X'e6988ee7a2bae8a686e5afabe69687e5ad97e79a84e59188e78fbee696b9e59091e38082e5bf85e9a088e4bdbfe794a82064697220e68c87e5ae9a206c747220e688962072746cefbc9be99c80e8a681e99a94e99ba2e8808ce99d9ee5bcb7e588b6e694b9e5afabe696b9e59091e69982efbc8ce4bdbfe794a820626469e38082' USING utf8mb4), CONVERT(X'3c703e3c62646f206469723d2272746c223e4142433c2f62646f3e3c2f703e' USING utf8mb4), CONVERT(X'e68c87e5ae9ae69687e5ad97e68ea1e794a8e794b1e58fb3e887b3e5b7a6e79a84e59188e78fbee696b9e59091e38082' USING utf8mb4), CONVERT(X'62646f' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d62646f2d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c62646f3e' USING utf8mb4),
display_label = CONVERT(X'e69687e5ad97e696b9e59091e8a686e5afab' USING utf8mb4),
summary = CONVERT(X'e6988ee7a2bae8a686e5afabe69687e5ad97e79a84e59188e78fbee696b9e59091e38082' USING utf8mb4),
description = CONVERT(X'e6988ee7a2bae8a686e5afabe69687e5ad97e79a84e59188e78fbee696b9e59091e38082e5bf85e9a088e4bdbfe794a82064697220e68c87e5ae9a206c747220e688962072746cefbc9be99c80e8a681e99a94e99ba2e8808ce99d9ee5bcb7e588b6e694b9e5afabe696b9e59091e69982efbc8ce4bdbfe794a820626469e38082' USING utf8mb4),
example_code = CONVERT(X'3c703e3c62646f206469723d2272746c223e4142433c2f62646f3e3c2f703e' USING utf8mb4),
example_description = CONVERT(X'e68c87e5ae9ae69687e5ad97e68ea1e794a8e794b1e58fb3e887b3e5b7a6e79a84e59188e78fbee696b9e59091e38082' USING utf8mb4),
sort_key = CONVERT(X'62646f' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d62646f2d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d62646f' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'62646f' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746578742d6c6576656c2d73656d616e74696373' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d7370616e' USING utf8mb4), CONVERT(X'3c7370616e3e' USING utf8mb4), CONVERT(X'e9809ae794a8e69687e5ad97e5aeb9e599a8' USING utf8mb4), CONVERT(X'e5b087e69687e5ad97e5b1a4e7b49ae585a7e5aeb9e58886e7b584efbc8ce69cace8baabe4b88de68f90e4be9be789b9e5ae9ae8aa9ee6848fe38082' USING utf8mb4), CONVERT(X'e5b087e69687e5ad97e5b1a4e7b49ae585a7e5aeb9e58886e7b584efbc8ce69cace8baabe4b88de68f90e4be9be789b9e5ae9ae8aa9ee6848fe38082e5b8b8e794a8e4be86e5a597e794a8e6a8a3e5bc8fe38081e8aa9ee8a880e68896e7a88be5bc8fe6938de4bd9cefbc9be88ba5e69c89e5bcb7e8aabfe38081e9878de8a681e680a7e7ad89e8aa9ee6848fefbc8ce584aae58588e4bdbfe794a8e79bb8e68789e58583e7b4a0e38082' USING utf8mb4), CONVERT(X'3c703ee78b80e6858befbc9a3c7370616e20636c6173733d22737461747573223ee5b7b2e584b2e5ad983c2f7370616e3e3c2f703e' USING utf8mb4), CONVERT(X'e782bae78b80e6858be69687e5ad97e5bbbae7ab8be58fafe5a597e794a8e6a8a3e5bc8fe79a84e5aeb9e599a8e38082' USING utf8mb4), CONVERT(X'7370616e' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d7370616e2d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c7370616e3e' USING utf8mb4),
display_label = CONVERT(X'e9809ae794a8e69687e5ad97e5aeb9e599a8' USING utf8mb4),
summary = CONVERT(X'e5b087e69687e5ad97e5b1a4e7b49ae585a7e5aeb9e58886e7b584efbc8ce69cace8baabe4b88de68f90e4be9be789b9e5ae9ae8aa9ee6848fe38082' USING utf8mb4),
description = CONVERT(X'e5b087e69687e5ad97e5b1a4e7b49ae585a7e5aeb9e58886e7b584efbc8ce69cace8baabe4b88de68f90e4be9be789b9e5ae9ae8aa9ee6848fe38082e5b8b8e794a8e4be86e5a597e794a8e6a8a3e5bc8fe38081e8aa9ee8a880e68896e7a88be5bc8fe6938de4bd9cefbc9be88ba5e69c89e5bcb7e8aabfe38081e9878de8a681e680a7e7ad89e8aa9ee6848fefbc8ce584aae58588e4bdbfe794a8e79bb8e68789e58583e7b4a0e38082' USING utf8mb4),
example_code = CONVERT(X'3c703ee78b80e6858befbc9a3c7370616e20636c6173733d22737461747573223ee5b7b2e584b2e5ad983c2f7370616e3e3c2f703e' USING utf8mb4),
example_description = CONVERT(X'e782bae78b80e6858be69687e5ad97e5bbbae7ab8be58fafe5a597e794a8e6a8a3e5bc8fe79a84e5aeb9e599a8e38082' USING utf8mb4),
sort_key = CONVERT(X'7370616e' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d7370616e2d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d7370616e' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'7370616e' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746578742d6c6576656c2d73656d616e74696373' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d6272' USING utf8mb4), CONVERT(X'3c62723e' USING utf8mb4), CONVERT(X'e68f9be8a18c' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae585a7e5aeb9e4b8ade69c89e6848fe7bea9e79a84e68f9be8a18ce38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae585a7e5aeb9e4b8ade69c89e6848fe7bea9e79a84e68f9be8a18ce38082e981a9e59088e8a9a9e58fa5e68896e59cb0e59d80e4b8ade79a84e68f9be8a18cefbc8ce4b88de68789e794a8e5a49ae5808b20627220e8a3bde980a0e6aeb5e890bde99693e8b79defbc9b627220e698afe7a9bae58583e7b4a0e38082' USING utf8mb4), CONVERT(X'3c703ee7acace4b880e8a18ce8a9a9e58fa53c62723ee7acace4ba8ce8a18ce8a9a9e58fa53c2f703e' USING utf8mb4), CONVERT(X'e4bf9de79599e8a9a9e58fa5e4b98be99693e79a84e68f9be8a18ce38082' USING utf8mb4), CONVERT(X'6272' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d62722d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c62723e' USING utf8mb4),
display_label = CONVERT(X'e68f9be8a18c' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae585a7e5aeb9e4b8ade69c89e6848fe7bea9e79a84e68f9be8a18ce38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae585a7e5aeb9e4b8ade69c89e6848fe7bea9e79a84e68f9be8a18ce38082e981a9e59088e8a9a9e58fa5e68896e59cb0e59d80e4b8ade79a84e68f9be8a18cefbc8ce4b88de68789e794a8e5a49ae5808b20627220e8a3bde980a0e6aeb5e890bde99693e8b79defbc9b627220e698afe7a9bae58583e7b4a0e38082' USING utf8mb4),
example_code = CONVERT(X'3c703ee7acace4b880e8a18ce8a9a9e58fa53c62723ee7acace4ba8ce8a18ce8a9a9e58fa53c2f703e' USING utf8mb4),
example_description = CONVERT(X'e4bf9de79599e8a9a9e58fa5e4b98be99693e79a84e68f9be8a18ce38082' USING utf8mb4),
sort_key = CONVERT(X'6272' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d62722d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d6272' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'6272' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746578742d6c6576656c2d73656d616e74696373' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d776272' USING utf8mb4), CONVERT(X'3c7762723e' USING utf8mb4), CONVERT(X'e58fafe981b8e68f9be8a18ce9bb9e' USING utf8mb4), CONVERT(X'e6a899e7a4bae7808fe8a6bde599a8e58fafe8a696e99c80e8a681e68f9be8a18ce79a84e4bd8de7bdaee38082' USING utf8mb4), CONVERT(X'e6a899e7a4bae7808fe8a6bde599a8e58fafe8a696e99c80e8a681e68f9be8a18ce79a84e4bd8de7bdaee38082e4b88de69c83e5838f20627220e4b880e6a8a3e5bcb7e588b6e68f9be8a18cefbc8ce981a9e59088e8bc83e995b7e5ad97e4b8b2efbc9b77627220e698afe7a9bae58583e7b4a0e38082' USING utf8mb4), CONVERT(X'3c703e766572792d6c6f6e672d3c7762723e6964656e7469666965722d3c7762723e6e616d653c2f703e' USING utf8mb4), CONVERT(X'e59ca8e995b7e8ad98e588a5e5908de7a8b1e4b8ade68f90e4be9be68f9be8a18ce6a99fe69c83e38082' USING utf8mb4), CONVERT(X'776272' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d7762722d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c7762723e' USING utf8mb4),
display_label = CONVERT(X'e58fafe981b8e68f9be8a18ce9bb9e' USING utf8mb4),
summary = CONVERT(X'e6a899e7a4bae7808fe8a6bde599a8e58fafe8a696e99c80e8a681e68f9be8a18ce79a84e4bd8de7bdaee38082' USING utf8mb4),
description = CONVERT(X'e6a899e7a4bae7808fe8a6bde599a8e58fafe8a696e99c80e8a681e68f9be8a18ce79a84e4bd8de7bdaee38082e4b88de69c83e5838f20627220e4b880e6a8a3e5bcb7e588b6e68f9be8a18cefbc8ce981a9e59088e8bc83e995b7e5ad97e4b8b2efbc9b77627220e698afe7a9bae58583e7b4a0e38082' USING utf8mb4),
example_code = CONVERT(X'3c703e766572792d6c6f6e672d3c7762723e6964656e7469666965722d3c7762723e6e616d653c2f703e' USING utf8mb4),
example_description = CONVERT(X'e59ca8e995b7e8ad98e588a5e5908de7a8b1e4b8ade68f90e4be9be68f9be8a18ce6a99fe69c83e38082' USING utf8mb4),
sort_key = CONVERT(X'776272' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f746578742d6c6576656c2d73656d616e746963732e68746d6c237468652d7762722d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d776272' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'776272' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'6564697473' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d696e73' USING utf8mb4), CONVERT(X'3c696e733e' USING utf8mb4), CONVERT(X'e696b0e5a29ee585a7e5aeb9' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae69687e4bbb6e4bfaee8a882e4b8ade58aa0e585a5e79a84e585a7e5aeb9e38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae69687e4bbb6e4bfaee8a882e4b8ade58aa0e585a5e79a84e585a7e5aeb9e38082e58fafe794a8206461746574696d6520e8a898e98c84e4bfaee8a882e69982e99693efbc8ce68896206369746520e68f90e4be9be8ae8ae69bb4e8aaaae6988ee7b6b2e59d80efbc9be4b88de698afe596aee7b494e79a84e5ba95e7b79ae69588e69e9ce38082' USING utf8mb4), CONVERT(X'3c703ee79baee5898de694afe68fb420507974686f6e3c696e73206461746574696d653d22323032362d31312d3130223e20e888872048544d4c3c2f696e733ee380823c2f703e' USING utf8mb4), CONVERT(X'e6a899e8a898e696b0e5a29ee79a84e8aa9ee8a880e694afe68fb4e8aaaae6988ee38082' USING utf8mb4), CONVERT(X'696e73' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f65646974732e68746d6c237468652d696e732d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c696e733e' USING utf8mb4),
display_label = CONVERT(X'e696b0e5a29ee585a7e5aeb9' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae69687e4bbb6e4bfaee8a882e4b8ade58aa0e585a5e79a84e585a7e5aeb9e38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae69687e4bbb6e4bfaee8a882e4b8ade58aa0e585a5e79a84e585a7e5aeb9e38082e58fafe794a8206461746574696d6520e8a898e98c84e4bfaee8a882e69982e99693efbc8ce68896206369746520e68f90e4be9be8ae8ae69bb4e8aaaae6988ee7b6b2e59d80efbc9be4b88de698afe596aee7b494e79a84e5ba95e7b79ae69588e69e9ce38082' USING utf8mb4),
example_code = CONVERT(X'3c703ee79baee5898de694afe68fb420507974686f6e3c696e73206461746574696d653d22323032362d31312d3130223e20e888872048544d4c3c2f696e733ee380823c2f703e' USING utf8mb4),
example_description = CONVERT(X'e6a899e8a898e696b0e5a29ee79a84e8aa9ee8a880e694afe68fb4e8aaaae6988ee38082' USING utf8mb4),
sort_key = CONVERT(X'696e73' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f65646974732e68746d6c237468652d696e732d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d696e73' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'696e73' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'6564697473' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d64656c' USING utf8mb4), CONVERT(X'3c64656c3e' USING utf8mb4), CONVERT(X'e588aae999a4e585a7e5aeb9' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae69687e4bbb6e4bfaee8a882e4b8ade7a7bbe999a4e79a84e585a7e5aeb9e38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae69687e4bbb6e4bfaee8a882e4b8ade7a7bbe999a4e79a84e585a7e5aeb9e38082e58fafe794a8206461746574696d6520e68896206369746520e8aaaae6988ee4bfaee8a882efbc9be58385e8a1a8e7a4bae585a7e5aeb9e4b88de5868de6ada3e7a2bae8808ce99d9ee4bfaee8a882e588aae999a4e69982efbc8ce58fafe4bdbfe794a82073e38082' USING utf8mb4), CONVERT(X'3c703e3c64656c3ee58385e694afe68fb420507974686f6e3c2f64656c3e3c696e733ee694afe68fb420507974686f6e20e888872048544d4c3c2f696e733e3c2f703e' USING utf8mb4), CONVERT(X'e5b08de785a7e69687e4bbb6e4bfaee8a882e5898de5be8ce79a84e585a7e5aeb9e38082' USING utf8mb4), CONVERT(X'64656c' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f65646974732e68746d6c237468652d64656c2d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c64656c3e' USING utf8mb4),
display_label = CONVERT(X'e588aae999a4e585a7e5aeb9' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae69687e4bbb6e4bfaee8a882e4b8ade7a7bbe999a4e79a84e585a7e5aeb9e38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae69687e4bbb6e4bfaee8a882e4b8ade7a7bbe999a4e79a84e585a7e5aeb9e38082e58fafe794a8206461746574696d6520e68896206369746520e8aaaae6988ee4bfaee8a882efbc9be58385e8a1a8e7a4bae585a7e5aeb9e4b88de5868de6ada3e7a2bae8808ce99d9ee4bfaee8a882e588aae999a4e69982efbc8ce58fafe4bdbfe794a82073e38082' USING utf8mb4),
example_code = CONVERT(X'3c703e3c64656c3ee58385e694afe68fb420507974686f6e3c2f64656c3e3c696e733ee694afe68fb420507974686f6e20e888872048544d4c3c2f696e733e3c2f703e' USING utf8mb4),
example_description = CONVERT(X'e5b08de785a7e69687e4bbb6e4bfaee8a882e5898de5be8ce79a84e585a7e5aeb9e38082' USING utf8mb4),
sort_key = CONVERT(X'64656c' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f65646974732e68746d6c237468652d64656c2d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d64656c' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'64656c' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'656d6265646465642d636f6e74656e74' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d70696374757265' USING utf8mb4), CONVERT(X'3c706963747572653e' USING utf8mb4), CONVERT(X'e59c96e78987e4be86e6ba90e7bea4e7b584' USING utf8mb4), CONVERT(X'e782ba20696d6720e68f90e4be9be4be9de6a29de4bbb6e981b8e69387e79a84e59c96e78987e4be86e6ba90e38082' USING utf8mb4), CONVERT(X'e782ba20696d6720e68f90e4be9be4be9de6a29de4bbb6e981b8e69387e79a84e59c96e78987e4be86e6ba90e38082e9808fe9818e20736f7572636520e79a84206d6564696120e68896207479706520e7ad89e6a29de4bbb6e981b8e69387e8b387e6ba90efbc8ce4bb8de99c8020696d6720e68f90e4be9be59c96e78987e69cace9ab94e88887e69bbfe4bba3e69687e5ad97e38082' USING utf8mb4), CONVERT(X'3c706963747572653e0a20203c736f75726365206d656469613d22286d696e2d77696474683a2038303070782922207372637365743d22776964652e6a7067223e0a20203c696d67207372633d22736d616c6c2e6a70672220616c743d22e5b1b1e699af223e0a3c2f706963747572653e' USING utf8mb4), CONVERT(X'e4be9de58fafe794a8e5aface5baa6e981b8e69387e5b1b1e699afe59c96e78987e4be86e6ba90e38082' USING utf8mb4), CONVERT(X'70696374757265' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f656d6265646465642d636f6e74656e742e68746d6c237468652d706963747572652d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c706963747572653e' USING utf8mb4),
display_label = CONVERT(X'e59c96e78987e4be86e6ba90e7bea4e7b584' USING utf8mb4),
summary = CONVERT(X'e782ba20696d6720e68f90e4be9be4be9de6a29de4bbb6e981b8e69387e79a84e59c96e78987e4be86e6ba90e38082' USING utf8mb4),
description = CONVERT(X'e782ba20696d6720e68f90e4be9be4be9de6a29de4bbb6e981b8e69387e79a84e59c96e78987e4be86e6ba90e38082e9808fe9818e20736f7572636520e79a84206d6564696120e68896207479706520e7ad89e6a29de4bbb6e981b8e69387e8b387e6ba90efbc8ce4bb8de99c8020696d6720e68f90e4be9be59c96e78987e69cace9ab94e88887e69bbfe4bba3e69687e5ad97e38082' USING utf8mb4),
example_code = CONVERT(X'3c706963747572653e0a20203c736f75726365206d656469613d22286d696e2d77696474683a2038303070782922207372637365743d22776964652e6a7067223e0a20203c696d67207372633d22736d616c6c2e6a70672220616c743d22e5b1b1e699af223e0a3c2f706963747572653e' USING utf8mb4),
example_description = CONVERT(X'e4be9de58fafe794a8e5aface5baa6e981b8e69387e5b1b1e699afe59c96e78987e4be86e6ba90e38082' USING utf8mb4),
sort_key = CONVERT(X'70696374757265' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f656d6265646465642d636f6e74656e742e68746d6c237468652d706963747572652d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d70696374757265' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'70696374757265' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'656d6265646465642d636f6e74656e74' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d736f75726365' USING utf8mb4), CONVERT(X'3c736f757263653e' USING utf8mb4), CONVERT(X'e5aa92e9ab94e4be86e6ba90' USING utf8mb4), CONVERT(X'e782ba2070696374757265e38081617564696f20e6889620766964656f20e68f90e4be9be58fafe981b8e79a84e4be86e6ba90e38082' USING utf8mb4), CONVERT(X'e782ba2070696374757265e38081617564696f20e6889620766964656f20e68f90e4be9be58fafe981b8e79a84e4be86e6ba90e38082e59ca8207069637475726520e4b8ade4bdbfe794a820737263736574efbc8ce59ca8e99fb3e8a88ae68896e5bdb1e78987e4b8ade9809ae5b8b8e4bdbfe794a820737263efbc9b736f7572636520e69cace8baabe4b88de698afe692ade694bee599a8efbc8ce698afe7a9bae58583e7b4a0e38082' USING utf8mb4), CONVERT(X'3c617564696f20636f6e74726f6c733e0a20203c736f75726365207372633d226c6573736f6e2e6f67672220747970653d22617564696f2f6f6767223e0a20203c736f75726365207372633d226c6573736f6e2e6d70332220747970653d22617564696f2f6d706567223e0a3c2f617564696f3e' USING utf8mb4), CONVERT(X'e68f90e4be9be5908ce4b880e99fb3e8a88ae79a84e4b88de5908ce6a0bce5bc8fe4be86e6ba90e38082' USING utf8mb4), CONVERT(X'736f75726365' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f656d6265646465642d636f6e74656e742e68746d6c237468652d736f757263652d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c736f757263653e' USING utf8mb4),
display_label = CONVERT(X'e5aa92e9ab94e4be86e6ba90' USING utf8mb4),
summary = CONVERT(X'e782ba2070696374757265e38081617564696f20e6889620766964656f20e68f90e4be9be58fafe981b8e79a84e4be86e6ba90e38082' USING utf8mb4),
description = CONVERT(X'e782ba2070696374757265e38081617564696f20e6889620766964656f20e68f90e4be9be58fafe981b8e79a84e4be86e6ba90e38082e59ca8207069637475726520e4b8ade4bdbfe794a820737263736574efbc8ce59ca8e99fb3e8a88ae68896e5bdb1e78987e4b8ade9809ae5b8b8e4bdbfe794a820737263efbc9b736f7572636520e69cace8baabe4b88de698afe692ade694bee599a8efbc8ce698afe7a9bae58583e7b4a0e38082' USING utf8mb4),
example_code = CONVERT(X'3c617564696f20636f6e74726f6c733e0a20203c736f75726365207372633d226c6573736f6e2e6f67672220747970653d22617564696f2f6f6767223e0a20203c736f75726365207372633d226c6573736f6e2e6d70332220747970653d22617564696f2f6d706567223e0a3c2f617564696f3e' USING utf8mb4),
example_description = CONVERT(X'e68f90e4be9be5908ce4b880e99fb3e8a88ae79a84e4b88de5908ce6a0bce5bc8fe4be86e6ba90e38082' USING utf8mb4),
sort_key = CONVERT(X'736f75726365' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f656d6265646465642d636f6e74656e742e68746d6c237468652d736f757263652d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d736f75726365' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'736f75726365' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'656d6265646465642d636f6e74656e74' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d696d67' USING utf8mb4), CONVERT(X'3c696d673e' USING utf8mb4), CONVERT(X'e59c96e78987' USING utf8mb4), CONVERT(X'e5b087e59c96e78987e5b58ce585a5e69687e4bbb6e38082' USING utf8mb4), CONVERT(X'e5b087e59c96e78987e5b58ce585a5e69687e4bbb6e38082e9809ae5b8b8e4bba52073726320e68c87e5ae9ae8b387e6ba90efbc8ce4bba520616c7420e68f90e4be9be69bbfe4bba3e69687e5ad97efbc9be7b494e8a39de9a3bee59c96e78987e58fafe4bdbfe794a8e7a9ba20616c74e38082696d6720e698afe7a9bae58583e7b4a0e38082' USING utf8mb4), CONVERT(X'3c696d67207372633d226469616772616d2e706e672220616c743d22e794b1206865616420e8888720626f647920e7b584e68890e79a842048544d4c20e69687e4bbb6e7b590e6a78b222077696474683d2236343022206865696768743d22333630223e' USING utf8mb4), CONVERT(X'e5b58ce585a5e59c96e78987efbc8ce68f90e4be9be69bbfe4bba3e69687e5ad97e88887e5b0bae5afb8e38082' USING utf8mb4), CONVERT(X'696d67' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f656d6265646465642d636f6e74656e742e68746d6c237468652d696d672d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c696d673e' USING utf8mb4),
display_label = CONVERT(X'e59c96e78987' USING utf8mb4),
summary = CONVERT(X'e5b087e59c96e78987e5b58ce585a5e69687e4bbb6e38082' USING utf8mb4),
description = CONVERT(X'e5b087e59c96e78987e5b58ce585a5e69687e4bbb6e38082e9809ae5b8b8e4bba52073726320e68c87e5ae9ae8b387e6ba90efbc8ce4bba520616c7420e68f90e4be9be69bbfe4bba3e69687e5ad97efbc9be7b494e8a39de9a3bee59c96e78987e58fafe4bdbfe794a8e7a9ba20616c74e38082696d6720e698afe7a9bae58583e7b4a0e38082' USING utf8mb4),
example_code = CONVERT(X'3c696d67207372633d226469616772616d2e706e672220616c743d22e794b1206865616420e8888720626f647920e7b584e68890e79a842048544d4c20e69687e4bbb6e7b590e6a78b222077696474683d2236343022206865696768743d22333630223e' USING utf8mb4),
example_description = CONVERT(X'e5b58ce585a5e59c96e78987efbc8ce68f90e4be9be69bbfe4bba3e69687e5ad97e88887e5b0bae5afb8e38082' USING utf8mb4),
sort_key = CONVERT(X'696d67' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f656d6265646465642d636f6e74656e742e68746d6c237468652d696d672d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d696d67' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'696d67' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'656d6265646465642d636f6e74656e74' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d696672616d65' USING utf8mb4), CONVERT(X'3c696672616d653e' USING utf8mb4), CONVERT(X'e585a7e5b58ce9a081e99da2' USING utf8mb4), CONVERT(X'e59ca8e79baee5898de69687e4bbb6e585a7e5b58ce585a5e58fa6e4b880e5808be9a081e99da2e38082' USING utf8mb4), CONVERT(X'e59ca8e79baee5898de69687e4bbb6e585a7e5b58ce585a5e58fa6e4b880e5808be9a081e99da2e38082e58fafe794a82073726320e68c87e5ae9ae7b6b2e59d80efbc8c7469746c6520e8aaaae6988ee794a8e98094efbc9b73616e64626f7820e58fafe99990e588b6e585a7e5b58ce585a7e5aeb9e883bde58a9be38082e5a496e983a8e9a081e99da2e58fafe883bde7a681e6ada2e8a2abe5b58ce585a5e38082' USING utf8mb4), CONVERT(X'3c696672616d65207372633d222f7072657669657722207469746c653d22e69599e5adb8e9a090e8a6bd222073616e64626f783e3c2f696672616d653e' USING utf8mb4), CONVERT(X'e5b58ce585a5e58f972073616e64626f7820e99990e588b6e79a84e69599e5adb8e9a090e8a6bde9a081e99da2e38082' USING utf8mb4), CONVERT(X'696672616d65' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f696672616d652d656d6265642d6f626a6563742e68746d6c237468652d696672616d652d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c696672616d653e' USING utf8mb4),
display_label = CONVERT(X'e585a7e5b58ce9a081e99da2' USING utf8mb4),
summary = CONVERT(X'e59ca8e79baee5898de69687e4bbb6e585a7e5b58ce585a5e58fa6e4b880e5808be9a081e99da2e38082' USING utf8mb4),
description = CONVERT(X'e59ca8e79baee5898de69687e4bbb6e585a7e5b58ce585a5e58fa6e4b880e5808be9a081e99da2e38082e58fafe794a82073726320e68c87e5ae9ae7b6b2e59d80efbc8c7469746c6520e8aaaae6988ee794a8e98094efbc9b73616e64626f7820e58fafe99990e588b6e585a7e5b58ce585a7e5aeb9e883bde58a9be38082e5a496e983a8e9a081e99da2e58fafe883bde7a681e6ada2e8a2abe5b58ce585a5e38082' USING utf8mb4),
example_code = CONVERT(X'3c696672616d65207372633d222f7072657669657722207469746c653d22e69599e5adb8e9a090e8a6bd222073616e64626f783e3c2f696672616d653e' USING utf8mb4),
example_description = CONVERT(X'e5b58ce585a5e58f972073616e64626f7820e99990e588b6e79a84e69599e5adb8e9a090e8a6bde9a081e99da2e38082' USING utf8mb4),
sort_key = CONVERT(X'696672616d65' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f696672616d652d656d6265642d6f626a6563742e68746d6c237468652d696672616d652d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d696672616d65' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'696672616d65' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'656d6265646465642d636f6e74656e74' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d656d626564' USING utf8mb4), CONVERT(X'3c656d6265643e' USING utf8mb4), CONVERT(X'e5a496e983a8e585a7e5aeb9e5b58ce585a5' USING utf8mb4), CONVERT(X'e68f90e4be9be5a496e983a8e68789e794a8e7a88be5bc8fe68896e4ba92e58b95e585a7e5aeb9e79a84e5b58ce585a5e4bd8de7bdaee38082' USING utf8mb4), CONVERT(X'e68f90e4be9be5a496e983a8e68789e794a8e7a88be5bc8fe68896e4ba92e58b95e585a7e5aeb9e79a84e5b58ce585a5e4bd8de7bdaee38082e9808fe9818e2073726320e88887207479706520e68f8fe8bfb0e8b387e6ba90efbc8ce5afa6e99a9be694afe68fb4e58f96e6b1bae696bce7808fe8a6bde599a8e88887e585a7e5aeb9e9a19ee59e8befbc9b656d62656420e698afe7a9bae58583e7b4a0e38082' USING utf8mb4), CONVERT(X'3c656d626564207372633d2267756964652e7064662220747970653d226170706c69636174696f6e2f706466222077696474683d2236303022206865696768743d22343030223e' USING utf8mb4), CONVERT(X'e68f90e4be9b2050444620e585a7e5b58ce9a1afe7a4bae79a84e4bd8de7bdaeefbc8ce5afa6e99a9be59188e78fbee8a696e7808fe8a6bde599a8e694afe68fb4e8808ce5ae9ae38082' USING utf8mb4), CONVERT(X'656d626564' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f696672616d652d656d6265642d6f626a6563742e68746d6c237468652d656d6265642d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c656d6265643e' USING utf8mb4),
display_label = CONVERT(X'e5a496e983a8e585a7e5aeb9e5b58ce585a5' USING utf8mb4),
summary = CONVERT(X'e68f90e4be9be5a496e983a8e68789e794a8e7a88be5bc8fe68896e4ba92e58b95e585a7e5aeb9e79a84e5b58ce585a5e4bd8de7bdaee38082' USING utf8mb4),
description = CONVERT(X'e68f90e4be9be5a496e983a8e68789e794a8e7a88be5bc8fe68896e4ba92e58b95e585a7e5aeb9e79a84e5b58ce585a5e4bd8de7bdaee38082e9808fe9818e2073726320e88887207479706520e68f8fe8bfb0e8b387e6ba90efbc8ce5afa6e99a9be694afe68fb4e58f96e6b1bae696bce7808fe8a6bde599a8e88887e585a7e5aeb9e9a19ee59e8befbc9b656d62656420e698afe7a9bae58583e7b4a0e38082' USING utf8mb4),
example_code = CONVERT(X'3c656d626564207372633d2267756964652e7064662220747970653d226170706c69636174696f6e2f706466222077696474683d2236303022206865696768743d22343030223e' USING utf8mb4),
example_description = CONVERT(X'e68f90e4be9b2050444620e585a7e5b58ce9a1afe7a4bae79a84e4bd8de7bdaeefbc8ce5afa6e99a9be59188e78fbee8a696e7808fe8a6bde599a8e694afe68fb4e8808ce5ae9ae38082' USING utf8mb4),
sort_key = CONVERT(X'656d626564' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f696672616d652d656d6265642d6f626a6563742e68746d6c237468652d656d6265642d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d656d626564' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'656d626564' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'656d6265646465642d636f6e74656e74' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d6f626a656374' USING utf8mb4), CONVERT(X'3c6f626a6563743e' USING utf8mb4), CONVERT(X'e5a496e983a8e8b387e6ba90e789a9e4bbb6' USING utf8mb4), CONVERT(X'e5b58ce585a5e5a496e983a8e8b387e6ba90efbc8ce4b8a6e58fafe68f90e4be9be58299e68fb4e585a7e5aeb9e38082' USING utf8mb4), CONVERT(X'e5b58ce585a5e5a496e983a8e8b387e6ba90efbc8ce4b8a6e58fafe68f90e4be9be58299e68fb4e585a7e5aeb9e38082e4bdbfe794a8206461746120e68c87e5ae9ae8b387e6ba90e380817479706520e68f8fe8bfb0e6a0bce5bc8fefbc9be784a1e6b395e4bdbfe794a8e8a9b2e8b387e6ba90e69982efbc8ce58fafe59188e78fbee58583e7b4a0e585a7e79a84e58299e68fb4e585a7e5aeb9e38082' USING utf8mb4), CONVERT(X'3c6f626a65637420646174613d2267756964652e7064662220747970653d226170706c69636174696f6e2f706466223e0a20203c6120687265663d2267756964652e706466223ee4b88be8bc892050444620e68c87e58d973c2f613e0a3c2f6f626a6563743e' USING utf8mb4), CONVERT(X'e5b58ce585a520504446efbc8ce4b8a6e68f90e4be9be4b88be8bc89e980a3e7b590e4bd9ce782bae58299e68fb4e38082' USING utf8mb4), CONVERT(X'6f626a656374' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f696672616d652d656d6265642d6f626a6563742e68746d6c237468652d6f626a6563742d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c6f626a6563743e' USING utf8mb4),
display_label = CONVERT(X'e5a496e983a8e8b387e6ba90e789a9e4bbb6' USING utf8mb4),
summary = CONVERT(X'e5b58ce585a5e5a496e983a8e8b387e6ba90efbc8ce4b8a6e58fafe68f90e4be9be58299e68fb4e585a7e5aeb9e38082' USING utf8mb4),
description = CONVERT(X'e5b58ce585a5e5a496e983a8e8b387e6ba90efbc8ce4b8a6e58fafe68f90e4be9be58299e68fb4e585a7e5aeb9e38082e4bdbfe794a8206461746120e68c87e5ae9ae8b387e6ba90e380817479706520e68f8fe8bfb0e6a0bce5bc8fefbc9be784a1e6b395e4bdbfe794a8e8a9b2e8b387e6ba90e69982efbc8ce58fafe59188e78fbee58583e7b4a0e585a7e79a84e58299e68fb4e585a7e5aeb9e38082' USING utf8mb4),
example_code = CONVERT(X'3c6f626a65637420646174613d2267756964652e7064662220747970653d226170706c69636174696f6e2f706466223e0a20203c6120687265663d2267756964652e706466223ee4b88be8bc892050444620e68c87e58d973c2f613e0a3c2f6f626a6563743e' USING utf8mb4),
example_description = CONVERT(X'e5b58ce585a520504446efbc8ce4b8a6e68f90e4be9be4b88be8bc89e980a3e7b590e4bd9ce782bae58299e68fb4e38082' USING utf8mb4),
sort_key = CONVERT(X'6f626a656374' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f696672616d652d656d6265642d6f626a6563742e68746d6c237468652d6f626a6563742d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d6f626a656374' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'6f626a656374' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'656d6265646465642d636f6e74656e74' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d766964656f' USING utf8mb4), CONVERT(X'3c766964656f3e' USING utf8mb4), CONVERT(X'e5bdb1e78987' USING utf8mb4), CONVERT(X'e59ca8e69687e4bbb6e4b8ade68f90e4be9be5bdb1e78987e692ade694bee585a7e5aeb9e38082' USING utf8mb4), CONVERT(X'e59ca8e69687e4bbb6e4b8ade68f90e4be9be5bdb1e78987e692ade694bee585a7e5aeb9e38082e58fafe4bdbfe794a820636f6e74726f6c7320e9a1afe7a4bae68ea7e588b6e4bb8be99da2e38081706f7374657220e68c87e5ae9ae5b081e99da2efbc8ce4b8a6e4bba520747261636b20e68f90e4be9be5ad97e5b995efbc9be887aae58b95e692ade694bee58fafe883bde58f97e7808fe8a6bde599a8e99990e588b6e38082' USING utf8mb4), CONVERT(X'3c766964656f20636f6e74726f6c732077696474683d223634302220706f737465723d22636f7665722e6a7067223e0a20203c736f75726365207372633d226c6573736f6e2e6d70342220747970653d22766964656f2f6d7034223e0a20203c747261636b206b696e643d2263617074696f6e7322207372633d2263617074696f6e732e76747422207372636c616e673d227a682d48616e7422206c6162656c3d22e7b981e9ab94e4b8ade69687223e0a3c2f766964656f3e' USING utf8mb4), CONVERT(X'e68f90e4be9be69c89e68ea7e588b6e4bb8be99da2e38081e5b081e99da2e88887e5ad97e5b995e8bb8ce79a84e5bdb1e78987e38082' USING utf8mb4), CONVERT(X'766964656f' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f6d656469612e68746d6c237468652d766964656f2d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c766964656f3e' USING utf8mb4),
display_label = CONVERT(X'e5bdb1e78987' USING utf8mb4),
summary = CONVERT(X'e59ca8e69687e4bbb6e4b8ade68f90e4be9be5bdb1e78987e692ade694bee585a7e5aeb9e38082' USING utf8mb4),
description = CONVERT(X'e59ca8e69687e4bbb6e4b8ade68f90e4be9be5bdb1e78987e692ade694bee585a7e5aeb9e38082e58fafe4bdbfe794a820636f6e74726f6c7320e9a1afe7a4bae68ea7e588b6e4bb8be99da2e38081706f7374657220e68c87e5ae9ae5b081e99da2efbc8ce4b8a6e4bba520747261636b20e68f90e4be9be5ad97e5b995efbc9be887aae58b95e692ade694bee58fafe883bde58f97e7808fe8a6bde599a8e99990e588b6e38082' USING utf8mb4),
example_code = CONVERT(X'3c766964656f20636f6e74726f6c732077696474683d223634302220706f737465723d22636f7665722e6a7067223e0a20203c736f75726365207372633d226c6573736f6e2e6d70342220747970653d22766964656f2f6d7034223e0a20203c747261636b206b696e643d2263617074696f6e7322207372633d2263617074696f6e732e76747422207372636c616e673d227a682d48616e7422206c6162656c3d22e7b981e9ab94e4b8ade69687223e0a3c2f766964656f3e' USING utf8mb4),
example_description = CONVERT(X'e68f90e4be9be69c89e68ea7e588b6e4bb8be99da2e38081e5b081e99da2e88887e5ad97e5b995e8bb8ce79a84e5bdb1e78987e38082' USING utf8mb4),
sort_key = CONVERT(X'766964656f' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f6d656469612e68746d6c237468652d766964656f2d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d766964656f' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'766964656f' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'656d6265646465642d636f6e74656e74' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d617564696f' USING utf8mb4), CONVERT(X'3c617564696f3e' USING utf8mb4), CONVERT(X'e99fb3e8a88a' USING utf8mb4), CONVERT(X'e59ca8e69687e4bbb6e4b8ade68f90e4be9be99fb3e8a88ae692ade694bee585a7e5aeb9e38082' USING utf8mb4), CONVERT(X'e59ca8e69687e4bbb6e4b8ade68f90e4be9be99fb3e8a88ae692ade694bee585a7e5aeb9e38082e58fafe79bb4e68ea5e4bdbfe794a82073726320e68896e58897e587ba20736f75726365efbc8c636f6e74726f6c7320e58fafe9a1afe7a4bae692ade694bee4bb8be99da2efbc9be5afa6e99a9be6a0bce5bc8fe694afe68fb4e88887e887aae58b95e692ade694bee694bfe7ad96e58f96e6b1bae696bce7808fe8a6bde599a8e38082' USING utf8mb4), CONVERT(X'3c617564696f20636f6e74726f6c73207372633d226c6573736f6e2e6d7033223e0a20203c6120687265663d226c6573736f6e2e6d7033223ee4b88be8bc89e99fb3e8a88a3c2f613e0a3c2f617564696f3e' USING utf8mb4), CONVERT(X'e68f90e4be9be99fb3e8a88ae692ade694bee599a8e58f8ae4b88de694afe68fb420617564696f20e69982e79a84e58299e68fb4e980a3e7b590e38082' USING utf8mb4), CONVERT(X'617564696f' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f6d656469612e68746d6c237468652d617564696f2d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c617564696f3e' USING utf8mb4),
display_label = CONVERT(X'e99fb3e8a88a' USING utf8mb4),
summary = CONVERT(X'e59ca8e69687e4bbb6e4b8ade68f90e4be9be99fb3e8a88ae692ade694bee585a7e5aeb9e38082' USING utf8mb4),
description = CONVERT(X'e59ca8e69687e4bbb6e4b8ade68f90e4be9be99fb3e8a88ae692ade694bee585a7e5aeb9e38082e58fafe79bb4e68ea5e4bdbfe794a82073726320e68896e58897e587ba20736f75726365efbc8c636f6e74726f6c7320e58fafe9a1afe7a4bae692ade694bee4bb8be99da2efbc9be5afa6e99a9be6a0bce5bc8fe694afe68fb4e88887e887aae58b95e692ade694bee694bfe7ad96e58f96e6b1bae696bce7808fe8a6bde599a8e38082' USING utf8mb4),
example_code = CONVERT(X'3c617564696f20636f6e74726f6c73207372633d226c6573736f6e2e6d7033223e0a20203c6120687265663d226c6573736f6e2e6d7033223ee4b88be8bc89e99fb3e8a88a3c2f613e0a3c2f617564696f3e' USING utf8mb4),
example_description = CONVERT(X'e68f90e4be9be99fb3e8a88ae692ade694bee599a8e58f8ae4b88de694afe68fb420617564696f20e69982e79a84e58299e68fb4e980a3e7b590e38082' USING utf8mb4),
sort_key = CONVERT(X'617564696f' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f6d656469612e68746d6c237468652d617564696f2d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d617564696f' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'617564696f' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'656d6265646465642d636f6e74656e74' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d747261636b' USING utf8mb4), CONVERT(X'3c747261636b3e' USING utf8mb4), CONVERT(X'e69687e5ad97e8bb8c' USING utf8mb4), CONVERT(X'e782bae99fb3e8a88ae68896e5bdb1e78987e68f90e4be9be5ad97e5b995e38081e6a899e9a18ce68896e585b6e4bb96e5ae9ae69982e69687e5ad97e8b387e69699e38082' USING utf8mb4), CONVERT(X'e782bae99fb3e8a88ae68896e5bdb1e78987e68f90e4be9be5ad97e5b995e38081e6a899e9a18ce68896e585b6e4bb96e5ae9ae69982e69687e5ad97e8b387e69699e38082e9809ae5b8b8e4bdbfe794a82057656256545420e6aa94e6a188efbc8ce9808fe9818e206b696e64e380817372636c616e67e380816c6162656c20e68c87e5ae9ae7a8aee9a19ee38081e8aa9ee8a880e88887e5908de7a8b1efbc9b747261636b20e698afe7a9bae58583e7b4a0e38082' USING utf8mb4), CONVERT(X'3c766964656f20636f6e74726f6c73207372633d226c6573736f6e2e6d7034223e0a20203c747261636b206b696e643d227375627469746c657322207372633d227a682e76747422207372636c616e673d227a682d48616e7422206c6162656c3d22e7b981e9ab94e4b8ade69687222064656661756c743e0a3c2f766964656f3e' USING utf8mb4), CONVERT(X'e782bae5bdb1e78987e68c87e5ae9ae9a090e8a8ade5ad97e5b995e8bb8ce38082' USING utf8mb4), CONVERT(X'747261636b' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f6d656469612e68746d6c237468652d747261636b2d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c747261636b3e' USING utf8mb4),
display_label = CONVERT(X'e69687e5ad97e8bb8c' USING utf8mb4),
summary = CONVERT(X'e782bae99fb3e8a88ae68896e5bdb1e78987e68f90e4be9be5ad97e5b995e38081e6a899e9a18ce68896e585b6e4bb96e5ae9ae69982e69687e5ad97e8b387e69699e38082' USING utf8mb4),
description = CONVERT(X'e782bae99fb3e8a88ae68896e5bdb1e78987e68f90e4be9be5ad97e5b995e38081e6a899e9a18ce68896e585b6e4bb96e5ae9ae69982e69687e5ad97e8b387e69699e38082e9809ae5b8b8e4bdbfe794a82057656256545420e6aa94e6a188efbc8ce9808fe9818e206b696e64e380817372636c616e67e380816c6162656c20e68c87e5ae9ae7a8aee9a19ee38081e8aa9ee8a880e88887e5908de7a8b1efbc9b747261636b20e698afe7a9bae58583e7b4a0e38082' USING utf8mb4),
example_code = CONVERT(X'3c766964656f20636f6e74726f6c73207372633d226c6573736f6e2e6d7034223e0a20203c747261636b206b696e643d227375627469746c657322207372633d227a682e76747422207372636c616e673d227a682d48616e7422206c6162656c3d22e7b981e9ab94e4b8ade69687222064656661756c743e0a3c2f766964656f3e' USING utf8mb4),
example_description = CONVERT(X'e782bae5bdb1e78987e68c87e5ae9ae9a090e8a8ade5ad97e5b995e8bb8ce38082' USING utf8mb4),
sort_key = CONVERT(X'747261636b' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f6d656469612e68746d6c237468652d747261636b2d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d747261636b' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'747261636b' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'656d6265646465642d636f6e74656e74' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d6d6170' USING utf8mb4), CONVERT(X'3c6d61703e' USING utf8mb4), CONVERT(X'e5bdb1e5838fe59cb0e59c96' USING utf8mb4), CONVERT(X'e5ae9ae7bea9e59c96e78987e4b8ade79a84e58fafe4ba92e58b95e58d80e59f9fe99b86e59088e38082' USING utf8mb4), CONVERT(X'e5ae9ae7bea9e59c96e78987e4b8ade79a84e58fafe4ba92e58b95e58d80e59f9fe99b86e59088e38082e4bba5206e616d6520e591bde5908defbc8ce4be9b20696d6720e79a84207573656d617020e5bc95e794a8efbc8ce4b8a6e4bdbfe794a8206172656120e68f8fe8bfb0e59084e58d80e59f9fe38082' USING utf8mb4), CONVERT(X'3c696d67207372633d226d61702e706e672220616c743d22e6a893e5b1a4e9858de7bdaee59c9622207573656d61703d2223666c6f6f72223e0a3c6d6170206e616d653d22666c6f6f72223e0a20203c617265612073686170653d22726563742220636f6f7264733d22302c302c3130302c3130302220687265663d222f726f6f6d2d612220616c743d224120e69599e5aea4223e0a3c2f6d61703e' USING utf8mb4), CONVERT(X'e5b087e59c96e78987e79a84e4b880e5808be79fa9e5bda2e58d80e59f9fe980a3e588b0e69599e5aea4e9a081e99da2e38082' USING utf8mb4), CONVERT(X'6d6170' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f696d6167652d6d6170732e68746d6c237468652d6d61702d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c6d61703e' USING utf8mb4),
display_label = CONVERT(X'e5bdb1e5838fe59cb0e59c96' USING utf8mb4),
summary = CONVERT(X'e5ae9ae7bea9e59c96e78987e4b8ade79a84e58fafe4ba92e58b95e58d80e59f9fe99b86e59088e38082' USING utf8mb4),
description = CONVERT(X'e5ae9ae7bea9e59c96e78987e4b8ade79a84e58fafe4ba92e58b95e58d80e59f9fe99b86e59088e38082e4bba5206e616d6520e591bde5908defbc8ce4be9b20696d6720e79a84207573656d617020e5bc95e794a8efbc8ce4b8a6e4bdbfe794a8206172656120e68f8fe8bfb0e59084e58d80e59f9fe38082' USING utf8mb4),
example_code = CONVERT(X'3c696d67207372633d226d61702e706e672220616c743d22e6a893e5b1a4e9858de7bdaee59c9622207573656d61703d2223666c6f6f72223e0a3c6d6170206e616d653d22666c6f6f72223e0a20203c617265612073686170653d22726563742220636f6f7264733d22302c302c3130302c3130302220687265663d222f726f6f6d2d612220616c743d224120e69599e5aea4223e0a3c2f6d61703e' USING utf8mb4),
example_description = CONVERT(X'e5b087e59c96e78987e79a84e4b880e5808be79fa9e5bda2e58d80e59f9fe980a3e588b0e69599e5aea4e9a081e99da2e38082' USING utf8mb4),
sort_key = CONVERT(X'6d6170' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f696d6167652d6d6170732e68746d6c237468652d6d61702d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d6d6170' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'6d6170' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'656d6265646465642d636f6e74656e74' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d61726561' USING utf8mb4), CONVERT(X'3c617265613e' USING utf8mb4), CONVERT(X'e5bdb1e5838fe786b1e58d80' USING utf8mb4), CONVERT(X'e5ae9ae7bea9e5bdb1e5838fe59cb0e59c96e4b8ade79a84e58d80e59f9fe88887e980a3e7b590e38082' USING utf8mb4), CONVERT(X'e5ae9ae7bea9e5bdb1e5838fe59cb0e59c96e4b8ade79a84e58d80e59f9fe88887e980a3e7b590e38082e694bee59ca8206d617020e585a7efbc8ce4bba5207368617065e38081636f6f72647320e68f8fe8bfb0e7af84e59c8defbc8ce980a3e7b590e58d80e59f9fe99c80e68f90e4be9be981a9e795b620616c74efbc9b6172656120e698afe7a9bae58583e7b4a0e38082' USING utf8mb4), CONVERT(X'3c696d67207372633d2263616d7075732e706e672220616c743d22e6a0a1e59c92e59cb0e59c9622207573656d61703d222363616d707573223e0a3c6d6170206e616d653d2263616d707573223e0a20203c617265612073686170653d22636972636c652220636f6f7264733d2238302c38302c33302220687265663d222f6c6962726172792220616c743d22e59c96e69bb8e9a4a8223e0a3c2f6d61703e' USING utf8mb4), CONVERT(X'e782bae6a0a1e59c92e59cb0e59c96e4b8ade79a84e59c96e69bb8e9a4a8e5bbbae7ab8be59c93e5bda2e980a3e7b590e786b1e58d80e38082' USING utf8mb4), CONVERT(X'61726561' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f696d6167652d6d6170732e68746d6c237468652d617265612d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c617265613e' USING utf8mb4),
display_label = CONVERT(X'e5bdb1e5838fe786b1e58d80' USING utf8mb4),
summary = CONVERT(X'e5ae9ae7bea9e5bdb1e5838fe59cb0e59c96e4b8ade79a84e58d80e59f9fe88887e980a3e7b590e38082' USING utf8mb4),
description = CONVERT(X'e5ae9ae7bea9e5bdb1e5838fe59cb0e59c96e4b8ade79a84e58d80e59f9fe88887e980a3e7b590e38082e694bee59ca8206d617020e585a7efbc8ce4bba5207368617065e38081636f6f72647320e68f8fe8bfb0e7af84e59c8defbc8ce980a3e7b590e58d80e59f9fe99c80e68f90e4be9be981a9e795b620616c74efbc9b6172656120e698afe7a9bae58583e7b4a0e38082' USING utf8mb4),
example_code = CONVERT(X'3c696d67207372633d2263616d7075732e706e672220616c743d22e6a0a1e59c92e59cb0e59c9622207573656d61703d222363616d707573223e0a3c6d6170206e616d653d2263616d707573223e0a20203c617265612073686170653d22636972636c652220636f6f7264733d2238302c38302c33302220687265663d222f6c6962726172792220616c743d22e59c96e69bb8e9a4a8223e0a3c2f6d61703e' USING utf8mb4),
example_description = CONVERT(X'e782bae6a0a1e59c92e59cb0e59c96e4b8ade79a84e59c96e69bb8e9a4a8e5bbbae7ab8be59c93e5bda2e980a3e7b590e786b1e58d80e38082' USING utf8mb4),
sort_key = CONVERT(X'61726561' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f696d6167652d6d6170732e68746d6c237468652d617265612d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d61726561' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'61726561' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746162756c61722d64617461' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d7461626c65' USING utf8mb4), CONVERT(X'3c7461626c653e' USING utf8mb4), CONVERT(X'e8b387e69699e8a1a8e6a0bc' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae4bba5e58897e88887e6ac84e7b584e7b994e79a84e8b387e69699e38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae4bba5e58897e88887e6ac84e7b584e7b994e79a84e8b387e69699e38082e4bdbfe794a8207472e380817468e38081746420e5bbbae7ab8be585a7e5aeb9efbc8ce58fafe58aa0e4b88a2063617074696f6e20e88887e58897e7bea4e7b584efbc9be8a1a8e6a0bce4b88de68789e58faae794a8e4be86e68e92e78988e695b4e5808be7b6b2e9a081e38082' USING utf8mb4), CONVERT(X'3c7461626c653e0a20203c63617074696f6e3ee8aa9ee6b395e4bdbfe794a8e6aca1e695b83c2f63617074696f6e3e0a20203c74723e3c74682073636f70653d22636f6c223ee8aa9ee6b3953c2f74683e3c74682073636f70653d22636f6c223ee6aca1e695b83c2f74683e3c2f74723e0a20203c74723e3c74643e6469763c2f74643e3c74643e333c2f74643e3c2f74723e0a3c2f7461626c653e' USING utf8mb4), CONVERT(X'e4bdbfe794a8e8a1a8e6a0bce59188e78fbee8aa9ee6b395e88887e6aca1e695b8e79a84e5b08de68789e38082' USING utf8mb4), CONVERT(X'7461626c65' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f7461626c65732e68746d6c237468652d7461626c652d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c7461626c653e' USING utf8mb4),
display_label = CONVERT(X'e8b387e69699e8a1a8e6a0bc' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae4bba5e58897e88887e6ac84e7b584e7b994e79a84e8b387e69699e38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae4bba5e58897e88887e6ac84e7b584e7b994e79a84e8b387e69699e38082e4bdbfe794a8207472e380817468e38081746420e5bbbae7ab8be585a7e5aeb9efbc8ce58fafe58aa0e4b88a2063617074696f6e20e88887e58897e7bea4e7b584efbc9be8a1a8e6a0bce4b88de68789e58faae794a8e4be86e68e92e78988e695b4e5808be7b6b2e9a081e38082' USING utf8mb4),
example_code = CONVERT(X'3c7461626c653e0a20203c63617074696f6e3ee8aa9ee6b395e4bdbfe794a8e6aca1e695b83c2f63617074696f6e3e0a20203c74723e3c74682073636f70653d22636f6c223ee8aa9ee6b3953c2f74683e3c74682073636f70653d22636f6c223ee6aca1e695b83c2f74683e3c2f74723e0a20203c74723e3c74643e6469763c2f74643e3c74643e333c2f74643e3c2f74723e0a3c2f7461626c653e' USING utf8mb4),
example_description = CONVERT(X'e4bdbfe794a8e8a1a8e6a0bce59188e78fbee8aa9ee6b395e88887e6aca1e695b8e79a84e5b08de68789e38082' USING utf8mb4),
sort_key = CONVERT(X'7461626c65' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f7461626c65732e68746d6c237468652d7461626c652d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d7461626c65' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'7461626c65' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746162756c61722d64617461' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d63617074696f6e' USING utf8mb4), CONVERT(X'3c63617074696f6e3e' USING utf8mb4), CONVERT(X'e8a1a8e6a0bce6a899e9a18c' USING utf8mb4), CONVERT(X'e782bae68980e5b1ac207461626c6520e68f90e4be9be6a899e9a18ce38082' USING utf8mb4), CONVERT(X'e782bae68980e5b1ac207461626c6520e68f90e4be9be6a899e9a18ce38082e9809ae5b8b8e698af207461626c6520e79a84e7acace4b880e5808be5ad90e58583e7b4a0efbc8ce58fafe58d94e58aa9e4bdbfe794a8e88085e79086e8a7a3e8a1a8e6a0bce4b8bbe9a18cefbc9be4b88de5908ce696bc2066696775726520e79a842066696763617074696f6ee38082' USING utf8mb4), CONVERT(X'3c7461626c653e0a20203c63617074696f6e3ee5adb8e7bf92e980b2e5baa63c2f63617074696f6e3e0a20203c74723e3c74682073636f70653d22636f6c223ee8aa9ee8a8803c2f74683e3c74682073636f70653d22636f6c223ee78b80e6858b3c2f74683e3c2f74723e0a20203c74723e3c74643e48544d4c3c2f74643e3c74643ee7b7b4e7bf92e4b8ad3c2f74643e3c2f74723e0a3c2f7461626c653e' USING utf8mb4), CONVERT(X'e782bae5adb8e7bf92e980b2e5baa6e8a1a8e68f90e4be9be6a899e9a18ce38082' USING utf8mb4), CONVERT(X'63617074696f6e' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f7461626c65732e68746d6c237468652d63617074696f6e2d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c63617074696f6e3e' USING utf8mb4),
display_label = CONVERT(X'e8a1a8e6a0bce6a899e9a18c' USING utf8mb4),
summary = CONVERT(X'e782bae68980e5b1ac207461626c6520e68f90e4be9be6a899e9a18ce38082' USING utf8mb4),
description = CONVERT(X'e782bae68980e5b1ac207461626c6520e68f90e4be9be6a899e9a18ce38082e9809ae5b8b8e698af207461626c6520e79a84e7acace4b880e5808be5ad90e58583e7b4a0efbc8ce58fafe58d94e58aa9e4bdbfe794a8e88085e79086e8a7a3e8a1a8e6a0bce4b8bbe9a18cefbc9be4b88de5908ce696bc2066696775726520e79a842066696763617074696f6ee38082' USING utf8mb4),
example_code = CONVERT(X'3c7461626c653e0a20203c63617074696f6e3ee5adb8e7bf92e980b2e5baa63c2f63617074696f6e3e0a20203c74723e3c74682073636f70653d22636f6c223ee8aa9ee8a8803c2f74683e3c74682073636f70653d22636f6c223ee78b80e6858b3c2f74683e3c2f74723e0a20203c74723e3c74643e48544d4c3c2f74643e3c74643ee7b7b4e7bf92e4b8ad3c2f74643e3c2f74723e0a3c2f7461626c653e' USING utf8mb4),
example_description = CONVERT(X'e782bae5adb8e7bf92e980b2e5baa6e8a1a8e68f90e4be9be6a899e9a18ce38082' USING utf8mb4),
sort_key = CONVERT(X'63617074696f6e' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f7461626c65732e68746d6c237468652d63617074696f6e2d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d63617074696f6e' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'63617074696f6e' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746162756c61722d64617461' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d636f6c67726f7570' USING utf8mb4), CONVERT(X'3c636f6c67726f75703e' USING utf8mb4), CONVERT(X'e8a1a8e6a0bce6ac84e7bea4e7b584' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae8a1a8e6a0bce4b8ade4b880e7b584e6ac84e4bd8de38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae8a1a8e6a0bce4b8ade4b880e7b584e6ac84e4bd8de38082e58fafe58c85e590ab20636f6cefbc8ce68896e59ca8e6b292e69c8920636f6c20e5ad90e58583e7b4a0e69982e794a8207370616e20e68c87e5ae9ae6ac84e695b8efbc9be5ae83e5ae9ae7bea9e6ac84e7bea4e7b584efbc8ce4b88de5bbbae7ab8be8b387e69699e584b2e5ad98e6a0bce38082' USING utf8mb4), CONVERT(X'3c7461626c653e0a20203c636f6c67726f75703e3c636f6c20636c6173733d226e616d65223e3c636f6c20636c6173733d22636f756e74223e3c2f636f6c67726f75703e0a20203c74723e3c74682073636f70653d22636f6c223ee8aa9ee6b3953c2f74683e3c74682073636f70653d22636f6c223ee6aca1e695b83c2f74683e3c2f74723e0a20203c74723e3c74643e703c2f74643e3c74643e323c2f74643e3c2f74723e0a3c2f7461626c653e' USING utf8mb4), CONVERT(X'e5b087e8a1a8e6a0bce6ac84e4bd8de58886e7b584e4bba5e4bebfe5a597e794a8e694afe68fb4e79a84e6ac84e6a8a3e5bc8fe38082' USING utf8mb4), CONVERT(X'636f6c67726f7570' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f7461626c65732e68746d6c237468652d636f6c67726f75702d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c636f6c67726f75703e' USING utf8mb4),
display_label = CONVERT(X'e8a1a8e6a0bce6ac84e7bea4e7b584' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae8a1a8e6a0bce4b8ade4b880e7b584e6ac84e4bd8de38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae8a1a8e6a0bce4b8ade4b880e7b584e6ac84e4bd8de38082e58fafe58c85e590ab20636f6cefbc8ce68896e59ca8e6b292e69c8920636f6c20e5ad90e58583e7b4a0e69982e794a8207370616e20e68c87e5ae9ae6ac84e695b8efbc9be5ae83e5ae9ae7bea9e6ac84e7bea4e7b584efbc8ce4b88de5bbbae7ab8be8b387e69699e584b2e5ad98e6a0bce38082' USING utf8mb4),
example_code = CONVERT(X'3c7461626c653e0a20203c636f6c67726f75703e3c636f6c20636c6173733d226e616d65223e3c636f6c20636c6173733d22636f756e74223e3c2f636f6c67726f75703e0a20203c74723e3c74682073636f70653d22636f6c223ee8aa9ee6b3953c2f74683e3c74682073636f70653d22636f6c223ee6aca1e695b83c2f74683e3c2f74723e0a20203c74723e3c74643e703c2f74643e3c74643e323c2f74643e3c2f74723e0a3c2f7461626c653e' USING utf8mb4),
example_description = CONVERT(X'e5b087e8a1a8e6a0bce6ac84e4bd8de58886e7b584e4bba5e4bebfe5a597e794a8e694afe68fb4e79a84e6ac84e6a8a3e5bc8fe38082' USING utf8mb4),
sort_key = CONVERT(X'636f6c67726f7570' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f7461626c65732e68746d6c237468652d636f6c67726f75702d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d636f6c67726f7570' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'636f6c67726f7570' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746162756c61722d64617461' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d636f6c' USING utf8mb4), CONVERT(X'3c636f6c3e' USING utf8mb4), CONVERT(X'e8a1a8e6a0bce6ac84' USING utf8mb4), CONVERT(X'e8a1a8e7a4ba20636f6c67726f757020e4b8ade79a84e4b880e5808be68896e5a49ae5808be6ac84e4bd8de38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4ba20636f6c67726f757020e4b8ade79a84e4b880e5808be68896e5a49ae5808be6ac84e4bd8de38082e58fafe794a8207370616e20e8a1a8e7a4bae980a3e7ba8ce6ac84e695b8efbc9be4b88de5bbbae7ab8be8b387e69699e585a7e5aeb9efbc8ce4b99fe4b88de698afe68980e69c892043535320e5b1ace680a7e983bde883bde5a597e794a8e588b0e6ac84e38082636f6c20e698afe7a9bae58583e7b4a0e38082' USING utf8mb4), CONVERT(X'3c7461626c653e0a20203c636f6c67726f75703e3c636f6c207370616e3d22322220636c6173733d2273756d6d6172792d636f6c756d6e73223e3c2f636f6c67726f75703e0a20203c74723e3c74643e48544d4c3c2f74643e3c74643ee5ae8ce688903c2f74643e3c2f74723e0a3c2f7461626c653e' USING utf8mb4), CONVERT(X'e782bae5898de585a9e6ac84e8a8ade5ae9ae585b1e794a8e6ac84e5ae9ae7bea9e38082' USING utf8mb4), CONVERT(X'636f6c' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f7461626c65732e68746d6c237468652d636f6c2d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c636f6c3e' USING utf8mb4),
display_label = CONVERT(X'e8a1a8e6a0bce6ac84' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4ba20636f6c67726f757020e4b8ade79a84e4b880e5808be68896e5a49ae5808be6ac84e4bd8de38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4ba20636f6c67726f757020e4b8ade79a84e4b880e5808be68896e5a49ae5808be6ac84e4bd8de38082e58fafe794a8207370616e20e8a1a8e7a4bae980a3e7ba8ce6ac84e695b8efbc9be4b88de5bbbae7ab8be8b387e69699e585a7e5aeb9efbc8ce4b99fe4b88de698afe68980e69c892043535320e5b1ace680a7e983bde883bde5a597e794a8e588b0e6ac84e38082636f6c20e698afe7a9bae58583e7b4a0e38082' USING utf8mb4),
example_code = CONVERT(X'3c7461626c653e0a20203c636f6c67726f75703e3c636f6c207370616e3d22322220636c6173733d2273756d6d6172792d636f6c756d6e73223e3c2f636f6c67726f75703e0a20203c74723e3c74643e48544d4c3c2f74643e3c74643ee5ae8ce688903c2f74643e3c2f74723e0a3c2f7461626c653e' USING utf8mb4),
example_description = CONVERT(X'e782bae5898de585a9e6ac84e8a8ade5ae9ae585b1e794a8e6ac84e5ae9ae7bea9e38082' USING utf8mb4),
sort_key = CONVERT(X'636f6c' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f7461626c65732e68746d6c237468652d636f6c2d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d636f6c' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'636f6c' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746162756c61722d64617461' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d74626f6479' USING utf8mb4), CONVERT(X'3c74626f64793e' USING utf8mb4), CONVERT(X'e8a1a8e6a0bce8b387e69699e58897e7bea4e7b584' USING utf8mb4), CONVERT(X'e5b087e8a1a8e6a0bce4b8ade79a84e4b8bbe8a681e8b387e69699e58897e58886e68890e7bea4e7b584e38082' USING utf8mb4), CONVERT(X'e5b087e8a1a8e6a0bce4b8ade79a84e4b8bbe8a681e8b387e69699e58897e58886e68890e7bea4e7b584e38082e58c85e590ab207472efbc8ce8888720746865616420e79a84e6a899e9a18ce58897e58f8a2074666f6f7420e79a84e5bd99e7b8bde58897e58d80e58886efbc9be4b880e5bcb5e8a1a8e6a0bce58fafe69c89e5a49ae5808b2074626f6479e38082' USING utf8mb4), CONVERT(X'3c7461626c653e0a20203c74686561643e3c74723e3c74682073636f70653d22636f6c223ee8aa9ee6b3953c2f74683e3c2f74723e3c2f74686561643e0a20203c74626f64793e3c74723e3c74643e6469763c2f74643e3c2f74723e3c74723e3c74643e703c2f74643e3c2f74723e3c2f74626f64793e0a3c2f7461626c653e' USING utf8mb4), CONVERT(X'e5b087e8aa9ee6b395e8b387e69699e58897e7b584e68890e8a1a8e6a0bce4b8bbe9ab94e38082' USING utf8mb4), CONVERT(X'74626f6479' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f7461626c65732e68746d6c237468652d74626f64792d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c74626f64793e' USING utf8mb4),
display_label = CONVERT(X'e8a1a8e6a0bce8b387e69699e58897e7bea4e7b584' USING utf8mb4),
summary = CONVERT(X'e5b087e8a1a8e6a0bce4b8ade79a84e4b8bbe8a681e8b387e69699e58897e58886e68890e7bea4e7b584e38082' USING utf8mb4),
description = CONVERT(X'e5b087e8a1a8e6a0bce4b8ade79a84e4b8bbe8a681e8b387e69699e58897e58886e68890e7bea4e7b584e38082e58c85e590ab207472efbc8ce8888720746865616420e79a84e6a899e9a18ce58897e58f8a2074666f6f7420e79a84e5bd99e7b8bde58897e58d80e58886efbc9be4b880e5bcb5e8a1a8e6a0bce58fafe69c89e5a49ae5808b2074626f6479e38082' USING utf8mb4),
example_code = CONVERT(X'3c7461626c653e0a20203c74686561643e3c74723e3c74682073636f70653d22636f6c223ee8aa9ee6b3953c2f74683e3c2f74723e3c2f74686561643e0a20203c74626f64793e3c74723e3c74643e6469763c2f74643e3c2f74723e3c74723e3c74643e703c2f74643e3c2f74723e3c2f74626f64793e0a3c2f7461626c653e' USING utf8mb4),
example_description = CONVERT(X'e5b087e8aa9ee6b395e8b387e69699e58897e7b584e68890e8a1a8e6a0bce4b8bbe9ab94e38082' USING utf8mb4),
sort_key = CONVERT(X'74626f6479' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f7461626c65732e68746d6c237468652d74626f64792d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d74626f6479' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'74626f6479' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746162756c61722d64617461' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d7468656164' USING utf8mb4), CONVERT(X'3c74686561643e' USING utf8mb4), CONVERT(X'e8a1a8e6a0bce6a899e9a18ce58897e7bea4e7b584' USING utf8mb4), CONVERT(X'e5b087e8a1a8e6a0bce4b8ade4bd9ce782bae6ac84e6a899e9a18ce79a84e58897e7b584e68890e7bea4e7b584e38082' USING utf8mb4), CONVERT(X'e5b087e8a1a8e6a0bce4b8ade4bd9ce782bae6ac84e6a899e9a18ce79a84e58897e7b584e68890e7bea4e7b584e38082e9809ae5b8b8e58c85e590abe4bdbfe794a820746820e79a84207472efbc8ce694bee59ca8e4b8bbe8a681e8b387e69699e58897e4b98be5898defbc9be4b88de68789e58faae782bae4ba86e8ae93e69f90e58897e8ae8ae7b297e9ab94e8808ce4bdbfe794a8e38082' USING utf8mb4), CONVERT(X'3c7461626c653e0a20203c74686561643e3c74723e3c74682073636f70653d22636f6c223ee5908de7a8b13c2f74683e3c74682073636f70653d22636f6c223ee6aca1e695b83c2f74683e3c2f74723e3c2f74686561643e0a20203c74626f64793e3c74723e3c74643e703c2f74643e3c74643e323c2f74643e3c2f74723e3c2f74626f64793e0a3c2f7461626c653e' USING utf8mb4), CONVERT(X'e782bae8b387e69699e6ac84e4bd8de5bbbae7ab8be6a899e9a18ce58897e38082' USING utf8mb4), CONVERT(X'7468656164' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f7461626c65732e68746d6c237468652d74686561642d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c74686561643e' USING utf8mb4),
display_label = CONVERT(X'e8a1a8e6a0bce6a899e9a18ce58897e7bea4e7b584' USING utf8mb4),
summary = CONVERT(X'e5b087e8a1a8e6a0bce4b8ade4bd9ce782bae6ac84e6a899e9a18ce79a84e58897e7b584e68890e7bea4e7b584e38082' USING utf8mb4),
description = CONVERT(X'e5b087e8a1a8e6a0bce4b8ade4bd9ce782bae6ac84e6a899e9a18ce79a84e58897e7b584e68890e7bea4e7b584e38082e9809ae5b8b8e58c85e590abe4bdbfe794a820746820e79a84207472efbc8ce694bee59ca8e4b8bbe8a681e8b387e69699e58897e4b98be5898defbc9be4b88de68789e58faae782bae4ba86e8ae93e69f90e58897e8ae8ae7b297e9ab94e8808ce4bdbfe794a8e38082' USING utf8mb4),
example_code = CONVERT(X'3c7461626c653e0a20203c74686561643e3c74723e3c74682073636f70653d22636f6c223ee5908de7a8b13c2f74683e3c74682073636f70653d22636f6c223ee6aca1e695b83c2f74683e3c2f74723e3c2f74686561643e0a20203c74626f64793e3c74723e3c74643e703c2f74643e3c74643e323c2f74643e3c2f74723e3c2f74626f64793e0a3c2f7461626c653e' USING utf8mb4),
example_description = CONVERT(X'e782bae8b387e69699e6ac84e4bd8de5bbbae7ab8be6a899e9a18ce58897e38082' USING utf8mb4),
sort_key = CONVERT(X'7468656164' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f7461626c65732e68746d6c237468652d74686561642d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d7468656164' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'7468656164' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746162756c61722d64617461' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d74666f6f74' USING utf8mb4), CONVERT(X'3c74666f6f743e' USING utf8mb4), CONVERT(X'e8a1a8e6a0bce5bd99e7b8bde58897e7bea4e7b584' USING utf8mb4), CONVERT(X'e5b087e8a1a8e6a0bce4b8ade79a84e5bd99e7b8bde68896e7b590e5b0bee8b387e69699e58897e7b584e68890e7bea4e7b584e38082' USING utf8mb4), CONVERT(X'e5b087e8a1a8e6a0bce4b8ade79a84e5bd99e7b8bde68896e7b590e5b0bee8b387e69699e58897e7b584e68890e7bea4e7b584e38082e981a9e59088e7b8bde8a888e7ad89e8b387e69699efbc8ce58c85e590ab207472efbc8ce694bee59ca8e4b8bbe8a681e8b387e69699e58897e7bea4e7b584e4b98be5be8ce38082' USING utf8mb4), CONVERT(X'3c7461626c653e0a20203c74626f64793e3c74723e3c74643e48544d4c3c2f74643e3c74643e333c2f74643e3c2f74723e3c2f74626f64793e0a20203c74666f6f743e3c74723e3c74682073636f70653d22726f77223ee59088e8a8883c2f74683e3c74643e333c2f74643e3c2f74723e3c2f74666f6f743e0a3c2f7461626c653e' USING utf8mb4), CONVERT(X'e59ca8e8a1a8e6a0bce7b590e5b0bee68f90e4be9be59088e8a888e8b387e69699e38082' USING utf8mb4), CONVERT(X'74666f6f74' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f7461626c65732e68746d6c237468652d74666f6f742d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c74666f6f743e' USING utf8mb4),
display_label = CONVERT(X'e8a1a8e6a0bce5bd99e7b8bde58897e7bea4e7b584' USING utf8mb4),
summary = CONVERT(X'e5b087e8a1a8e6a0bce4b8ade79a84e5bd99e7b8bde68896e7b590e5b0bee8b387e69699e58897e7b584e68890e7bea4e7b584e38082' USING utf8mb4),
description = CONVERT(X'e5b087e8a1a8e6a0bce4b8ade79a84e5bd99e7b8bde68896e7b590e5b0bee8b387e69699e58897e7b584e68890e7bea4e7b584e38082e981a9e59088e7b8bde8a888e7ad89e8b387e69699efbc8ce58c85e590ab207472efbc8ce694bee59ca8e4b8bbe8a681e8b387e69699e58897e7bea4e7b584e4b98be5be8ce38082' USING utf8mb4),
example_code = CONVERT(X'3c7461626c653e0a20203c74626f64793e3c74723e3c74643e48544d4c3c2f74643e3c74643e333c2f74643e3c2f74723e3c2f74626f64793e0a20203c74666f6f743e3c74723e3c74682073636f70653d22726f77223ee59088e8a8883c2f74683e3c74643e333c2f74643e3c2f74723e3c2f74666f6f743e0a3c2f7461626c653e' USING utf8mb4),
example_description = CONVERT(X'e59ca8e8a1a8e6a0bce7b590e5b0bee68f90e4be9be59088e8a888e8b387e69699e38082' USING utf8mb4),
sort_key = CONVERT(X'74666f6f74' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f7461626c65732e68746d6c237468652d74666f6f742d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d74666f6f74' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'74666f6f74' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746162756c61722d64617461' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d7472' USING utf8mb4), CONVERT(X'3c74723e' USING utf8mb4), CONVERT(X'e8a1a8e6a0bce58897' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae8a1a8e6a0bce4b8ade79a84e4b880e58897e584b2e5ad98e6a0bce38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae8a1a8e6a0bce4b8ade79a84e4b880e58897e584b2e5ad98e6a0bce38082e4bdbfe794a820746820e6889620746420e5bbbae7ab8be8a9b2e58897e79a84e584b2e5ad98e6a0bcefbc8ce9809ae5b8b8e694bee59ca8207468656164e3808174626f647920e688962074666f6f7420e4b8ade38082' USING utf8mb4), CONVERT(X'3c7461626c653e0a20203c74626f64793e0a202020203c74723e3c74643e507974686f6e3c2f74643e3c74643e353c2f74643e3c2f74723e0a202020203c74723e3c74643e48544d4c3c2f74643e3c74643e333c2f74643e3c2f74723e0a20203c2f74626f64793e0a3c2f7461626c653e' USING utf8mb4), CONVERT(X'e5bbbae7ab8be585a9e7ad86e58897e8b387e69699e38082' USING utf8mb4), CONVERT(X'7472' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f7461626c65732e68746d6c237468652d74722d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c74723e' USING utf8mb4),
display_label = CONVERT(X'e8a1a8e6a0bce58897' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae8a1a8e6a0bce4b8ade79a84e4b880e58897e584b2e5ad98e6a0bce38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae8a1a8e6a0bce4b8ade79a84e4b880e58897e584b2e5ad98e6a0bce38082e4bdbfe794a820746820e6889620746420e5bbbae7ab8be8a9b2e58897e79a84e584b2e5ad98e6a0bcefbc8ce9809ae5b8b8e694bee59ca8207468656164e3808174626f647920e688962074666f6f7420e4b8ade38082' USING utf8mb4),
example_code = CONVERT(X'3c7461626c653e0a20203c74626f64793e0a202020203c74723e3c74643e507974686f6e3c2f74643e3c74643e353c2f74643e3c2f74723e0a202020203c74723e3c74643e48544d4c3c2f74643e3c74643e333c2f74643e3c2f74723e0a20203c2f74626f64793e0a3c2f7461626c653e' USING utf8mb4),
example_description = CONVERT(X'e5bbbae7ab8be585a9e7ad86e58897e8b387e69699e38082' USING utf8mb4),
sort_key = CONVERT(X'7472' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f7461626c65732e68746d6c237468652d74722d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d7472' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'7472' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746162756c61722d64617461' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d7464' USING utf8mb4), CONVERT(X'3c74643e' USING utf8mb4), CONVERT(X'e8b387e69699e584b2e5ad98e6a0bc' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae8a1a8e6a0bce58897e4b8ade79a84e8b387e69699e584b2e5ad98e6a0bce38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae8a1a8e6a0bce58897e4b8ade79a84e8b387e69699e584b2e5ad98e6a0bce38082e58fafe794a820636f6c7370616e20e6889620726f777370616e20e8b7a8e6ac84e38081e8b7a8e58897efbc9be6a899e9a18ce584b2e5ad98e6a0bce68789e4bdbfe794a8207468e38082' USING utf8mb4), CONVERT(X'3c7461626c653e0a20203c74723e3c74682073636f70653d22726f77223ee8aa9ee8a8803c2f74683e3c74643e48544d4c3c2f74643e3c2f74723e0a3c2f7461626c653e' USING utf8mb4), CONVERT(X'e59ca8e58897e6a899e9a18ce69781e694bee7bdaee8b387e69699e580bce38082' USING utf8mb4), CONVERT(X'7464' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f7461626c65732e68746d6c237468652d74642d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c74643e' USING utf8mb4),
display_label = CONVERT(X'e8b387e69699e584b2e5ad98e6a0bc' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae8a1a8e6a0bce58897e4b8ade79a84e8b387e69699e584b2e5ad98e6a0bce38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae8a1a8e6a0bce58897e4b8ade79a84e8b387e69699e584b2e5ad98e6a0bce38082e58fafe794a820636f6c7370616e20e6889620726f777370616e20e8b7a8e6ac84e38081e8b7a8e58897efbc9be6a899e9a18ce584b2e5ad98e6a0bce68789e4bdbfe794a8207468e38082' USING utf8mb4),
example_code = CONVERT(X'3c7461626c653e0a20203c74723e3c74682073636f70653d22726f77223ee8aa9ee8a8803c2f74683e3c74643e48544d4c3c2f74643e3c2f74723e0a3c2f7461626c653e' USING utf8mb4),
example_description = CONVERT(X'e59ca8e58897e6a899e9a18ce69781e694bee7bdaee8b387e69699e580bce38082' USING utf8mb4),
sort_key = CONVERT(X'7464' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f7461626c65732e68746d6c237468652d74642d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d7464' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'7464' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'746162756c61722d64617461' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d7468' USING utf8mb4), CONVERT(X'3c74683e' USING utf8mb4), CONVERT(X'e6a899e9a18ce584b2e5ad98e6a0bc' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae8a1a8e6a0bce4b8ade79a84e58897e68896e6ac84e6a899e9a18ce584b2e5ad98e6a0bce38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae8a1a8e6a0bce4b8ade79a84e58897e68896e6ac84e6a899e9a18ce584b2e5ad98e6a0bce38082e58fafe794a82073636f706520e68c87e6988ee6a899e9a18ce981a9e794a8e79a84e58897e68896e6ac84efbc8ce8a487e99b9ce8a1a8e6a0bce58fafe794a8206865616465727320e5bbbae7ab8be9979ce881afefbc9be4b88de58faae698afe7b297e9ab94e79a84207464e38082' USING utf8mb4), CONVERT(X'3c7461626c653e0a20203c74723e3c74682073636f70653d22636f6c223ee8aa9ee6b3953c2f74683e3c74682073636f70653d22636f6c223ee6aca1e695b83c2f74683e3c2f74723e0a20203c74723e3c74682073636f70653d22726f77223e6469763c2f74683e3c74643e333c2f74643e3c2f74723e0a3c2f7461626c653e' USING utf8mb4), CONVERT(X'e58886e588a5e6a899e7a4bae6ac84e6a899e9a18ce88887e58897e6a899e9a18ce38082' USING utf8mb4), CONVERT(X'7468' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f7461626c65732e68746d6c237468652d74682d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c74683e' USING utf8mb4),
display_label = CONVERT(X'e6a899e9a18ce584b2e5ad98e6a0bc' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae8a1a8e6a0bce4b8ade79a84e58897e68896e6ac84e6a899e9a18ce584b2e5ad98e6a0bce38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae8a1a8e6a0bce4b8ade79a84e58897e68896e6ac84e6a899e9a18ce584b2e5ad98e6a0bce38082e58fafe794a82073636f706520e68c87e6988ee6a899e9a18ce981a9e794a8e79a84e58897e68896e6ac84efbc8ce8a487e99b9ce8a1a8e6a0bce58fafe794a8206865616465727320e5bbbae7ab8be9979ce881afefbc9be4b88de58faae698afe7b297e9ab94e79a84207464e38082' USING utf8mb4),
example_code = CONVERT(X'3c7461626c653e0a20203c74723e3c74682073636f70653d22636f6c223ee8aa9ee6b3953c2f74683e3c74682073636f70653d22636f6c223ee6aca1e695b83c2f74683e3c2f74723e0a20203c74723e3c74682073636f70653d22726f77223e6469763c2f74683e3c74643e333c2f74643e3c2f74723e0a3c2f7461626c653e' USING utf8mb4),
example_description = CONVERT(X'e58886e588a5e6a899e7a4bae6ac84e6a899e9a18ce88887e58897e6a899e9a18ce38082' USING utf8mb4),
sort_key = CONVERT(X'7468' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f7461626c65732e68746d6c237468652d74682d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d7468' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'7468' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'666f726d73' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d666f726d' USING utf8mb4), CONVERT(X'3c666f726d3e' USING utf8mb4), CONVERT(X'e8a1a8e596ae' USING utf8mb4), CONVERT(X'e5b087e58fafe68f90e4baa4e79a84e8bcb8e585a5e68ea7e588b6e9a085e7b584e68890e8a1a8e596aee38082' USING utf8mb4), CONVERT(X'e5b087e58fafe68f90e4baa4e79a84e8bcb8e585a5e68ea7e588b6e9a085e7b584e68890e8a1a8e596aee38082e4bdbfe794a820616374696f6ee380816d6574686f6420e7ad89e68f8fe8bfb0e68f90e4baa4e696b9e5bc8fefbc9be6ac84e4bd8de9809ae5b8b8e99c80e8a681206e616d6520e6898de883bde99aa8e8a1a8e596aee68f90e4baa4efbc8c666f726d20e4b88de58fafe5b7a2e78b80e38082' USING utf8mb4), CONVERT(X'3c666f726d20616374696f6e3d222f73656172636822206d6574686f643d22676574223e0a20203c6c6162656c3ee9979ce98db5e5ad97203c696e707574206e616d653d2271223e3c2f6c6162656c3e0a20203c627574746f6e20747970653d227375626d6974223ee6909ce5b08b3c2f627574746f6e3e0a3c2f666f726d3e' USING utf8mb4), CONVERT(X'e5b087e9979ce98db5e5ad97e4bba52047455420e8a1a8e596aee68f90e4baa4e38082' USING utf8mb4), CONVERT(X'666f726d' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f666f726d732e68746d6c237468652d666f726d2d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c666f726d3e' USING utf8mb4),
display_label = CONVERT(X'e8a1a8e596ae' USING utf8mb4),
summary = CONVERT(X'e5b087e58fafe68f90e4baa4e79a84e8bcb8e585a5e68ea7e588b6e9a085e7b584e68890e8a1a8e596aee38082' USING utf8mb4),
description = CONVERT(X'e5b087e58fafe68f90e4baa4e79a84e8bcb8e585a5e68ea7e588b6e9a085e7b584e68890e8a1a8e596aee38082e4bdbfe794a820616374696f6ee380816d6574686f6420e7ad89e68f8fe8bfb0e68f90e4baa4e696b9e5bc8fefbc9be6ac84e4bd8de9809ae5b8b8e99c80e8a681206e616d6520e6898de883bde99aa8e8a1a8e596aee68f90e4baa4efbc8c666f726d20e4b88de58fafe5b7a2e78b80e38082' USING utf8mb4),
example_code = CONVERT(X'3c666f726d20616374696f6e3d222f73656172636822206d6574686f643d22676574223e0a20203c6c6162656c3ee9979ce98db5e5ad97203c696e707574206e616d653d2271223e3c2f6c6162656c3e0a20203c627574746f6e20747970653d227375626d6974223ee6909ce5b08b3c2f627574746f6e3e0a3c2f666f726d3e' USING utf8mb4),
example_description = CONVERT(X'e5b087e9979ce98db5e5ad97e4bba52047455420e8a1a8e596aee68f90e4baa4e38082' USING utf8mb4),
sort_key = CONVERT(X'666f726d' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f666f726d732e68746d6c237468652d666f726d2d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d666f726d' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'666f726d' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'666f726d73' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d6c6162656c' USING utf8mb4), CONVERT(X'3c6c6162656c3e' USING utf8mb4), CONVERT(X'e6ac84e4bd8de6a899e7b1a4' USING utf8mb4), CONVERT(X'e782bae58fafe6a899e8a898e79a84e8a1a8e596aee68ea7e588b6e9a085e68f90e4be9be69687e5ad97e6a899e7b1a4e38082' USING utf8mb4), CONVERT(X'e782bae58fafe6a899e8a898e79a84e8a1a8e596aee68ea7e588b6e9a085e68f90e4be9be69687e5ad97e6a899e7b1a4e38082e58fafe794a820666f7220e5b08de68789e68ea7e588b6e9a085e79a84206964efbc8ce68896e79bb4e68ea5e58c85e4bd8fe68ea7e588b6e9a085efbc9be5ae83e88887e8bcb8e585a5e6a186e4b8ade79a8420706c616365686f6c64657220e794a8e98094e4b88de5908ce38082' USING utf8mb4), CONVERT(X'3c6c6162656c20666f723d226e69636b6e616d65223ee69ab1e7a8b13c2f6c6162656c3e0a3c696e7075742069643d226e69636b6e616d6522206e616d653d226e69636b6e616d65223e' USING utf8mb4), CONVERT(X'e4bba520666f7220e8888720696420e5bbbae7ab8be69ab1e7a8b1e6ac84e4bd8de79a84e6a899e7b1a4e9979ce881afe38082' USING utf8mb4), CONVERT(X'6c6162656c' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f666f726d732e68746d6c237468652d6c6162656c2d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c6c6162656c3e' USING utf8mb4),
display_label = CONVERT(X'e6ac84e4bd8de6a899e7b1a4' USING utf8mb4),
summary = CONVERT(X'e782bae58fafe6a899e8a898e79a84e8a1a8e596aee68ea7e588b6e9a085e68f90e4be9be69687e5ad97e6a899e7b1a4e38082' USING utf8mb4),
description = CONVERT(X'e782bae58fafe6a899e8a898e79a84e8a1a8e596aee68ea7e588b6e9a085e68f90e4be9be69687e5ad97e6a899e7b1a4e38082e58fafe794a820666f7220e5b08de68789e68ea7e588b6e9a085e79a84206964efbc8ce68896e79bb4e68ea5e58c85e4bd8fe68ea7e588b6e9a085efbc9be5ae83e88887e8bcb8e585a5e6a186e4b8ade79a8420706c616365686f6c64657220e794a8e98094e4b88de5908ce38082' USING utf8mb4),
example_code = CONVERT(X'3c6c6162656c20666f723d226e69636b6e616d65223ee69ab1e7a8b13c2f6c6162656c3e0a3c696e7075742069643d226e69636b6e616d6522206e616d653d226e69636b6e616d65223e' USING utf8mb4),
example_description = CONVERT(X'e4bba520666f7220e8888720696420e5bbbae7ab8be69ab1e7a8b1e6ac84e4bd8de79a84e6a899e7b1a4e9979ce881afe38082' USING utf8mb4),
sort_key = CONVERT(X'6c6162656c' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f666f726d732e68746d6c237468652d6c6162656c2d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d6c6162656c' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'6c6162656c' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'666f726d73' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d696e707574' USING utf8mb4), CONVERT(X'3c696e7075743e' USING utf8mb4), CONVERT(X'e8bcb8e585a5e68ea7e588b6e9a085' USING utf8mb4), CONVERT(X'e4be9d207479706520e68f90e4be9be69687e5ad97e38081e6a0b8e58f96e696b9e5a18ae58f8ae585b6e4bb96e8bcb8e585a5e58a9fe883bde38082' USING utf8mb4), CONVERT(X'e4be9d207479706520e68f90e4be9be69687e5ad97e38081e6a0b8e58f96e696b9e5a18ae58f8ae585b6e4bb96e8bcb8e585a5e58a9fe883bde38082e59084e9a19ee59e8be58fafe794a8e79a84e5b1ace680a7e88887e8a18ce782bae4b88de5908cefbc9be794a8206e616d6520e68c87e5ae9ae68f90e4baa4e5908de7a8b1e380816c6162656c20e68f90e4be9be6a899e7b1a4e38082696e70757420e698afe7a9bae58583e7b4a0e38082' USING utf8mb4), CONVERT(X'3c6c6162656c20666f723d22656d61696c223e456d61696c3c2f6c6162656c3e0a3c696e7075742069643d22656d61696c22206e616d653d22656d61696c2220747970653d22656d61696c22206175746f636f6d706c6574653d22656d61696c222072657175697265643e' USING utf8mb4), CONVERT(X'e5bbbae7ab8be69c89e6a899e7b1a4e38081e5bf85e5a1abe4b894e4bdbfe794a820456d61696c20e8bcb8e585a5e59e8be588a5e79a84e6ac84e4bd8de38082' USING utf8mb4), CONVERT(X'696e707574' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f696e7075742e68746d6c237468652d696e7075742d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c696e7075743e' USING utf8mb4),
display_label = CONVERT(X'e8bcb8e585a5e68ea7e588b6e9a085' USING utf8mb4),
summary = CONVERT(X'e4be9d207479706520e68f90e4be9be69687e5ad97e38081e6a0b8e58f96e696b9e5a18ae58f8ae585b6e4bb96e8bcb8e585a5e58a9fe883bde38082' USING utf8mb4),
description = CONVERT(X'e4be9d207479706520e68f90e4be9be69687e5ad97e38081e6a0b8e58f96e696b9e5a18ae58f8ae585b6e4bb96e8bcb8e585a5e58a9fe883bde38082e59084e9a19ee59e8be58fafe794a8e79a84e5b1ace680a7e88887e8a18ce782bae4b88de5908cefbc9be794a8206e616d6520e68c87e5ae9ae68f90e4baa4e5908de7a8b1e380816c6162656c20e68f90e4be9be6a899e7b1a4e38082696e70757420e698afe7a9bae58583e7b4a0e38082' USING utf8mb4),
example_code = CONVERT(X'3c6c6162656c20666f723d22656d61696c223e456d61696c3c2f6c6162656c3e0a3c696e7075742069643d22656d61696c22206e616d653d22656d61696c2220747970653d22656d61696c22206175746f636f6d706c6574653d22656d61696c222072657175697265643e' USING utf8mb4),
example_description = CONVERT(X'e5bbbae7ab8be69c89e6a899e7b1a4e38081e5bf85e5a1abe4b894e4bdbfe794a820456d61696c20e8bcb8e585a5e59e8be588a5e79a84e6ac84e4bd8de38082' USING utf8mb4),
sort_key = CONVERT(X'696e707574' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f696e7075742e68746d6c237468652d696e7075742d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d696e707574' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'696e707574' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'666f726d73' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d627574746f6e' USING utf8mb4), CONVERT(X'3c627574746f6e3e' USING utf8mb4), CONVERT(X'e68c89e98895' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae58fafe794b1e4bdbfe794a8e88085e5959fe58b95e6938de4bd9ce79a84e68c89e98895e38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae58fafe794b1e4bdbfe794a8e88085e5959fe58b95e6938de4bd9ce79a84e68c89e98895e38082e59ca8e8a1a8e596aee585a7e68789e6988ee7a2bae68c87e5ae9a2074797065efbc8ce981bfe5858de99d9ee68f90e4baa4e794a8e98094e79a84e68c89e98895e6848fe5a496e68f90e4baa4efbc9be887aae8a882e6938de4bd9ce4bb8de99c80e7a88be5bc8fe89995e79086e38082' USING utf8mb4), CONVERT(X'3c627574746f6e20747970653d22627574746f6e223ee58886e69e90e7a88be5bc8fe7a2bc3c2f627574746f6e3e' USING utf8mb4), CONVERT(X'e5bbbae7ab8be4b88de69c83e887aae58b95e68f90e4baa4e8a1a8e596aee79a84e6938de4bd9ce68c89e98895e38082' USING utf8mb4), CONVERT(X'627574746f6e' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f666f726d2d656c656d656e74732e68746d6c237468652d627574746f6e2d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c627574746f6e3e' USING utf8mb4),
display_label = CONVERT(X'e68c89e98895' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae58fafe794b1e4bdbfe794a8e88085e5959fe58b95e6938de4bd9ce79a84e68c89e98895e38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae58fafe794b1e4bdbfe794a8e88085e5959fe58b95e6938de4bd9ce79a84e68c89e98895e38082e59ca8e8a1a8e596aee585a7e68789e6988ee7a2bae68c87e5ae9a2074797065efbc8ce981bfe5858de99d9ee68f90e4baa4e794a8e98094e79a84e68c89e98895e6848fe5a496e68f90e4baa4efbc9be887aae8a882e6938de4bd9ce4bb8de99c80e7a88be5bc8fe89995e79086e38082' USING utf8mb4),
example_code = CONVERT(X'3c627574746f6e20747970653d22627574746f6e223ee58886e69e90e7a88be5bc8fe7a2bc3c2f627574746f6e3e' USING utf8mb4),
example_description = CONVERT(X'e5bbbae7ab8be4b88de69c83e887aae58b95e68f90e4baa4e8a1a8e596aee79a84e6938de4bd9ce68c89e98895e38082' USING utf8mb4),
sort_key = CONVERT(X'627574746f6e' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f666f726d2d656c656d656e74732e68746d6c237468652d627574746f6e2d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d627574746f6e' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'627574746f6e' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'666f726d73' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d73656c656374' USING utf8mb4), CONVERT(X'3c73656c6563743e' USING utf8mb4), CONVERT(X'e981b8e69387e68ea7e588b6e9a085' USING utf8mb4), CONVERT(X'e8ae93e4bdbfe794a8e88085e5be9ee981b8e9a085e6b885e596aee981b8e58f96e580bce38082' USING utf8mb4), CONVERT(X'e8ae93e4bdbfe794a8e88085e5be9ee981b8e9a085e6b885e596aee981b8e58f96e580bce38082e9809ae5b8b8e58c85e590ab206f7074696f6eefbc8ce4b99fe58fafe9808fe9818e206f707467726f757020e58886e7b584efbc9b6d756c7469706c6520e58581e8a8b1e5a49ae981b8efbc8c6e616d6520e6b1bae5ae9ae68f90e4baa4e5908de7a8b1e38082' USING utf8mb4), CONVERT(X'3c6c6162656c20666f723d226c616e6775616765223ee8aa9ee8a8803c2f6c6162656c3e0a3c73656c6563742069643d226c616e677561676522206e616d653d226c616e6775616765223e0a20203c6f7074696f6e2076616c75653d22707974686f6e223e507974686f6e3c2f6f7074696f6e3e0a20203c6f7074696f6e2076616c75653d2268746d6c223e48544d4c3c2f6f7074696f6e3e0a3c2f73656c6563743e' USING utf8mb4), CONVERT(X'e5bbbae7ab8be7a88be5bc8fe8aa9ee8a880e981b8e596aee38082' USING utf8mb4), CONVERT(X'73656c656374' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f666f726d2d656c656d656e74732e68746d6c237468652d73656c6563742d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c73656c6563743e' USING utf8mb4),
display_label = CONVERT(X'e981b8e69387e68ea7e588b6e9a085' USING utf8mb4),
summary = CONVERT(X'e8ae93e4bdbfe794a8e88085e5be9ee981b8e9a085e6b885e596aee981b8e58f96e580bce38082' USING utf8mb4),
description = CONVERT(X'e8ae93e4bdbfe794a8e88085e5be9ee981b8e9a085e6b885e596aee981b8e58f96e580bce38082e9809ae5b8b8e58c85e590ab206f7074696f6eefbc8ce4b99fe58fafe9808fe9818e206f707467726f757020e58886e7b584efbc9b6d756c7469706c6520e58581e8a8b1e5a49ae981b8efbc8c6e616d6520e6b1bae5ae9ae68f90e4baa4e5908de7a8b1e38082' USING utf8mb4),
example_code = CONVERT(X'3c6c6162656c20666f723d226c616e6775616765223ee8aa9ee8a8803c2f6c6162656c3e0a3c73656c6563742069643d226c616e677561676522206e616d653d226c616e6775616765223e0a20203c6f7074696f6e2076616c75653d22707974686f6e223e507974686f6e3c2f6f7074696f6e3e0a20203c6f7074696f6e2076616c75653d2268746d6c223e48544d4c3c2f6f7074696f6e3e0a3c2f73656c6563743e' USING utf8mb4),
example_description = CONVERT(X'e5bbbae7ab8be7a88be5bc8fe8aa9ee8a880e981b8e596aee38082' USING utf8mb4),
sort_key = CONVERT(X'73656c656374' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f666f726d2d656c656d656e74732e68746d6c237468652d73656c6563742d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d73656c656374' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'73656c656374' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'666f726d73' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d646174616c697374' USING utf8mb4), CONVERT(X'3c646174616c6973743e' USING utf8mb4), CONVERT(X'e8bcb8e585a5e5bbbae8adb0e6b885e596ae' USING utf8mb4), CONVERT(X'e782bae8bcb8e585a5e68ea7e588b6e9a085e68f90e4be9be5bbbae8adb0e580bce38082' USING utf8mb4), CONVERT(X'e782bae8bcb8e585a5e68ea7e588b6e9a085e68f90e4be9be5bbbae8adb0e580bce38082e794a820696420e8888720696e70757420e79a84206c69737420e5bbbae7ab8be9979ce881afefbc9be5bbbae8adb0e6b885e596aee9809ae5b8b8e4b88de99990e588b6e4bdbfe794a8e88085e58faae883bde8bcb8e585a5e58897e587bae79a84e580bce38082' USING utf8mb4), CONVERT(X'3c6c6162656c3ee8aa9ee8a880203c696e707574206e616d653d226c616e677561676522206c6973743d226c616e677561676573223e3c2f6c6162656c3e0a3c646174616c6973742069643d226c616e677561676573223e0a20203c6f7074696f6e2076616c75653d22507974686f6e223e3c2f6f7074696f6e3e0a20203c6f7074696f6e2076616c75653d2248544d4c223e3c2f6f7074696f6e3e0a3c2f646174616c6973743e' USING utf8mb4), CONVERT(X'e782bae69687e5ad97e8bcb8e585a5e68f90e4be9be8aa9ee8a880e5908de7a8b1e5bbbae8adb0e38082' USING utf8mb4), CONVERT(X'646174616c697374' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f666f726d2d656c656d656e74732e68746d6c237468652d646174616c6973742d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c646174616c6973743e' USING utf8mb4),
display_label = CONVERT(X'e8bcb8e585a5e5bbbae8adb0e6b885e596ae' USING utf8mb4),
summary = CONVERT(X'e782bae8bcb8e585a5e68ea7e588b6e9a085e68f90e4be9be5bbbae8adb0e580bce38082' USING utf8mb4),
description = CONVERT(X'e782bae8bcb8e585a5e68ea7e588b6e9a085e68f90e4be9be5bbbae8adb0e580bce38082e794a820696420e8888720696e70757420e79a84206c69737420e5bbbae7ab8be9979ce881afefbc9be5bbbae8adb0e6b885e596aee9809ae5b8b8e4b88de99990e588b6e4bdbfe794a8e88085e58faae883bde8bcb8e585a5e58897e587bae79a84e580bce38082' USING utf8mb4),
example_code = CONVERT(X'3c6c6162656c3ee8aa9ee8a880203c696e707574206e616d653d226c616e677561676522206c6973743d226c616e677561676573223e3c2f6c6162656c3e0a3c646174616c6973742069643d226c616e677561676573223e0a20203c6f7074696f6e2076616c75653d22507974686f6e223e3c2f6f7074696f6e3e0a20203c6f7074696f6e2076616c75653d2248544d4c223e3c2f6f7074696f6e3e0a3c2f646174616c6973743e' USING utf8mb4),
example_description = CONVERT(X'e782bae69687e5ad97e8bcb8e585a5e68f90e4be9be8aa9ee8a880e5908de7a8b1e5bbbae8adb0e38082' USING utf8mb4),
sort_key = CONVERT(X'646174616c697374' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f666f726d2d656c656d656e74732e68746d6c237468652d646174616c6973742d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d646174616c697374' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'646174616c697374' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'666f726d73' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d6f707467726f7570' USING utf8mb4), CONVERT(X'3c6f707467726f75703e' USING utf8mb4), CONVERT(X'e981b8e9a085e7bea4e7b584' USING utf8mb4), CONVERT(X'e5b0872073656c65637420e4b8ade79a84206f7074696f6e20e58886e7b584e38082' USING utf8mb4), CONVERT(X'e5b0872073656c65637420e4b8ade79a84206f7074696f6e20e58886e7b584e38082e4bdbfe794a8206c6162656c20e782bae7bea4e7b584e591bde5908defbc8c64697361626c656420e58fafe5819ce794a8e695b4e7b584e981b8e9a085efbc9be4b88de68789e5b7a2e78b80e694bee7bdae206f707467726f7570e38082' USING utf8mb4), CONVERT(X'3c6c6162656c3ee68a80e8a1930a20203c73656c656374206e616d653d22746563686e6f6c6f6779223e0a202020203c6f707467726f7570206c6162656c3d22e6a899e8a898e8aa9ee8a880223e3c6f7074696f6e2076616c75653d2268746d6c223e48544d4c3c2f6f7074696f6e3e3c2f6f707467726f75703e0a202020203c6f707467726f7570206c6162656c3d22e7a88be5bc8fe8aa9ee8a880223e3c6f7074696f6e2076616c75653d22707974686f6e223e507974686f6e3c2f6f7074696f6e3e3c2f6f707467726f75703e0a20203c2f73656c6563743e0a3c2f6c6162656c3e' USING utf8mb4), CONVERT(X'e68a8ae981b8e9a085e4be9de68a80e8a193e9a19ee59e8be58886e7b584e38082' USING utf8mb4), CONVERT(X'6f707467726f7570' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f666f726d2d656c656d656e74732e68746d6c237468652d6f707467726f75702d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c6f707467726f75703e' USING utf8mb4),
display_label = CONVERT(X'e981b8e9a085e7bea4e7b584' USING utf8mb4),
summary = CONVERT(X'e5b0872073656c65637420e4b8ade79a84206f7074696f6e20e58886e7b584e38082' USING utf8mb4),
description = CONVERT(X'e5b0872073656c65637420e4b8ade79a84206f7074696f6e20e58886e7b584e38082e4bdbfe794a8206c6162656c20e782bae7bea4e7b584e591bde5908defbc8c64697361626c656420e58fafe5819ce794a8e695b4e7b584e981b8e9a085efbc9be4b88de68789e5b7a2e78b80e694bee7bdae206f707467726f7570e38082' USING utf8mb4),
example_code = CONVERT(X'3c6c6162656c3ee68a80e8a1930a20203c73656c656374206e616d653d22746563686e6f6c6f6779223e0a202020203c6f707467726f7570206c6162656c3d22e6a899e8a898e8aa9ee8a880223e3c6f7074696f6e2076616c75653d2268746d6c223e48544d4c3c2f6f7074696f6e3e3c2f6f707467726f75703e0a202020203c6f707467726f7570206c6162656c3d22e7a88be5bc8fe8aa9ee8a880223e3c6f7074696f6e2076616c75653d22707974686f6e223e507974686f6e3c2f6f7074696f6e3e3c2f6f707467726f75703e0a20203c2f73656c6563743e0a3c2f6c6162656c3e' USING utf8mb4),
example_description = CONVERT(X'e68a8ae981b8e9a085e4be9de68a80e8a193e9a19ee59e8be58886e7b584e38082' USING utf8mb4),
sort_key = CONVERT(X'6f707467726f7570' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f666f726d2d656c656d656e74732e68746d6c237468652d6f707467726f75702d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d6f707467726f7570' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'6f707467726f7570' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'666f726d73' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d6f7074696f6e' USING utf8mb4), CONVERT(X'3c6f7074696f6e3e' USING utf8mb4), CONVERT(X'e981b8e9a085' USING utf8mb4), CONVERT(X'e8a1a8e7a4ba2073656c65637420e6889620646174616c69737420e4b8ade79a84e4b880e5808be981b8e9a085e38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4ba2073656c65637420e6889620646174616c69737420e4b8ade79a84e4b880e5808be981b8e9a085e3808276616c756520e58fafe68c87e5ae9ae5b08de68789e580bcefbc9be59ca82073656c65637420e4b8ade58fafe4bdbfe794a82073656c656374656420e68c87e5ae9ae5889de5a78be981b8e58f96e78b80e6858be38082' USING utf8mb4), CONVERT(X'3c6c6162656c3ee8aa9ee8a8800a20203c73656c656374206e616d653d226c616e6775616765223e0a202020203c6f7074696f6e2076616c75653d22707974686f6e223e507974686f6e3c2f6f7074696f6e3e0a202020203c6f7074696f6e2076616c75653d2268746d6c222073656c65637465643e48544d4c3c2f6f7074696f6e3e0a20203c2f73656c6563743e0a3c2f6c6162656c3e' USING utf8mb4), CONVERT(X'e9a090e8a8ade981b8e58f962048544d4c20e981b8e9a085e38082' USING utf8mb4), CONVERT(X'6f7074696f6e' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f666f726d2d656c656d656e74732e68746d6c237468652d6f7074696f6e2d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c6f7074696f6e3e' USING utf8mb4),
display_label = CONVERT(X'e981b8e9a085' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4ba2073656c65637420e6889620646174616c69737420e4b8ade79a84e4b880e5808be981b8e9a085e38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4ba2073656c65637420e6889620646174616c69737420e4b8ade79a84e4b880e5808be981b8e9a085e3808276616c756520e58fafe68c87e5ae9ae5b08de68789e580bcefbc9be59ca82073656c65637420e4b8ade58fafe4bdbfe794a82073656c656374656420e68c87e5ae9ae5889de5a78be981b8e58f96e78b80e6858be38082' USING utf8mb4),
example_code = CONVERT(X'3c6c6162656c3ee8aa9ee8a8800a20203c73656c656374206e616d653d226c616e6775616765223e0a202020203c6f7074696f6e2076616c75653d22707974686f6e223e507974686f6e3c2f6f7074696f6e3e0a202020203c6f7074696f6e2076616c75653d2268746d6c222073656c65637465643e48544d4c3c2f6f7074696f6e3e0a20203c2f73656c6563743e0a3c2f6c6162656c3e' USING utf8mb4),
example_description = CONVERT(X'e9a090e8a8ade981b8e58f962048544d4c20e981b8e9a085e38082' USING utf8mb4),
sort_key = CONVERT(X'6f7074696f6e' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f666f726d2d656c656d656e74732e68746d6c237468652d6f7074696f6e2d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d6f7074696f6e' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'6f7074696f6e' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'666f726d73' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d7465787461726561' USING utf8mb4), CONVERT(X'3c74657874617265613e' USING utf8mb4), CONVERT(X'e5a49ae8a18ce69687e5ad97e6ac84e4bd8d' USING utf8mb4), CONVERT(X'e8ae93e4bdbfe794a8e88085e8bcb8e585a5e5a49ae8a18ce7b494e69687e5ad97e38082' USING utf8mb4), CONVERT(X'e8ae93e4bdbfe794a8e88085e8bcb8e585a5e5a49ae8a18ce7b494e69687e5ad97e38082e5889de5a78be580bce5afabe59ca8e9968be5a78be88887e7b590e69d9fe6a899e7b1a4e4b98be99693efbc8ce4b88de4bdbfe794a82076616c756520e5b1ace680a7efbc9be585b6e4b8ade79a84e69687e5ad97e4b88de4bd9ce782ba2048544d4c20e5ad90e58583e7b4a0e59188e78fbee38082' USING utf8mb4), CONVERT(X'3c6c6162656c20666f723d226e6f746573223ee5adb8e7bf92e7ad86e8a8983c2f6c6162656c3e0a3c74657874617265612069643d226e6f74657322206e616d653d226e6f7465732220726f77733d2234223ee4bb8ae5a4a9e5adb8e7bf922048544d4ce380823c2f74657874617265613e' USING utf8mb4), CONVERT(X'e5bbbae7ab8be69c89e5889de5a78be585a7e5aeb9e79a84e5a49ae8a18ce7ad86e8a898e6ac84e4bd8de38082' USING utf8mb4), CONVERT(X'7465787461726561' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f666f726d2d656c656d656e74732e68746d6c237468652d74657874617265612d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c74657874617265613e' USING utf8mb4),
display_label = CONVERT(X'e5a49ae8a18ce69687e5ad97e6ac84e4bd8d' USING utf8mb4),
summary = CONVERT(X'e8ae93e4bdbfe794a8e88085e8bcb8e585a5e5a49ae8a18ce7b494e69687e5ad97e38082' USING utf8mb4),
description = CONVERT(X'e8ae93e4bdbfe794a8e88085e8bcb8e585a5e5a49ae8a18ce7b494e69687e5ad97e38082e5889de5a78be580bce5afabe59ca8e9968be5a78be88887e7b590e69d9fe6a899e7b1a4e4b98be99693efbc8ce4b88de4bdbfe794a82076616c756520e5b1ace680a7efbc9be585b6e4b8ade79a84e69687e5ad97e4b88de4bd9ce782ba2048544d4c20e5ad90e58583e7b4a0e59188e78fbee38082' USING utf8mb4),
example_code = CONVERT(X'3c6c6162656c20666f723d226e6f746573223ee5adb8e7bf92e7ad86e8a8983c2f6c6162656c3e0a3c74657874617265612069643d226e6f74657322206e616d653d226e6f7465732220726f77733d2234223ee4bb8ae5a4a9e5adb8e7bf922048544d4ce380823c2f74657874617265613e' USING utf8mb4),
example_description = CONVERT(X'e5bbbae7ab8be69c89e5889de5a78be585a7e5aeb9e79a84e5a49ae8a18ce7ad86e8a898e6ac84e4bd8de38082' USING utf8mb4),
sort_key = CONVERT(X'7465787461726561' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f666f726d2d656c656d656e74732e68746d6c237468652d74657874617265612d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d7465787461726561' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'7465787461726561' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'666f726d73' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d6f7574707574' USING utf8mb4), CONVERT(X'3c6f75747075743e' USING utf8mb4), CONVERT(X'e8a888e7ae97e68896e6938de4bd9ce7b590e69e9c' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae8a888e7ae97e68896e4bdbfe794a8e88085e6938de4bd9ce68980e5be97e588b0e79a84e7b590e69e9ce38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae8a888e7ae97e68896e4bdbfe794a8e88085e6938de4bd9ce68980e5be97e588b0e79a84e7b590e69e9ce38082e58fafe794a820666f7220e58897e587bae79bb8e9979ce68ea7e588b6e9a085206964efbc8ce4bd86e58583e7b4a0e69cace8baabe4b88de69c83e887aae58b95e59fb7e8a18ce8a888e7ae97efbc9be99c80e794b1e7a88be5bc8fe69bb4e696b0e7b590e69e9ce38082' USING utf8mb4), CONVERT(X'3c6c6162656c20666f723d22616d6f756e74223ee695b8e9878f3c2f6c6162656c3e0a3c696e7075742069643d22616d6f756e742220747970653d226e756d626572222076616c75653d2232223e0a3c6f757470757420666f723d22616d6f756e74223ee7b8bde9a18d2032303020e585833c2f6f75747075743e' USING utf8mb4), CONVERT(X'e6a899e7a4bae88887e695b8e9878fe8bcb8e585a5e79bb8e9979ce79a84e7b590e69e9cefbc9be695b8e580bce69bb4e696b0e99c80e58fa6e8a18ce5afa6e4bd9ce38082' USING utf8mb4), CONVERT(X'6f7574707574' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f666f726d2d656c656d656e74732e68746d6c237468652d6f75747075742d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c6f75747075743e' USING utf8mb4),
display_label = CONVERT(X'e8a888e7ae97e68896e6938de4bd9ce7b590e69e9c' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae8a888e7ae97e68896e4bdbfe794a8e88085e6938de4bd9ce68980e5be97e588b0e79a84e7b590e69e9ce38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae8a888e7ae97e68896e4bdbfe794a8e88085e6938de4bd9ce68980e5be97e588b0e79a84e7b590e69e9ce38082e58fafe794a820666f7220e58897e587bae79bb8e9979ce68ea7e588b6e9a085206964efbc8ce4bd86e58583e7b4a0e69cace8baabe4b88de69c83e887aae58b95e59fb7e8a18ce8a888e7ae97efbc9be99c80e794b1e7a88be5bc8fe69bb4e696b0e7b590e69e9ce38082' USING utf8mb4),
example_code = CONVERT(X'3c6c6162656c20666f723d22616d6f756e74223ee695b8e9878f3c2f6c6162656c3e0a3c696e7075742069643d22616d6f756e742220747970653d226e756d626572222076616c75653d2232223e0a3c6f757470757420666f723d22616d6f756e74223ee7b8bde9a18d2032303020e585833c2f6f75747075743e' USING utf8mb4),
example_description = CONVERT(X'e6a899e7a4bae88887e695b8e9878fe8bcb8e585a5e79bb8e9979ce79a84e7b590e69e9cefbc9be695b8e580bce69bb4e696b0e99c80e58fa6e8a18ce5afa6e4bd9ce38082' USING utf8mb4),
sort_key = CONVERT(X'6f7574707574' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f666f726d2d656c656d656e74732e68746d6c237468652d6f75747075742d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d6f7574707574' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'6f7574707574' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'666f726d73' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d70726f6772657373' USING utf8mb4), CONVERT(X'3c70726f67726573733e' USING utf8mb4), CONVERT(X'e5b7a5e4bd9ce980b2e5baa6' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae5b7a5e4bd9ce79baee5898de79a84e5ae8ce68890e980b2e5baa6e38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae5b7a5e4bd9ce79baee5898de79a84e5ae8ce68890e980b2e5baa6e38082e4bdbfe794a82076616c756520e88887206d617820e68f8fe8bfb0e980b2e5baa6efbc9be6b292e69c892076616c756520e69982e4bba3e8a1a8e980b2e5baa6e4b88de7a2bae5ae9aefbc8ce59bbae5ae9ae7af84e59c8de79a84e6b8ace9878fe580bce58987e981a9e59088206d65746572e38082' USING utf8mb4), CONVERT(X'3c6c6162656c20666f723d2275706c6f6164223ee4b88ae582b3e980b2e5baa63c2f6c6162656c3e0a3c70726f67726573732069643d2275706c6f6164222076616c75653d22333022206d61783d22313030223e3330253c2f70726f67726573733e' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae4b88ae582b3e5b7a5e4bd9ce5ae8ce68890e799bee58886e4b98be4b889e58d81e38082' USING utf8mb4), CONVERT(X'70726f6772657373' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f666f726d2d656c656d656e74732e68746d6c237468652d70726f67726573732d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c70726f67726573733e' USING utf8mb4),
display_label = CONVERT(X'e5b7a5e4bd9ce980b2e5baa6' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae5b7a5e4bd9ce79baee5898de79a84e5ae8ce68890e980b2e5baa6e38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae5b7a5e4bd9ce79baee5898de79a84e5ae8ce68890e980b2e5baa6e38082e4bdbfe794a82076616c756520e88887206d617820e68f8fe8bfb0e980b2e5baa6efbc9be6b292e69c892076616c756520e69982e4bba3e8a1a8e980b2e5baa6e4b88de7a2bae5ae9aefbc8ce59bbae5ae9ae7af84e59c8de79a84e6b8ace9878fe580bce58987e981a9e59088206d65746572e38082' USING utf8mb4),
example_code = CONVERT(X'3c6c6162656c20666f723d2275706c6f6164223ee4b88ae582b3e980b2e5baa63c2f6c6162656c3e0a3c70726f67726573732069643d2275706c6f6164222076616c75653d22333022206d61783d22313030223e3330253c2f70726f67726573733e' USING utf8mb4),
example_description = CONVERT(X'e8a1a8e7a4bae4b88ae582b3e5b7a5e4bd9ce5ae8ce68890e799bee58886e4b98be4b889e58d81e38082' USING utf8mb4),
sort_key = CONVERT(X'70726f6772657373' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f666f726d2d656c656d656e74732e68746d6c237468652d70726f67726573732d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d70726f6772657373' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'70726f6772657373' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'666f726d73' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d6d65746572' USING utf8mb4), CONVERT(X'3c6d657465723e' USING utf8mb4), CONVERT(X'e7af84e59c8de6b8ace9878fe580bc' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae5b7b2e79fa5e7af84e59c8de585a7e79a84e6b8ace9878fe580bce68896e6af94e4be8be38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae5b7b2e79fa5e7af84e59c8de585a7e79a84e6b8ace9878fe580bce68896e6af94e4be8be38082e58fafe794a8206d696ee380816d6178e380816c6f77e3808168696768e380816f7074696d756d20e68f8fe8bfb0e7af84e59c8de58f8ae79086e683b3e580bcefbc9be4b88de68789e794a8e4be86e8a1a8e7a4bae5b7a5e4bd9ce79a84e5ae8ce68890e980b2e5baa6e38082' USING utf8mb4), CONVERT(X'3c6c6162656c20666f723d2273746f72616765223ee584b2e5ad98e7a9bae99693e4bdbfe794a8e9878f3c2f6c6162656c3e0a3c6d657465722069643d2273746f7261676522206d696e3d223022206d61783d22313030222076616c75653d223635223e3635253c2f6d657465723e' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae5b7b2e79fa5e5aeb9e9878fe7af84e59c8de585a7e79a84e4bdbfe794a8e6af94e4be8be38082' USING utf8mb4), CONVERT(X'6d65746572' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f666f726d2d656c656d656e74732e68746d6c237468652d6d657465722d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c6d657465723e' USING utf8mb4),
display_label = CONVERT(X'e7af84e59c8de6b8ace9878fe580bc' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae5b7b2e79fa5e7af84e59c8de585a7e79a84e6b8ace9878fe580bce68896e6af94e4be8be38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae5b7b2e79fa5e7af84e59c8de585a7e79a84e6b8ace9878fe580bce68896e6af94e4be8be38082e58fafe794a8206d696ee380816d6178e380816c6f77e3808168696768e380816f7074696d756d20e68f8fe8bfb0e7af84e59c8de58f8ae79086e683b3e580bcefbc9be4b88de68789e794a8e4be86e8a1a8e7a4bae5b7a5e4bd9ce79a84e5ae8ce68890e980b2e5baa6e38082' USING utf8mb4),
example_code = CONVERT(X'3c6c6162656c20666f723d2273746f72616765223ee584b2e5ad98e7a9bae99693e4bdbfe794a8e9878f3c2f6c6162656c3e0a3c6d657465722069643d2273746f7261676522206d696e3d223022206d61783d22313030222076616c75653d223635223e3635253c2f6d657465723e' USING utf8mb4),
example_description = CONVERT(X'e8a1a8e7a4bae5b7b2e79fa5e5aeb9e9878fe7af84e59c8de585a7e79a84e4bdbfe794a8e6af94e4be8be38082' USING utf8mb4),
sort_key = CONVERT(X'6d65746572' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f666f726d2d656c656d656e74732e68746d6c237468652d6d657465722d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d6d65746572' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'6d65746572' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'666f726d73' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d6669656c64736574' USING utf8mb4), CONVERT(X'3c6669656c647365743e' USING utf8mb4), CONVERT(X'e8a1a8e596aee6ac84e4bd8de7bea4e7b584' USING utf8mb4), CONVERT(X'e5b087e79bb8e9979ce8a1a8e596aee68ea7e588b6e9a085e7b584e68890e7bea4e7b584e38082' USING utf8mb4), CONVERT(X'e5b087e79bb8e9979ce8a1a8e596aee68ea7e588b6e9a085e7b584e68890e7bea4e7b584e38082e9809ae5b8b8e4bba5e7acace4b880e5808b206c6567656e6420e68f90e4be9be7bea4e7b584e5908de7a8b1efbc9b64697361626c656420e58fafe5819ce794a8e7bea4e7b584e4b8ade79a84e5a49ae695b8e68ea7e588b6e9a085e38082' USING utf8mb4), CONVERT(X'3c6669656c647365743e0a20203c6c6567656e643ee881afe7b5a1e696b9e5bc8f3c2f6c6567656e643e0a20203c6c6162656c3e456d61696c203c696e707574206e616d653d22656d61696c2220747970653d22656d61696c223e3c2f6c6162656c3e0a3c2f6669656c647365743e' USING utf8mb4), CONVERT(X'e68a8ae881afe7b5a1e6ac84e4bd8de7b584e68890e585b7e5908de7a8b1e79a84e7bea4e7b584e38082' USING utf8mb4), CONVERT(X'6669656c64736574' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f666f726d2d656c656d656e74732e68746d6c237468652d6669656c647365742d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c6669656c647365743e' USING utf8mb4),
display_label = CONVERT(X'e8a1a8e596aee6ac84e4bd8de7bea4e7b584' USING utf8mb4),
summary = CONVERT(X'e5b087e79bb8e9979ce8a1a8e596aee68ea7e588b6e9a085e7b584e68890e7bea4e7b584e38082' USING utf8mb4),
description = CONVERT(X'e5b087e79bb8e9979ce8a1a8e596aee68ea7e588b6e9a085e7b584e68890e7bea4e7b584e38082e9809ae5b8b8e4bba5e7acace4b880e5808b206c6567656e6420e68f90e4be9be7bea4e7b584e5908de7a8b1efbc9b64697361626c656420e58fafe5819ce794a8e7bea4e7b584e4b8ade79a84e5a49ae695b8e68ea7e588b6e9a085e38082' USING utf8mb4),
example_code = CONVERT(X'3c6669656c647365743e0a20203c6c6567656e643ee881afe7b5a1e696b9e5bc8f3c2f6c6567656e643e0a20203c6c6162656c3e456d61696c203c696e707574206e616d653d22656d61696c2220747970653d22656d61696c223e3c2f6c6162656c3e0a3c2f6669656c647365743e' USING utf8mb4),
example_description = CONVERT(X'e68a8ae881afe7b5a1e6ac84e4bd8de7b584e68890e585b7e5908de7a8b1e79a84e7bea4e7b584e38082' USING utf8mb4),
sort_key = CONVERT(X'6669656c64736574' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f666f726d2d656c656d656e74732e68746d6c237468652d6669656c647365742d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d6669656c64736574' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'6669656c64736574' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'666f726d73' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d6c6567656e64' USING utf8mb4), CONVERT(X'3c6c6567656e643e' USING utf8mb4), CONVERT(X'e8a1a8e596aee7bea4e7b584e6a899e9a18c' USING utf8mb4), CONVERT(X'e782bae68980e5b1ac206669656c6473657420e68f90e4be9be7bea4e7b584e6a899e9a18ce38082' USING utf8mb4), CONVERT(X'e782bae68980e5b1ac206669656c6473657420e68f90e4be9be7bea4e7b584e6a899e9a18ce38082e694bee59ca8206669656c6473657420e79a84e7acace4b880e5808be5ad90e58583e7b4a0e4bd8de7bdaeefbc8ce58d94e58aa9e4bdbfe794a8e88085e79086e8a7a3e98099e7b584e68ea7e588b6e9a085e79a84e585b1e5908ce794a8e98094e38082' USING utf8mb4), CONVERT(X'3c6669656c647365743e0a20203c6c6567656e643ee5818fe5a5bde8aa9ee8a8803c2f6c6567656e643e0a20203c6c6162656c3e3c696e70757420747970653d22636865636b626f7822206e616d653d226c616e6775616765222076616c75653d2268746d6c223e48544d4c3c2f6c6162656c3e0a3c2f6669656c647365743e' USING utf8mb4), CONVERT(X'e4bba5206c6567656e6420e8aaaae6988ee6a0b8e58f96e696b9e5a18ae7bea4e7b584e79a84e794a8e98094e38082' USING utf8mb4), CONVERT(X'6c6567656e64' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f666f726d2d656c656d656e74732e68746d6c237468652d6c6567656e642d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c6c6567656e643e' USING utf8mb4),
display_label = CONVERT(X'e8a1a8e596aee7bea4e7b584e6a899e9a18c' USING utf8mb4),
summary = CONVERT(X'e782bae68980e5b1ac206669656c6473657420e68f90e4be9be7bea4e7b584e6a899e9a18ce38082' USING utf8mb4),
description = CONVERT(X'e782bae68980e5b1ac206669656c6473657420e68f90e4be9be7bea4e7b584e6a899e9a18ce38082e694bee59ca8206669656c6473657420e79a84e7acace4b880e5808be5ad90e58583e7b4a0e4bd8de7bdaeefbc8ce58d94e58aa9e4bdbfe794a8e88085e79086e8a7a3e98099e7b584e68ea7e588b6e9a085e79a84e585b1e5908ce794a8e98094e38082' USING utf8mb4),
example_code = CONVERT(X'3c6669656c647365743e0a20203c6c6567656e643ee5818fe5a5bde8aa9ee8a8803c2f6c6567656e643e0a20203c6c6162656c3e3c696e70757420747970653d22636865636b626f7822206e616d653d226c616e6775616765222076616c75653d2268746d6c223e48544d4c3c2f6c6162656c3e0a3c2f6669656c647365743e' USING utf8mb4),
example_description = CONVERT(X'e4bba5206c6567656e6420e8aaaae6988ee6a0b8e58f96e696b9e5a18ae7bea4e7b584e79a84e794a8e98094e38082' USING utf8mb4),
sort_key = CONVERT(X'6c6567656e64' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f666f726d2d656c656d656e74732e68746d6c237468652d6c6567656e642d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d6c6567656e64' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'6c6567656e64' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'666f726d73' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d73656c6563746564636f6e74656e74' USING utf8mb4), CONVERT(X'3c73656c6563746564636f6e74656e743e' USING utf8mb4), CONVERT(X'e79baee5898de981b8e58f96e585a7e5aeb9' USING utf8mb4), CONVERT(X'e58f8de698a02073656c65637420e4b8ade79baee5898de68980e981b8206f7074696f6e20e79a84e585a7e5aeb9e38082' USING utf8mb4), CONVERT(X'e58f8de698a02073656c65637420e4b8ade79baee5898de68980e981b8206f7074696f6e20e79a84e585a7e5aeb9e38082e794a8e696bce58fafe887aae8a8822073656c65637420e79a84e7acace4b880e5808be5ad9020627574746f6eefbc8ce8ae93e68c89e98895e4bba5e5aea3e5918ae5bc8fe59188e78fbee981b8e58f96e585a7e5aeb9efbc9be5afa6e99a9be59188e78fbee4be9de7808fe8a6bde599a8e694afe68fb4e8808ce5ae9ae38082' USING utf8mb4), CONVERT(X'3c6c6162656c20666f723d22637573746f6d2d6c616e6775616765223ee8aa9ee8a8803c2f6c6162656c3e0a3c73656c6563742069643d22637573746f6d2d6c616e677561676522206e616d653d226c616e6775616765223e0a20203c627574746f6e3e3c73656c6563746564636f6e74656e743e3c2f73656c6563746564636f6e74656e743e3c2f627574746f6e3e0a20203c6f7074696f6e2076616c75653d22707974686f6e223e507974686f6e3c2f6f7074696f6e3e0a20203c6f7074696f6e2076616c75653d2268746d6c223e48544d4c3c2f6f7074696f6e3e0a3c2f73656c6563743e' USING utf8mb4), CONVERT(X'e7a4bae7af84e58fafe887aae8a882e981b8e596aee4b8ade79a84e79baee5898de981b8e58f96e585a7e5aeb9efbc8ce99c80e7808fe8a6bde599a8e694afe68fb4e6ada4e58a9fe883bde38082' USING utf8mb4), CONVERT(X'73656c6563746564636f6e74656e74' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f666f726d2d656c656d656e74732e68746d6c237468652d73656c6563746564636f6e74656e742d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c73656c6563746564636f6e74656e743e' USING utf8mb4),
display_label = CONVERT(X'e79baee5898de981b8e58f96e585a7e5aeb9' USING utf8mb4),
summary = CONVERT(X'e58f8de698a02073656c65637420e4b8ade79baee5898de68980e981b8206f7074696f6e20e79a84e585a7e5aeb9e38082' USING utf8mb4),
description = CONVERT(X'e58f8de698a02073656c65637420e4b8ade79baee5898de68980e981b8206f7074696f6e20e79a84e585a7e5aeb9e38082e794a8e696bce58fafe887aae8a8822073656c65637420e79a84e7acace4b880e5808be5ad9020627574746f6eefbc8ce8ae93e68c89e98895e4bba5e5aea3e5918ae5bc8fe59188e78fbee981b8e58f96e585a7e5aeb9efbc9be5afa6e99a9be59188e78fbee4be9de7808fe8a6bde599a8e694afe68fb4e8808ce5ae9ae38082' USING utf8mb4),
example_code = CONVERT(X'3c6c6162656c20666f723d22637573746f6d2d6c616e6775616765223ee8aa9ee8a8803c2f6c6162656c3e0a3c73656c6563742069643d22637573746f6d2d6c616e677561676522206e616d653d226c616e6775616765223e0a20203c627574746f6e3e3c73656c6563746564636f6e74656e743e3c2f73656c6563746564636f6e74656e743e3c2f627574746f6e3e0a20203c6f7074696f6e2076616c75653d22707974686f6e223e507974686f6e3c2f6f7074696f6e3e0a20203c6f7074696f6e2076616c75653d2268746d6c223e48544d4c3c2f6f7074696f6e3e0a3c2f73656c6563743e' USING utf8mb4),
example_description = CONVERT(X'e7a4bae7af84e58fafe887aae8a882e981b8e596aee4b8ade79a84e79baee5898de981b8e58f96e585a7e5aeb9efbc8ce99c80e7808fe8a6bde599a8e694afe68fb4e6ada4e58a9fe883bde38082' USING utf8mb4),
sort_key = CONVERT(X'73656c6563746564636f6e74656e74' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f666f726d2d656c656d656e74732e68746d6c237468652d73656c6563746564636f6e74656e742d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d73656c6563746564636f6e74656e74' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'73656c6563746564636f6e74656e74' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'696e7465726163746976652d656c656d656e7473' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d64657461696c73' USING utf8mb4), CONVERT(X'3c64657461696c733e' USING utf8mb4), CONVERT(X'e58fafe5b195e9968be585a7e5aeb9' USING utf8mb4), CONVERT(X'e68f90e4be9be4bdbfe794a8e88085e58fafe5b195e9968be68896e694b6e59088e79a84e8a39ce58585e585a7e5aeb9e38082' USING utf8mb4), CONVERT(X'e68f90e4be9be4bdbfe794a8e88085e58fafe5b195e9968be68896e694b6e59088e79a84e8a39ce58585e585a7e5aeb9e38082e9809ae5b8b8e4bba5e7acace4b880e5808b2073756d6d61727920e4bd9ce782bae6a899e9a18cefbc8c6f70656e20e8a1a8e7a4bae5889de5a78be5b195e9968befbc9be981a9e59088e68fade99cb2e5bc8fe8aaaae6988eefbc8ce4b88de7ad89e696bce68980e69c89e9a19ee59e8be79a84e4ba92e58b95e68ea7e588b6e9a085e38082' USING utf8mb4), CONVERT(X'3c64657461696c733e0a20203c73756d6d6172793ee4bb80e9babce698af2048544d4cefbc9f3c2f73756d6d6172793e0a20203c703e48544d4c20e794a8e696bce68f8fe8bfb0e7b6b2e9a081e585a7e5aeb9e7b590e6a78be380823c2f703e0a3c2f64657461696c733e' USING utf8mb4), CONVERT(X'e5bbbae7ab8be58fafe794b1e4bdbfe794a8e88085e5b195e9968be79a84e8a7a3e9878be38082' USING utf8mb4), CONVERT(X'64657461696c73' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f696e7465726163746976652d656c656d656e74732e68746d6c237468652d64657461696c732d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c64657461696c733e' USING utf8mb4),
display_label = CONVERT(X'e58fafe5b195e9968be585a7e5aeb9' USING utf8mb4),
summary = CONVERT(X'e68f90e4be9be4bdbfe794a8e88085e58fafe5b195e9968be68896e694b6e59088e79a84e8a39ce58585e585a7e5aeb9e38082' USING utf8mb4),
description = CONVERT(X'e68f90e4be9be4bdbfe794a8e88085e58fafe5b195e9968be68896e694b6e59088e79a84e8a39ce58585e585a7e5aeb9e38082e9809ae5b8b8e4bba5e7acace4b880e5808b2073756d6d61727920e4bd9ce782bae6a899e9a18cefbc8c6f70656e20e8a1a8e7a4bae5889de5a78be5b195e9968befbc9be981a9e59088e68fade99cb2e5bc8fe8aaaae6988eefbc8ce4b88de7ad89e696bce68980e69c89e9a19ee59e8be79a84e4ba92e58b95e68ea7e588b6e9a085e38082' USING utf8mb4),
example_code = CONVERT(X'3c64657461696c733e0a20203c73756d6d6172793ee4bb80e9babce698af2048544d4cefbc9f3c2f73756d6d6172793e0a20203c703e48544d4c20e794a8e696bce68f8fe8bfb0e7b6b2e9a081e585a7e5aeb9e7b590e6a78be380823c2f703e0a3c2f64657461696c733e' USING utf8mb4),
example_description = CONVERT(X'e5bbbae7ab8be58fafe794b1e4bdbfe794a8e88085e5b195e9968be79a84e8a7a3e9878be38082' USING utf8mb4),
sort_key = CONVERT(X'64657461696c73' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f696e7465726163746976652d656c656d656e74732e68746d6c237468652d64657461696c732d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d64657461696c73' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'64657461696c73' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'696e7465726163746976652d656c656d656e7473' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d73756d6d617279' USING utf8mb4), CONVERT(X'3c73756d6d6172793e' USING utf8mb4), CONVERT(X'e5b195e9968be58d80e5a18ae6a899e9a18c' USING utf8mb4), CONVERT(X'e68f90e4be9be68980e5b1ac2064657461696c7320e79a84e6a899e9a18ce68896e69198e8a681e38082' USING utf8mb4), CONVERT(X'e68f90e4be9be68980e5b1ac2064657461696c7320e79a84e6a899e9a18ce68896e69198e8a681e38082e4bd9ce782ba2064657461696c7320e79a84e7acace4b880e5808be5ad90e58583e7b4a0e69982efbc8ce9809ae5b8b8e698afe4bdbfe794a8e88085e58887e68f9be5b195e9968be78b80e6858be79a84e6938de4bd9ce4bd8de7bdaee38082' USING utf8mb4), CONVERT(X'3c64657461696c73206f70656e3e0a20203c73756d6d6172793ee5adb8e7bf92e68f90e7a4ba3c2f73756d6d6172793e0a20203c703ee5be9ee5b8b8e8a68be58583e7b4a0e9968be5a78be7b7b4e7bf92e380823c2f703e0a3c2f64657461696c733e' USING utf8mb4), CONVERT(X'e782bae9a090e8a8ade5b195e9968be79a84e8aaaae6988ee58d80e5a18ae68f90e4be9be6a899e9a18ce38082' USING utf8mb4), CONVERT(X'73756d6d617279' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f696e7465726163746976652d656c656d656e74732e68746d6c237468652d73756d6d6172792d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c73756d6d6172793e' USING utf8mb4),
display_label = CONVERT(X'e5b195e9968be58d80e5a18ae6a899e9a18c' USING utf8mb4),
summary = CONVERT(X'e68f90e4be9be68980e5b1ac2064657461696c7320e79a84e6a899e9a18ce68896e69198e8a681e38082' USING utf8mb4),
description = CONVERT(X'e68f90e4be9be68980e5b1ac2064657461696c7320e79a84e6a899e9a18ce68896e69198e8a681e38082e4bd9ce782ba2064657461696c7320e79a84e7acace4b880e5808be5ad90e58583e7b4a0e69982efbc8ce9809ae5b8b8e698afe4bdbfe794a8e88085e58887e68f9be5b195e9968be78b80e6858be79a84e6938de4bd9ce4bd8de7bdaee38082' USING utf8mb4),
example_code = CONVERT(X'3c64657461696c73206f70656e3e0a20203c73756d6d6172793ee5adb8e7bf92e68f90e7a4ba3c2f73756d6d6172793e0a20203c703ee5be9ee5b8b8e8a68be58583e7b4a0e9968be5a78be7b7b4e7bf92e380823c2f703e0a3c2f64657461696c733e' USING utf8mb4),
example_description = CONVERT(X'e782bae9a090e8a8ade5b195e9968be79a84e8aaaae6988ee58d80e5a18ae68f90e4be9be6a899e9a18ce38082' USING utf8mb4),
sort_key = CONVERT(X'73756d6d617279' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f696e7465726163746976652d656c656d656e74732e68746d6c237468652d73756d6d6172792d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d73756d6d617279' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'73756d6d617279' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'696e7465726163746976652d656c656d656e7473' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d6469616c6f67' USING utf8mb4), CONVERT(X'3c6469616c6f673e' USING utf8mb4), CONVERT(X'e5b08de8a9b1e6a186' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae5b08de8a9b1e6a186e68896e585b6e4bb96e99c80e8a681e4bdbfe794a8e88085e4ba92e58b95e79a84e78da8e7ab8be8a696e7aa97e38082' USING utf8mb4), CONVERT(X'e8a1a8e7a4bae5b08de8a9b1e6a186e68896e585b6e4bb96e99c80e8a681e4bdbfe794a8e88085e4ba92e58b95e79a84e78da8e7ab8be8a696e7aa97e38082e58fafe794a82073686f774d6f64616c282920e9968be5959fe6a8a1e6858be5b08de8a9b1e6a186efbc9be596aee7b494e58aa0e4b88a206f70656e20e698afe99d9ee6a8a1e6858be9a1afe7a4baefbc8ce4b88de69c83e887aae58b95e794a2e7949fe8838ce699afe981aee7bda9e68896e6a8a1e6858be8a18ce782bae38082' USING utf8mb4), CONVERT(X'3c6469616c6f67206f70656e20617269612d6c6162656c6c656462793d226e6f746963652d7469746c65223e0a20203c68322069643d226e6f746963652d7469746c65223ee6938de4bd9ce68f90e7a4ba3c2f68323e0a20203c703ee8ab8be7a2bae8aa8de8bcb8e585a5e585a7e5aeb9e380823c2f703e0a20203c666f726d206d6574686f643d226469616c6f67223e3c627574746f6e3ee9979ce996893c2f627574746f6e3e3c2f666f726d3e0a3c2f6469616c6f673e' USING utf8mb4), CONVERT(X'e9a1afe7a4bae99d9ee6a8a1e6858be5b08de8a9b1e6a186efbc8ce4bdbfe794a8206d6574686f643d6469616c6f6720e79a84e8a1a8e596aee9979ce99689e5ae83e38082' USING utf8mb4), CONVERT(X'6469616c6f67' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f696e7465726163746976652d656c656d656e74732e68746d6c237468652d6469616c6f672d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c6469616c6f673e' USING utf8mb4),
display_label = CONVERT(X'e5b08de8a9b1e6a186' USING utf8mb4),
summary = CONVERT(X'e8a1a8e7a4bae5b08de8a9b1e6a186e68896e585b6e4bb96e99c80e8a681e4bdbfe794a8e88085e4ba92e58b95e79a84e78da8e7ab8be8a696e7aa97e38082' USING utf8mb4),
description = CONVERT(X'e8a1a8e7a4bae5b08de8a9b1e6a186e68896e585b6e4bb96e99c80e8a681e4bdbfe794a8e88085e4ba92e58b95e79a84e78da8e7ab8be8a696e7aa97e38082e58fafe794a82073686f774d6f64616c282920e9968be5959fe6a8a1e6858be5b08de8a9b1e6a186efbc9be596aee7b494e58aa0e4b88a206f70656e20e698afe99d9ee6a8a1e6858be9a1afe7a4baefbc8ce4b88de69c83e887aae58b95e794a2e7949fe8838ce699afe981aee7bda9e68896e6a8a1e6858be8a18ce782bae38082' USING utf8mb4),
example_code = CONVERT(X'3c6469616c6f67206f70656e20617269612d6c6162656c6c656462793d226e6f746963652d7469746c65223e0a20203c68322069643d226e6f746963652d7469746c65223ee6938de4bd9ce68f90e7a4ba3c2f68323e0a20203c703ee8ab8be7a2bae8aa8de8bcb8e585a5e585a7e5aeb9e380823c2f703e0a20203c666f726d206d6574686f643d226469616c6f67223e3c627574746f6e3ee9979ce996893c2f627574746f6e3e3c2f666f726d3e0a3c2f6469616c6f673e' USING utf8mb4),
example_description = CONVERT(X'e9a1afe7a4bae99d9ee6a8a1e6858be5b08de8a9b1e6a186efbc8ce4bdbfe794a8206d6574686f643d6469616c6f6720e79a84e8a1a8e596aee9979ce99689e5ae83e38082' USING utf8mb4),
sort_key = CONVERT(X'6469616c6f67' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f696e7465726163746976652d656c656d656e74732e68746d6c237468652d6469616c6f672d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d6469616c6f67' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'6469616c6f67' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'736372697074696e67' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d736372697074' USING utf8mb4), CONVERT(X'3c7363726970743e' USING utf8mb4), CONVERT(X'e68c87e4bba4e7a2bce68896e8b387e69699e58d80e5a18a' USING utf8mb4), CONVERT(X'e5b58ce585a5e68896e5bc95e794a8e68c87e4bba4e7a2bcefbc8ce4b99fe58fafe689bfe8bc89e68c87e5ae9ae59e8be588a5e79a84e8b387e69699e38082' USING utf8mb4), CONVERT(X'e5b58ce585a5e68896e5bc95e794a8e68c87e4bba4e7a2bcefbc8ce4b99fe58fafe689bfe8bc89e68c87e5ae9ae59e8be588a5e79a84e8b387e69699e380827479706520e6b1bae5ae9ae6a8a1e7b584e38081e8b387e69699e58d80e5a18ae7ad89e794a8e98094efbc8c73726320e58fafe5bc95e794a8e5a496e983a8e68c87e4bba4e7a2bcefbc9be69cace6aca12048544d4c20e58886e69e90e4b88de8a7a3e69e90e68896e59fb7e8a18ce585b6e4b8ade79a84204a617661536372697074e38082' USING utf8mb4), CONVERT(X'3c73637269707420747970653d226d6f64756c6522207372633d222f6170702e6a73223e3c2f7363726970743e' USING utf8mb4), CONVERT(X'e5bc95e794a8e5a496e983a8204a61766153637269707420e6a8a1e7b584efbc9be58886e69e90e5b7a5e585b7e58faae8ae80e58f96e6a899e8a898efbc8ce4b88de59fb7e8a18ce68c87e4bba4e7a2bce38082' USING utf8mb4), CONVERT(X'736372697074' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f736372697074696e672e68746d6c237468652d7363726970742d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c7363726970743e' USING utf8mb4),
display_label = CONVERT(X'e68c87e4bba4e7a2bce68896e8b387e69699e58d80e5a18a' USING utf8mb4),
summary = CONVERT(X'e5b58ce585a5e68896e5bc95e794a8e68c87e4bba4e7a2bcefbc8ce4b99fe58fafe689bfe8bc89e68c87e5ae9ae59e8be588a5e79a84e8b387e69699e38082' USING utf8mb4),
description = CONVERT(X'e5b58ce585a5e68896e5bc95e794a8e68c87e4bba4e7a2bcefbc8ce4b99fe58fafe689bfe8bc89e68c87e5ae9ae59e8be588a5e79a84e8b387e69699e380827479706520e6b1bae5ae9ae6a8a1e7b584e38081e8b387e69699e58d80e5a18ae7ad89e794a8e98094efbc8c73726320e58fafe5bc95e794a8e5a496e983a8e68c87e4bba4e7a2bcefbc9be69cace6aca12048544d4c20e58886e69e90e4b88de8a7a3e69e90e68896e59fb7e8a18ce585b6e4b8ade79a84204a617661536372697074e38082' USING utf8mb4),
example_code = CONVERT(X'3c73637269707420747970653d226d6f64756c6522207372633d222f6170702e6a73223e3c2f7363726970743e' USING utf8mb4),
example_description = CONVERT(X'e5bc95e794a8e5a496e983a8204a61766153637269707420e6a8a1e7b584efbc9be58886e69e90e5b7a5e585b7e58faae8ae80e58f96e6a899e8a898efbc8ce4b88de59fb7e8a18ce68c87e4bba4e7a2bce38082' USING utf8mb4),
sort_key = CONVERT(X'736372697074' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f736372697074696e672e68746d6c237468652d7363726970742d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d736372697074' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'736372697074' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'736372697074696e67' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d6e6f736372697074' USING utf8mb4), CONVERT(X'3c6e6f7363726970743e' USING utf8mb4), CONVERT(X'e5819ce794a8e68c87e4bba4e7a2bce69982e79a84e585a7e5aeb9' USING utf8mb4), CONVERT(X'e59ca8e68c87e4bba4e7a2bce5819ce794a8e7ad89e68c87e5ae9ae6a29de4bbb6e4b88be68f90e4be9be69bbfe4bba3e585a7e5aeb9e38082' USING utf8mb4), CONVERT(X'e59ca8e68c87e4bba4e7a2bce5819ce794a8e7ad89e68c87e5ae9ae6a29de4bbb6e4b88be68f90e4be9be69bbfe4bba3e585a7e5aeb9e38082e585a7e5aeb9e79a84e8a7a3e69e90e88887e58581e8a8b1e5afabe6b395e69c83e58f97e588b0e68980e59ca8e4bd8de7bdaee58f8ae68c87e4bba4e7a2bce5959fe794a8e78b80e6858be5bdb1e99fbfefbc9be5ae83e4b88de698afe581b5e6b8ace69f90e694afe68c87e4bba4e7a2bce59fb7e8a18ce5a4b1e69597e79a84e5b7a5e585b7e38082' USING utf8mb4), CONVERT(X'3c6e6f7363726970743e0a20203c703ee4ba92e58b95e58a9fe883bde99c80e8a681e5959fe794a8204a617661536372697074e380823c2f703e0a3c2f6e6f7363726970743e' USING utf8mb4), CONVERT(X'e782bae5819ce794a8204a61766153637269707420e79a84e4bdbfe794a8e88085e68f90e4be9be68f90e7a4bae38082' USING utf8mb4), CONVERT(X'6e6f736372697074' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f736372697074696e672e68746d6c237468652d6e6f7363726970742d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c6e6f7363726970743e' USING utf8mb4),
display_label = CONVERT(X'e5819ce794a8e68c87e4bba4e7a2bce69982e79a84e585a7e5aeb9' USING utf8mb4),
summary = CONVERT(X'e59ca8e68c87e4bba4e7a2bce5819ce794a8e7ad89e68c87e5ae9ae6a29de4bbb6e4b88be68f90e4be9be69bbfe4bba3e585a7e5aeb9e38082' USING utf8mb4),
description = CONVERT(X'e59ca8e68c87e4bba4e7a2bce5819ce794a8e7ad89e68c87e5ae9ae6a29de4bbb6e4b88be68f90e4be9be69bbfe4bba3e585a7e5aeb9e38082e585a7e5aeb9e79a84e8a7a3e69e90e88887e58581e8a8b1e5afabe6b395e69c83e58f97e588b0e68980e59ca8e4bd8de7bdaee58f8ae68c87e4bba4e7a2bce5959fe794a8e78b80e6858be5bdb1e99fbfefbc9be5ae83e4b88de698afe581b5e6b8ace69f90e694afe68c87e4bba4e7a2bce59fb7e8a18ce5a4b1e69597e79a84e5b7a5e585b7e38082' USING utf8mb4),
example_code = CONVERT(X'3c6e6f7363726970743e0a20203c703ee4ba92e58b95e58a9fe883bde99c80e8a681e5959fe794a8204a617661536372697074e380823c2f703e0a3c2f6e6f7363726970743e' USING utf8mb4),
example_description = CONVERT(X'e782bae5819ce794a8204a61766153637269707420e79a84e4bdbfe794a8e88085e68f90e4be9be68f90e7a4bae38082' USING utf8mb4),
sort_key = CONVERT(X'6e6f736372697074' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f736372697074696e672e68746d6c237468652d6e6f7363726970742d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d6e6f736372697074' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'6e6f736372697074' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'736372697074696e67' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d74656d706c617465' USING utf8mb4), CONVERT(X'3c74656d706c6174653e' USING utf8mb4), CONVERT(X'e585a7e5aeb9e7af84e69cac' USING utf8mb4), CONVERT(X'e4bf9de5ad98e58fafe4be9be4b98be5be8ce4bdbfe794a8e79a842048544d4c20e7af84e69cace585a7e5aeb9e38082' USING utf8mb4), CONVERT(X'e4bf9de5ad98e58fafe4be9be4b98be5be8ce4bdbfe794a8e79a842048544d4c20e7af84e69cace585a7e5aeb9e38082e4b880e888ace7af84e69cace585a7e5aeb9e4b88de69c83e5838fe699aee9809ae9a081e99da2e585a7e5aeb9e7ab8be58db3e59188e78fbeefbc8ce9809ae5b8b8e794b1e7a88be5bc8fe8a487e8a3bde4bdbfe794a8efbc9be789b9e5ae9ae5b1ace680a7e4b99fe883bde794a8e696bce5aea3e5918ae5bc8f20536861646f7720444f4de38082' USING utf8mb4), CONVERT(X'3c74656d706c6174652069643d2273796e7461782d63617264223e0a20203c61727469636c653e3c68323ee8aa9ee6b395e5908de7a8b13c2f68323e3c703ee8aa9ee6b395e8aaaae6988e3c2f703e3c2f61727469636c653e0a3c2f74656d706c6174653e' USING utf8mb4), CONVERT(X'e4bf9de5ad98e697a5e5be8ce58fafe8a487e8a3bde79a84e8aa9ee6b395e58da1e78987e7af84e69cace38082' USING utf8mb4), CONVERT(X'74656d706c617465' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f736372697074696e672e68746d6c237468652d74656d706c6174652d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c74656d706c6174653e' USING utf8mb4),
display_label = CONVERT(X'e585a7e5aeb9e7af84e69cac' USING utf8mb4),
summary = CONVERT(X'e4bf9de5ad98e58fafe4be9be4b98be5be8ce4bdbfe794a8e79a842048544d4c20e7af84e69cace585a7e5aeb9e38082' USING utf8mb4),
description = CONVERT(X'e4bf9de5ad98e58fafe4be9be4b98be5be8ce4bdbfe794a8e79a842048544d4c20e7af84e69cace585a7e5aeb9e38082e4b880e888ace7af84e69cace585a7e5aeb9e4b88de69c83e5838fe699aee9809ae9a081e99da2e585a7e5aeb9e7ab8be58db3e59188e78fbeefbc8ce9809ae5b8b8e794b1e7a88be5bc8fe8a487e8a3bde4bdbfe794a8efbc9be789b9e5ae9ae5b1ace680a7e4b99fe883bde794a8e696bce5aea3e5918ae5bc8f20536861646f7720444f4de38082' USING utf8mb4),
example_code = CONVERT(X'3c74656d706c6174652069643d2273796e7461782d63617264223e0a20203c61727469636c653e3c68323ee8aa9ee6b395e5908de7a8b13c2f68323e3c703ee8aa9ee6b395e8aaaae6988e3c2f703e3c2f61727469636c653e0a3c2f74656d706c6174653e' USING utf8mb4),
example_description = CONVERT(X'e4bf9de5ad98e697a5e5be8ce58fafe8a487e8a3bde79a84e8aa9ee6b395e58da1e78987e7af84e69cace38082' USING utf8mb4),
sort_key = CONVERT(X'74656d706c617465' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f736372697074696e672e68746d6c237468652d74656d706c6174652d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d74656d706c617465' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'74656d706c617465' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'736372697074696e67' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d736c6f74' USING utf8mb4), CONVERT(X'3c736c6f743e' USING utf8mb4), CONVERT(X'536861646f7720444f4d20e68f92e6a7bd' USING utf8mb4), CONVERT(X'e59ca820536861646f7720444f4d20e4b8ade68c87e5ae9ae689bfe68ea5e5a496e983a8e585a7e5aeb9e79a84e4bd8de7bdaee38082' USING utf8mb4), CONVERT(X'e59ca820536861646f7720444f4d20e4b8ade68c87e5ae9ae689bfe68ea5e5a496e983a8e585a7e5aeb9e79a84e4bd8de7bdaee380826e616d6520e58fafe5bbbae7ab8be585b7e5908de68f92e6a7bdefbc8ce6b292e69c89e58886e9858de585a7e5aeb9e69982e58fafe4bdbfe794a8e58583e7b4a0e585a7e79a84e58299e68fb4e69687e5ad97efbc9be596aee78da8e694bee59ca8e4b880e888ace9a081e99da2e4b8ade4b88de69c83e887aae58b95e5bbbae7ab8b20536861646f7720444f4de38082' USING utf8mb4), CONVERT(X'3c6469763e0a20203c74656d706c61746520736861646f77726f6f746d6f64653d226f70656e223e0a202020203c703ee682a8e5a5bdefbc8c3c736c6f74206e616d653d22757365726e616d65223ee8a8aae5aea23c2f736c6f743ee380823c2f703e0a20203c2f74656d706c6174653e0a20203c7370616e20736c6f743d22757365726e616d65223e52696c65793c2f7370616e3e0a3c2f6469763e' USING utf8mb4), CONVERT(X'e59ca8e694afe68fb4e5aea3e5918ae5bc8f20536861646f7720444f4d20e79a84e7808fe8a6bde599a8e4b8adefbc8ce5b087e5a496e983a8e5908de7a8b1e58886e9858de588b0e585b7e5908de68f92e6a7bde38082' USING utf8mb4), CONVERT(X'736c6f74' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f736372697074696e672e68746d6c237468652d736c6f742d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c736c6f743e' USING utf8mb4),
display_label = CONVERT(X'536861646f7720444f4d20e68f92e6a7bd' USING utf8mb4),
summary = CONVERT(X'e59ca820536861646f7720444f4d20e4b8ade68c87e5ae9ae689bfe68ea5e5a496e983a8e585a7e5aeb9e79a84e4bd8de7bdaee38082' USING utf8mb4),
description = CONVERT(X'e59ca820536861646f7720444f4d20e4b8ade68c87e5ae9ae689bfe68ea5e5a496e983a8e585a7e5aeb9e79a84e4bd8de7bdaee380826e616d6520e58fafe5bbbae7ab8be585b7e5908de68f92e6a7bdefbc8ce6b292e69c89e58886e9858de585a7e5aeb9e69982e58fafe4bdbfe794a8e58583e7b4a0e585a7e79a84e58299e68fb4e69687e5ad97efbc9be596aee78da8e694bee59ca8e4b880e888ace9a081e99da2e4b8ade4b88de69c83e887aae58b95e5bbbae7ab8b20536861646f7720444f4de38082' USING utf8mb4),
example_code = CONVERT(X'3c6469763e0a20203c74656d706c61746520736861646f77726f6f746d6f64653d226f70656e223e0a202020203c703ee682a8e5a5bdefbc8c3c736c6f74206e616d653d22757365726e616d65223ee8a8aae5aea23c2f736c6f743ee380823c2f703e0a20203c2f74656d706c6174653e0a20203c7370616e20736c6f743d22757365726e616d65223e52696c65793c2f7370616e3e0a3c2f6469763e' USING utf8mb4),
example_description = CONVERT(X'e59ca8e694afe68fb4e5aea3e5918ae5bc8f20536861646f7720444f4d20e79a84e7808fe8a6bde599a8e4b8adefbc8ce5b087e5a496e983a8e5908de7a8b1e58886e9858de588b0e585b7e5908de68f92e6a7bde38082' USING utf8mb4),
sort_key = CONVERT(X'736c6f74' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f736372697074696e672e68746d6c237468652d736c6f742d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d736c6f74' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'736c6f74' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
-- @statement

            SET @category_id = (
                SELECT id
                FROM syntax_categories
                WHERE language = 'html'
                  AND slug = CONVERT(X'736372697074696e67' USING utf8mb4)
            );
            
-- @statement

            INSERT INTO syntaxes (
                category_id, slug, name, display_label, summary, description, example_code, example_description, sort_key, source_url, source_version, source_fetched_at, is_active
            )
            VALUES (
                @category_id, CONVERT(X'656c656d656e742d63616e766173' USING utf8mb4), CONVERT(X'3c63616e7661733e' USING utf8mb4), CONVERT(X'e7b9aae59c96e795abe5b883' USING utf8mb4), CONVERT(X'e68f90e4be9be58fafe794b1e7a88be5bc8fe7b9aae8a3bde9bb9ee999a3e59c96e79a84e795abe5b883e88887e58299e68fb4e585a7e5aeb9e38082' USING utf8mb4), CONVERT(X'e68f90e4be9be58fafe794b1e7a88be5bc8fe7b9aae8a3bde9bb9ee999a3e59c96e79a84e795abe5b883e88887e58299e68fb4e585a7e5aeb9e38082776964746820e888872068656967687420e8a8ade5ae9ae7b9aae59c96e5b0bae5afb8efbc8ce5afa6e99a9be7b9aae59c96e9809ae5b8b8e99c80e8a681204a617661536372697074efbc9be58583e7b4a0e585a7e58fafe694bee981a9e59088e794a8e98094e79a84e58299e68fb4e585a7e5aeb9e38082' USING utf8mb4), CONVERT(X'3c63616e7661732069643d226368617274222077696474683d2234303022206865696768743d22323030223e0a20203c703ee8aa9ee6b395e4bdbfe794a8e7b5b1e8a888e59c96efbc9be4b99fe58fafe69fa5e996b1e4b88be696b9e69687e5ad97e7b5b1e8a888e380823c2f703e0a3c2f63616e7661733e' USING utf8mb4), CONVERT(X'e5bbbae7ab8be7b9aae59c96e58d80e59f9fe58f8ae58299e68fb4e8aaaae6988eefbc8ce5afa6e99a9be59c96e5bda2e99c80e58fa6e5a496e7b9aae8a3bde38082' USING utf8mb4), CONVERT(X'63616e766173' USING utf8mb4), CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f63616e7661732e68746d6c237468652d63616e7661732d656c656d656e74' USING utf8mb4), CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4), CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4), 1
            )
            ON DUPLICATE KEY UPDATE
                name = CONVERT(X'3c63616e7661733e' USING utf8mb4),
display_label = CONVERT(X'e7b9aae59c96e795abe5b883' USING utf8mb4),
summary = CONVERT(X'e68f90e4be9be58fafe794b1e7a88be5bc8fe7b9aae8a3bde9bb9ee999a3e59c96e79a84e795abe5b883e88887e58299e68fb4e585a7e5aeb9e38082' USING utf8mb4),
description = CONVERT(X'e68f90e4be9be58fafe794b1e7a88be5bc8fe7b9aae8a3bde9bb9ee999a3e59c96e79a84e795abe5b883e88887e58299e68fb4e585a7e5aeb9e38082776964746820e888872068656967687420e8a8ade5ae9ae7b9aae59c96e5b0bae5afb8efbc8ce5afa6e99a9be7b9aae59c96e9809ae5b8b8e99c80e8a681204a617661536372697074efbc9be58583e7b4a0e585a7e58fafe694bee981a9e59088e794a8e98094e79a84e58299e68fb4e585a7e5aeb9e38082' USING utf8mb4),
example_code = CONVERT(X'3c63616e7661732069643d226368617274222077696474683d2234303022206865696768743d22323030223e0a20203c703ee8aa9ee6b395e4bdbfe794a8e7b5b1e8a888e59c96efbc9be4b99fe58fafe69fa5e996b1e4b88be696b9e69687e5ad97e7b5b1e8a888e380823c2f703e0a3c2f63616e7661733e' USING utf8mb4),
example_description = CONVERT(X'e5bbbae7ab8be7b9aae59c96e58d80e59f9fe58f8ae58299e68fb4e8aaaae6988eefbc8ce5afa6e99a9be59c96e5bda2e99c80e58fa6e5a496e7b9aae8a3bde38082' USING utf8mb4),
sort_key = CONVERT(X'63616e766173' USING utf8mb4),
source_url = CONVERT(X'68747470733a2f2f68746d6c2e737065632e7768617477672e6f72672f6d756c7469706167652f63616e7661732e68746d6c237468652d63616e7661732d656c656d656e74' USING utf8mb4),
source_version = CONVERT(X'48544d4c204c6976696e67205374616e6461726420e2809420323032362d31312d3039' USING utf8mb4),
source_fetched_at = CONVERT(X'323032362d31312d31302031323a32383a3332' USING utf8mb4),
                is_active = 1;
            
-- @statement

            SET @syntax_id = (
                SELECT id
                FROM syntaxes
                WHERE category_id = @category_id
                  AND slug = CONVERT(X'656c656d656e742d63616e766173' USING utf8mb4)
            );
            
-- @statement

            UPDATE syntax_detection_rules
            SET is_active = 0
            WHERE syntax_id = @syntax_id;
            
-- @statement

            INSERT INTO syntax_detection_rules (
                syntax_id,
                analyzer,
                rule_type,
                match_value,
                is_active
            )
            VALUES (
                @syntax_id,
                'html_parser',
                'tag_name',
                CONVERT(X'63616e766173' USING utf8mb4),
                1
            )
            ON DUPLICATE KEY UPDATE
                is_active = 1;
            
