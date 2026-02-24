# Day 07 – FULL JOIN, CROSS JOIN & Time-Based Analysis

## 🎯 Objective
Practice:
- FULL JOIN across multiple tables
- CROSS JOIN for combinational analysis
- Pattern filtering using LIKE
- Filtering using IN
- Time-based self joins
- Ranking with ORDER BY and LIMIT


## 🗂 Dataset

### Tables Used

**countries**
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

**languages**
- lang_id	
- code	
- name	
- percent	
- official

**currencies**
- code
- basic_unit
- frac_unit

**populations**
- pop_id	
- country_code	
- year	
- fertility_rate	
- life_expectancy	
- size


## 📝 Problems

1. Using FULL JOIN, retrieve:
   - Country name
   - Region
   - Language
   - Currency basic unit
   - Currency fractional unit  
   for regions that match the pattern `'M%esia'`.

2. Find the languages currently spoken in Pakistan (PAK) and India (IND).

3. Using CROSS JOIN, determine all possible language combinations that could have been spoken in Pakistan or India historically.

4. Identify the five countries with the lowest life expectancy in 2010 along with their regions.

5. Calculate how much the population of each country changed from 2010 to 2015 using a self join on the populations table.


## 💡 Why This Is Strong for a Data Engineer

This practice focuses on advanced relational modeling and time-series comparisons.

In real-world data engineering, you often:

- Use FULL JOIN when datasets may have missing relationships
- Apply CROSS JOIN for dimensional combinations
- Filter subsets of entities for targeted analytics
- Rank and limit results for dashboard reporting
- Compare time-based records using self joins
- Measure growth trends and historical changes

These are foundational skills for:
- Designing warehouse models
- Building analytical datasets
- Handling incomplete data
- Performing historical comparisons
- Supporting BI and reporting systems