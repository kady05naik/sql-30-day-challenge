# Day 09 – Subqueries, IN, NOT IN & Analytical Filtering

## 🎯 Objective
Practice:
- Subqueries in WHERE clause
- Using IN and NOT IN
- Filtering with nested queries
- DISTINCT with ORDER BY
- Comparing values to aggregate results
- Combining JOIN with GROUP BY and LIMIT


## 🗂 Dataset

### Tables Used

**countries**
- code
- name
- region
- continent
- capital

**languages**
- code
- name

**currencies**
- code

**populations**
- country_code
- year
- life_expectancy

**cities**
- name
- country_code
- urbanarea_pop


## 📝 Problems

1. Retrieve the country codes for all countries located in the Middle East.

2. List all unique language names ordered alphabetically.

3. Find all distinct languages spoken in countries located in the Middle East using a subquery.

4. Return the country code and name for countries in Oceania that do not appear in the currencies table.

5. Calculate the average life expectancy for the year 2015.

6. Retrieve all population records from 2015 where life expectancy is at least 1.15 times higher than the average life expectancy of 2015.

7. Return the name, country code, and urban area population for all capital cities, ordered by urban population (highest first).

8. Identify the top nine countries with the highest number of cities.  
   - Order results by the number of cities (descending).
   - Limit the output to nine records.


## 💡 Why This Is Strong for a Data Engineer

This practice focuses on analytical filtering and nested logic.

In real-world data engineering scenarios, you often:

- Use subqueries to filter based on dynamic conditions
- Compare records against aggregated benchmarks
- Detect missing relationships using NOT IN
- Identify high-performing or outlier records
- Rank and limit results for dashboard reporting
- Combine joins and aggregations to produce summary insights

Mastering subqueries and conditional filtering strengthens your ability to build intelligent, analytics-ready datasets in production environments.