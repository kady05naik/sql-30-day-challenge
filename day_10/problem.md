# Day 10 – Correlated Subqueries & Analytical Calculations

## 🎯 Objective
Practice:
- Correlated subqueries
- Subqueries in SELECT and WHERE clauses
- Aggregations inside subqueries
- Filtering using IN with nested queries
- Calculated columns using arithmetic operations
- Ranking with ORDER BY and LIMIT


## 🗂 Dataset

### Tables Used

**countries**
- code
- name
- local_name
- continent
- gov_form
- capital

**cities**
- name
- country_code
- city_proper_pop
- metroarea_pop

**languages**
- code

**economies**
- code
- year
- inflation_rate
- unemployment_rate


## 📝 Problems

1. Using a correlated subquery, return each country along with the number of cities it has.  
   - Order by number of cities (descending), then country name.  
   - Limit the results to the top 9 countries.

2. Group by country code in the languages table and count how many languages are spoken in each country.

3. Using a subquery, return each country’s local name along with the total number of languages spoken in that country.  
   - Order results by language count (descending).

4. Retrieve inflation rate and unemployment rate for the year 2015 for countries whose form of government includes either "Republic" or "Monarchy".  
   - Order by inflation rate.

5. Find the top 10 capital cities in Europe and the Americas based on a calculated metric `city_perc`, defined as:  

   city_perc = (city_proper_pop / metroarea_pop) * 100  

   - Only include cities where metroarea_pop is not NULL.  
   - Order results by city_perc (descending).  
   - Limit results to 10.


## 💡 Why This Is Strong for a Data Engineer

This practice focuses on advanced analytical SQL patterns.

In real-world data engineering scenarios, you often:

- Use correlated subqueries to calculate metrics per entity
- Embed aggregations inside SELECT statements
- Filter datasets dynamically using nested queries
- Derive custom metrics for business reporting
- Rank and limit results for dashboard consumption
- Combine demographic, economic, and geographic datasets

Mastering correlated subqueries and calculated metrics strengthens your ability to design analytical models and business intelligence datasets in production environments.