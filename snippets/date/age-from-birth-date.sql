-- Calculate age in years
-- Use case: profiles, demographics

SELECT 
  name,
  TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) AS age
FROM people;