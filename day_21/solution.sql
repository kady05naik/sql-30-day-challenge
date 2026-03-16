-- Write a SQL query to fetch unique values of DEPT from Student table

SELECT 
	DISTINCT dept
FROM
	Student;



-- Write a SQL query to fetch unique values of DEPT from Student table Without special function

SELECT 
	dept
FROM
	student
GROUP BY 
	dept;



-- Write a SQL query to fetch only duplicate DEPT from Student table

SELECT 
	dept,
    COUNT(*)
FROM 
	student
GROUP BY 
	dept
HAVING 
	COUNT(*)>1;



-- Write a SQL query to print the first 3 characters of FIRST_NAME from Student table.

SELECT 
	SUBSTRING(fname,1,3)
FROM 
	student;



-- Write a SQL query to print the last 2 characters of FIRST_NAME from Student table.

SELECT 
	SUBSTRING(fname,length(fname)-1,length(fname))
FROM
	student;

SELECT 
	RIGHT(fname,2)
FROM 
	student;



-- Write a sql query to print the first name from 3rd character

SELECT 
	SUBSTRING(fname,3)
FROM
	student;

SELECT 
	SUBSTRING(fname, 3, length(fname))
FROM
	student;



-- Write a SQL query to print details of the Students whose FIRST_NAME start with 'p'.

SELECT 
	fname 
FROM 
	student 
WHERE 
	fname LIKE 'P%';



-- Write a SQL query to print details of the Students whose FIRST_NAME end with 'a'.

SELECT 
	fname
FROM 
	student
WHERE 
	fname LIKE '%a';



-- Write an SQL query to print details of the Students whose GPA lies between 9.00 and 9.99. by using between operator

SELECT
	*
FROM
	student
WHERE
	gpa BETWEEN 9.00 AND 9.99;



-- Write an SQL query to fetch the count of Students having DEPT ‘Physics’.

SELECT 
	COUNT(DISTINCT id)
FROM 
	student
WHERE
	dept='Physics';