-- Write a SQL query for a report that provides the following information for each person in the Person table, regardless if there is an address for each of those people:
-- FirstName, LastName, City, State

SELECT 
	first_name,
	last_name,
	city,
	state 
FROM person
LEFT JOIN address 
ON person.personid=address.personid;




-- Write the 2nd highest salary from employee table

SELECT salary
FROM (
	SELECT 
		salary,
		DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk
	FROM employee
)
WHERE rnk=2;




-- Write a SQL query to rank scores. If there is a tie between two scores, both should have the same ranking. Note that after a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no "holes" between ranks.

SELECT 
	score,
	DENSE_RANK() OVER(ORDER BY score DESC) AS "Rank"
FROM 
	scores;
	
	
	
	
-- Write an SQL query to find all numbers that appear at least three times consecutively. Return the result table in any order.

SELECT a.num
FROM logs a 
JOIN logs b 
	ON a.id=b.id+1 
	AND a.num=b.num
JOIN logs c 
	ON a.id=c.id+2
	AND a.num=c.num;
	
	
	
	
-- write a SQL query that finds out employees who earn more than their managers. 

SELECT 
	e1.id, 
	e1.name,
	e1.salary
FROM employee e1 
JOIN employee e2
	ON e1.managerid=e2.id
WHERE e1.salary>e2.salary;




-- Write a SQL query to find all duplicate emails in a table named Person.

SELECT 	email
FROM person
GROUP BY email 
HAVING count(email)>1;


WITH CTE AS(
	SELECT 
		email,
		row_number() OVER(PARTITION BY email ORDER BY email ) As rnk
	FROM 
		person
)
SELECT email 
FROM CTE
WHERE rnk>1;




-- Write a SQL query to find all customers who never order anything.

SELECT 
	c.id,
	c.name
FROM customers c
LEFT orders o 
	ON c.id=o.customer_id
	WHERE o.id=NULL;
	

SELECT 
	id, 
	name
FROM customers
WHERE id NOT IN(
	SELECT customer_id
	FROM orders 
);




-- Write a SQL query to find employees who have the highest salary in each of the departments.

WITH CTE AS (
	SELECT 
		e.id,
		e.name,
		e.salary,
		e.departmentid,
		d.name As department_name,
		DENSE_RANK() OVER(PARTITION BY e.department_id ORDER BY e.salary DESC) AS rnk 
	FROM employee e
	JOIN department d 
		ON e.departmentid=d.id
)
SELECT 
	id,
	name,
	salary,
	department_id, 
	department_name
FROM 
	CTE
WHERE rnk=1;