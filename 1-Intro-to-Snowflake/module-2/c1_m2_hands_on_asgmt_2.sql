USE DATABASE tasty_bytes;

USE SCHEMA raw_pos;

-- 1. Use the CREATE DATABASE… CLONE command to create a clone of tasty_bytes, and call this new database “tasty_bytes_clone”. When you run this CREATE DATABASE… CLONE command, what status message do you see in Results?
CREATE OR REPLACE DATABASE tasty_bytes_clone
CLONE tasty_bytes;

-- 2. Use the CREATE TABLE… CLONE command to create a clone of tasty_bytes.raw_pos.truck, and call this new table “truck_clone” and put it in the “raw_pos” schema in the “tasty_bytes” database. When you run this CREATE TABLE… CLONE command, what status message do you see in Results?
CREATE OR REPLACE TABLE tasty_bytes.raw_pos.truck_clone
CLONE tasty_bytes.raw_pos.truck;

-- 3. Run the command which shows information from the TABLE_STORAGE_METRICS view about the “truck_clone” and “truck” tables. What values are in the “active_bytes” column for the “truck” table and the “truck_clone” table, respectively?
SELECT *
FROM tasty_bytes.information_schema.table_storage_metrics
WHERE 1=1
    AND (table_name = 'TRUCK_CLONE' OR table_name = 'TRUCK')
    AND TABLE_CATALOG = 'TASTY_BYTES';