/*
===============================================================================
Snippet Name: Daily Sales Aggregation Using DATE()
Slug: daily-sales-aggregation.sql
-------------------------------------------------------------------------------
Description:
This snippet demonstrates how to aggregate sales records by calendar day in 
MySQL using the DATE() function. It includes both a fixed date range query 
and a dynamic query for the last 7 days. Using DATE() ensures correct daily 
totals across multiple months or years, unlike DAYOFMONTH().
===============================================================================
*/


-- Query to count sales per day in a fixed date range (Sep 17 to Sep 18, 2024)
SELECT DATE(`date`) AS sale_date,
       COUNT(*) AS total_sales
  FROM sales
 WHERE `date` >= '2024-09-17'
   AND `date` <  '2024-09-19'
GROUP BY DATE(`date`);

-- Dynamic query to count sales over the last 7 days
SELECT DATE(`date`) AS sale_date,
       COUNT(*) AS total_sales
  FROM sales
 WHERE `date` >= CURDATE() - INTERVAL 7 DAY
   AND `date` <  CURDATE()
GROUP BY DATE(`date`);

/*
Query Explanation:
------------------
1. Fixed date range query:
   - DATE(`date`) extracts the full calendar date.
   - COUNT(*) counts sales per day.
   - WHERE `date` >= '2024-09-17' AND `date` < '2024-09-19' filters the specific range.
   - GROUP BY DATE(`date`) ensures daily aggregation.

2. Dynamic last 7 days query:
   - Filters the last 7 days using CURDATE() - INTERVAL 7 DAY.
   - DATE(`date`) ensures each day is counted separately.
   - GROUP BY DATE(`date`) aggregates correctly across months/years.
*/


/*
Use Case Example:
-----------------
Table: sales
---------------
id | date                | description
-- | ------------------ | ----------------
1  | 2024-09-15 10:15:00 | Sale transaction 1
2  | 2024-09-15 12:30:00 | Sale transaction 2
3  | 2024-09-16 08:00:00 | Sale transaction 3
4  | 2024-09-17 14:45:00 | Sale transaction 4
5  | 2024-09-17 16:20:00 | Sale transaction 5

*/

-- Create table `sales`
CREATE TABLE IF NOT EXISTS sales (
  id INT AUTO_INCREMENT PRIMARY KEY,
  `date` DATETIME NOT NULL,
  description VARCHAR(255) DEFAULT NULL
);

-- Insert example sales records from September 15 to October 20, 2024
INSERT INTO sales (`date`, description) VALUES
('2024-09-15 10:15:00', 'Sale transaction 1'),
('2024-09-15 12:30:00', 'Sale transaction 2'),
('2024-09-16 08:00:00', 'Sale transaction 3'),
('2024-09-17 14:45:00', 'Sale transaction 4'),
('2024-09-17 16:20:00', 'Sale transaction 5'),
('2024-09-18 09:10:00', 'Sale transaction 6'),
('2024-09-18 18:30:00', 'Sale transaction 7'),
('2024-09-19 11:00:00', 'Sale transaction 8'),
('2024-09-20 15:00:00', 'Sale transaction 9'),
('2024-09-25 13:20:00', 'Sale transaction 10'),
('2024-10-01 09:15:00', 'Sale transaction 11'),
('2024-10-05 17:30:00', 'Sale transaction 12'),
('2024-10-10 10:00:00', 'Sale transaction 13'),
('2024-10-15 14:00:00', 'Sale transaction 14'),
('2024-10-20 16:45:00', 'Sale transaction 15');

/*

Query Result:
-----------------------------------------

Fixed range query result (Sep 17–Sep 18):
-----------------------------------------
sale_date   | total_sales
----------- | ------------
2024-09-17  | 2
2024-09-18  | 2

Dynamic last 7 days query result:
---------------------------------
- Shows daily totals for the 7 days prior to today.
- Fully safe across months and years.
*/