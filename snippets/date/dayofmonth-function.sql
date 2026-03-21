/*
===============================================================================
Snippet Name: DAYOFMONTH() function - Use case with example
-------------------------------------------------------------------------------
Description:
This snippet demonstrates counting records by the day of the month using the 
MySQL function DAYOFMONTH(). It explains how the function works, highlights 
its limitations for reporting purposes, and warns about potential pitfalls.

DAYOFMONTH() returns only the day number (1-31) of a date. Aggregating by this 
alone can produce misleading results if your data spans multiple months or years.
===============================================================================
*/

/*
Query Explanation:
------------------
- Selects the day of the month from the `sales` table using DAYOFMONTH(date).
- Counts how many records exist for each day number.
- GROUP BY DAYOFMONTH(date) aggregates all occurrences of the same day number 
  across different months/years into a single group.
- ⚠️ WARNING: This can produce misleading results when analyzing daily totals 
  over multiple months, because different calendar dates with the same day 
  number are merged together.
- For safe daily aggregation across months/years, see `count-records-per-day.sql`.
*/

SELECT DAYOFMONTH(`date`) AS day_of_month,
       COUNT(*) AS records
FROM sales
WHERE `date` >= '2024-09-15' 
  AND `date` <  '2024-10-20'
GROUP BY DAYOFMONTH(`date`);

/*
Use Case Example:
-----------------
Table: sales
---------------
id | date                | description
-- | ------------------ | ----------------
1  | 2024-09-15 10:15:00 | Sale transaction 1
2  | 2024-10-15 14:00:00 | Sale transaction 2

Query result:
-------------------------
day_of_month | records
------------ | -------
15           | 2   -- combines Sept 15 and Oct 15, which may be misleading

⚠️ Note: This snippet is meant for educational purposes to show how 
DAYOFMONTH() works and its limitations. For accurate daily totals over multiple 
months/years, use the safer approach in `count-records-per-day.sql`.

*/
