-- QUES_1: Write an SQL query to report the first name, last name, city, and state of each person in the Person table. 
-- If the address of a personId is not present in the Address table, report null instead.

SELECT 
	p.personId,
	p.lastName ,
    	a.city ,
    	a.state 
FROM person p
LEFT JOIN address a
	ON p.personId=a.personId;



-- QUES_2: Write SQL query to get the second highest salary among all Employees

SELECT 
	e.salary
FROM (
		SELECT 
			salary,
			DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
		FROM employee 
)e
WHERE e.rnk=2;



-- QUES_3: Write an SQL query to find Employees who have the highest salary in each of the department.

SELECT 
    	e.name,
    	d.name,
	MAX(e.salary) OVER(PARTITION BY d.name) As max_salary
FROM employee e
JOIN department d
	ON e.departmentid=d.id;
    
    
    
-- QUES_4: Write a SQL Query to find Max salary and Department name from each department.

SELECT 
    	d.name,
	MAX(e.salary) As max_salary
FROM employee e
JOIN department d
	ON e.departmentid=d.id
GROUP BY d.name ; 
    


-- QUES_5 : Write a SQL query to get the top 3 salary from the employee

SELECT distinct salary 
FROM employee
ORDER BY salary DESC
LIMIT 3;



-- Ques_6 : Write an SQL query to get one unique email with the smallest id . solve the thing by using group by

SELECT 
	MIN(id),
	email
FROM Person 
GROUP BY email;



-- QUES_7 : Write an SQL query to FIND the duplicate emails. 

SELECT 
	email
FROM 
	person
GROUP BY email
HAVING COUNT(*)>1;
    


-- QUES_8 : Write an SQL query to delete the duplicate emails

WITH cte_del AS(
	SELECT 
		id,
        email,
		ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) AS rnk
	FROM person
)
DELETE person
FROM cte_del
JOIN person 
	ON cte_del.id=person.id
WHERE cte_del.rnk>1;


DELETE p2
FROM person p1
JOIN person p2
	ON p1.email=p2.email
AND p1.id<p2.id;



-- QUES_9 : Write Query to find the duplicate rows.

SELECT 
	id,
    name,
    email
FROM employee
GROUP BY 1,2,3
HAVING COUNT(*)>1;



-- QUES_10 : Write an SQL query to find the Employees who has the Top Three Salaries depatment wise

WITH cte_top3_salaries AS (
	SELECT 
		departmentid,
		name,
        salary,
        DENSE_RANK() OVER(PARTITION BY departmentid ORDER BY salary DESC) AS rnk
	FROM 
		employee
)
SELECT 
	t.name,
	t.salary,
    d.name
FROM cte_top3_salaries t
INNER JOIN department d
	ON t.departmentid=d.id
WHERE t.rnk<=3;
