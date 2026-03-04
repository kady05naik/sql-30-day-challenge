# Day 14 – Primary Keys, Distinct Counts & Schema Evolution

## 🎯 Objective
Practice:
- Counting rows and distinct values
- Renaming columns
- Creating Primary Keys
- Adding SERIAL identifiers
- Working with composite distinct counts
- Updating tables using CONCAT()
- Designing custom primary keys
- Strengthening data integrity

---

## 🗂 Dataset / Schema Context

### Tables Used

**universities**
- university_shortname (renamed to id)
- university
- university_city

**organizations**
- organization (renamed to id)

**professors**
- firstname
- lastname
- university_shortname
- id (new serial column)

**cars**
- make
- model
- id (new varchar column)

---

## 📝 Problems

1. Find the total number of rows in the `universities` table.

2. Determine how many unique values exist in the `university_city` column.

3. In the `organizations` table:
   - Rename the column `organization` to `id`
   - Make `id` a Primary Key
   - Name the constraint `organization_pk`

4. In the `universities` table:
   - Rename the column `university_shortname` to `id`
   - Make `id` a Primary Key
   - Name the constraint `university_pk`

5. In the `professors` table:
   - Add a new column `id` with data type `SERIAL`

6. Make the `id` column in `professors` a Primary Key  
   - Name the constraint `professors_pkey`

7. Write a query to return all columns and limit the result to 10 rows from the `professors` table.

8. Count the number of distinct combinations of `make` and `model` in the `cars` table.

9. Add a new column `id` to the `cars` table with data type `VARCHAR(128)`.

10. Populate the `id` column by concatenating `make` and `model` using:
    
    `CONCAT(make, model)`

11. Make the `id` column the Primary Key of the `cars` table.  
    - Name the constraint `id_pk`

---

## 💡 Why This Matters for Data Engineers

This exercise focuses on **schema normalization and key design**, which are critical in production databases.

In real-world systems, Data Engineers:

- Create Primary Keys to ensure row uniqueness
- Replace natural keys with surrogate keys (e.g., SERIAL)
- Design custom composite identifiers
- Enforce uniqueness across business entities
- Prepare tables for foreign key relationships
- Standardize schemas before building data warehouses

Understanding Primary Keys and unique constraints is foundational for:
- Data modeling
- Star schema design
- Referential integrity
- Scalable database architecture
- ETL and transformation pipelines

This is the stage where raw tables evolve into production-ready database structures.