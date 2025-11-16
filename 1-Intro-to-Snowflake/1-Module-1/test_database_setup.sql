USE DATABASE test_database;
USE SCHEMA test_schema;

CREATE OR REPLACE TABLE test_table
(
    test_number NUMBER,
    test_varchar VARCHAR,
    test_boolean BOOLEAN,
    test_date DATE,
    test_variant VARIANT,
    test_geography GEOGRAPHY
);
INSERT INTO test_database.test_schema.test_table VALUES(28, 'ha!', TRUE, '2024-01-01', NULL, NULL);