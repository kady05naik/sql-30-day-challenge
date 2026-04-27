# problem.md
## SQL Practice Problems – Joins, Window Functions, Subqueries, Ranking

---

## Problem 1: Top Three Salaries in Each Department

Write a SQL query to **find employees who earn the top three salaries in each department**.

### Required Output:
* Employee ID
* Employee Name
* Salary

### Requirements:
* Return employees whose salary ranks in the **top 3 within their department**
* Handle duplicate salaries correctly — tied salaries should receive the **same rank**
* Use a **window function** with `DENSE_RANK()`
* Use `PARTITION BY` on department

---

## Problem 2: Delete Duplicate Emails

Write a SQL query to **delete all duplicate email entries** in a table named `Person`, keeping only the entry with the **smallest ID** for each email.

### Requirements:
* Remove all duplicate emails, retaining only the row with the **minimum ID**
* Solve using **two approaches**:
  * Using a **CTE** with `ROW_NUMBER()`
  * Using a **self JOIN**

---

## Problem 3: Rising Temperature

Write an SQL query to **find all dates' ID where the temperature was higher than the previous day's temperature**.

### Requirements:
* Compare each day's temperature with the **immediately preceding date**
* Use `DATEDIFF` to match consecutive dates
* Return the **ID** of matching records

---

## Problem 4: Person Address Report

Write an SQL query to **report the first name, last name, city, and state of each person** in the `Person` table.

### Required Output:
* FirstName
* LastName
* City
* State

### Requirements:
* Include **all persons**, even if they do not have an address
* If a person has no address, return **NULL** for city and state
* Use appropriate JOIN

---

## Problem 5: Employees Without a Project

Write a SQL query to **find the names of employees who have not been assigned to any project**.

### Requirements:
* Return the **name** of each unassigned employee
* Use a **LEFT JOIN** between the `Employee` and `Project` tables
* Filter using `NULL` check on the project side

---

## Concepts Covered
* LEFT JOIN
* RIGHT JOIN
* SELF JOIN
* Window Functions
* `DENSE_RANK()`
* `ROW_NUMBER()`
* `PARTITION BY`
* `DATEDIFF`
* Common Table Expressions (CTE)
* DELETE with Subquery / CTE
* NULL Filtering
* Ranking Problems
* Duplicate Record Handling

---