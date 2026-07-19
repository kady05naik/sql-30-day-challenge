# 🧠 SQL Practice – Core to Advanced Data Engineering Scenarios

This set focuses on **foundational to intermediate SQL problems** commonly asked in data analyst and data engineering assessments. 
It covers basic filtering, aggregations, conditional filtering (`HAVING`), joins, and subquery concepts.

---

## 🏗️ Database Schema

Use the following DDL schema to understand the relationship between the tables before writing your queries:

```sql
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50),
    signup_date DATE,
    segment VARCHAR(20)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    brand VARCHAR(50),
    unit_price DECIMAL(10,2)
);
  
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    product_id INT,
    quantity INT,
    discount DECIMAL(5,2),
    sales_amount DECIMAL(12,2),
    payment_method VARCHAR(20),
    region VARCHAR(30)
);
```

---

## 📌 Section 1: Basic Filtering & Text Matching

### Q1: Customers from the Netherlands
**Problem Statement:** Extract a complete list of customers who are located in the Netherlands.
*   **Requirements:** Filter exactly on the country field.

### Q2: Show Electronics Products
**Problem Statement:** Find all products that belong to the electronics catalog.
*   **Requirements:** Ensure the matching handles mixed or lowercase entries safely.

### Q3: Recent Orders
**Problem Statement:** Filter all records for transactions that occurred strictly after February 1st, 2025.
*   **Requirements:** Apply safe date format boundaries.

### Q4: Distinct Sales Regions
**Problem Statement:** Extract a clean list of all unique geographic regions where orders have been placed.
*   **Requirements:** Eliminate duplicates in the output.

### Q5: Name Prefix Search
**Problem Statement:** Identify all customer accounts where the customer's name begins with the letter "A".
*   **Requirements:** Use wildcard text matching.

---

## 📌 Section 2: Aggregations & Grouping

### Q6: Regional Revenue
**Problem Statement:** Calculate the total gross sales generated within each distinct region.
*   **Requirements:** Group by region and sum the total sales metrics.

### Q7: Payment Method Metrics
**Problem Statement:** Determine the average order value processed through each unique payment method type.
*   **Requirements:** Aggregate the mean amount across payment streams.

### Q8: Peak Transaction Value
**Problem Statement:** Find the single highest sales amount recorded in the transactions ledger.
*   **Requirements:** Use an aggregate function without explicit groupings.

---

## 📌 Section 3: Group Filtering (HAVING)

### Q9: Total Units Sold by Category
**Problem Statement:** Join the appropriate catalogs to calculate the absolute volume of items sold within each category.
*   **Requirements:** Group metrics cleanly by category name.

### Q10: Top Customer Identification
**Problem Statement:** Pinpoint the single customer account identifier responsible for placing the absolute highest frequency of separate orders.
*   **Requirements:** Order the aggregated frequency counts descending and limit the output.

### Q11: High-Value Product Categories
**Problem Statement:** Identify product categories that have generated an aggregate revenue higher than €10,000.
*   **Requirements:** Filter combined metrics post-aggregation using the appropriate keyword.

### Q12: High-Volume Operational Regions
**Problem Statement:** Find regions that have successfully processed more than 10 individual orders.
*   **Requirements:** Apply group-level filters on record counts.

### Q13: VIP Customer Wallets
**Problem Statement:** Generate a list of customer IDs whose cumulative life-time spending amounts to more than €5,000.
*   **Requirements:** Group on customer keys and apply value checks.

### Q14: Mass-Volume Product Performance
**Problem Statement:** Extract the name of products whose total quantity shipped across all orders exceeds 100 units.
*   **Requirements:** Combine metadata and transaction logs, group by product name, and isolate values.

### Q15: High-Density Customer Cities
**Problem Statement:** Identify cities that contain a concentration of more than 5 registered customer accounts.
*   **Requirements:** Group directly on city geographies.

---

## 📌 Section 4: Joins & Relational Analysis

### Q16: Enriched Order Ledger (Customer Names)
**Problem Statement:** Display every order record enriched with the corresponding customer's registered name.
*   **Requirements:** Map transaction records to primary customer tables using matching IDs.

### Q17: Enriched Order Line Items (Product Category)
**Problem Statement:** Display every order record mapped to its respective product category classification.
*   **Requirements:** Ensure every line item pulls category data fields cleanly.

### Q18: Zero-Engagement Customers (Anti-Join Pattern)
**Problem Statement:** Extract a precise list of registered accounts who have never placed a single order in the system.
*   **Requirements:** Use an outer join pattern and filter for non-matching rows.

### Q19: Dead Stock Inventory (Anti-Join Pattern)
**Problem Statement:** Identify inventory items that have never recorded a single unit sale.
*   **Requirements:** Locate items listed in the product library that completely miss representation in the orders journal.

---

## 📌 Section 5: Advanced Multi-Metric Reporting

### Q20: Deep-Dive Regional Performance Matrix
**Problem Statement:** For each operational region, generate a high-utility metrics sheet calculating:
1. Total Revenue
2. Total Order Volume
3. Average Ticket Size per Order

*   **Requirements:** 
    *   Isolate rows where the aggregate revenue is strictly greater than €50,000.
    *   Ensure the average transaction item size remains strictly above €500.
    *   Sort the final matrix in a descending sequence highlighting the top-earning region first.

---

## 🚀 Skills Covered

- Exact and case-insensitive string filtering (`LIKE`, `LOWER`)
- Table Deduplication & Uniqueness extraction (`DISTINCT`)
- Relational mapping strategies (`INNER JOIN`, `LEFT JOIN`)
- Missing value discovery / Anti-Join extraction (`IS NULL`)
- Multi-field matrix aggregations (`SUM`, `AVG`, `COUNT`, `MAX`)
- Post-aggregation relational constraints (`HAVING`)
- Data ordering and window limitations (`ORDER BY`, `LIMIT`)

---

## 🏁 Goal

These operational scenarios directly mirror the foundational requirements of everyday **Data Pipeline Construction**:
- KPI dashboard source-modeling
- Inventory optimization analytics
- Marketing segment isolation
- Executive financial health reporting

---

💡 *Tip: Draft the solution queries referencing the explicit schemas shown above before evaluating your work!*
