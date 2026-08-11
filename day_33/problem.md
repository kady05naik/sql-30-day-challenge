# problem.md
## SQL Practice Problems – Advanced Joins, Deduplication, Window Functions, and Top-N Ranking

---

## Problem 1: Combine Two Tables

Write an SQL query to **report the first name, last name, city, and state of each person in the Person table**.

### Required Output:
* Person ID
* Last Name
* City
* State

### Requirements:
* Include **all persons**, even if they do not have an address mapping
* If the address of a `personId` is missing from the `Address` table, report **NULL** for city and state
* Apply a relational `LEFT JOIN` on the shared `personId` field

```sql
SELECT 
    p.personId,
    p.lastName,
    a.city,
    a.state 
FROM person p
LEFT JOIN address a
    ON p.personId = a.personId;
```

---

## Problem 2: Second Highest Salary

Write an SQL query to **get the second highest salary among all employees in the Employee table**.

### Required Output:
* Salary

### Requirements:
* Handle identical tied salaries cleanly by utilizing the `DENSE_RANK()` window function
* Wrap the ranking logic inside a subquery and filter for index rank position **2**

```sql
SELECT 
    e.salary
FROM (
    SELECT 
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM employee 
) e
WHERE e.rnk = 2;
```

---

## Problem 3: Department Highest Salary (Window Function Approach)

Write an SQL query to **find employees who have the highest salary in each of the departments using window logic**.

### Required Output:
* Employee Name
* Department Name
* Maximum Salary

### Requirements:
* Link the `employee` records with the corresponding `department` data using an inner `JOIN`
* Compute the maximum salary dynamically across department partitions via `MAX() OVER(PARTITION BY ...)`

```sql
SELECT 
    e.name,
    d.name,
    MAX(e.salary) OVER(PARTITION BY d.name) AS max_salary
FROM employee e
JOIN department d
    ON e.departmentid = d.id;
```

---

## Problem 4: Department Highest Salary (Group By Approach)

Write a SQL query to **find the maximum salary and corresponding department name from each department**.

### Required Output:
* Department Name
* Maximum Salary

### Requirements:
* Group your relational entries together by department name using `GROUP BY`
* Pull the largest salary metric out of each distinct group using the aggregate `MAX()` function

```sql
SELECT 
    d.name,
    MAX(e.salary) AS max_salary
FROM employee e
JOIN department d
    ON e.departmentid = d.id
GROUP BY d.name; 
```

---

## Problem 5: Top 3 Salaries Overall

Write a SQL query to **get the top 3 unique salaries from the employee table**.

### Required Output:
* Salary

### Requirements:
* Deduplicate identical dollar values using the `DISTINCT` keyword
* Sort values from largest to smallest and use `LIMIT 3` to capture the top results

```sql
SELECT DISTINCT salary 
FROM employee
ORDER BY salary DESC
LIMIT 3;
```

---

## Problem 6: Unique Emails with Smallest ID

Write an SQL query to **retrieve each unique email along with its respective smallest ID using a group-by condition**.

### Required Output:
* Minimum ID
* Email

### Requirements:
* Condense multiple repeating email logs down into unique lines using `GROUP BY`
* Isolate the absolute oldest record pointer within each group bucket using `MIN(id)`

```sql
SELECT 
    MIN(id),
    email
FROM Person 
GROUP BY email;
```

---

## Problem 7: Identify Duplicate Emails

Write an SQL query to **find all the duplicate emails present in the Person table**.

### Required Output:
* Email

### Requirements:
* Cluster records together by their text contents using `GROUP BY`
* Filter grouped aggregations using `HAVING COUNT(*) > 1` to find values repeating more than once

```sql
SELECT 
    email
FROM person
GROUP BY email
HAVING COUNT(*) > 1;
```

---

## Problem 8: Delete Duplicate Emails

Write an SQL query to **delete all duplicate email entries, keeping only the record with the smallest ID**.

### Required Output:
* *None (In-place mutation table delete optimization)*

### Requirements:
* Solve using **two alternative approaches**:
  1. A structured **CTE approach** using `ROW_NUMBER() OVER(PARTITION BY ...)` to match target rows above rank index 1.
  2. A highly performant **self-JOIN configuration** linking the table on matching email string addresses where `p1.id < p2.id`.

```sql
-- Approach 1: Utilizing CTE & Row Numbers
WITH cte_del AS (
    SELECT 
        id,
        email,
        ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) AS rnk
    FROM person
)
DELETE person
FROM cte_del
JOIN person 
    ON cte_del.id = person.id
WHERE cte_del.rnk > 1;

-- Approach 2: Utilizing a direct Self-JOIN
DELETE p2
FROM person p1
JOIN person p2
    ON p1.email = p2.email
   AND p1.id < p2.id;
```

---

## Problem 9: Find Completely Duplicate Rows

Write a SQL query to **identify and list rows that contain completely identical column patterns across the employee table**.

### Required Output:
* ID
* Name
* Email

### Requirements:
* Bundle rows sharing matching column metrics using index positional ordering notation (`GROUP BY 1,2,3`)
* Use `HAVING COUNT(*) > 1` to filter out non-unique data rows

```sql
SELECT 
    id,
    name,
    email
FROM employee
GROUP BY 1,2,3
HAVING COUNT(*) > 1;
```

---

## Problem 10: Department Top Three Salaries

Write an SQL query to **find the employees who earn the top three salaries department-wise**.

### Required Output:
* Employee Name
* Salary
* Department Name

### Requirements:
* Compute ranking scales partitioned inside each department boundaries using a CTE with `DENSE_RANK()`
* Intersect the indexed dataset with the `department` details table using an inner `JOIN`
* Filter out rows where the window placement value is strictly **less than or equal to 3**

```sql
WITH cte_top3_salaries AS (
    SELECT 
        departmentid,
        name,
        salary,
        DENSE_RANK() OVER(PARTITION BY departmentid ORDER BY salary DESC) AS rnk
    FROM employee
)
SELECT 
    t.name,
    t.salary,
    d.name
FROM cte_top3_salaries t
INNER JOIN department d
    ON t.departmentid = d.id
WHERE t.rnk <= 3;
```

---

## Concepts Covered
* Unconditional Matrix Inclusion (`LEFT JOIN` / `NULL` Generation)
* Dense Ranking vs Positional Identification (`DENSE_RANK`, `ROW_NUMBER`)
* Subquery Data Extractions
* Window Function Segmentations (`PARTITION BY`)
* Positional Column Index Groupings (`GROUP BY 1,2,3`)
* Post-Aggregation Row Filters (`HAVING COUNT`)
* Destructive Table Record Cleaning Operations (`DELETE` with self-JOIN)
* Top-N Evaluation Problems

---
