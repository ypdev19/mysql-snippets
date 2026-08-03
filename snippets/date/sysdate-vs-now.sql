-- NOW() is fixed ONCE at the start of the statement,
-- even if the statement takes several seconds to run.
SELECT NOW(), SLEEP(2), NOW(); -- both NOW() values are equal

-- SYSDATE() is evaluated at the exact moment the function runs,
-- so it can return a different value within the same statement.
SELECT SYSDATE(), SLEEP(2), SYSDATE(); -- the two SYSDATE() values may differ

-- This matters especially inside triggers and stored procedures.
