# Day 04 – GROUP BY, HAVING & Advanced Aggregations
## 🎯 Objective

Practice:
- GROUP BY for aggregations
- Using COUNT(), AVG(), MAX() with grouping
- COUNT(DISTINCT) for uniqueness analysis
- Filtering grouped results using HAVING
- Combining WHERE + GROUP BY + HAVING
- Sorting aggregated results
- Applying LIMIT for top results


## 🗂 Dataset: films

Columns used:
- title
- release_year
- country
- duration
- language
- certification
- budget
- gross


## 📝 Problems

- Find the number of films released each year.
- Calculate the average film duration for each release year.
- Find the maximum budget for each combination of release year and country, ordered by year and country.
- Calculate the number of distinct languages used in films each year (language diversity).
- Identify countries that have more than 10 different film certifications.
- Find countries with an average film budget greater than 1,000,000,000.
- List release years for films released after 1990.
- Calculate the average budget and average gross for films released after 1990 (grouped by year).
- From films released after 1990, include only years where the average budget is greater than 60 million.
- Among films released after 1990 with an average budget above 60 million, find the year with the highest average gross.


##💡 Why This Is Strong for a Data Engineer

This practice builds real-world aggregation and grouping skills that are critical in production data systems.
In real-world data engineering scenarios, you often:

- Build yearly or country-level KPIs using GROUP BY
- Analyze diversity metrics using COUNT(DISTINCT)
- Apply HAVING to filter aggregated results
- Combine WHERE and HAVING for precise data slicing
- Identify top-performing segments using ORDER BY + LIMIT
- Generate summary tables for BI dashboards
- Mastering GROUP BY and HAVING is essential for designing analytics-ready datasets and scalable reporting pipelines.