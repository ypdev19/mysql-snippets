/*
===============================================================================
Snippet Name: Conditional Counting with COUNT(IF())
-------------------------------------------------------------------------------

Description: Pivot multiple category counts into columns in a single pass over the table, instead of running one 
query per category.

===============================================================================
*/

-- ---------------------------------------------------------
-- 1. BASE TEMPLATE
--    Swap `orders`, `status`, `created_at` and the category
--    values for your own table/column/values.
-- ---------------------------------------------------------
SELECT
  DATE(created_at) AS day,
  COUNT(IF(status = 'pending', 1, NULL))   AS pending_count,
  COUNT(IF(status = 'shipped', 1, NULL))   AS shipped_count,
  COUNT(IF(status = 'cancelled', 1, NULL)) AS cancelled_count,
  COUNT(*)                                 AS total_orders
FROM orders
GROUP BY day
ORDER BY day;


-- ---------------------------------------------------------
-- 2. SAME RESULT, USING SUM() INSTEAD OF COUNT()
--    SUM(IF(condition, 1, 0)) adds 1s and 0s instead of
--    relying on COUNT() skipping NULLs. Equivalent result,
--    different mental model — use whichever reads clearer.
-- ---------------------------------------------------------
SELECT
  DATE(created_at) AS day,
  SUM(IF(status = 'pending', 1, 0))   AS pending_count,
  SUM(IF(status = 'shipped', 1, 0))   AS shipped_count,
  SUM(IF(status = 'cancelled', 1, 0)) AS cancelled_count,
  COUNT(*)                            AS total_orders
FROM orders
GROUP BY day
ORDER BY day;


-- ---------------------------------------------------------
-- 3. PORTABLE VERSION USING CASE (not MySQL-specific)
--    IF() only exists in MySQL. CASE WHEN works across
--    most SQL engines (Postgres, SQL Server, etc).
--    No ELSE needed — it implicitly returns NULL.
-- ---------------------------------------------------------
SELECT
  DATE(created_at) AS day,
  COUNT(CASE WHEN status = 'pending' THEN 1 END)   AS pending_count,
  COUNT(CASE WHEN status = 'shipped' THEN 1 END)   AS shipped_count,
  COUNT(CASE WHEN status = 'cancelled' THEN 1 END) AS cancelled_count,
  COUNT(*)                                          AS total_orders
FROM orders
GROUP BY day
ORDER BY day;


-- ---------------------------------------------------------
-- 4. CONDITIONAL SUM (not just count)
--    Same pattern, but summing a value instead of counting
--    rows — e.g. total revenue broken down by status.
-- ---------------------------------------------------------
SELECT
  DATE(created_at) AS day,
  SUM(IF(status = 'shipped', amount, 0))   AS shipped_revenue,
  SUM(IF(status = 'cancelled', amount, 0)) AS cancelled_lost_revenue,
  SUM(amount)                              AS total_amount
FROM orders
GROUP BY day
ORDER BY day;


-- ---------------------------------------------------------
-- 5. GROUPING BY SOMETHING OTHER THAN DATE
--    The same pivot pattern works with any GROUP BY key —
--    here, breaking counts down per user instead of per day.
-- ---------------------------------------------------------
SELECT
  user_id,
  COUNT(IF(status = 'pending', 1, NULL))   AS pending_count,
  COUNT(IF(status = 'shipped', 1, NULL))   AS shipped_count,
  COUNT(IF(status = 'cancelled', 1, NULL)) AS cancelled_count,
  COUNT(*)                                 AS total_orders
FROM orders
GROUP BY user_id
ORDER BY total_orders DESC;
