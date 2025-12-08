USE DATABASE tasty_bytes_clone;
/*
1. Use the tasty_bytes_clone database we created in the assignment on cloning (or if you didn’t do that, just run: “CREATE DATABASE tasty_bytes_clone CLONE tasty_bytes;”), and then use the CREATE PROCEDURE command to create a stored procedure.
- Name it “increase_prices”
- Have it return a Boolean (though this doesn’t matter here)
- Set the language to be SQL
- Update the sale_price_usd in the menu table accordingly

After you create this “increase_prices” stored procedure, call the stored procedure using the CALL command.
After you run the CALL command, what column name do you see in the results, and what value do you see under that column name?
*/
CREATE OR REPLACE PROCEDURE increase_prices()
    RETURNS BOOLEAN
    LANGUAGE SQL
    AS $$
BEGIN
    UPDATE tasty_bytes_clone.raw_pos.menu
    SET sale_price_usd = sale_price_usd + 1;
END;
$$;
CALL INCREASE_PRICES();
-- 2. When you run the DESCRIBE PROCEDURE command for our “increase_prices” stored procedure, what entry do you see in the “value” column for the “execute as” row?
    DESCRIBE PROCEDURE INCREASE_PRICES();
    /*
    Create a stored procedure called “decrease_mango_sticky_rice_price” that decreases the price by 1 dollar for the item with the “MENU_ITEM_NAME” of “Mango Sticky Rice”. 
    
    If you run the SHOW PROCEDURES command, what value do you see in the “arguments” column in the row associated with “decrease_mango_sticky_rice_price”?
    */
CREATE OR REPLACE PROCEDURE decrease_mango_sticky_rice_price()
    RETURNS BOOLEAN
    LANGUAGE SQL
    AS $$
BEGIN
    UPDATE tasty_bytes_clone.raw_pos.menu
    SET sale_price_usd = sale_price_usd - 1
    WHERE menu_item_name = 'Mango Sticky Rice';
END;
$$;
SHOW PROCEDURES;