# SQL Practice Problems – Student & Scholarship Tables

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

## Problem 1: Students Count per Department

Write a SQL query to **fetch the number of students in each department** and display the result in **descending order of student count**.

Expected Output:
- `dept`
- `total_students`

---

## Problem 2: Unique Departments with Length

Write a SQL query to:
- Fetch **unique departments** from the Student table
- Display the **length of each department name**

Expected Output:
- `dept`
- `dept_length`

---

## Problem 3: Students with Scholarship Details

Write a SQL query to:
- List **all students**
- Display their **scholarship amount if available**
- If a student has not received a scholarship, show **NULL**

Expected Output:
- Student details
- Scholarship amount (if exists)

Hint:
- Use `LEFT JOIN`

---

## Problem 4: Top N Students by GPA

Write a SQL query to:
- Fetch the **top 5 students based on highest GPA**
- Sort the result in **descending order of GPA**

Expected Output:
- `id`
- `fname`
- `lname`
- `gpa`

---

## Problem 5: Students with Same GPA (Important)

Write a SQL query to:
- Fetch the list of students who have **duplicate GPA values**

Expected Output:
- All columns of students having same GPA

Hint:
- Use `GROUP BY` and `HAVING`

---

## Notes

- Use aggregate functions like `COUNT()`
- Use filtering with `HAVING`
- Use joins (`LEFT JOIN`) for combining tables
- Use sorting (`ORDER BY`) and limiting (`LIMIT`)