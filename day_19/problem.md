# Day 11 – Database Management, Views, and Roles

## Business Scenario
As a data engineer working with PostgreSQL databases, you are responsible for maintaining database structures, enforcing data integrity, managing permissions, and optimizing queries using views and materialized views.  

Your tasks include managing database objects such as views, roles, and tables while ensuring proper normalization and performance improvements.

---

# Problems

## Problem 1: Dropping Dependent Views
Two views exist in the database: `top_15_2017` and `top_artists_2017`.  
The `top_artists_2017` view depends on `top_15_2017`.

**Task:**  
Write a SQL command that drops `top_15_2017` and automatically removes all dependent objects.

---

## Problem 2: Managing View Permissions
The `long_reviews` view currently allows public users to perform updates and inserts.

**Tasks:**
1. Revoke `UPDATE` and `INSERT` privileges from all database users.
2. Grant `UPDATE` and `INSERT` privileges only to a user named `editor`.

---

## Problem 3: Redefining a View
The existing view `artist_title` joins review information with artist details.

**Task:**  
Redefine the `artist_title` view so that it includes the following columns:

- `reviewid`
- `title`
- `artist`
- `label`

The `label` information should come from the `labels` table.

---

## Problem 4: Creating and Refreshing a Materialized View
Materialized views store query results physically and must be refreshed when the underlying data changes.

**Tasks:**
1. Create a materialized view named `genre_count` that counts the number of records for each genre from the `genres` table.
2. Insert a new genre record into the `genres` table.
3. Refresh the materialized view to reflect the updated data.
4. Query the materialized view to verify the changes.

---

## Problem 5: Creating and Managing Database Roles
The organization wants to manage database access through roles.

**Tasks:**
1. Create a role called `data_scientist`.
2. Create a login role for a user named `Marta`.
3. Add `Marta` to the `data_scientist` role.
4. Later remove `Marta` from the `data_scientist` role.

---

## Problem 6: Table Refactoring for Better Storage
The `film` table currently contains a `long_description` column that stores large text data.

To optimize storage and improve table performance, the descriptions should be moved to a separate table.

**Tasks:**
1. Create a new table called `film_descriptions` with the following columns:
   - `film_id`
   - `long_description`
2. Copy the description data from the `film` table into the new table.
3. Remove the `long_description` column from the original `film` table.
4. Join both tables to confirm the data has been successfully moved.

---

# Expected Outcome
By completing these tasks, you will:

- Manage dependent views using `CASCADE`
- Control database access using `REVOKE` and `GRANT`
- Redefine views using `CREATE OR REPLACE VIEW`
- Use materialized views to improve query performance
- Manage user roles and permissions
- Refactor database tables to improve storage and maintain normalization