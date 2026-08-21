-- 1. Write a solution to find the average selling price for each product. average_price should be rounded to 2 decimal places. If a product does not have any sold units, its average selling price is assumed to be 0.

SELECT 
    p.product_id, 
    ROUND(COALESCE(SUM(p.price*s.units)/SUM(s.units),0),2) AS average_price 
FROM prices p
LEFT JOIN unitssold s
    ON p.product_id = s.product_id 
    AND  s.purchase_date  BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;



-- 2. Write a solution to find the number of times each student attended each exam. Return the result table ordered by student_id and subject_name.

SELECT 
    s.student_id ,
    s.student_name ,
    sub.subject_name,
    COALESCE(COUNT(e.subject_name),0) AS attended_exams
FROM  Students s    
cross JOIN subjects sub 
LEFT JOIN examinations e
    ON e.student_id=s.student_id AND sub.subject_name=e.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;



-- 3. Write a solution to get the names of products that have at least 100 units ordered in February 2020 and their amount.
   -- Return the result table in any order.
   
SELECT 
    p.product_name,
    SUM(o.unit) AS unit    
FROM products p
INNER JOIN orders o
    ON p.product_id=o.product_id
WHERE o.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY p.product_name
HAVING SUM(o.unit)>=100;
