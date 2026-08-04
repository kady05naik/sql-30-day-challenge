# problem.md
## SQL Practice Problems – Advanced Filtering, String Manipulation, and Aggregations

---

## Problem 1: Weather Observation Station 11

Write a SQL query to **query the list of CITY names from STATION that either do not start with vowels or do not end with vowels**.

### Required Output:
* City

### Requirements:
* Exclude **duplicate entries** from the final answer using `DISTINCT`
* Match strings that fail the start vowel condition **OR** fail the end vowel condition
* Use `REGEXP` with conditional logical operators


---

## Problem 2: Weather Observation Station 12

Write a SQL query to **query the list of CITY names from STATION that do not start with vowels and do not end with vowels**.

### Required Output:
* City

### Requirements:
* Exclude **duplicate entries** from the final answer using `DISTINCT`
* Match strings that strictly fail **both** conditions simultaneously using `AND`


---

## Problem 3: Higher Than 75 Marks

Write a SQL query to **query the Name of any student in STUDENTS who scored higher than 75 Marks**, sorted by the **last three characters** of their name.

### Required Output:
* Name

### Requirements:
* Filter for records where `marks > 75`
* Extract the last 3 characters using `SUBSTRING()` and `LENGTH()`
* If names end with the same last three characters, use a secondary sort by ascending `id`


---

## Problem 4: Employee Names

Write a SQL query that **prints a list of employee names from the Employee table in alphabetical order**.

### Required Output:
* Name

### Requirements:
* Sort alphabetically (ascending) using standard `ORDER BY` execution


---

## Problem 5: Employee Salaries

Write a SQL query that **prints a list of employee names for employees having a salary greater than \$2,000 per month who have been employees for less than 10 months**.

### Required Output:
* Name

### Requirements:
* Apply multiple filters: `months < 10` and `salary > 2000`
* Sort the final result by ascending `employee_id`


---

## Problem 6: Revising Aggregations - The Count Function

Write a SQL query to **query a count of the number of cities in CITY having a Population larger than 100,000**.

### Required Output:
* Count value

### Requirements:
* Filter for populations over 100,000
* Use the aggregate `COUNT()` function to total the matching records


---

## Problem 7: Revising Aggregations - The Sum Function

Write a SQL query to **query the total population of all cities in CITY where District is California**.

### Required Output:
* Total sum value

### Requirements:
* Filter exactly for the district **'California'**
* Accumulate values using the aggregate `SUM()` function


---

## Problem 8: Revising Aggregations - Averages

Write a SQL query to **query the average population of all cities in CITY where District is California**.

### Required Output:
* Average value

### Requirements:
* Filter exactly for the district **'California'**
* Find the mean using the aggregate `AVG()` function


---

## Problem 9: Average Population

Write a SQL query to **query the average population for all cities in CITY, rounded down to the nearest integer**.

### Required Output:
* Average integer value

### Requirements:
* Find the total table average using `AVG()`
* Truncate or floor the result to completely **round down** to an integer


---

## Problem 10: Japan Population

Write a SQL query to **query the sum of the populations of all Japanese cities in the CITY table** (where CountryCode is 'JPN').

### Required Output:
* Total population sum

### Requirements:
* Filter columns using the Japanese country code **'JPN'**
* Total the filtered rows using `SUM()`


---

## Concepts Covered
* Regex Negative Matching (`NOT REGEXP`)
* Complex Sorting (`ORDER BY` with String Functions)
* Substring Extraction (`SUBSTRING`, `LENGTH`)
* Logical Evaluation (`AND`, `OR`)
* Basic Mathematical Aggregations (`COUNT`, `SUM`, `AVG`)
* Mathematical Rounding Operations (`FLOOR`)

---
