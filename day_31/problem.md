# 🧠 SQL Practice – Advanced Data Engineering Scenarios

This set focuses on **real-world SQL problems** commonly asked in **senior data engineering interviews**.  
It covers window functions, deduplication, joins, and analytical queries.

---

## 📌 Q1: Top 3 Customers by Revenue (Window Function)

### 📝 Problem Statement
Find the **top 3 customers by total revenue**, considering only **successful payments**.

### 📊 Tables Used
- `customers`
- `orders`
- `payments`

### 💡 Requirements
- Calculate total revenue per customer
- Rank customers based on revenue
- Return top 3 customers (handle ties)

---

## 📌 Q2: Identify Duplicate Orders (Deduplication Pattern)

### 📝 Problem Statement
Identify and remove **duplicate orders** based on:
- `customer_id`
- `order_date`
- `status`

### 💡 Requirements
- Keep only one record per duplicate group
- Delete all other duplicate rows
- Ensure deterministic ordering

---

## 📌 Q3: Running Revenue per Customer (Cumulative Window)

### 📝 Problem Statement
Calculate **running (cumulative) revenue** for each customer over time.

### 📊 Tables Used
- `customers`
- `orders`
- `payments`

### 💡 Requirements
- Consider only successful payments
- Order by `order_date`
- Compute cumulative sum per customer

---

## 📌 Q4: Latest Order per Customer

### 📝 Problem Statement
Retrieve the **most recent order** for each customer.

### 💡 Requirements
- One row per customer
- Based on latest `order_date`
- Handle ties deterministically

---

## 📌 Q5: Customers with No Orders (Anti Join)

### 📝 Problem Statement
Find all customers who **have never placed any orders**.

### 💡 Requirements
- Use appropriate join strategy
- Return customer details

---

## 📌 Q6: Revenue by Category (Aggregation + Joins)

### 📝 Problem Statement
Calculate total revenue for each product category.

### 📊 Tables Used
- `products`
- `order_items`
- `orders`

### 💡 Requirements
- Use product price and quantity
- Consider only completed orders
- Aggregate revenue by category

---

## 📌 Q7: Detect Payment Failures Followed by Success

### 📝 Problem Statement
Identify cases where a **failed payment is followed by a successful payment** for the same order.

### 💡 Requirements
- Use window functions (`LAG`)
- Compare previous and current payment status
- Return relevant records

---

## 📌 Q8: Find Customer Retention (Repeat Buyers)

### 📝 Problem Statement
Identify customers who have placed **more than one completed order**.

### 💡 Requirements
- Count completed orders per customer
- Filter customers with multiple orders

---

## 🚀 Skills Covered

- Window Functions (`ROW_NUMBER`, `DENSE_RANK`, `SUM OVER`)
- Deduplication strategies
- Anti joins
- Aggregations
- Multi-table joins
- Real-world data filtering

---

## 🏁 Goal

These problems simulate **real production scenarios** such as:
- Revenue analytics
- Data cleaning
- Customer behavior analysis
- Pipeline transformations

---

💡 *Tip:* Try solving each problem before looking at the solution!