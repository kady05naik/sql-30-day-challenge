
-- How to find duplicate records except EmployeeID

SELECT 
	ename, 
    managerid, 
    dept, 
    sal
FROM employee
GROUP BY 1,2,3,4
HAVING COUNT(*)>1;

    


-- Count the duplicate record except EmployeeID

SELECT 
	ename, 
    managerid, 
    dept, 
    sal,
    COUNT(*)
FROM employee
GROUP BY 1,2,3,4
HAVING COUNT(*)>1;




-- Find only the uniqure recrod except EmployeeID

SELECT 
	ename, 
    managerid, 
    dept, 
    sal,
    COUNT(*)
FROM employee
GROUP BY 1,2,3,4
HAVING COUNT(*)=1;




-- Remove duplicate records from table

DELETE e1
FROM employee e1
JOIN employee e2
ON e1.ename=e2.ename
WHERE e1.managerid=e2.managerid
	AND e1.dept=e2.dept
    AND e1.sal=e2.sal
    AND e1.eid>e2.eid;




-- Find bottom 2 salary employee details
-- best approach
WITH min_sal AS(
	SELECT 
		*,
        DENSE_RANK() OVER (ORDER BY sal) AS rnk
	FROM 
		employee	
)
SELECT 
	eid, 
    ename, 
    managerid, 
    dept, 
    sal
FROM 
	min_sal
WHERE 
	rnk<=2;




-- Find top 2 salary employee details

SELECT 
	eid, 
    ename, 
    managerid, 
    dept, 
    sal
FROM(
	SELECT 
		*, 
		DENSE_RANK() OVER(ORDER BY sal DESC) AS rnk
	FROM
		employee
)t
WHERE
	rnk<=2;




-- Find lowest salary employee in each department

WITH min_sal AS(
	SELECT 
		*,
		DENSE_RANK() OVER(PARTITION BY dept ORDER BY sal ) AS rnk
	FROM
		employee
)
SELECT 
	eid, 
    ename, 
    managerid, 
    dept, 
    sal
FROM  
	min_sal
WHERE 
	rnk=1;




-- Find the second highest salary department wise

SELECT 
	eid, 
    ename, 
    managerid, 
    dept, 
    sal
FROM(
	SELECT 
		*,
        DENSE_RANK() OVER(PARTITION BY dept ORDER BY sal DESC) AS rnk
	FROM
		employee
)t
WHERE rnk=2;




-- Find the sum of the salary department wise

SELECT 
	DISTINCT dept,
    sum_sal
FROM (
	SELECT
		*,
        SUM(sal) OVER(PARTITION BY dept) AS sum_sal
	FROM
		employee    
)t ;
