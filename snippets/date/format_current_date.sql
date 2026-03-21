-- Formats current date as DD-MM-YYYY
-- Use case: reports, exports, UI display

SELECT DATE_FORMAT(CURDATE(), '%d-%m-%Y') AS formatted_date;