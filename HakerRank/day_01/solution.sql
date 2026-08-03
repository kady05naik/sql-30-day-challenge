-- 1. Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.

SELECT *
FROM city
WHERE population >100000 AND CountryCode ='USA';


-- 2. Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.

SELECT name 
FROM city
WHERE population>120000 and countrycode='USA';


-- 3. 	Submissions	Leaderboard	Discussions. Query all columns (attributes) for every row in the CITY table.

SELECT * from city;


-- 4. Query all columns for a city in CITY with the ID 1661.

SELECT *
FROM city
WHERE id=1661;


-- 5. Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.

SELECT *
FROm city
WHERE countrycode='JPN';


-- 6. Query a list of CITY and STATE from the STATION table.

SELECT city, state
FROM station ;


-- 7. Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.

SELECT DISTINCT city 
FROM station
where id % 2 = 0;


-- 8. Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.

SELECT COUNT(city) - COUNT(DISTINCT CITY) AS difference
FROM station;


-- 9. Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.

SELECT city, length(city)
FROM station 
ORDER BY length(city) desc,city
limit 1;


SELECT city, length(city)
FROM station 
ORDER BY length(city),city
limit 1;


-- 10. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.

SELECT distinct city
FROM station
WHERE city regexp '^[aeiou]';

