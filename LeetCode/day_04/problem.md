# problem.md
## SQL Practice Problems – Complex Joins, Missing Value Handling, and Date Window Filtering

---

## Problem 1: Average Selling Price

Write a SQL query to **find the average selling price for each product**. If a product does not have any sold units, its average selling price is assumed to be 0.

### Required Output:
* product_id
* average_price

### Requirements:
* Link transactional sales rows to product prices using a `LEFT JOIN` on matching product IDs
* Validate that transaction dates fall correctly within sliding validity timelines using a `BETWEEN` filter condition
* Calculate the weighted price metrics safely by grouping product sets and fallback-protecting zero-sales cases with `COALESCE`
* Format the final summary values to **2 decimal places** using the `ROUND()` function

```sql
SELECT 
    p.product_id, 
    ROUND(COALESCE(SUM(p.price*s.units)/SUM(s.units),0),2) AS average_price 
FROM prices p
LEFT JOIN unitssold s
    ON p.product_id = s.product_id 
    AND s.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;
```

---

## Problem 2: Students and Examinations

Write a SQL query to **find the number of times each student attended each exam**.

### Required Output:
* student_id
* student_name
* subject_name
* attended_exams

### Requirements:
* Generate a complete combinatorial base matrix of every student and every subject using a `CROSS JOIN`
* Map attendance event occurrences into this baseline matrix with a conditional `LEFT JOIN`
* Group results by matching entity attributes to count totals, treating absent logs safely using `COALESCE(COUNT(...), 0)`
* Arrange the final table explicitly using `ORDER BY student_id, subject_name`

```sql
SELECT 
    s.student_id,
    s.student_name,
    sub.subject_name,
    COALESCE(COUNT(e.subject_name),0) AS attended_exams
FROM Students s    
CROSS JOIN subjects sub 
LEFT JOIN examinations e
    ON e.student_id = s.student_id 
    AND sub.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;
```

---

## Problem 3: List the Products Ordered in a Period

Write a SQL query to **get the names of products that have at least 100 units ordered in February 2020 and their total amount**.

### Required Output:
* product_name
* unit

### Requirements:
* Combine lookup names with purchase details using an inner `JOIN` on shared identifiers
* Filter transaction records strictly within the month boundary limits (`2020-02-01` to `2020-02-29`)
* Group sales records together by descriptive names and filter group summaries with a `HAVING SUM(o.unit) >= 100` condition

```sql
SELECT 
    p.product_name,
    SUM(o.unit) AS unit    
FROM products p
INNER JOIN orders o
    ON p.product_id = o.product_id
WHERE o.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY p.product_name
HAVING SUM(o.unit) >= 100;
```

---

## Concepts Covered
* Relational Intersections & Master Matched Pairs (`LEFT JOIN`, `CROSS JOIN`, `INNER JOIN`)
* Date Validity Boundaries & Windows (`BETWEEN ... AND ...`)
* Null Value Value Overrides & Safe Defenses (`COALESCE`)
* Composite Key Multi-Field Rollups (`GROUP BY column_1, column_2`)
* Post-Aggregation Conditional Filters (`HAVING SUM(...) >= x`)
* Strict Positional Multi-Key Sorting (`ORDER BY`)

---
