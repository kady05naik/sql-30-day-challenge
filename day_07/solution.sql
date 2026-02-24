SELECT 
	c1.name AS country, 
    c1.region, 
    l.name AS language,
	c2.basic_unit, 
    c2.frac_unit
FROM countries as c1 
FULL JOIN languages as l 
    USING (code)
FULL JOIN currencies as c2
    ON l.code=c2.code
WHERE region LIKE 'M%esia';


--What are the languages presently spoken in the two countries
SELECT 
	c.name AS country, 
	l.name AS language
FROM countries AS c 
INNER JOIN languages AS l
ON c.code=l.code
WHERE c.code IN ('PAK','IND')
	AND l.code in ('PAK','IND');
	

--FInd which languages could potentially have been spoken in either country over the course of their history
SELECT c.name AS country, l.name AS language
FROM countries AS c        
CROSS JOIN languages l
WHERE c.code in ('PAK','IND')
	AND l.code in ('PAK','IND');
	

--Find the names of the five countries and their respective regions with the lowest life expectancy for the year 2010
SELECT 
	c.name AS country,
    region,
    life_expectancy AS life_exp
FROM countries AS c
INNER JOIN populations AS p 
    ON c.code = p.country_code
WHERE p.year= 2010
ORDER BY  life_exp
LIMIT 5;


--FInd out how much the population for each country changed from 2010 to 2015
SELECT 
    p1.country_code,
    p1.size AS size2010, 
    p2.size AS size2015
FROM populations p1
INNER JOIN populations p2
    ON p1.country_code=p2.country_code
Where p1.year=2010
    AND p2.year=p1.year+5;