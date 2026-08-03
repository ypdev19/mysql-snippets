-- Calculate age in years

SELECT 
  name,
  TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) AS age
FROM people;