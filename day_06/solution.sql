-- Find gross domestic product (GDP) per capita by region in 2010.
SELECT 
    name, 
    region, 
    gdp_percapita
FROM countries AS c
LEFT JOIN economies AS e
    ON c.code=e.code
WHERE e.year=2010;


-- Select region, and average gdp_percapita as avg_gdp
SELECT 
    c.region,
    AVG(e.gdp_percapita) AS avg_gdp
FROM countries AS c
LEFT JOIN economies AS e
USING(code)
WHERE year = 2010
GROUP BY c.region;


-- Order the result set by the average GDP per capita from highest to lowest. Return only the first 10 records in your result
SELECT 
	region, 
	AVG(gdp_percapita) AS avg_gdp
FROM countries AS c
LEFT JOIN economies AS e
	USING(code)
WHERE year = 2010
GROUP BY region
ORDER BY avg_gdp DESC
LIMIT 10;


-- Find country, code, region, basic_unit where region is North American region or records where the name of the country is missing(apply Full Join).
SELECT 
	name AS country, 
	code, 
	region, 
	basic_unit
FROM countries
FULL JOIN currencies 
USING (code)
WHERE region='North America' 
	OR name IS NULL
ORDER BY region;


-- Find the avg salary group by department_name
SELECT 
	department_name, 
	AVG(salary) AS avg_sal
FROM employee e
JOIN department d
	ON e.department_id=d.department_id
GROUP BY department_name;
 
 
-- Find employee details who have the same department_id
SELECT 
	e.employee_id, 
	e.ename, 
	e.department_id, 
	e.salary, 
	e.join_date, 
	e.manager_id, 
	e.job_title
FROM employee e
JOIN employee a
	ON e.department_id=a.department_id
WHERE e.employee_id<>a.employee_id
ORDER BY department_id;


 -- Find employee details along with the manager name
SELECT 
	e.employee_id, 
	e.ename, 
	e.department_id, 
	e.salary, 
	e.join_date, 
	e.job_title, 
	e.manager_id, 
	m.ename AS manager_name
FROM employee e 
	LEFT JOIN employee m
ON e.manager_id=m.employee_id;


-- Find all employees who haven’t worked on any project 
SELECT 
	employee_id,
	ename
FROM employee
WHERE employee_id NOT IN
(
	SELECT employee_id FROM project
);


-- Find out the employee name and corresponding department name of the employee
SELECT 
	ename, 
	department_name
FROM employee e 
JOIN department d
	ON e.department_id=d.department_id
ORDER BY ename;