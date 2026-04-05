-- Write a SQL query to find employees who earn the top three salaries in each of the department.

SELECT 
	id,
	name,
	salary
FROM (
	SELECT 
		id,
		name,
		salary,
		DENSE_RANK() OVER(PARTITION BY departmentid ORDER BY salary DESC) AS rnk
	FROM 
		employee
)t 
WHERE rnk<=3;




-- Write a SQL query to delete all duplicate email entries in a table named Person, keeping only unique emails based on its smallest Id.
WITH CTE AS
 (
	SELECT 
		id,
		email,
		ROW_NUMBER() OVER(PARTITION BY email ORDER BY id ) AS rnum
	FROM 
		Person
)
DELETE FROM person
WHERE id IN(SELECT id FROM CTE WHERE rnum>1);


DELETE p1
FROM person p1
JOIN person p2
	ON p1.email=p2.email
WHERE p1.id>p2.id;




-- Write an SQL query to find all dates' id with higher temperature compared to its previous dates (yesterday).

SELECT w1.id
FROM weather w1
JOIN weather w2
	ON DATEDIFF(day, w2.recorddate,w2.recorddate)=1
	AND w1.temperature > w2.temperature;




-- Write an SQL query to report the first name, last name, city, and state of each person in the Person table. If the address of a personId is not present in the Address table, report null instead.

SELECT 
    p.firstname, 
    p.lastname,
    a.city,
    a.state
FROM  address a
RIGHT JOIN person p 
	ON a.personid=p.personid;



-- Write a SQL query to find the names of Employees who have not been assigned to any project.

SELECT 
	e.name
FROM employee e
LEFT JOIN project p
	ON e.employee_id=p.employee_id
WHERE project_id IS NULL;