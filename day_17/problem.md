# Day 17 – Dimensional Modeling & Star Schema Analysis

## 🎯 Objective
Practice:
- Designing **dimension tables**
- Understanding **fact tables**
- Building **star schema relationships**
- Adding **foreign key constraints**
- Performing **analytical queries on fact tables**
- Understanding **Star Schema vs Snowflake Schema**
- Aggregating business metrics

---

## 🧠 Business Context

You are working as a Data Engineer designing a **data warehouse for analytics**.

The warehouse will track:
- Running activity data
- Book sales across stores
- Author and genre dimensions

Your tasks involve creating **dimension tables**, linking them with **fact tables**, and running **analytical queries** to generate insights.

---

## 📝 Problems

### Part 1 – Create Dimension Tables

1. Create a **route dimension table** called `route` with the following columns:

- route_id (Primary Key)
- route_name
- park_name
- distance_km
- city_name

All fields except `route_id` must be **NOT NULL**.

---

2. Create a **week dimension table** called `week` with the following columns:

- week_id (Primary Key)
- week
- month
- duration_mins
- year

---

### Part 2 – Basic Fact Table Analysis

3. Calculate the **total running duration** using the `duration_mins` column from the `runs_fact` table.

---

4. Join the `week_dim` table with `runs_fact` and calculate the **total duration of runs in July 2019**.

---

### Part 3 – Add Foreign Keys in a Fact Table

In the `fact_booksales` table:

5. Add a foreign key constraint called **sales_book** referencing:

- `book_id` → `dim_book_star(book_id)`

6. Add a foreign key constraint called **sales_time** referencing:

- `time_id` → `dim_time_star(time_id)`

7. Add a foreign key constraint called **sales_store** referencing:

- `store_id` → `dim_store_star(store_id)`

---

### Part 4 – Create an Author Dimension

8. Create a dimension table called `dim_author` containing:

- author

---

9. Insert **distinct authors** from the `dim_book_star` table into `dim_author`.

---

10. Add a **primary key column** `author_id` (SERIAL) to `dim_author`.

---

11. Display all rows from `dim_author`.

---

### Part 5 – Star Schema Analytical Query

12. Calculate **total sales amount by state** for books where:

- genre = 'novel'

Join the following tables:

- fact_booksales
- dim_book_star
- dim_store_star

Group results by **state**.

---

### Part 6 – Snowflake Schema Query

13. Perform the same analysis using a **Snowflake Schema** by joining:

- fact_booksales
- dim_book_sf
- dim_genre_sf
- dim_store_sf
- dim_city_sf
- dim_state_sf

Filter for:

- genre = 'novel'

Group results by **state**.

---

### Part 7 – Data Quality Check

14. Retrieve all rows from `dim_store_star` where:

- country is **not USA**
- country is **not CA**

---

## 🏗 Why This Matters for Data Engineers

This exercise introduces **dimensional modeling**, a core concept in **data warehousing**.

In production systems, Data Engineers design:

- **Fact Tables** → store measurable events (sales, runs, transactions)
- **Dimension Tables** → provide descriptive attributes (author, store, time)

Two common warehouse models:

### ⭐ Star Schema
- Simple structure
- Faster queries
- Dimensions directly connect to fact tables

### ❄ Snowflake Schema
- Normalized dimensions
- More joins required
- Reduces data redundancy

These models power analytics systems such as:

- Power BI
- Tableau
- Snowflake
- BigQuery
- Azure Synapse

Understanding dimensional modeling helps engineers build scalable **BI and analytics platforms**.

---

## 🚀 Key Learning Concepts

- Fact vs Dimension tables
- Star schema
- Snowflake schema
- Data warehouse modeling
- Analytical aggregations
- Foreign key relationships in fact tables
- Business intelligence query patterns

This is the stage where SQL moves from **database operations → analytics engineering**.