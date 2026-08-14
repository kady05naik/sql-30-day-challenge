-- 1. Write a solution to find the names of all the salespersons who did not have any orders related to the company with the name "RED".

SELECT
    name
FROM salesperson
WHERE sales_id NOT IN 
(
	SELECT 
		o.sales_id 
	FROM orders o
	INNER JOIN company c
		ON o.com_id=c.com_id 
	WHERE c.name='RED'
);



-- 2. Report for every three line segments whether they can form a triangle.

SELECT 
    x,
    y,
    z,
    CASE
        WHEN x+y>z AND y+z>x AND z+x>y THEN 'Yes' ELSE 'No'
    END triangle
FROM triangle;



-- 3. A single number is a number that appeared only once in the MyNumbers table.
   -- Find the largest single number. If there is no single number, report null.
 
 SELECT  MAX(num) AS num
FROM mynumbers
WHERE num IN (
    SELECT num 
    FROM mynumbers
    GROUP BY num
    HAVING COUNT(*)=1
);



-- 4. Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".
   -- Return the result table ordered by rating in descending order.

SELECT 
    id,
    movie,
    description,
    rating
FROM
    cinema
WHERE id%2 <> 0 
    AND description != 'boring'
ORDER BY rating DESC;    



-- 5. Write a solution to swap all 'f' and 'm' values (i.e., change all 'f' values to 'm' and vice versa) with a single update statement and no intermediate temporary tables.
   -- Note that you must write a single update statement, do not write any select statement for this problem.

UPDATE salary 
SET sex =
    (CASE 
        WHEN sex='f' THEN 'm' ELSE 'f'
    END);
	
	

-- 6. Write a solution to find all the pairs (actor_id, director_id) where the actor has cooperated with the director at least three times

SELECT actor_id,director_id
FROM actordirector
GROUP BY actor_id, director_id
    HAVING COUNT(DISTINCT timestamp)>=3;
	
	
	
-- 7. Write a solution to report the product_name, year, and price for each sale_id in the Sales table.

SELECT 
	p.product_name,
	s.year,
	s.price
FROM 
	sales s 
INNER JOIN 
	product p 
ON 	s.product_id=p.product_id;

	

-- 8. Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.

SELECT 
    p.project_id,
    ROUND(AVG(e.experience_years),2) AS average_years 
FROM project p 
INNER JOIN employee e
    ON p.employee_id=e.employee_id
GROUP BY p.project_id;



-- 9. Write a solution to report the products that were only sold in the first quarter of 2019. That is, between 2019-01-01 and 2019-03-31 inclusive.

SELECT 
    p.product_id,
    p.product_name
FROM product p
INNER JOIN sales s
    ON p.product_id=s.product_id
GROUP BY p.product_id, p.product_name
HAVING MIN(s.sale_date)>='2019-01-01' and MAX(s.sale_date)<='2019-03-31';