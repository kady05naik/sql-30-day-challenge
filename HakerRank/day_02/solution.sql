-- 1. Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY NOT REGEXP '^[aeiouAEIOU]' 
   OR CITY NOT REGEXP '[aeiouAEIOU]$';


-- 2. Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT city
FROM station 
WHERE city NOT regexp '^[aeiouAEIOU]' 
    AND city NOT regexp '[aeiouAEIOU]$';


--3. Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

SELECT name
FROM students
WHERE marks>75
ORDER BY substring(lower(name),(length(name)-2)), id;


-- 4. Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.

SELECT name 
FROM employee
ORDER BY name;


-- 5. Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than $2000 per month who have been employees for less than  months. Sort your result by ascending employee_id.

SELECT name
FROM employee
WHERE months <10 and salary>2000 
ORDER BY employee_id;


-- 6. Query a count of the number of cities in CITY having a Population larger than 100,000.


SELECT COUNT(name)
FROM city
WHERE population >100000;


-- 7.  Query the total population of all cities in CITY where District is California.

SELECT sum(population)
FROM city
WHERE district ='California';


-- 8. Query the average population of all cities in CITY where District is California.

SELECT AVG(population)
FROM city
WHERE district = 'California';


-- 9. Query the average population for all cities in CITY, rounded down to the nearest integer.

SELECT round(AVG(population))
FROM city;


-- 10. Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.

SELECT SUM(population)
FROM city
WHERE COUNTRYCODE ='JPN';




