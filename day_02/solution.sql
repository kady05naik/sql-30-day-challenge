-- Count the unique titles
SELECT 
	COUNT(DISTINCT title) AS nineties_english_films_for_teens
FROM 
	films
WHERE 
	release_year BETWEEN 1990 AND 1999
	AND language='English'
	AND certification IN ('G','PG','PG-13');
	

-- List all film titles with missing budgets
SELECT 
	title AS no_budget_info
FROM 
	films
WHERE 
	budget IS NULL;


-- Count the number of films we have language data for
SELECT 
	COUNT(*) AS count_language_known
FROM 
	films
WHERE 
	language IS NOT NULL;


-- Query the sum of film durations 
SELECT 
	sum(duration) AS total_duration
FROM 
	films;


-- Calculate the average duration of all films
SELECT 
	AVG(duration) AS average_duration
FROM
	films;


-- Find the latest release_year
SELECT 
	MAX(release_year) AS latest_year
FROM 
	films;


-- Find the duration of the shortest film
SELECT 
	MIN(duration) AS shortest_film
FROM 
	films;


-- Calculate the sum of gross from the year 2000 or later
SELECT 
	SUM(gross) AS total_gross
FROM 
	films
WHERE 
	release_year>=2000;


-- Calculate the average gross of films that start with A
SELECT 
	AVG(gross) AS avg_gross_A
FROM 
	films
WHERE 
	title LIKE 'A%';


-- Calculate the lowest gross film in 1994
SELECT 
	MIN(gross) AS lowest_gross
FROM 
	films
WHERE 
	release_year=1994;


-- Calculate the highest gross film released between 2000-2012
SELECT 
	MAX(gross) AS highest_gross
FROM 
	films
WHERE 
	release_year BETWEEN 2000 AND 2012;
