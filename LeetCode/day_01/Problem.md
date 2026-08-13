# problem.md
## SQL Practice Problems – Self-Joins, Anti-Joins, Null Handling, and Subqueries

---

## Problem 1: Employees Earning More Than Their Managers

Write a SQL query to **find the employees who earn more than their managers**.

### Required Output:
* Employee (Employee Name)

### Requirements:
* Link the table to itself using an `INNER JOIN` (Self-JOIN) mapping `employee.managerid` to `manager.id`
* Filter out rows where the employee's salary is strictly **greater than** the manager's salary



---

## Problem 2: Duplicate Emails

Write a SQL query to **report all the duplicate emails**. It is guaranteed that the email field is not NULL.

### Required Output:
* Email

### Requirements:
* Group identical emails together using `GROUP BY`
* Use `HAVING COUNT(*) > 1` to filter out non-duplicate records



---

## Problem 3: Customers Who Never Order

Write a SQL query to **find all customers who never order anything**.

### Required Output:
* Customers (Customer Name)

### Requirements:
* Solve using **two alternative approaches**:
  1. A structured **Subquery approach** checking exclusion via `NOT IN`
  2. A highly performant **Anti-Join approach** using `LEFT JOIN` combined with an `IS NULL` check on the right side




---

## Problem 4: Delete Duplicate Emails

Write a SQL query to **delete all duplicate emails, keeping only one unique email with the smallest ID**.

### Required Output:
* *None (In-place table delete operation)*

### Requirements:
* Use a Common Table Expression (CTE) with the `ROW_NUMBER()` window function to partition by email and order by ID
* Perform a relational `DELETE` statement targeting any record assigned an incremental rank index greater than 1



---

## Problem 5: Game Play Analysis I

Write a SQL query to **find the first login date for each player**.

### Required Output:
* player_id
* first_login

### Requirements:
* Group row events uniformly around the individual player's identifier using `GROUP BY`
* Identify the chronological earliest calendar date using the aggregate `MIN()` function



---

## Problem 6: Employee Bonus

Write a SQL query to **report the name and bonus amount of each employee who has a bonus less than 1,000, or did not get any bonus at all**.

### Required Output:
* name
* bonus

### Requirements:
* Join tables via a relational `LEFT JOIN` on employee pointer maps
* Handle absent/missing bonuses explicitly using an `IS NULL` condition alongside standard numerical bounds testing



---

## Problem 7: Find Customer Referee

Write a SQL query to **find the names of the customers that are either not referred by a customer with an ID of 2, or have no referrer at all**.

### Required Output:
* name

### Requirements:
* Explicitly account for SQL **Three-Valued Logic** (True, False, Unknown)
* Combine the inequality operator (`<>` or `!=`) with an explicit `IS NULL` check to correctly evaluate missing references



---

## Problem 8: Customer Placing the Largest Number of Orders

Write a SQL query to **find the customer number who has placed the largest total volume of orders**.

### Required Output:
* customer_number

### Requirements:
* Group orders together around distinct purchasing customers using `GROUP BY`
* Sort aggregated tallies in descending sequence based on unique invoice volumes (`COUNT(DISTINCT order_number)`)
* Restrict the execution block using `LIMIT 1` to extract the topmost customer reference



---

## Problem 9: Big Countries

Write a SQL query to **find the name, population, and area of countries considered "big"** (area $\ge$ 3,000,000 $\text{km}^2$ or population $\ge$ 25,000,000).

### Required Output:
* name
* population
* area

### Requirements:
* Construct inclusive criteria targeting multiple threshold limits utilizing the logical `OR` condition operator



---

## Problem 10: Classes More Than 5 Students

Write a SQL query to **find all the classes that have at least five enrolled students**.

### Required Output:
* class

### Requirements:
* Separate and sort courses into independent collection subsets using `GROUP BY`
* Filter down aggregated groups against a metric floor constraint using `HAVING COUNT(*) >= 5`



---

## Concepts Covered
* Self-Referencing Relations (`INNER JOIN` on self)
* Group Isolation Constraints (`HAVING` vs `WHERE`)
* Anti-Join Subsetting Strategies (`NOT IN` vs `LEFT JOIN` / `IS NULL`)
* Three-Valued Logic and Null Set Operations (`IS NULL`, Missing Matches)
* Aggregate Extrema Identifications (`MIN`, `COUNT DISTINCT`)
* Selective Row Record Elimination (`DELETE` using CTE configurations)

---
