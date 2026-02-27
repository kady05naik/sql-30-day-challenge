-- Select country code for countries in the Middle East
SELECT 
    code
FROM 
    countries
WHERE
    region='Middle East';
	
	
-- Select unique language names, Order by the name of the language
SELECT 
    DISTINCT name
FROM languages
ORDER BY name;


-- Find unique language names  from region name Middle East in countries table(Use self join)
SELECT 
	DISTINCT name
FROM languages
WHERE code IN
    (SELECT code
    FROM countries
    WHERE region = 'Middle East')
ORDER BY name;


-- return every country code where continent is Oceania and country code is not included in the currencies table 
SELECT 
	code, 
	name
FROM countries
WHERE continent = 'Oceania'
	AND code NOT IN
    (SELECT code
    FROM currencies);
	
	
-- Select average life_expectancy from the populations table for the year 2015
SELECT 
	AVG(life_expectancy) 
FROM populations
WHERE year=2015;


-- Filter for only those populations where life expectancy is 1.15 times higher than average in year 2015
SELECT *
FROM populations
WHERE year = 2015
  AND life_expectancy > 1.15 *
  (SELECT AVG(life_expectancy)
   FROM populations
   WHERE year = 2015) ;
   

-- Return the name, country_code and urbanarea_pop for all capital cities
SELECT 
    name, 
    country_code, 
    urbanarea_pop
FROM cities
WHERE name IN
    (SELECT capital
    FROM countries)
ORDER BY urbanarea_pop DESC;


-- Find top nine countries with the most cities, Order by count of cities as cities_num. Limit the results
SELECT 
    c1.name AS country,
    COUNT(DISTINCT c2.name) AS cities_num
FROM countries c1
LEFT JOIN cities c2
    ON c1.code=c2.country_code
GROUP BY c1.name
ORDER BY cities_num desc
LIMIT 9;


