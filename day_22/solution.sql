-- Write an SQL query to fetch the no. of Students for each DEPT in the descending order.

SELECT
	dept,
    COUNT(id)
FROM student
GROUP BY dept
ORDER BY COUNT(id) desc;
	


-- Write a SQL query that fetches unique DEPT from Student table and print its length

SELECT 
	DISTINCT dept,
    LENGTH(dept)
FROM student;



-- List all students and their scholarship amounts if they have received any. If a student has not received a scholarship, display NULL for the scholarship details.

SELECT 
	s.id,
    s.fname,
    s.lname,
    s.gpa,
    s.enrollment_date,
    s.dept,
    sch.s_amt
FROM Student s 
LEFT JOIN scholarship sch
	ON s.id=sch.student_id;

	
	
-- Write an SQL query to show the top n (say 5) records of Student table order by descending GPA.

SELECT 
	id,
    fname,
    lname,
    gpa
FROM student
ORDER BY gpa desc
LIMIT 5;



-- Write an SQL query to fetch the list of Students with the same GPA. (IMP)

SELECT 
	*
FROM student
WHERE GPA IN(
	SELECT 
		gpa
	FROM student
	GROUP BY gpa
    HAVING COUNT(gpa)>1
);