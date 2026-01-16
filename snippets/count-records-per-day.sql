/*
===============================================================================
Snippet Name: Count records per day -- Safe Daily Aggregation Using DATE()
-------------------------------------------------------------------------------
Description:
This snippet demonstrates how to safely aggregate records by calendar day in 
MySQL using the DATE() function. Unlike DAYOFMONTH(), this method preserves 
the full date (year, month, day), making it safe to use across multiple months 
and years.
===============================================================================
*/


SELECT DATE(order_date) AS thedate,
       COUNT(*) AS count
FROM sales_orders
GROUP BY thedate
ORDER BY thedate ASC;

/*
Query Explanation:
------------------
- DATE(order_date) extracts the full calendar date from the DATETIME column.
- COUNT(*) counts how many records/orders exist for each date.
- GROUP BY thedate ensures each day is counted separately.
- ORDER BY thedate ASC sorts results chronologically.
- Safe across months and years; no risk of merging different months with 
  the same day number.
*/

/*
===============================================================================
Use Case Example
-------------------------------------------------------------------------------
-----------------
Table: sales_orders
-------------------
id | customer_name | order_date
-- | ------------- | -------------------
1  | Alice         | 2025-04-20 14:22:00
2  | Bob           | 2025-04-20 16:10:23
3  | Charlie       | 2025-04-21 09:45:12
4  | Diana         | 2025-04-21 12:10:11
5  | Evan          | 2025-04-21 20:00:55

*/

-- Create table sales_orders
CREATE TABLE IF NOT EXISTS sales_orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255),
    order_date DATETIME
);

-- Insert data
INSERT INTO sales_orders (customer_name, order_date) VALUES
('Alice', '2025-04-20 14:22:00'),
('Bob', '2025-04-20 16:10:23'),
('Charlie', '2025-04-21 09:45:12'),
('Diana', '2025-04-21 12:10:11'),
('Evan', '2025-04-21 20:00:55');

/*

Query Result:
-----------------------------------------

-------------
thedate     | count
----------- | -----
2025-04-20  | 2
2025-04-21  | 3

*/
