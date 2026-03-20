-- Write an SQL query to show the second highest GPA from a Student.

-- Best approach is dense_rank()

WITH high_sal AS
(
	SELECT 
		gpa, 
		DENSE_RANK() OVER (ORDER BY gpa desc) AS drnk
    FROM 
		student
)
SELECT gpa
FROM high_sal
WHERE drnk=2;
	
    
SELECT gpa
FROM
	(
		SELECT 
			gpa,
            DENSE_RANK() OVER (ORDER BY gpa DESC) AS drnk
		FROM 
			student
	)CTE
WHERE drnk=2;


SELECT MAX(gpa)
FROM student
WHERE gpa<(
		SELECT MAX(gpa)
        FROM student) ;


SELECT gpa
FROM student
ORDER BY gpa DESC
LIMIT 1 OFFSET 1;	




-- Write an SQL query to show one row twice in results from a table.

SELECT * 
FROM student
UNION ALL
SELECT *
FROM student;




-- Write an SQL query to list STUDENT_ID who does not get Scholarship.

SELECT DISTINCT s.id
FROM student s 
LEFT JOIN scholarship sch
ON s.id=sch.student_id
WHERE sch.student_id is NULL;


SELECT id
FROM student 
WHERE id NOT IN (
	SELECT student_id 
    FROM scholarship
);




-- Write an SQL query to fetch the DEPT that have less than 4 people in it.

SELECT 
	dept
FROM
	student
GROUP BY dept
HAVING COUNT(dept) <4;




-- Write an SQL query to show the last record from a table.

SELECT id
FROM student
ORDER BY id DESC
LIMIT 1;




-- Write an SQL query to fetch the first row of a table.

SELECT	id
FROM student
ORDER BY id ASC
LIMIT 1;




-- Write an SQL query to fetch the last five records from a table.

SELECT *
FROM student
ORDER BY id DESC
LIMIT 5;
