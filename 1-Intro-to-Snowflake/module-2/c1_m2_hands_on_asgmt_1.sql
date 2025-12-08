USE DATABASE tasty_bytes;

/* Cloning tasty_bytes truck table and setting up cloned truck_dev table */
-- clone truck table to truck_dev
CREATE OR REPLACE TABLE tasty_bytes.raw_pos.truck_dev
CLONE tasty_bytes.raw_pos.truck;

-- query cloned truck_dev table to ensure it has been created correctly
SELECT *
FROM tasty_bytes.raw_pos.truck_dev;

-- record most recent query_id
SET saved_query_id = LAST_QUERY_ID();

-- record time for time travel
SET saved_timestamp = CURRENT_TIMESTAMP();

-- make modifications to truck_dev table
UPDATE tasty_bytes.raw_pos.truck_dev t
SET t.year = (YEAR(CURRENT_DATE()) - 1000);

-- 1. Run the SHOW VARIABLES command. What are the values in the “type” column for saved_query_id and saved_timestamp, in that order?
SHOW VARIABLES;

-- 2. When you run “SELECT * FROM tasty_bytes.raw_pos.truck_dev” with AT and specify the timestamp to be the $saved_timestamp variable we set earlier, what value is in the “year” column for the truck with a “truck_id” of 1?
SELECT *
FROM tasty_bytes.raw_pos.truck_dev
AT(TIMESTAMP => $saved_timestamp);

-- 3. When you run “SELECT * FROM tasty_bytes.raw_pos.truck_dev” with BEFORE and specify the STATEMENT to be the $saved_query_id variable we set earlier, what value is in the “year” column for the truck with a “truck_id” of 2?
SELECT * 
FROM tasty_bytes.raw_pos.truck_dev
BEFORE(STATEMENT => $saved_query_id);