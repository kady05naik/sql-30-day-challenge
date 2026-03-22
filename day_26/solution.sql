use practice;

-- How to get unique product from the table without using distinct keywords.

SELECT 	product
FROM product
GROUP BY product;




-- How to get only duplicate prodcut  

SELECT product
FROM product
GROUP BY product
HAVING count(product)>1;




-- How to get the sum of quantities sold for each product,

SELECT
	product,
    SUM(quantity)
FROM product
GROUP BY product;




-- How to get the product and their respective count

SELECT 
	product,
    COUNT(product)
FROM product
GROUP BY product;




-- How do you delete duplicate product

DELETE p1
FROM product p1
JOIN product p2
ON p1.product=p2.product
WHERE p1.id>p2.id
    AND p1.quantity=p2.quantity
    AND p1.color=p2.color;