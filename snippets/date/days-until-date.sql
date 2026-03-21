-- Returns number of days until a future date
-- Use case: deadlines, events, expirations

SELECT DATEDIFF('2030-01-01', NOW()) AS days_until;