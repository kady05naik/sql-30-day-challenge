# problem.md

## SQL Practice – Pizza Sales Database (Joins, Aggregations, Subqueries, CTE)

Assume we have the following tables:

* orders
* order_details
* pizzas
* pizza_type

---

## Problem 1: Top-Selling Pizza Category Using NATURAL JOIN

Write an SQL query to **identify the single top-selling pizza category**.

### Requirements:

* Use **NATURAL JOIN**
* Calculate total revenue using:

  * price from pizzas table
  * quantity from order_details table
* Group results by category
* Return only the highest revenue category

---

## Problem 2: Total Revenue Using Joins

Write an SQL query to **calculate total revenue using the price column from pizzas and quantity column from order_details**.

### Requirements:

* Include **all records from pizzas table**
* Also calculate:

  * Total number of orders
  * Average pizza price
  * Total revenue
* Use appropriate JOINs

---

## Problem 3: Pizza Name Revenue Summary

Write an SQL query to:

* Calculate total orders
* Calculate average price
* Calculate total revenue
* Display pizza name from pizza_type table

### Requirements:

* Use **NATURAL JOIN** with pizza_type
* Group results by pizza name and category
* Sort results by:

  * Total revenue (descending)
  * Total orders (descending)

---

## Problem 4: Pizza Types Ordered Less Than Average

Write an SQL query to **find pizza types that were ordered less frequently than the average orders across all pizza types**.

### Requirements:

* Calculate total orders per pizza
* Compare with overall average orders
* Use subquery
* Return:

  * Pizza name
  * Category
  * Total orders

---

## Problem 5: Most Ordered Pizza and Cheapest Pizza

A marketing campaign wants to:

1. Promote the **most ordered pizza**
2. Introduce a **value meal with the cheapest pizza**

Write an SQL query to **identify both pizzas**.

### Requirements:

* Use **CTE**
* Find pizza with highest total quantity ordered
* Find pizza with lowest price
* Combine both results into one output
* Add a description column:

  * 'Most Ordered'
  * 'Cheapest'
* Use **UNION ALL**

---

## Concepts Covered

* NATURAL JOIN
* LEFT JOIN
* RIGHT JOIN
* GROUP BY
* ORDER BY
* Aggregation Functions
* Subqueries
* Common Table Expressions (CTE)
* UNION ALL
* Revenue Calculations
