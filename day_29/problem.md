# problem.md

## SQL Practice Problems – Joins, Window Functions, Subqueries, Ranking

---

## Problem 1: Person Address Report

Write a SQL query for a report that provides the following information for **each person in the Person table**, regardless if there is an address for each of those people.

### Required Output:

* FirstName
* LastName
* City
* State

### Requirements:

* Include all persons even if they do not have an address
* Use appropriate JOIN

---

## Problem 2: Second Highest Salary

Write an SQL query to **find the second highest salary from the Employee table**.

### Requirements:

* Use a **window function**
* Handle duplicate salaries correctly

---

## Problem 3: Rank Scores Without Gaps

Write a SQL query to **rank scores**.

### Requirements:

* If two scores are the same, they should have the same rank
* After a tie, the next rank should be the **next consecutive integer**
* There should be **no gaps in ranking**
* Use a window function

---

## Problem 4: Numbers Appearing Three Times Consecutively

Write an SQL query to **find all numbers that appear at least three times consecutively** in a Logs table.

### Requirements:

* Numbers must appear in **consecutive rows**
* Return the number(s) only

---

## Problem 5: Employees Earning More Than Their Managers

Write a SQL query to **find employees who earn more than their managers**.

### Requirements:

* Return:

  * Employee ID
  * Employee Name
  * Employee Salary
* Use self join

---

## Problem 6: Duplicate Emails

Write a SQL query to **find all duplicate emails in a Person table**.

### Requirements:

* Return emails that appear more than once
* Solve using:

  * GROUP BY
  * Window function

---

## Problem 7: Customers Who Never Order

Write a SQL query to **find all customers who never placed an order**.

### Requirements:

* Return:

  * Customer ID
  * Customer Name
* Solve using:

  * LEFT JOIN
  * Subquery

---

## Problem 8: Highest Salary in Each Department

Write a SQL query to **find employees who have the highest salary in each department**.

### Requirements:

* Return:

  * Employee ID
  * Employee Name
  * Salary
  * Department ID
  * Department Name
* Use:

  * JOIN
  * Window Function
  * DENSE_RANK()

---

## Concepts Covered

* LEFT JOIN
* SELF JOIN
* Window Functions
* DENSE_RANK()
* ROW_NUMBER()
* GROUP BY
* HAVING
* Subqueries
* Common Table Expressions (CTE)
* Ranking Problems
* Consecutive Records Problems

---
