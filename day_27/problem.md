# problem.md

## SQL Practice – Employee Table (Duplicates, Ranking, Window Functions)

Assume we have an **employee** table with the following columns:

* eid (Employee ID)
* ename (Employee Name)
* managerid
* dept
* sal (Salary)

---

## Problem 1: Find Duplicate Records Except EmployeeID

Write an SQL query to **find duplicate employee records based on all columns except EmployeeID**.

### Requirements:

* Ignore `eid`
* Identify duplicates based on:

  * ename
  * managerid
  * dept
  * sal

---

## Problem 2: Count Duplicate Records Except EmployeeID

Write an SQL query to **count duplicate employee records grouped by employee details except EmployeeID**.

### Requirements:

* Return employee details along with duplicate count
* Only include duplicate records

---

## Problem 3: Find Only Unique Records Except EmployeeID

Write an SQL query to **find records that are unique when ignoring EmployeeID**.

### Requirements:

* Records should appear only once based on:

  * ename
  * managerid
  * dept
  * sal

---

## Problem 4: Remove Duplicate Records from Employee Table

Write an SQL query to **delete duplicate records from the employee table**.

### Requirements:

* Keep one record
* Delete remaining duplicate rows
* Duplicates are based on:

  * ename
  * managerid
  * dept
  * sal
* Use EmployeeID to identify which row to delete

---

## Problem 5: Find Bottom 2 Salary Employee Details

Write an SQL query to **find employees who have the lowest two salary values**.

### Requirements:

* Use window function
* Handle duplicate salary values correctly

---

## Problem 6: Find Top 2 Salary Employee Details

Write an SQL query to **find employees who have the highest two salary values**.

### Requirements:

* Use ranking function
* Handle duplicate salaries properly

---

## Problem 7: Find Lowest Salary Employee in Each Department

Write an SQL query to **find employees who have the lowest salary in each department**.

### Requirements:

* Department-wise ranking
* Return full employee details

---

## Problem 8: Find Second Highest Salary Department Wise

Write an SQL query to **find employees who have the second highest salary in each department**.

### Requirements:

* Use window function
* Partition by department

---

## Problem 9: Find Sum of Salary Department Wise

Write an SQL query to **calculate the total salary for each department**.

### Requirements:

* Department-wise salary sum
* Use aggregation or window function

---

## Concepts Covered

* GROUP BY
* HAVING
* Self Join
* DELETE with JOIN
* Window Functions
* DENSE_RANK()
* PARTITION BY
* Aggregate Functions
* Duplicate Handling
