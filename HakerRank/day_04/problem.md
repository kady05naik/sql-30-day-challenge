# problem.md
## SQL Practice Problems – Advanced Geolocation Math, Window Functions, and Joins

---

## Problem 1: Weather Observation Station 16 & 17

Write a SQL query to **query the Western Longitude (LONG_W) for the smallest Northern Latitude (LAT_N) from STATION that is strictly greater than 38.7780**.

### Required Output:
* Longitude value

### Requirements:
* Filter rows where `lat_n > 38.7780`
* Sort records by `lat_n` ascending to find the smallest value, isolating the target row using `LIMIT 1`
* Round your final answer to **4 decimal places**



---

## Problem 2: Weather Observation Station 18 (Manhattan Distance)

Consider $P_1(a, b)$ and $P_2(c, d)$ to be two points on a 2D plane where $(a, c)$ represent extreme values of `LAT_N` and $(b, d)$ represent extreme values of `LONG_W`. Write a query to **calculate the Manhattan Distance between points $P_1$ and $P_2$**.

### Required Output:
* Manhattan distance value

### Requirements:
* Calculate distance using the absolute formula: $|x_1 - x_2| + |y_1 - y_2|$
* Isolate extreme values using `MAX()` and `MIN()`
* Round your final calculation to **4 decimal places**



---

## Problem 3: Weather Observation Station 19 (Euclidean Distance)

Consider $P_1(a, c)$ and $P_2(b, d)$ to be two points on a 2D plane representing extreme coordinate pairs. Write a query to **calculate the Euclidean Distance between points $P_1$ and $P_2$**.

### Required Output:
* Euclidean distance value

### Requirements:
* Calculate distance using the Pythagorean formula: $\sqrt{(x_1 - x_2)^2 + (y_1 - y_2)^2}$
* Utilize geometric functions `SQRT()` and `POW()`
* Format your final answer to display **4 decimal digits**



---

## Problem 4: Weather Observation Station 20 (Median Calculation)

Write a SQL query to **find the median of the Northern Latitudes (LAT_N) from STATION**.

### Required Output:
* Median latitude value

### Requirements:
* Define row indexing using a Common Table Expression (CTE) with the `ROW_NUMBER()` window function
* Capture total row count using `COUNT(*) OVER()`
* Filter the middle positions dynamically (`rn BETWEEN cnt/2 AND cnt/2+1`) and average them to robustly handle both odd and even datasets
* Round your answer to **4 decimal places**



---

## Problem 5: African Cities

Given the `CITY` and `COUNTRY` tables, write a SQL query to **query the names of all cities located on the continent of 'Africa'**.

### Required Output:
* City name

### Requirements:
* Link tables via a relational `JOIN` matching `CITY.CountryCode` with `COUNTRY.Code`
* Make your search case-insensitive by using the `LOWER()` function on the continent filter



---

## Problem 6: Population By Continent

Given the `CITY` and `COUNTRY` tables, write a SQL query to **query the names of all continents and their respective average city populations**.

### Required Output:
* Continent name
* Average population

### Requirements:
* Combine spatial attributes across tables using an inner `JOIN`
* Aggregate records by partitioning them with a `GROUP BY` clause on continent
* Compute average group populations using `AVG()` and round completely down to the nearest integer using `FLOOR()`



---

## Concepts Covered
* Sorting & Selection Limits (`ORDER BY`, `LIMIT`)
* Geometric Coordinates & Coordinate Math (`SQRT`, `POW`)
* Manhattan & Euclidean Formulas
* Common Table Expressions (CTE)
* Advanced Window Functions (`ROW_NUMBER`, `COUNT(*) OVER()`)
* Median Math Implementation
* Relational Table Intersections (`JOIN` / `ON`)
* Case-Insensitive String Matching (`LOWER`)
* Categorical Row Bundling (`GROUP BY`)
* Truncating Numeric Values Downward (`FLOOR`)

---
