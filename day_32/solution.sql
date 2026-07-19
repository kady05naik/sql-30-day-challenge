-- List all customers from the Netherlands.

SELECT * 
FROM customers
WHERE country like 'Netherlands';


-- Show all Electronics products.

SELECT * 
FROM products 
WHERE lower(category) like 'electronics';


-- Find orders placed after 1st February 2025.

SELECT *
FROM orders
WHERE order_date > '2025-02-01';


-- Display distinct regions.

SELECT DISTINCT region
FROM orders;


-- Find customers whose name starts with "A".

SELECT * 
FROM customers
WHERE customer_name like 'A%';


-- Find total sales by region.

SELECT region, sum(sales_amount) AS total_sales
FROM orders
GROUP BY region;


-- Find average order value by payment method.

SELECT payment_method, AVG(sales_amount) AS avg_order
FROM orders
GROUP BY payment_method;


-- Find highest sales amount.

SELECT MAX(sales_amount)
FROM orders;


-- Find total quantity sold per category.

SELECT p.category, sum(o.quantity) AS total_quantity
FROM orders o
JOIN products p
	ON o.product_id=p.product_id
GROUP BY p.category;


-- Which customer placed the highest number of orders?

SELECT customer_id, count(order_id) AS number_of_orders
FROM orders
GROUP BY customer_id
ORDER BY count(order_id) desc
LIMIT 1;


-- Show categories whose revenue exceeds €10,000.

SELECT p.category, SUM(o.sales_amount) AS total_revenue
FROM products p
JOIN  orders o
	ON p.product_id=o.product_id
GROUP BY p.category
HAVING SUM(o.sales_amount)>10000;


-- Show regions having more than 10 orders.

SELECT region, count(order_id) AS total_orders
FROM orders 
GROUP BY region
	HAVING count(order_id)>10;


-- Find customers whose total spending exceeds €5,000.

SELECT customer_id, sum(sales_amount) AS total_spending
FROM orders
GROUP BY customer_id
	HAVING sum(sales_amount)>5000;
    

-- Find products sold more than 100 units.

SELECT p.product_name, sum(o.quantity) AS total_quantity_sold
FROM orders o 
JOIN products p
	ON o.product_id=p.product_id
GROUP BY p.product_name
	HAVING sum(o.quantity)>100;
    
    
-- Find cities having more than five customers.

SELECT city
FROM customers
GROUP BY city
	HAVING count(customer_id)>5;


-- Display every order with customer name.

SELECT o.*, c.customer_name
FROM orders o 
JOIN customers c 
	ON o.customer_id=c.customer_id;


-- Display every order with product category.

SELECT o.*, p.category
FROM orders o 
JOIN products p
	ON o.product_id=p.product_id;
    

-- Find customers who never placed any order.

SELECT c.*
FROM customers c
LEFT JOIN orders o
ON c.customer_id=o.customer_id
	WHERE o.order_id IS NULL;
    
    
-- Find products that were never sold.

SELECT p.*
FROM products p
LEFT JOIN orders o
	ON p.product_id=o.product_id
WHERE o.order_id is NULL;


-- For each region, calculate:
-- Total Revenue
-- Total Orders
-- Average Order Value
-- Return only regions where:
-- Revenue > €50,000
-- Average Order Value > €500
-- Sort by revenue descending.

SELECT region, sum(sales_amount) AS revenue , count(order_id) AS number_of_orders, avg(sales_amount) As avg_revenue
FROM orders
GROUP BY region
	HAVING avg(sales_amount)>500 and
		   sum(sales_amount)>50000
ORDER BY sum(sales_amount) desc;


