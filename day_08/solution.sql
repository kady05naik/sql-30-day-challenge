-- A set operation to stack all records in two tables on top of each other, excluding duplicates.
SELECT 
    *
FROM economies2019 
UNION
SELECT 
    *
FROM economies2015
ORDER BY code, year;


-- Query that determines all pairs of code and year from economies and populations, without duplicates
SELECT 
    code, 
    year
FROM economies
UNION 
SELECT 
    country_code,
    year
FROM populations;


-- Amend the query to return all combinations (including duplicates) of country code and year in the economies or the populations tables.
SELECT 
    code, 
    year
FROM economies
UNION ALL
SELECT 
    country_code, 
    year
FROM populations
ORDER BY code, year;


-- Return all city names that are also country names.
SELECT 
    name
FROM cities
INTERSECT 
SELECT 
    name
FROM countries;


-- Return all cities that do not have the same name as a country
SELECT 
    name
FROM cities
EXCEPT
SELECT 
    name
FROM countries
ORDER BY name;


