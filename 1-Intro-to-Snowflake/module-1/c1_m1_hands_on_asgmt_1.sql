-- 1. How many items are there with an item_category of 'Snack' and an item_subcategory of 'Warm Option'?
SELECT COUNT(*) num_items
FROM tasty_bytes_sample_data.raw_pos.menu
WHERE item_category = 'Snack'
AND item_subcategory = 'Warm Option';

-- 2. What are the max sales prices for each of the three item subcategories (hot option, warm option, cold option)? List from highest to lowest
SELECT
    item_subcategory,
    MAX(sale_price_usd) max_sales_price
FROM tasty_bytes_sample_data.raw_pos.menu
GROUP BY 1
ORDER BY 2 DESC;