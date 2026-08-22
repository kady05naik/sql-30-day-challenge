# problem.md
## SQL Practice Problems – Unmatched Record Joins, Multi-Key Sorting, and String Aggregations

---

## Problem 1: Replace Employee ID With The Unique Identifier

Write a SQL query to **show the unique ID of each user**. If a user does not have a unique ID, replace it and just show NULL.

### Required Output:
* unique_id
* name

### Requirements:
* Include **all employees** from the base table regardless of whether they possess a matching credentials record
* Apply a relational `LEFT JOIN` on the primary identifier to safely preserve missing links as **NULL** values

```sql
SELECT 
    u.unique_id,
    e.name     
FROM employees e
LEFT JOIN employeeUNI u
    ON e.id = u.id;
```

---

## Problem 2: Top Travellers

Write a SQL query to **report the total distance traveled by each user**.

### Required Output:
* name
* travelled_distance

### Requirements:
* Aggregate individual trip records using a `GROUP BY` statement centered on the user's name
* Use `COALESCE` to default users with zero recorded trips safely to a distance of **0**
* Sort the result set primarily by `travelled_distance` in **descending order**, with a secondary alphabetical sort on `name` in **ascending order**

```sql
SELECT 
    u.name,
    COALESCE(SUM(r.distance),0) AS travelled_distance
FROM users u
LEFT JOIN rides r
    ON u.id = r.user_id
GROUP BY u.name
ORDER BY COALESCE(SUM(distance),0) DESC, u.name;
```

---

## Problem 3: Group Sold Products By The Date

Write a SQL query to **find for each date the number of different products sold and their names**.

### Required Output:
* sell_date
* num_sold
* products

### Requirements:
* Group sales information tightly around calendar dates using a `GROUP BY` expression
* Tally only the unique product titles processed per day using `COUNT(DISTINCT product)`
* Flatten and string-concatenate the distinct daily product values lexicographically using `GROUP_CONCAT(DISTINCT ... ORDER BY ...)`
* Order the final result log sequentially by the transaction date

```sql
SELECT 
    sell_date,
    COUNT(DISTINCT product) AS num_sold,
    GROUP_CONCAT(DISTINCT product ORDER BY product) AS products 
FROM Activities
GROUP BY sell_date;
```

---

## Concepts Covered
* Preserving Master Rows via Relational Filters (`LEFT JOIN`)
* Fallback Defaults for Absent Metrics (`COALESCE`)
* Multi-Level Sorting Hierarchies (`ORDER BY DESC, ASC`)
* Distinct Accumulators (`COUNT DISTINCT`)
* Row-to-String Aggregations (`GROUP_CONCAT`)
* Inline Element Sorting within Aggregates (`ORDER BY` inside functions)

---
