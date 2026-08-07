# problem.md
## SQL Practice Problems – Conditional Logic, Advanced Aggregations, and Geolocation Queries

---

## Problem 1: Weather Observation Station 11

Write a SQL query to **query the list of CITY names from STATION that either do not start with vowels or do not end with vowels**.

### Required Output:
* City

### Requirements:
* Exclude **duplicate entries** from the final answer using `DISTINCT`
* Match strings failing the start vowel condition **OR** the end vowel condition using regular expressions



---

## Problem 2: Population Density Difference

Write a SQL query to **find the difference between the maximum and minimum populations in the CITY table**.

### Required Output:
* Population difference value

### Requirements:
* Isolate the extreme values using aggregate `MAX()` and `MIN()` functions
* Subtract the minimum value from the maximum value


---

## Problem 3: Type of Triangle

Write a SQL query to **identify the type of each record in the TRIANGLES table using its three side lengths (A, B, C)**.

### Required Output:
* Triangle classification string

### Requirements:
* Evaluate conditions sequentially using a `CASE` statement
* Validate if the sides can form a triangle first (`A + B <= C`) to filter **'Not A Triangle'**
* Check for **'Equilateral'**, **'Isosceles'**, and **'Scalene'** patterns based on side equality


---

## Problem 4: The PADS

Write a SQL query to **generate two specific result sets mapping names to professional initials, and counting occupational occurrences**.

### Required Output:
* Concat text rows formatted into a single output list

### Requirements:
* Format strings using `CONCAT()` and extract string characters using `SUBSTRING()`
* Combine both query result sets into a single unified output stream using `UNION`
* Sort the combined results alphabetically



---

## Problem 5: The Blunder

Write a SQL query to **calculate the amount of calculation error between actual average salary and a miscalculated average with all zeros removed**.

### Required Output:
* Integer error value

### Requirements:
* Strip out characters from numerical fields using string `REPLACE()`
* Compute the difference between the two standard `AVG()` outputs
* Round the final result **up** to the next integer using `CEIL()`



---

## Problem 6: Top Earners

Write a SQL query to **find the maximum total earnings for all employees as well as the total number of employees who have maximum earnings**.

### Required Output:
* Maximum earnings
* Employee count

### Requirements:
* Calculate total earnings per employee using multiplication (`months * salary`)
* Filter rows using a subquery that isolates the maximum earnings value (`MAX()`)
* Group the final results to compile the matching head count



---

## Problem 7: Weather Observation Station 2

Write a SQL query to **query the rounded sum of all Northern Latitudes (LAT_N) and Western Longitudes (LONG_W) from STATION**.

### Required Output:
* Rounded latitude sum (`lat`)
* Rounded longitude sum (`lon`)

### Requirements:
* Accumulate values using the aggregate `SUM()` function
* Round both values to a scale of **2 decimal places** using `ROUND()`



---

## Problem 8: Weather Observation Station 13

Write a SQL query to **query the sum of Northern Latitudes (LAT_N) from STATION having values between 38.7880 and 137.2345**.

### Required Output:
* Truncated/rounded sum value

### Requirements:
* Apply multiple boundary constraints in the `WHERE` filter
* Truncate/round the final summary answer to **4 decimal places**



---

## Problem 9: Weather Observation Station 14

Write a SQL query to **query the greatest value of Northern Latitudes (LAT_N) from STATION that is strictly less than 137.2345**.

### Required Output:
* Truncated/rounded maximum value

### Requirements:
* Filter rows strictly below the `137.2345` threshold
* Find the maximum target value using `MAX()` and format to **4 decimal places**



---

## Problem 10: Weather Observation Station 15

Write a SQL query to **query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345**.

### Required Output:
* Longitude value

### Requirements:
* Apply the strict conditional filter boundary to `lat_n`
* Order records by `lat_n DESC` to find the largest value, isolating the row using `LIMIT 1`
* Return the corresponding longitude rounded to **4 decimal places**



---

## Concepts Covered
* Regular Expressions (`REGEXP`)
* Advanced Mathematical Aggregations (`MAX`, `MIN`, `SUM`, `AVG`)
* Conditional Logic (`CASE WHEN ... THEN ... ELSE END`)
* Result Set Stacking (`UNION`)
* String Cleaning and Manipulation (`CONCAT`, `SUBSTRING`, `REPLACE`, `LOWER`)
* Numerical Rounding Controls (`ROUND`, `CEIL`)
* Subqueries in Filtering Conditions (`WHERE ... IN (SELECT...)`)
* Sorting and Limiting Output Records (`ORDER BY`, `LIMIT`)

---
