/*
===============================================================================
Snippet Name: Table Column Operations -- Add, Rename, Drop Columns
-------------------------------------------------------------------------------
Description:
This snippet file consolidates common column-level operations in MySQL tables. 
Each section is self-contained and parameterized for easy reuse. Operations 
include adding columns, renaming columns, and dropping columns. Use placeholders 
(<…>) to adapt the commands to your tables.
===============================================================================
*/

--------------------------------------------------------------------------------
/* Add Column
-------------------------------------------------------------------------------
Description:
Adds a new column to an existing table, specifying the column name, data type, 
constraints, and position (AFTER an existing column or FIRST). Safe for 
incrementally evolving schemas.
Usage:
ALTER TABLE <table_name> ADD <column_name> <data_type> <constraints> AFTER <existing_column>;
-------------------------------------------------------------------------------
*/
ALTER TABLE <table_name>
ADD <column_name> <data_type> <constraints>
AFTER <existing_column>;

--------------------------------------------------------------------------------
/* Rename Column
-------------------------------------------------------------------------------
Description:
Renames an existing column and optionally changes its data type or constraints.
Usage:
ALTER TABLE <table_name> CHANGE <old_column_name> <new_column_name> <data_type> <constraints>;
-------------------------------------------------------------------------------
*/
ALTER TABLE <table_name>
CHANGE <old_column_name> <new_column_name> <data_type> <constraints>;

--------------------------------------------------------------------------------
/* Drop Column
-------------------------------------------------------------------------------
Description:
Removes a column from a table permanently. Ensure that you back up data if necessary.
Usage:
ALTER TABLE <table_name> DROP COLUMN <column_name>;
-------------------------------------------------------------------------------
*/
ALTER TABLE <table_name>
DROP COLUMN <column_name>;