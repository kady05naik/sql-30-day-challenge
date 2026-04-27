# Q1: Top 3 Customers by Revenue (Window Function)

WITH revenue AS
(
	SELECT 
	    c.customer_id, 
        SUM(p.amount) AS amount
    FROM payments p 
    JOIN orders o 
		ON p.order_id=o.order_id
	JOIN customers c
		ON o.customer_id=c.customer_id  
	WHERE p.status='success'
	GROUP BY c.customer_id
)
SELECT 
	customer_id,
	amount
FROM (
	SELECT 
		customer_id, 
        amount,
        dense_rank() OVER (ORDER BY amount DESC) AS rnk
	FROM revenue
)t
WHERE rnk<=3;



# Q2: Identify Duplicate Orders (Deduplication Pattern)

WITH duplicate AS
(
	SELECT *,
		ROW_NUMBER() OVER (PARTITION BY customer_id, order_date, status ORDER BY order_id, customer_id) AS rnk
	FROM 
		orders
)
DELETE  o
FROM orders o
JOIN duplicate d
ON d.order_id=o.order_id
WHERE d.rnk>1;



# Q3: Running Revenue per Customer (Cumulative Window)

SELECT 
	c.customer_id, 
    c.name,
    o.order_date,
    SUM(p.amount) OVER(PARTITION BY c.customer_id ORDER BY o.order_date ) AS running_revenue
FROM payments p 
JOIN orders o 
	ON p.order_id=o.order_id
JOIN  customers c
	ON o.customer_id = c.customer_id
WHERE p.status='success';



# Q4: Latest Order per Customer (Very Common)

SELECT 
	customer_id,
    order_id,
    order_date,
    status
FROM(
	SELECT 
		*,
		ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date DESC) as rnk
	FROM orders 
)t
WHERE rnk=1;
    
    
    
# Q5: Customers with No Orders (Anti Join)

SELECT 
	c.customer_id,
    c.name,
    c.city
FROM customers c 
LEFT JOIN orders o
	ON c.customer_id=o.customer_id
WHERE o.customer_id is NULL;



# Q6: Revenue by Category (Multi Join Aggregation)

SELECT 
	p.category,
    SUM(p.price*oi.quantity) AS revenue
FROM products p 
LEFT JOIN order_items oi
	ON p.product_id=oi.product_id
LEFT JOIN orders o
	ON oi.order_id= o.order_id
WHERE o.status='completed'
GROUP BY p.category;



# Q7: Detect Payment Failures Followed by Success

SELECT 	*
FROM payments
ORDER BY status desc;



# Q8: Find Customer Retention (Repeat Buyers)

SELECT 
	customer_id,
    COUNT(order_id)
FROM orders
WHERE status='completed'
GROUP BY customer_id
HAVING COUNT(DISTINCT order_id)>1;