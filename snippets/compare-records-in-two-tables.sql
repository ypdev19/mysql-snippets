/*
===============================================================================
Snippet Name: Find records that exist only in one table (anti-join)
-------------------------------------------------------------------------------
Description:
This query retrieves records from `table1` that have no corresponding match 
in `table2`, based on a join condition. It is useful for identifying unmatched 
or exclusive records, such as detecting missing data, orphan records, 
or clients with no transactions.
===============================================================================
*/

/*
Query Explanation:
------------------
- Selects all records from `table1`.
- Attempts to join each record in `table1` with a record in `table2` using the condition `t1.id = t2.relid`.
- The LEFT JOIN ensures that all records from `table1` are preserved.
- The WHERE clause `t2.relid IS NULL` filters only those records that had no match in `table2`, meaning they exist exclusively in `table1`.
*/

SELECT t1.*
FROM table1 t1
LEFT JOIN table2 AS t2 ON t1.id = t2.relid
WHERE t2.relid IS NULL;

/*
Use Case Example:
-----------------
Let's say we have the following tables: `clients` and `orders`.

Table: clients
---------------
id | name
-- | ------
1  | Alice
2  | Bob
3  | Carol

Table: orders
---------------
id | client_id | order_date
-- | ----------|------------
1  |    1      | 2023-01-01
2  |    2      | 2023-01-02

You want to find clients who have not placed any orders.

Query:

SELECT c.*
FROM clients c
LEFT JOIN orders o ON c.id = o.client_id
WHERE o.client_id IS NULL;

Expected Output:
----------------
Only clients without any associated order, e.g.:

id | name
-- | ------
3  | Carol

*/