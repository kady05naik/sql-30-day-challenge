# problem.md
## SQL Practice Problems – Basic Select, Regular Expressions, String Functions, Aggregations

---

## Problem 1: Revising the Select Query I

Write a SQL query to **query all columns for all American cities in the CITY table with populations larger than 100,000**.

### Required Output:
* All columns (`ID`, `NAME`, `COUNTRYCODE`, `DISTRICT`, `POPULATION`)

### Requirements:
* Filter for populations strictly **greater than 100,000**
* Filter for the American country code **'USA'**



---

## Problem 2: Revising the Select Query II

Write a SQL query to **query the NAME field for all American cities in the CITY table with populations larger than 120,000**.

### Required Output:
* Name

### Requirements:
* Filter for populations strictly **greater than 120,000**
* Filter for the American country code **'USA'**



---

## Problem 3: Select All

Write a SQL query to **query all columns (attributes) for every row in the CITY table**.

### Required Output:
* All columns (`ID`, `NAME`, `COUNTRYCODE`, `DISTRICT`, `POPULATION`)

### Requirements:
* Retrieve **every row** from the table without any filtering conditions



---

## Problem 4: Select By ID

Write a SQL query to **query all columns for a city in CITY with the ID 1661**.

### Required Output:
* All columns (`ID`, `NAME`, `COUNTRYCODE`, `DISTRICT`, `POPULATION`)

### Requirements:
* Filter exactly for the record where **ID equals 1661**



---

## Problem 5: Japanese Cities' Attributes

Write a SQL query to **query all attributes of every Japanese city in the CITY table**.

### Required Output:
* All columns (`ID`, `NAME`, `COUNTRYCODE`, `DISTRICT`, `POPULATION`)

### Requirements:
* Filter for the Japanese country code **'JPN'**



---

## Problem 6: Weather Observation Station 1

Write a SQL query to **query a list of CITY and STATE from the STATION table**.

### Required Output:
* City
* State

### Requirements:
* Retrieve only the specified geography attributes from the table



---

## Problem 7: Weather Observation Station 3

Write a SQL query to **query a list of CITY names from STATION for cities that have an even ID number**.

### Required Output:
* City

### Requirements:
* Print the results in any order
* Exclude **duplicate entries** from the final answer using `DISTINCT`
* Use the modulo operator (`%`) to find **even IDs**



---

## Problem 8: Weather Observation Station 4

Write a SQL query to **find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table**.

### Required Output:
* Calculated difference column (`difference`)

### Requirements:
* Count the absolute total of entries using `COUNT()`
* Count unique entries using `COUNT(DISTINCT ...)`
* Use subtraction to find the difference between the two counts



---

## Problem 9: Weather Observation Station 5

Write a SQL query to **query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths**.

### Required Output:
* City
* Length of the city name

### Requirements:
* Find both the **shortest** and **longest** names using `LENGTH()`
* If there is a tie with multiple shortest or longest cities, choose the one that comes **first alphabetically**
* Use `ORDER BY` and `LIMIT` to isolate the single target rows



---

## Problem 10: Weather Observation Station 6

Write a SQL query to **query the list of CITY names starting with vowels (a, e, i, o, or u) from STATION**.

### Required Output:
* City

### Requirements:
* Exclude **duplicate entries** from the final answer using `DISTINCT`
* Utilize regular expressions via `REGEXP` to match the **beginning anchor (`^`)** against vowels


---

## Concepts Covered
* Basic Data Retrieval (`SELECT *`, `SELECT columns`)
* Filtering Rows (`WHERE`)
* Logical Operators (`AND`)
* Numerical Comparisons (`>`, `=`)
* Eliminating Duplicate Rows (`DISTINCT`)
* Modulo Arithmetic (`%`)
* Aggregate Functions (`COUNT`)
* Sorting Results (`ORDER BY DESC/ASC`)
* Restricting Row Counts (`LIMIT`)
* String Evaluation Functions (`LENGTH`)
* Regular Expressions (`REGEXP`, `^` Anchor)

---
