# SQL Practice Problems – Employee Table

Assume we have an `employee` table with the following columns:

| Column Name | Description |
|-------------|-------------|
| ename       | Employee Name |
| salary      | Employee Salary |
| department  | Employee Department |

---

## Problem 1: Employees Earning More Than Average Salary

Write a SQL query to find the **names, salaries, and departments of employees who earn more than the average salary of all employees**.

Expected Output Columns:
- `ename`
- `salary`
- `department`

---

## Problem 2: Maximum Salary

Write a SQL query to **find the maximum salary from the employee table**.

Expected Output:
- Maximum salary value.

---

## Problem 3: Employee With Maximum Salary

Write a SQL query to **find the name of the employee who has the highest salary**.

Expected Output Columns:
- `ename`
- `salary`

---

## Problem 4: Second Highest Salary

Write a SQL query to **find the second highest salary from the employee table**.

Hint:
- Use sorting and limit operations.

Expected Output:
- Second highest salary value.

---

## Problem 5: Employee With Second Highest Salary

Write a SQL query to **find the name of the employee who has the second highest salary**.

Expected Output Columns:
- `ename`

Hint:
- Order salaries in descending order and skip the highest one.

---

## Notes

- Assume the table name is `employee`.
- Use appropriate SQL functions like:
  - `AVG()`
  - `MAX()`
  - `ORDER BY`
  - `LIMIT`
  - `OFFSET`