-- 1. Write a solution to find the employees who earn more than their managers.

SELECT 
    e.name AS Employee 
FROM employee e
INNER JOIN employee m
    ON e.managerid =m.id 
WHERE e.salary>m.salary;



-- 2. Write a solution to report all the duplicate emails. Note that it's guaranteed that the email field is not NULL.

SELECT 
    email
FROM person
GROUP BY email
HAVING COUNT(*)>1;



-- 3. Write a solution to find all customers who never order anything.

SELECT 
    name AS Customers 
FROM customers 
WHERE id NOT IN(SELECT customerid FROM orders);


SELECT 
    c.name AS Customers 
FROM customers c
LEFT JOIN orders o
    ON c.id=o.customerid  
WHERE o.customerid IS NULL;



-- 4.Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.

WITH cte_dedup AS
(
    SELECT 
        id,
        email,
        ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) As rnum
    FROM 
        person
)
DELETE p
FROM cte_dedup d
JOIN person p
    ON d.id=p.id
WHERE d.rnum>1;



-- 5. Write a solution to find the first login date for each player.

SELECT 
    player_id,
    MIN(event_date) AS first_login 
FROM activity
GROUP BY player_id;



-- 6. Write a solution to report the name and bonus amount of each employee who satisfies either of the following:
   -- The employee has a bonus less than 1000.
   -- The employee did not get any bonus

SELECT 
    e.name,
    b.bonus
FROM employee e
LEFT JOIN bonus b
    ON e.empId=b.empId
WHERE b.bonus IS NULL
OR b.bonus<1000; 



-- 7. Find the names of the customer that are either:
   -- referred by any customer with id != 2.
   -- not referred by any customer.

SELECT 
    name
FROM customer
WHERE referee_id   <> 2 
OR referee_id  IS NULL;



-- 8. Write a solution to find the customer_number for the customer who has placed the largest number of orders.
-- The test cases are generated so that exactly one customer will have placed more orders than any other customer.

SELECT 
    customer_number
FROM orders
GROUP BY Customer_number
ORDER BY COUNT(DISTINCT order_number) desc
LIMIT 1;



-- 9. A country is big if:
   -- it has an area of at least three million (i.e., 3000000 km2), or
   -- it has a population of at least twenty-five million (i.e., 25000000).
   -- Write a solution to find the name, population, and area of the big countries.
   
SELECT 
    name,
    population,
    area
FROM world
WHERE area>=3000000
OR population>=25000000;



-- 10. Write a solution to find all the classes that have at least five students.
   --  Return the result table in any order.

SELECT 
    class
FROM courses
GROUP BY class
    HAVING COUNT(*)>=5;
