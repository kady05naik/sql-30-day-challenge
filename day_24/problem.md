# SQL Practice Problems – Student & Scholarship Tables (Advanced)

Assume we have the following tables:

## Student Table

| Column Name | Description |
|-------------|------------|
| id | Student ID |
| fname | First Name |
| lname | Last Name |
| gpa | Grade Point Average |
| enrollment_date | Enrollment Date |
| dept | Department |

## Scholarship Table

| Column Name | Description |
|-------------|------------|
| student_id | Student ID |
| s_amt | Scholarship Amount |
| s_date | Scholarship Date |

---

## Problem 1: Second Highest GPA

Write an SQL query to **find the second highest GPA from the Student table**.

### Requirements:
- The solution should **handle duplicate GPA values correctly**
- Use a **window function approach (recommended)**

Hint:
- Use `DENSE_RANK()`

---

## Problem 2: Duplicate a Row in Output

Write an SQL query to **display the same row twice in the result set**.

Hint:
- Use set operators

---

## Problem 3: Students Without Scholarship

Write an SQL query to **fetch the IDs of students who have not received any scholarship**.

### Requirements:
- Handle NULL values properly

Hint:
- Use `LEFT JOIN` or `NOT IN`

---

## Problem 4: Departments with Less Than 4 Students

Write an SQL query to **find departments that have fewer than 4 students**.

Hint:
- Use `GROUP BY` and `HAVING`

---

## Problem 5: Last Record from Table

Write an SQL query to **fetch the last record from the Student table**.

Hint:
- Use sorting

---

## Problem 6: First Record from Table

Write an SQL query to **fetch the first record from the Student table**.

Hint:
- Use sorting

---

## Problem 7: Last 5 Records from Table

Write an SQL query to **fetch the last five records from the Student table**.

Hint:
- Use `ORDER BY` and `LIMIT`

---

## Notes

- Use **window functions** for ranking problems
- Use **JOINs** for relational queries
- Use **GROUP BY + HAVING** for aggregation filtering
- Use **ORDER BY + LIMIT** for top/bottom records