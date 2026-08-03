/*
------------------------------------------------------------
Current Date and Time
------------------------------------------------------------

Retrieve the current server date and time using the most common MySQL date functions.

Compatible with:
MySQL 5.7+
MySQL 8.x
*/

-- Current date and time

SELECT NOW();

-- Example
-- 2026-07-18 11:35:42

------------------------------------------------------------

-- Current date only

SELECT CURDATE();

-- Example
-- 2026-07-18

------------------------------------------------------------

-- Current time only

SELECT CURTIME();

-- Example
-- 11:35:42

------------------------------------------------------------

-- ANSI SQL equivalent

SELECT CURRENT_TIMESTAMP;

------------------------------------------------------------

-- UTC timestamp

SELECT UTC_TIMESTAMP();
