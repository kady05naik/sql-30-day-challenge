-- Select name fields (with alias) and region 
SELECT 
    cities.name AS city, 
    countries.name AS country,
    region AS region
FROM cities 
INNER JOIN countries 
    ON cities.country_code = countries.code;
	

--join tables to examine the inflation rate in 2010 and 2015.
SELECT
    c.code AS country_code, 
    c.name, 
    e.year,
    e.inflation_rate
FROM countries AS c
INNER JOIN economies AS e
    ON c.code=e.code
WHERE e.year IN (2010,2015);
	

--Find which languages are official languages, and which ones are unofficial
SELECT 
    c.name AS country, 
    l.name AS language, 
    official
FROM countries AS c
INNER JOIN languages AS l
    USING (code);


-- Select country and  languages
SELECT 
    c.name AS country, 
    l.name AS language
FROM countries AS c
INNER JOIN languages l
    USING(code);
	

-- Select country and language where language is Bhojpuri
SELECT 
    c.name AS country, 
    l.name AS language
FROM countries AS c
INNER JOIN languages AS l
    USING(code)
WHERE l.name='Bhojpuri';


--Join tables country and populations and select country and its fertility_rate
SELECT 
    c.name,
    p.fertility_rate
FROM countries AS c 
INNER JOIN populations AS p
    ON c.code=p.country_code;
	
	
--join tables to return the country name, year, fertility rate, and unemployment rate in a single result from the countries, populations and economies tables.
SELECT 
    c.name, 
    e.year, 
    fertility_rate, 
    e.unemployment_rate
FROM countries AS c
INNER JOIN populations AS p
    ON c.code = p.country_code
INNER JOIN economies e 
    ON c.code=e.code;
	
	
--join tables to return the country name, year, fertility rate, and unemployment rate in a single result from the countries, populations and economies tables where year year col in pupulations & year col in economies should match.
SELECT 
	c.name, 
	e.year, 
	p.fertility_rate, 
	e.unemployment_rate
FROM countries AS c
INNER JOIN populations AS p
	ON c.code = p.country_code
INNER JOIN economies AS e
	ON c.code = e.code
WHERE p.year=e.year;


--select city name, code, country name, region, city_proper_pop order by code in descending order(Use INNER JOIN).
SELECT 
    c1.name AS city,
    code,
    c2.name AS country,
    region,
    city_proper_pop
FROM cities AS c1
INNER JOIN countries c2
    ON c1.country_code=c2.code
ORDER BY code DESC;


--select city name, code, country name, region, city_proper_pop order by code in descending order(Use LEFT JOIN).
SELECT 
	c1.name AS city, 
    code, 
    c2.name AS country,
    region, 
    city_proper_pop
FROM cities AS c1
LEFT JOIN countries c2
    ON c1.country_code = c2.code
ORDER BY code DESC;