-- Return the unique countries from the films table
SELECT 
	DISTINCT country 
FROM films;


-- Count the distinct countries from the films table
SELECT 
	COUNT(DISTINCT country) AS count_distinct_countries
FROM films;


-- Count the Spanish-language films
SELECT 
	language, 
	COUNT(language) AS count_spanish
FROM films
WHERE language='Spanish'
GROUP BY language


-- Select the title and release_year for all German-language films released before 2000
SELECT 
	title, 
	release_year
FROM films
WHERE language='German' 
	AND release_year<2000;


-- Update the query to see all German-language films released after 2000
SELECT 
	title, 
	release_year
FROM films
WHERE release_year > 2000
	AND language = 'German';
	
	
-- Select all records for German-language films released after 2000 and before 2010
SELECT * 
FROM films
WHERE (release_year>2000 
    AND release_year<2010)
    AND language='German';


-- Find the title and year of films from the 1990 or 1999
SELECT 
	title, 
	release_year
FROM films
WHERE release_year = 1990 
	OR release_year=1999;


-- Select the title and release_year for films released between 1990 and 2000
SELECT 
	title, 
	release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000;


-- Find the title and release_year for all films over two hours in length released in 1990 and 2000
SELECT 
	title, 
	release_year
FROM films
WHERE duration>120 
    AND (release_year =1990 OR release_year=2000);