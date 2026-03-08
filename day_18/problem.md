# Day 18 – Database Normalization & Views

## 🎯 Objective
Practice:
- Data warehouse schema updates
- Adding foreign key constraints
- Database normalization (1NF and 2NF)
- Creating relational tables
- Removing repeating groups
- Querying metadata for views
- Creating and querying SQL views

---

## 🧠 Business Context

You are working on improving a relational database used for:

- Store analytics
- Car rental customer management
- Music review analytics

Your tasks involve:

- Updating dimensional tables
- Normalizing poorly designed tables
- Creating views for analytical reporting

---

# 📝 Problems

## Part 1 – Data Quality Check

1. Count the number of stores in `dim_store_star` where the country is **not USA or Canada**.

---

# Part 2 – Expanding a Snowflake Dimension

2. Modify the `dim_country_sf` table:

- Add a new column `continent_id`
- Set the default value to **1**
- Ensure the column cannot contain NULL values

3. Add a **foreign key constraint** called `country_continent`:

- `continent_id` references `dim_continent_sf(continent_id)`

4. Display the updated `dim_country_sf` table.

---

# Part 3 – Database Normalization (First Normal Form – 1NF)

### Scenario
The `customers` table currently stores multiple car IDs and invoice IDs inside single columns.

This violates **First Normal Form (1NF)** because:
- Columns contain repeating groups
- Multiple values exist in a single field

5. Create a new table called `cust_rentals` with:

- `customer_id`
- `car_id`
- `invoice_id`

6. Remove the following columns from the `customers` table:

- `cars_rented`
- `invoice_id`

---

# Part 4 – Database Normalization (Second Normal Form – 2NF)

### Scenario
The `customer_rentals` table contains non-key attributes describing cars.

This violates **Second Normal Form (2NF)** because:
- Non-key attributes depend on `car_id`, not the entire primary key.

7. Create a new table `cars` containing:

- `car_id`
- `model`
- `manufacturer`
- `type_car`
- `condition`
- `color`

8. Insert **distinct car records** from `customer_rentals` into the `cars` table.

9. Remove the following columns from `customer_rentals`:

- `model`
- `manufacturer`
- `type_car`
- `condition`
- `color`

---

# Part 5 – Querying Metadata for Views

10. Retrieve all views from the database using `information_schema.views`.

Exclude system views from:

- `pg_catalog`
- `information_schema`

---

# Part 6 – Creating Analytical Views

11. Create a view called **high_scores** containing:

- All rows from `reviews`
- Only where `score > 9`

---

12. Count the number of records where:

- `label = 'self-released'`

Join:

- `labels`
- `high_scores`

using the `reviewid` column.

---

# Part 7 – Creating a Reporting View

13. Create a view called `top_artists_2017`.

Steps:

- Join `top_15_2017` with `artist_title`
- Use the `reviewid` column
- Output the **artist names**

14. Display all rows from the `top_artists_2017` view.

---

# 🏗 Why This Matters for Data Engineers

This exercise focuses on **data normalization and analytical views**.

In real-world data systems, engineers must:

- Normalize operational databases
- Remove repeating groups
- Separate entity relationships
- Improve query performance with views
- Create reusable analytical layers

Views help teams:

- Simplify complex joins
- Provide secure data access
- Build reusable reporting logic
- Support BI tools

Normalization ensures:

- Clean data structure
- Reduced redundancy
- Improved maintainability
- Better query performance

---

# 🚀 Key Learning Concepts

- First Normal Form (1NF)
- Second Normal Form (2NF)
- Data normalization
- Dimensional schema updates
- SQL Views
- Metadata exploration
- Data warehouse design

These concepts are foundational for building **scalable relational databases and analytics systems**.