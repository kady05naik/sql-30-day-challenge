# Day 05 – Joins Across Multiple Tables

## 🎯 Objective

Practice:

- INNER JOIN
- LEFT JOIN
- Joining multiple tables
- Using ON vs USING
- Aliasing columns and tables
- Filtering joined results
- Matching composite conditions (year alignment)
- Sorting joined datasets

## 🗂 Dataset: countries, cities, languages, economies, populations

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

Columns used from cities:
- name	
- country_code	
- city_proper_pop	
- metroarea_pop	
- urbanarea_pop

Columns used from languages:
- lang_id	
- code	
- name	
- percent	
- official

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

Columns used from populations:
- pop_id	
- country_code	
- year	
- fertility_rate	
- life_expectancy	
- size

## 📝 Problems

- Join cities and countries to display city name, country name, and region.
- Join countries and economies to analyze inflation rates for the years 2010 and 2015.
- Join countries and languages to identify which languages are official and unofficial.
- Display country names along with their languages.
- Find the country where the language is Bhojpuri.
- Join countries and populations to display country name and fertility rate.
- Join countries, populations, and economies to display country name, year, fertility rate, and unemployment rate.
- Modify the previous query so that fertility rate and unemployment rate are matched for the same year.
- Using INNER JOIN, display city name, country code, country name, region, and city population sorted by country code in descending order.
- Repeat the previous query using LEFT JOIN instead of INNER JOIN.


## 💡 Why This Is Strong for a Data Engineer

Joins are at the heart of real-world data engineering.
In production systems, Data Engineers constantly:
- Integrate data from multiple sources
- Combine fact and dimension tables
- Align time-series datasets across years
- Handle missing relationships using LEFT JOIN
- Prepare enriched datasets for analytics and BI tools

Understanding the difference between INNER JOIN and LEFT JOIN — and knowing when to use each — is critical when building scalable data pipelines and star schemas in 
data warehouses like Azure Synapse or Snowflake.