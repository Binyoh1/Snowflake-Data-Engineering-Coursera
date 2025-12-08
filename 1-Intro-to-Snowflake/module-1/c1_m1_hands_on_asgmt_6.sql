USE DATABASE tasty_bytes;
USE SCHEMA harmonized;

SELECT CURRENT_VERSION();

-- 1. Use the CREATE VIEW command to create a “truck_franchise” view. What is the “make” of the food truck for the franchisee with the first name of “Sara” and the last name of “Nicholson”?
CREATE VIEW test_database.test_schema.truck_franchise AS
SELECT
    t.*,
    f.first_name AS franchisee_first_name,
    f.last_name AS franchisee_last_name
FROM tasty_bytes.raw_pos.truck t
JOIN tasty_bytes.raw_pos.franchise f
ON t.franchise_id = f.franchise_id;

SELECT 
    franchisee_first_name,
    franchisee_last_name,
    make
FROM test_database.test_schema.truck_franchise
WHERE 1=1
AND franchisee_first_name = 'Sara'
AND franchisee_last_name = 'Nicholson';

-- 2. Use the DESCRIBE VIEW command to see information about the test_database.test_schema.truck_franchise view. What value is in the “type” column for TRUCK_ID?
DESCRIBE VIEW test_database.test_schema.truck_franchise;

-- 3. Drop the truck_franchise view using the DROP VIEW command. What is the status message in Results?
DROP VIEW test_database.test_schema.truck_franchise;

-- 4. Use the CREATE MATERIALIZED VIEW command to create a “truck_franchise_materialized” view. What description do you get in the result when you run the CREATE MATERIALIZED VIEW command?
-- Recall that materialized views can only query a single table and does not support joins
CREATE MATERIALIZED VIEW test_database.test_schema.truck_franchise_materialized AS
SELECT
    t.*,
    f.first_name AS franchisee_first_name,
    f.last_name AS franchisee_last_name
FROM tasty_bytes.raw_pos.truck t
JOIN tasty_bytes.raw_pos.franchise f
ON t.franchise_id = f.franchise_id;

-- 5. Use the CREATE MATERIALIZED VIEW command to create a “nissan” view in the test_database database and the test_schema schema. How many rows are in this “nissan” view?
CREATE MATERIALIZED VIEW test_database.test_schema.nissan_view AS
SELECT t.*
FROM tasty_bytes.raw_pos.truck t
WHERE t.make = 'Nissan';

SELECT COUNT(*) num_records
FROM test_database.test_schema.nissan_view;