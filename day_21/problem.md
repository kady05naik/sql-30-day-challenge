# SQL Practice Problems – Student Table

Assume we have a table named **Student** with the following columns:

| Column Name | Description |
|--------------|-------------|
| id | Student ID |
| fname | First Name |
| lname | Last Name |
| gpa | Grade Point Average |
| enrollment_date | Enrollment Date |
| dept | Department |

---

## Problem 1: Unique Departments

Write a SQL query to **fetch unique values of the `dept` column from the Student table**.

Expected Output:
- List of distinct departments.

---

## Problem 2: Unique Departments Without Using Special Functions

Write a SQL query to **fetch unique department values without using the `DISTINCT` function**.

Hint:
- Use `GROUP BY`.

---

## Problem 3: Duplicate Departments

Write a SQL query to **fetch departments that appear more than once in the Student table**.

Expected Output:
- Department name
- Number of occurrences

Hint:
- Use `GROUP BY` and `HAVING`.

---

## Problem 4: First 3 Characters of First Name

Write a SQL query to **print the first 3 characters of the `fname` column from the Student table**.

Example:

| fname | Output |
|------|-------|
| Shivansh | Shi |

---

## Problem 5: Last 2 Characters of First Name

Write a SQL query to **print the last 2 characters of the `fname` column**.

Example:

| fname | Output |
|------|-------|
| Shivansh | sh |

---

## Problem 6: First Name Starting From 3rd Character

Write a SQL query to **print the first name starting from the 3rd character**.

Example:

| fname | Output |
|------|-------|
| Shivansh | ivansh |

---

## Problem 7: Students Whose First Name Starts With 'P'

Write a SQL query to **fetch the details of students whose first name starts with the letter 'P'**.

Hint:
- Use `LIKE`.

---

## Problem 8: Students Whose First Name Ends With 'a'

Write a SQL query to **fetch the details of students whose first name ends with the letter 'a'**.

Hint:
- Use `LIKE`.

---

## Problem 9: Students With GPA Between 9.00 and 9.99

Write a SQL query to **fetch student details where GPA lies between 9.00 and 9.99**.

Hint:
- Use the `BETWEEN` operator.

---

## Problem 10: Count Students in Physics Department

Write a SQL query to **count the number of students belonging to the 'Physics' department**.

Expected Output:
- Total count of students in Physics.

---