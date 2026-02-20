-- Round the average number of facebook_likes to one decimal place
SELECT 
    ROUND(AVG(facebook_likes),1) AS avg_facebook_likes
FROM
    reviews;


-- Calculate the average budget rounded to the thousands
SELECT 
    ROUND(AVG(budget),-3) AS avg_budget_thousands
FROM 
    films;


-- Calculate the title and duration_hours from films
SELECT 
    title, 
    (duration/60.0) AS duration_hours
FROM 
    films;


-- Calculate the percentage of people who are no longer alive
SELECT  
    COUNT(deathdate)* 100.0 / COUNT(id) AS percentage_dead
FROM 
    people;


-- Find how many decades (period of ten years) the films table covers by using MIN() and MAX(); alias as number_of_decades
-- Find the number of decades in the films table
SELECT 
    (MAX(release_year) - MIN(release_year)) / 10.0 AS number_of_decades
FROM 
    films;


-- Round duration_hours to two decimal places
SELECT 
    title,
    round(duration / 60.0,2) AS duration_hours
FROM 
    films;


-- Select name from people and sort alphabetically
SELECT 
    name
FROM 
    people 
ORDER BY
    name;


-- Select the title and duration from longest to shortest film
SELECT 
    title, 
    duration
FROM 
    films 
ORDER BY 
    duration;


-- Select the release year, duration, and title sorted by release year and duration
SELECT 
    release_year, 
    duration, title
FROM 
    films
ORDER BY 
    release_year, 
    duration;


-- Select the certification, release year, and title sorted by certification and release year
SELECT 
    title, 
    certification, 
    release_year 
FROM 
    films
ORDER BY 
    certification, 
    release_year desc;


