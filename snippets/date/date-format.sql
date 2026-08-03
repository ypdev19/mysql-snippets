/*
------------------------------------------------------------
Format Dates
------------------------------------------------------------

Convert dates into readable strings using DATE_FORMAT().

Important: Avoid formatting dates in SQL if your application already handles presentation.
*/

SELECT DATE_FORMAT(NOW(), '%Y-%m-%d'); -- '2026-07-29'

SELECT DATE_FORMAT(NOW(), '%d/%m/%Y');  -- '29/07/2026'

SELECT DATE_FORMAT(NOW(), '%M %d, %Y'); -- 'July 29, 2026'

SELECT DATE_FORMAT(NOW(), '%W, %M %d %Y'); -- 'Wednesday, July 29 2026'

SELECT DATE_FORMAT(NOW(), '%h:%i %p'); -- '02:32:07 PM'

SELECT DATE_FORMAT(NOW(), '%Y-%M-%d %h:%i:%s %p'); -- '2026-July-29 02:32:07 PM'

SELECT DATE_FORMAT(NOW(), 'Current year is %Y');   -- 'Current year is 2026'

-- Using CURDATE()

SELECT DATE_FORMAT(CURDATE(), '%d-%m-%Y') AS formatted_date;

------------------------------------------------------------

-- Custom sentence

SELECT DATE_FORMAT(
    NOW(),
    'Today is %W, %M %d %Y'
);
-- For example: 'Wednesday 29 July 2026'


-- Most common specifiers:
-- %d  Day of month, numeric (00...31)
-- %H  Hour (00...23)
-- %h  Hour (01...12)
-- %i  Minutes (00...59)
-- %M  Month name (January...December)
-- %m  Month, numeric (00...12)
-- %p  AM or PM
-- %W  Weekday name (Sunday...Saturday)
-- %Y  Year, 4 digits
-- %y  Year, 2 digits
-- %s  Seconds (00...59)
