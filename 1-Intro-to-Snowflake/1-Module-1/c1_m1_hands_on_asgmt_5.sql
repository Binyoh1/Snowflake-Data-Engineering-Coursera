USE DATABASE test_database;
USE SCHEMA test_schema;

-- 1. Run the SHOW TABLES command. What value is in the “bytes” column for the test_table row?
SHOW TABLES;

-- 2. Create a new table in the TEST_DATABASE database and the TEST_SCHEMA schema called “test_table2” with one NUMBER column called TEST_NUMBER. Then insert the value 42 into it using the INSERT INTO command. Then use the SHOW TABLES command. What value is in the “bytes” column for the test_table2 row?
CREATE OR REPLACE TABLE test_table2
(
    test_number NUMBER
);
INSERT INTO test_table2 VALUES(42);
SHOW TABLES;

-- 3. Drop the test_table table with the DROP TABLE command. Then undrop it with the UNDROP TABLE command. What status message in the Results do you see?
DROP TABLE test_table;
UNDROP TABLE test_table;