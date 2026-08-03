-- The inverse of DATE_FORMAT, useful for parsing dates that come in non-standard formats.

SELECT STR_TO_DATE('29/07/2026', '%d/%m/%Y');   -- '2026-07-29'
SELECT STR_TO_DATE('29-July-2026', '%d-%M-%Y'); -- '2026-07-29'
