# Day 03 – SQL Math Functions, Rounding & Sorting
## 🎯 Objective

Practice:

- Mathematical calculations in SQL
- Using ROUND() with different precision levels
- Percentage calculations
- Working with MIN() and MAX()
- Converting units (minutes → hours)
- Sorting data using ORDER BY
- Multi-column sorting


## 🗂 Dataset: reviews, films, people

Columns used from reviews:
- id	
- film_id	
- num_user	
- num_critic	
- imdb_score	
- num_votes	
- facebook_likes


Columns used from films:
- id	
- title	
- release_year	
- country	
- duration	
- language	
- certification	
- gross	
- budget


Columns used from people:
- id	
- name	
- birthdate	
- deathdate


## 📝 Problems

 1. Calculate the average number of Facebook likes and round it to 1 decimal place.
 2. Calculate the average film budget rounded to the nearest thousand.
 3. Convert film duration from minutes to hours.
 4. Calculate the percentage of people who are no longer alive.
 5. Find how many decades the films table covers using MIN() and MAX() of release_year.
 6. Convert film duration to hours and round to 2 decimal places.
 7. List all people sorted alphabetically by name.
 8. Display film titles and durations from longest to shortest.
 9. Sort films by release_year and then by duration.
10. Sort films by certification and release_year (latest first within each certification).


## 💡 Why This Is Strong for a Data Engineer

This practice strengthens analytical thinking and data transformation skills that are essential in data engineering workflows.

In real-world environments, Data Engineers frequently:

- Perform metric calculations and rounding for reporting
- Convert and standardize units during transformations
- Calculate percentages for business insights
- Use MIN and MAX for validation and time-range analysis
- Sort datasets before loading into reporting layers
- Prepare clean, structured outputs for downstream analytics

Mastering these transformation and sorting techniques helps build strong foundations for scalable ETL pipelines and production-ready data models.





