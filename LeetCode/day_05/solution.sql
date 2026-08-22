-- 1. Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null.

SELECT 
	u.unique_id,
    	e.name     
FROM employees e
LEFT JOIN employeeUNI u
	ON e.id=u.id;



-- 2. Write a solution to report the distance traveled by each user.
--    Return the result table ordered by travelled_distance in descending order, if two or more users traveled the same distance, order them by their name in ascending order.

SELECT 
	u.name,
	COALESCE(SUM(r.distance),0) AS travelled_distance
FROM users u
LEFT JOIN rides r
	ON u.id=r.user_id
GROUP BY u.name
ORDER BY COALESCE(SUM(distance),0) DESC, u.name;



-- 3. Write a solution to find for each date the number of different products sold and their names.
	-- The sold products names for each date should be sorted lexicographically.
	-- Return the result table ordered by sell_date.

SELECT 
    sell_date ,
    COUNT(DISTINCT product) AS num_sold,
    GROUP_CONCAT(DISTINCT product ORDER BY product) AS products 
FROM Activities
GROUP BY sell_date ;

