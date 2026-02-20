-- Find the release_year and film_count of each year
SELECT 
	release_year, 
	count(title) AS film_count
FROM 
	films
GROUP BY 
	release_year;


-- Find the release_year and average duration of films for each year
SELECT 
    release_year, 
    AVG(duration) AS avg_duration
FROM 
	films
GROUP BY 
	release_year;
	

-- Find the release_year, country, and max_budget, then group and order by release_year and country
SELECT 
    release_year, 
    country, 
    MAX(budget) AS max_budget
FROM 
    films
GROUP BY 
    release_year,
    country
ORDER BY 
    release_year,
    country;
	

-- Using the films table: Find each release_year's language diversity
SELECT 
    release_year, 
    count(DISTINCT language) AS total_languages
FROM 
    films
GROUP BY 
    release_year
ORDER BY 
    total_languages desc;


--find out which countries (or country) have the greater than 10 varied film certifications.
SELECT 
    country,
    COUNT(DISTINCT certification) AS certification_count
FROM
    films
GROUP BY
    country
HAVING 
    COUNT(DISTINCT certification)>10;


-- Find countries have the average film budgets greater than 1000000000 order by budgets descending
SELECT 
    country,
    AVG(budget) AS average_budget
FROM
    films
GROUP BY 
    country
HAVING 
    AVG(budget)>1000000000
ORDER BY
    average_budget;


-- Select the release_year for films released after 1990 grouped by year
SELECT 
    release_year
FROM 
    films
WHERE 
    release_year>1990
GROUP BY 
    release_year;


-- list the average budget and average gross released after 1990
SELECT 
    release_year, 
    AVG(budget) AS avg_budget,
    AVG(gross) AS avg_gross
FROM 
    films
WHERE 
    release_year > 1990
GROUP BY 
    release_year;


-- list the average budget and average gross released after 1990 where with an average budget of greater than 60 million are included
SELECT 
    release_year, 
    AVG(budget) AS avg_budget, 
    AVG(gross) AS avg_gross
FROM 
    films
WHERE 
    release_year > 1990
GROUP BY 
    release_year
HAVING 
    AVG(budget)>60000000;
	

-- list the average budget greater than 60 million and average highest gross released after 1990 
SELECT 
    release_year, 
    AVG(budget) AS avg_budget, 
    AVG(gross) AS avg_gross
FROM 
    films
WHERE 
    release_year > 1990
GROUP BY 
    release_year
HAVING 
    AVG(budget) > 60000000
ORDER BY 
    avg_gross DESC
LIMIT 1;