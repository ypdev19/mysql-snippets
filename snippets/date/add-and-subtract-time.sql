/*
------------------------------------------------------------
Add or Subtract Time
------------------------------------------------------------

Modify dates using DATE_ADD() and DATE_SUB().
*/

-- Add days

SELECT DATE_ADD(NOW(), INTERVAL 30 DAY);

------------------------------------------------------------

-- Add months

SELECT DATE_ADD(NOW(), INTERVAL 6 MONTH);

------------------------------------------------------------

-- Add years

SELECT DATE_ADD(NOW(), INTERVAL 1 YEAR);

------------------------------------------------------------

-- Add hours

SELECT DATE_ADD(NOW(), INTERVAL 2 HOUR);

------------------------------------------------------------

-- Subtract days

SELECT DATE_SUB(NOW(), INTERVAL 7 DAY);

------------------------------------------------------------

-- Subtract months

SELECT DATE_SUB(NOW(), INTERVAL 3 MONTH);

------------------------------------------------------------

-- Subtract years

SELECT DATE_SUB(NOW(), INTERVAL 18 YEAR);

------------------------------------------------------------

-- Combined interval

SELECT DATE_ADD(
    NOW(),
    INTERVAL '2-6' YEAR_MONTH
);