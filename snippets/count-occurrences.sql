/*
===============================================================================
Snippet Name: Count occurrences of distinct values in a column
-------------------------------------------------------------------------------
Description:
Counts how many times each unique value appears in a specific column 
of a table using GROUP BY and COUNT. 
This is useful for calculating frequencies, identifying duplicates, 
or producing basic summary statistics.
===============================================================================
*/

/*
Query Explanation:
------------------
- Groups the records in `table1` by the values in the `row1` column.
- Counts how many times each distinct value occurs in `row1`.
*/

SELECT t1.row1 AS r1, COUNT(*) AS hits
FROM table1 t1
GROUP BY r1;

/*
Use Case Example:
-----------------
Suppose you have a table called `logins` with a column `user_id`:

+----------+
| user_id  |
+----------+
|    1     |
|    2     |
|    1     |
|    3     |
|    2     |
|    1     |
+----------+

The following query will count how many times each `user_id` occurs:

*/

SELECT user_id, COUNT(*) AS occurrences
FROM logins
GROUP BY user_id;

/*

Expected Output:
+----------+-------------+
| user_id  | occurrences |
+----------+-------------+
|    1     |      3      |
|    2     |      2      |
|    3     |      1      |
+----------+-------------+
*/
