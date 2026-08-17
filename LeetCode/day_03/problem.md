# problem.md
## SQL Practice Problems – User Analytics, Self-Comparisons, and Metric Calculations

---

## Problem 1: User Activity for the Past 30 Days I

Write a SQL query to **find the daily active user count for a period of 30 days ending 2019-07-27 inclusively**. A user was active on a given day if they made at least one activity on that day.

### Required Output:
* day (activity_date)
* active_users

### Requirements:
* Filter for valid activity logs by verifying specific action types using `IN`
* Constrain your timeline strictly to a 30-day window (`2019-06-28` to `2019-07-27`) using clear date boundary checks
* Group records by date and count only unique logins using `COUNT(DISTINCT user_id)`

```sql
SELECT 
    activity_date AS day,
    COUNT(DISTINCT user_id) AS active_users
FROM Activity 
WHERE activity_type IN('open_session', 'end_session', 'scroll_down', 'send_message')
  AND (activity_date >= '2019-06-28' AND activity_date <= '2019-07-27')
GROUP BY activity_date;
```

---

## Problem 2: Article Views I

Write a SQL query to **find all the authors that viewed at least one of their own articles**.

### Required Output:
* id (author_id)

### Requirements:
* Match rows where a self-view occurs by evaluating cross-column equality (`author_id = viewer_id`)
* Eliminate multiple row duplicates using the `DISTINCT` operator and sort the final output by ID ascending

```sql
SELECT DISTINCT author_id AS id
FROM views 
WHERE author_id = viewer_id
ORDER BY author_id;
```

---

## Problem 3: Queries Quality and Percentage

Write a SQL query to **find each query_name, its quality, and its poor_query_percentage** rounded to 2 decimal places. 
* *Quality* is the average of the ratio between query rating and its position.
* *Poor query percentage* is the percentage of all queries with a rating strictly less than 3.

### Required Output:
* query_name
* quality
* poor_query_percentage

### Requirements:
* Prevent integer truncation during division by multiplying numeric values by float decimals (`1.0` and `100.0`)
* Perform conditional tallying inside aggregations using a `CASE WHEN` statement combined with `SUM()`
* Round your final summary fractions to **2 decimal places** using the `ROUND()` function

```sql
SELECT
    query_name,
    ROUND(AVG(rating * 1.0 / position), 2) AS quality,
    ROUND(
        SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS poor_query_percentage
FROM Queries
GROUP BY query_name;
```

---

## Concepts Covered
* Distinct Aggregations (`COUNT DISTINCT`)
* Fixed Timeline Boundaries (`WHERE date >= ...`)
* In-Table Row Comparisons (`column_a = column_b`)
* Safe Decimal Precision Conversions (`* 1.0`)
* Conditional Metric Accumulation (`SUM(CASE WHEN...)`)
* Positional Target Rounding (`ROUND(..., 2)`)

---
