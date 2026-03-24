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
	
	
	
