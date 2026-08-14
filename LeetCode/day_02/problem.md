# problem.md
## SQL Practice Problems – Subquery Exclusions, Conditional Updates, and Grouped Boundary Filters

---

## Problem 1: Sales Person

Write a SQL query to **find the names of all the salespersons who did not have any orders related to the company named 'RED'**.

### Required Output:
* name

### Requirements:
* Use a nested subquery to find all `sales_id` records associated with company name `'RED'` via an `INNER JOIN`
* Filter the outer query using `NOT IN` to exclude those salespersons from the final output

```sql
SELECT
    name
FROM salesperson
WHERE sales_id NOT IN 
(
    SELECT 
        o.sales_id 
    FROM orders o
    INNER JOIN company c
        ON o.com_id = c.com_id 
    WHERE c.name = 'RED'
);
```

---

## Problem 2: Triangle Judgement

Write a SQL query to **report for every three line segments whether they can form a triangle**.

### Required Output:
* x
* y
* z
* triangle ('Yes' or 'No')

### Requirements:
* Evaluate the triangle inequality theorem: the sum of any two sides must be strictly greater than the remaining side
* Implement this conditional test across columns using a inline `CASE WHEN` statement

```sql
SELECT 
    x,
    y,
    z,
    CASE
        WHEN x+y>z AND y+z>x AND z+x>y THEN 'Yes' ELSE 'No'
    END AS triangle
FROM triangle;
```

---

## Problem 3: Biggest Single Number

Write a SQL query to **find the largest single number from the MyNumbers table. If there is no single number, report NULL**.

### Required Output:
* num

### Requirements:
* Isolate numbers that appear exactly once using a nested `GROUP BY` and `HAVING COUNT(*) = 1` filter
* Use the aggregate `MAX()` function on the outer layer to return the largest value, which inherently handles empty sets by returning `NULL`

```sql
SELECT MAX(num) AS num
FROM mynumbers
WHERE num IN (
    SELECT num 
    FROM mynumbers
    GROUP BY num
    HAVING COUNT(*) = 1
);
```

---

## Problem 4: Not Boring Movies

Write a SQL query to **report the movies with an odd-numbered ID and a description that is not "boring"**.

### Required Output:
* id
* movie
* description
* rating

### Requirements:
* Use the modulo operator (`% 2 <> 0`) to identify odd-numbered primary IDs
* Apply a string exclusion condition (`!= 'boring'`) and sort the output by `rating DESC`

```sql
SELECT 
    id,
    movie,
    description,
    rating
FROM cinema
WHERE id % 2 <> 0 
  AND description != 'boring'
ORDER BY rating DESC;    
```

---

## Problem 5: Swap Salary

Write a SQL query to **swap all 'f' and 'm' values with a single update statement and no intermediate temporary tables**.

### Required Output:
* *None (In-place table mutation statement)*

### Requirements:
* Execute an in-place column update using the `UPDATE` clause
* Dynamically toggle data values using a `CASE` expression directly within the `SET` statement

```sql
UPDATE salary 
SET sex =
    (CASE 
        WHEN sex = 'f' THEN 'm' ELSE 'f'
    END);
```

---

## Problem 6: Actors and Directors Who Cooperated At Least Three Times

Write a SQL query to **find all the pairs (actor_id, director_id) where the actor has cooperated with the director at least three times**.

### Required Output:
* actor_id
* director_id

### Requirements:
* Group records by a composite key combining both `actor_id` and `director_id`
* Count unique occurrences using `HAVING COUNT(DISTINCT timestamp) >= 3`

```sql
SELECT actor_id, director_id
FROM actordirector
GROUP BY actor_id, director_id
HAVING COUNT(DISTINCT timestamp) >= 3;
```

---

## Problem 7: Product Sales Analysis I

Write a SQL query to **report the product_name, year, and price for each sale_id in the Sales table**.

### Required Output:
* product_name
* year
* price

### Requirements:
* Pull descriptive names into your transactional log using an `INNER JOIN` matching on `product_id`

```sql
SELECT 
    p.product_name,
    s.year,
    s.price
FROM sales s 
INNER JOIN product p 
    ON s.product_id = p.product_id;
```

---

## Problem 8: Project Employees I

Write a SQL query that **reports the average experience years of all the employees for each project, rounded to 2 digits**.

### Required Output:
* project_id
* average_years

### Requirements:
* Relate tables using an `INNER JOIN` connecting rows on `employee_id`
* Form target collection buckets using `GROUP BY project_id` and calculate values via `ROUND(AVG(...), 2)`

```sql
SELECT 
    p.project_id,
    ROUND(AVG(e.experience_years), 2) AS average_years 
FROM project p 
INNER JOIN employee e
    ON p.employee_id = e.employee_id
GROUP BY p.project_id;
```

---

## Problem 9: Sales Analysis III

Write a SQL query to **report the products that were only sold in the first quarter of 2019 (between 2019-01-01 and 2019-03-31 inclusive)**.

### Required Output:
* product_id
* product_name

### Requirements:
* Consolidate transactional rows on product attributes using a unified `GROUP BY` clause
* Ensure strict range inclusion by checking that the absolute minimum and maximum sale dates fall inside the Q1 target window via `HAVING` expressions

```sql
SELECT 
    p.product_id,
    p.product_name
FROM product p
INNER JOIN sales s
    ON p.product_id = s.product_id
GROUP BY p.product_id, p.product_name
HAVING MIN(s.sale_date) >= '2019-01-01' 
   AND MAX(s.sale_date) <= '2019-03-31';
```

---

## Concepts Covered
* Subquery Exclusion Filters (`NOT IN`)
* Line Segment Matrix Calculations (`CASE WHEN`)
* Extreme Boundary Identification on Subsets (`MAX`, `MIN`)
* Arithmetic Operations on Index Records (`%`)
* In-place Mutation Updates (`UPDATE` with `SET`)
* Multi-Column Category Sorting (`GROUP BY` with composite parameters)
* Relational Intersections (`INNER JOIN`)
* Aggregate Metric Precision Formatting (`ROUND`)
* Group Timeline Constraint Filters (`HAVING MIN/MAX`)

---
