-- Write queries in snowflake

-- Select pizza_type_id, pizza_size, and price from pizzas table

SELECT 
    pizza_type_id,
	pizza_size,
    price
FROM 
    pizzas;
	
	
	
-- Filter the query to count only the pizzas categorized as 'Classic'

SELECT 
    COUNT(*) AS count_all_pizzas
FROM 
    pizza_type
WHERE 
    category='Classic';
	
	

-- Select and convert the order_id column from the orders table to VARCHAR using CAST(), aliasing it to order_id_string.

SELECT 
    cast(order_id AS VARCHAR) AS order_id_string
FROM 
    orders;
	


-- Select the price column from the pizzas table, converting it (using the double colon operators) to NUMBER data type and aliasing as price_dollars

SELECT 
    price, 
    price::NUMBER AS price_dollars
FROM 
    pizzas;
	
	

-- Use an appropriate function to combine the name and category columns.

SELECT 
    concat(name, ' - ', category) AS name_and_category
FROM 
    pizza_type;
	
	

-- Capitalize each word in the pizza_type_id column.

SELECT 
    INITCAP (pizza_type_id) AS capitalized_pizza_id 
FROM 
    pizza_type;
	
	

-- Get information about the orders table.

DESCRIBE TABLE orders;



-- Count the number of records. Extract the day of the week from order_date, aliasing as order_day.

SELECT 
	COUNT(*) AS orders_per_day, 
	EXTRACT(DAYOFWEEK FROM order_date) AS order_day
FROM 
	orders
GROUP BY order_day
ORDER BY orders_per_day DESC;



-- Select the current date and current time using valid date and time functions.

SELECT CURRENT_DATE, CURRENT_TIME;



-- Get the month from the order_date column. Use appropriate Snowflake SQL keywords to group the query results. Arrange your results by revenue in descending sequence.

SELECT 
    EXTRACT(MONTH FROM order_date) AS order_month, 
    p.pizza_size, 
    SUM(p.price * od.quantity) AS revenue
FROM orders o
INNER JOIN order_details od USING(order_id)
INNER JOIN pizzas p USING(pizza_id)
GROUP BY ALL
ORDER BY revenue DESC;