/*
------------------------------------------------------------
Extract Parts of a Date
------------------------------------------------------------

Retrieve specific parts from a DATE or DATETIME value.

Useful for filtering, grouping and reporting.
*/

SELECT YEAR(NOW()) AS year;

SELECT MONTH(NOW()) AS month;

SELECT DAY(NOW()) AS day;

SELECT HOUR(NOW()) AS hour;

SELECT MINUTE(NOW()) AS minute;

SELECT SECOND(NOW()) AS second;

------------------------------------------------------------

-- Extract multiple values

SELECT
    YEAR(NOW()) AS year,
    MONTH(NOW()) AS month,
    DAY(NOW()) AS day;

------------------------------------------------------------

-- Alternative

SELECT EXTRACT(YEAR FROM NOW());

SELECT EXTRACT(MONTH FROM NOW());

SELECT EXTRACT(DAY FROM NOW());
