# Day 06 – Advanced Joins, Self Joins & Subqueries
## 🎯 Objective

Practice:
- LEFT JOIN with filtering
- FULL JOIN
- Aggregations with GROUP BY
- ORDER BY with LIMIT
- Self Joins
- Subqueries with NOT IN
- Joining hierarchical data (Employee–Manager relationship)
- Multi-table joins across business domains

Columns used from countries:
- code	
- name	
- continent	
- region	
- surface_area	
- indep_year	
- local_name	
- gov_form	
- capital	
- cap_long	
- cap_lat

Columns used from economies:
- econ_id	
- code	
- year	
- income_group	
- gdp_percapita	
- gross_savings	
- inflation_rate	
- total_investment	
- unemployment_rate	
- exports	
- imports

Columns used from currencies
- code
- basic_unit

Tables Used (HR Domain):
- employee
- employee_id
- ename
- department_id
- salary
- join_date
- manager_id
- job_title
- department
- department_id
- department_name
- project
- employee_id


## 📝 Problems
- Find the GDP per capita by region for the year 2010.
- Calculate the average GDP per capita by region for 2010.
- Order regions by average GDP per capita (highest to lowest) and return only the top 10 regions.
- Using FULL JOIN, find country, code, region, and currency basic unit where:
- The region is North America, OR
- The country name is missing.
- Find the average salary grouped by department name.
- Perform a self join to find employees who share the same department (excluding self-matching records).
- Retrieve employee details along with their manager’s name.
- Find all employees who have not worked on any project.
- Retrieve employee names along with their corresponding department names.

## 💡 Why This Is Strong for a Data Engineer
- This practice reflects real-world data modeling and integration scenarios.
- As a Data Engineer, you frequently:
- Join economic or regional datasets for analytics
- Use LEFT and FULL JOIN to handle incomplete datasets
- Aggregate business metrics (like salary, GDP)
- Model hierarchical relationships (Employee → Manager)
- Use self joins to analyze internal relationships
- Apply subqueries to detect missing transactional data
- Combine HR, finance, and operational datasets

Mastering joins + subqueries builds the foundation for:
- Star schema design
- Building dimension & fact tables
- Data validation pipelines
- Production-grade analytical models