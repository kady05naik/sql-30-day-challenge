-- Write an SQL query to fetch three max GPA from a table 

WITH max_gpa AS(
SELECT 
	DISTINCT gpa, 
    DENSE_RANK() OVER (ORDER BY gpa DESC) AS rnk
FROM 
	student
)
SELECT gpa
FROM max_gpa
WHERE rnk<4;




-- Write an SQL query to fetch three min GPA from a table 

WITH min_gpa AS(
SELECT 
	DISTINCT gpa,
	DENSE_RANK() OVER(ORDER BY gpa ) AS rnk
FROM 
	student
)
SELECT gpa
FROM min_gpa
WHERE rnk<4;
 
	


-- Write an SQL query to fetch DEPTs along with the max GPA in each of these DEPTs.

WITH max_gpa AS(
SELECT
	gpa,
    dept,
    DENSE_RANK() OVER(PARTITION BY dept ORDER BY gpa DESC) AS rnk
FROM
	student
)
SELECT 
	dept, 
	gpa
FROM 
	max_gpa
WHERE
	rnk=1;
	



-- Write an SQL query to fetch the names of Students who has highest GPA.

WITH max_gpa AS(
SELECT
	gpa,
    dept,
    fname,
    DENSE_RANK() OVER(PARTITION BY dept ORDER BY gpa DESC) AS rnk
FROM
	student
)
SELECT 
	dept, 
	gpa,
    fname
FROM 
	max_gpa
WHERE
	rnk=1;




-- Write an SQL query to find the average GPA for each DEPT

SELECT 
	dept,
	AVG(gpa)
FROM student
GROUP BY dept;

SELECT 
	DISTINCT dept,
	gpa
FROM(
	SELECT 
		dept,
		AVG(gpa) OVER (PARTITION BY dept) AS gpa
	FROM
		student
)t;




-- Write an SQL query to find the number of students deptarment wise  who have GPA > 9.0 
    
SELECT 
	dept,
    COUNT(*)
FROM student
WHERE gpa>9.0
GROUP BY dept;
	
    
    
    
-- Write a SQL query to print the FIRST_NAME and LAST_NAME from Student table into single column COMPLETE_NAME

SELECT 
	concat(fname," ", lname) AS full_name
FROM
	student;