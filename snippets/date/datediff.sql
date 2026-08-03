-- Days since the given date

SELECT DATEDIFF(NOW(), '2002-11-02') AS days_since;

------------------------------------------------------------

-- Days remaining until the given date

SELECT DATEDIFF('2030-01-01', NOW()) AS days_until;

------------------------------------------------------------

-- Difference in hours

SELECT TIMESTAMPDIFF(
    HOUR,
    '2026-07-01 08:00:00',
    NOW()
);

------------------------------------------------------------

-- Difference in minutes

SELECT TIMESTAMPDIFF(
    MINUTE,
    '2026-07-18 08:30:00',
    NOW()
);

------------------------------------------------------------

-- Difference in months

SELECT TIMESTAMPDIFF(
    MONTH,
    '2020-01-01',
    NOW()
);
