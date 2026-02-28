-- 
SELECT 
  countries.name AS country,
  (SELECT 
		count(*)
   FROM cities
   WHERE countries.code= cities.country_code) AS cities_num
FROM countries
ORDER BY cities_num DESC, country
LIMIT 9;


-- Write a query that groups by each country code from languages, and counts the languages spoken in each country
SELECT 
    code, 
    count(*) AS lang_num
FROM languages
GROUP BY code ;


-- Find the number of languages spoken for each country (country name)
SELECT 
  local_name,
  lang_num
FROM countries, 
  (SELECT code, COUNT(*) AS lang_num
  FROM languages
  GROUP BY code) AS sub
WHERE sub.code=countries.code
ORDER BY lang_num DESC;


-- Find out Inflation and unemployment rate for certain countries in 2015, "Republic" or "Monarchy" as their form of government
SELECT 
  code,
  inflation_rate,
  unemployment_rate
FROM economies
WHERE year = 2015 
  AND code IN
	(SELECT 
    code
	FROM countries
	WHERE gov_form like '%Republic%' 
		OR gov_form like '%Monarchy%')
ORDER BY inflation_rate;


-- Find the top 10 capital cities in Europe and the Americas by city_perc, a metric you'll calculate. city_perc is a percentage that calculates the "proper" population in a 
-- city as a percentage of the total population in the wider metro area, as follows: city_proper_pop / metroarea_pop * 100
SELECT 
    name,
    country_code,
    city_proper_pop,
    metroarea_pop,
    (city_proper_pop / metroarea_pop) * 100 AS city_perc
FROM cities
WHERE metroarea_pop IS NOT NULL 
    AND name IN (
        SELECT capital 
        FROM countries
        WHERE continent ='Europe'
            OR continent LIKE '%America'
    )
ORDER BY city_perc desc
LIMIT 10;


