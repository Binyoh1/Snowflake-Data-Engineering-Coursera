USE DATABASE tasty_bytes;

-- 1. Use the DESCRIBE TABLE command to learn more about the “menu” table in the “raw_pos” schema in the “tasty_bytes” database. What is the value in the “type” column for the row associated with MENU_ITEM_HEALTH_METRICS_OBJ?\
DESCRIBE TABLE tasty_bytes.raw_pos.menu;

-- 2. Use the TYPEOF function to check the underlying data type of MENU_ITEM_HEALTH_METRICS_OBJ. What is it?
SELECT TYPEOF(menu_item_health_metrics_obj)
FROM tasty_bytes.raw_pos.menu;

-- 4. Get the first ingredient from the nested object
SELECT
    menu_item_health_metrics_obj:menu_item_health_metrics[0]['ingredients']
FROM tasty_bytes.raw_pos.menu;