# Day 02 – Aggregations, NULL Handling & Pattern Filtering

## 🎯 Objective
Practice:
- Aggregate functions (COUNT, SUM, AVG, MIN, MAX)
- Filtering using WHERE
- Handling NULL values
- Using IN operator
- Pattern matching with LIKE


## 🗂 Dataset: films

Columns used:
- title
- release_year
- language
- certification
- budget
- duration
- gross


## 📝 Problems

 1. Count unique English-language teen films released in the 1990s with certifications G, PG, or PG-13.
 2. List film titles with missing budget information.
 3. Count films with known language data.
 4. Calculate total duration of all films.
 5. Find the average duration of films.
 6. Find the latest release year.
 7. Find the shortest film duration.
 8. Calculate total gross from 2000 onwards.
 9. Calculate average gross for films starting with 'A'.
10. Find the lowest gross film in 1994.
11. Find the highest gross film released between 2000–2012.


## 💡 Why This Is Strong for a Data Engineer

This practice set strengthens core aggregation skills that are essential in real-world data engineering.

In production environments, Data Engineers frequently:
- Calculate business KPIs using SUM and AVG
- Perform data quality checks using COUNT
- Identify anomalies using MIN and MAX
- Handle missing data using NULL checks
- Filter datasets efficiently before transformations

Mastering these aggregation and filtering techniques builds a strong foundation for designing reliable and scalable data pipelines.
