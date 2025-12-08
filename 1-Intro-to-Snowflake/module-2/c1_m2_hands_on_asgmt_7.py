# The Snowpark package is required for Python Worksheets. 
# You can add more packages by selecting them using the Packages control and then importing them.

# 1. Import snowflake.snowpark as snowpark. Define main. Inside main, set df_table to equal session.table(“TASTY_BYTES.RAW_POS.MENU”). Inside main, use the show method on df_table. Inside main, return df_table. When you run this, what are the first three column names you see in the Results?

# 2. Building on the last question, now run the same code you just ran, but remove the line where you set df_table to equal session.table(“TASTY_BYTES.RAW_POS.MENU”). Instead of that line, add a line where you set df_table to equal session.sql(“SELECT * FROM TASTY_BYTES.RAW_POS.MENU LIMIT 10”). When you run this, what is the value you see for “MENU_ITEM_NAME” in the row corresponding to the MENU_ITEM of 10007?

# 3. Building on the last question, now import col from snowpark.functions. Then switch the line of code where you set df_table to session.sql(“SELECT * FROM TASTY_BYTES.RAW_POS.MENU LIMIT 10”) back to equalling session.table(“TASTY_BYTES.RAW_POS.MENU”). Okay, now add a new line of code where you use df_table.filter and COL to only pull out those rows where TRUCK_BRAND_NAME equals “The Mac Shack”, and set this equal to df_table. When you run this worksheet, how many rows do you see in the result?

# 4. Building on the last question, adjust the line where you use df_table.filter by adding the .select method and COL to the end of that line to only pull two columns: MENU_ITEM_NAME and ITEM_CATEGORY. When you run the worksheet, what are the two different kinds of item categories you see in the results?

import snowflake.snowpark as snowpark
from snowflake.snowpark.functions import col

def main(session: snowpark.Session): 
    
    df_table = session.table("TASTY_BYTES.RAW_POS.MENU") # q1
    
    # df_table = session.sql("""
    #     SELECT *
    #     FROM TASTY_BYTES.RAW_POS.MENU
    #     LIMIT 10
    # """) ## q2

    # df_table = df_table.filter(col("TRUCK_BRAND_NAME") == "The Mac Shack") ## q3
    
    df_table = df_table.filter(
        col("TRUCK_BRAND_NAME") == "The Mac Shack"
    ).select(
        col('MENU_ITEM_NAME'),
        col('ITEM_CATEGORY')
    ) # q4
    
    df_table.show()

    # Return value will appear in the Results tab.
    return df_table