# Day 08 – SQL Set Operations (UNION, UNION ALL, INTERSECT, EXCEPT)

## 🎯 Objective
Practice:
- UNION (removing duplicates)
- UNION ALL (including duplicates)
- INTERSECT (common records)
- EXCEPT (difference between datasets)
- Combining datasets from multiple sources
- Ordering results after set operations


## 🗂 Dataset

### Tables Used

**economies2019**
- code
- year
- (other economic indicators)

**economies2015**
- code
- year
- (other economic indicators)

**economies**
- code
- year

**populations**
- country_code
- year

**cities**
- name

**countries**
- name


## 📝 Problems

1. Stack all records from the `economies2019` and `economies2015` tables, excluding duplicate rows.

2. Retrieve all unique combinations of country code and year from both the `economies` and `populations` tables.

3. Modify the previous query to return all combinations of country code and year, including duplicates.

4. Find all city names that are also country names.

5. Find all city names that do not match any country name.


## 💡 Why This Is Strong for a Data Engineer

Set operations are extremely important in real-world data engineering.

In production environments, you often:

- Combine datasets from different years or systems
- Merge historical and current records
- Identify overlapping entities across datasets
- Detect mismatches between reference tables
- Remove or retain duplicates depending on business logic

Understanding the difference between UNION and UNION ALL is critical when working with large-scale data pipelines, especially in distributed systems like Spark or cloud warehouses.

These concepts directly apply to:
- Data consolidation
- Deduplication strategies
- Data validation checks
- Building incremental data pipelines