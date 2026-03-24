-- Identify the single top-selling pizza category using your knowledge of NATURAL JOIN.

SELECT
    pt.category,
    SUM(p.price * od.quantity) AS total_revenue
FROM order_details AS od
NATURAL JOIN pizzas AS p
NATURAL JOIN pizza_type AS pt
GROUP BY pt.category
ORDER BY total_revenue DESC
LIMIT 1;



-- Calculate the total revenue using the price column from the pizzas table and the quantity column of the order_details table, respectively.
-- Use an appropriate JOIN to include all records from the pizzas table.

SELECT 
    COUNT(o.order_id) AS total_orders,
    AVG(p.price) AS average_price,
    SUM(p.price*od.quantity) AS total_revenue	
FROM orders AS o
LEFT JOIN order_details AS od
ON o.order_id = od.order_id
RIGHT JOIN pizzas AS p
ON od.pizza_id = p.pizza_id;



-- Select pizza name from pizza_type. Perform a NATURAL JOIN with the pizza_type table.

SELECT COUNT(o.order_id) AS total_orders,
    AVG(p.price) AS average_price,
    SUM(p.price * od.quantity) AS total_revenue,
	pt.name AS pizza_name
FROM orders AS o
LEFT JOIN order_details AS od
ON o.order_id = od.order_id
RIGHT JOIN pizzas p
ON od.pizza_id = p.pizza_id
NATURAL JOIN pizza_type AS pt
GROUP BY 
    pt.name, 
    pt.category
ORDER BY 
    total_revenue desc, 
    total_orders desc;
	
	
	
-- find the pizza types ordered less frequently than the average for all types.

SELECT pt.name,
    pt.category,
    SUM(od.quantity) AS total_orders
FROM pizza_type pt
JOIN pizzas p
    ON pt.pizza_type_id = p.pizza_type_id
JOIN order_details od
    ON p.pizza_id = od.pizza_id
GROUP BY ALL
HAVING SUM(od.quantity) < (
  SELECT AVG(total_quantity) 
  FROM (
    SELECT  SUM(od.quantity) AS total_quantity
    FROM pizzas p
    JOIN order_details od 
    	ON p.pizza_id = od.pizza_id
    GROUP BY p.pizza_id
  ) subquery
);



-- The campaign aims to spotlight their most popular pizza based on total orders. They're also considering introducing a value meal featuring their least expensive pizza.
-- Your task as a consulting data engineer is to identify both these pizzas.

WITH  most_ordered AS (
    SELECT pizza_id, SUM(quantity) AS total_qty 
    FROM order_details GROUP BY pizza_id ORDER BY total_qty DESC
    LIMIT 1
)

, cheapest_pizza AS (
    SELECT pizza_id, price
    FROM pizzas 
    WHERE price = (SELECT MIN(price) FROM pizzas)
    LIMIT 1
)

SELECT pizza_id, 'Most Ordered' AS Description, total_qty AS metric
FROM most_ordered
UNION ALL
SELECT pizza_id, 'Cheapest' AS Description, price AS metric
FROM cheapest_pizza;



