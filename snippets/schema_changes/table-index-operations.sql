/*
===============================================================================
Snippet Name: Table Index Operations -- Manage Primary Keys, Indexes, and Auto-Increment
-------------------------------------------------------------------------------
Description:
This snippet file consolidates common index-level operations in MySQL tables. 
Each section is self-contained and parameterized for easy reuse. Operations 
include resetting AUTO_INCREMENT, adding indexes, dropping indexes, and managing 
primary keys. Use placeholders (<…>) to adapt the commands to your tables.
===============================================================================
*/

--------------------------------------------------------------------------------
/* Reset Auto-Increment
-------------------------------------------------------------------------------
Description:
Resets the AUTO_INCREMENT counter of a table. Useful after deleting rows or 
truncating tables, especially in testing/development environments.
Usage:
ALTER TABLE <table_name> AUTO_INCREMENT = <new_start_value>;
-------------------------------------------------------------------------------
*/
ALTER TABLE <table_name> AUTO_INCREMENT = <new_start_value>;

--------------------------------------------------------------------------------
/* Add Index
-------------------------------------------------------------------------------
Description:
Adds a new index to a table column or combination of columns. Improves query 
performance for searches and joins. Can be UNIQUE, PRIMARY, or NORMAL index.
Usage:
CREATE [UNIQUE|INDEX] <index_name> ON <table_name> (<column1>, <column2>, ...);
-------------------------------------------------------------------------------
*/
CREATE INDEX <index_name> ON <table_name> (<column1>, <column2>, ...);

--------------------------------------------------------------------------------
/* Drop Index
-------------------------------------------------------------------------------
Description:
Removes an existing index from a table. Useful for schema refactoring or 
cleaning unused indexes.
Usage:
DROP INDEX <index_name> ON <table_name>;
-------------------------------------------------------------------------------
*/
DROP INDEX <index_name> ON <table_name>;

--------------------------------------------------------------------------------
/* Add Primary Key
-------------------------------------------------------------------------------
Description:
Adds a primary key to one or more columns of a table. Primary keys enforce 
uniqueness and improve relational integrity.
Usage:
ALTER TABLE <table_name> ADD PRIMARY KEY (<column1>, <column2>, ...);
-------------------------------------------------------------------------------
*/
ALTER TABLE <table_name> ADD PRIMARY KEY (<column1>, <column2>, ...);

--------------------------------------------------------------------------------
/* Drop Primary Key
-------------------------------------------------------------------------------
Description:
Removes the primary key from a table. Useful when redefining table structure 
or replacing primary key columns.
Usage:
ALTER TABLE <table_name> DROP PRIMARY KEY;
-------------------------------------------------------------------------------
*/
ALTER TABLE <table_name> DROP PRIMARY KEY;