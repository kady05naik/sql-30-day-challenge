# Day 13 – Data Insertion, Type Casting & Constraints

## 🎯 Objective
Practice:
- Inserting data from one table into another
- Dropping tables
- Performing arithmetic operations with type casting
- Using string functions (LENGTH, SUBSTRING)
- Modifying column data types
- Applying NOT NULL constraints
- Adding UNIQUE constraints
- Enforcing data integrity rules


## 🗂 Dataset / Schema Context

### Tables Used

**university_professors**
- firstname
- lastname
- function
- organization

**affiliations**
- firstname
- lastname
- function
- organization

**transactions**
- transaction_date
- amount
- fee

**professors**
- firstname
- lastname
- university_shortname

**universities**
- university_shortname

**organizations**
- organization


## 📝 Problems

1. Insert all distinct affiliation records from `university_professors` into the `affiliations` table.  
   - Display all rows from `affiliations` after insertion.

2. Delete the table `university_professors` from the database.

3. Calculate the net transaction amount as:  

   net_amount = amount + fee  

   - Ensure `fee` is properly cast to an integer if required.

4. Retrieve distinct `university_shortname` values from the `professors` table and determine the length of each value.

5. Modify the `university_shortname` column in the `professors` table to a fixed-length `CHAR(3)` type.

6. Change the data type of the `firstname` column to `VARCHAR(64)`.

7. Convert existing values in the `firstname` column to a maximum of 16 characters using a substring operation during type conversion.

8. Add a NOT NULL constraint to the `firstname` column.

9. Add a NOT NULL constraint to the `lastname` column.

10. Add a UNIQUE constraint to the `university_shortname` column in the `universities` table.  
    - Name the constraint `university_shortname_unq`.

11. Add a UNIQUE constraint to the `organization` column in the `organizations` table.  
    - Name the constraint `organization_unq`.


## 💡 Why This Is Strong for a Data Engineer

This practice focuses on schema governance and data integrity — key responsibilities of a Data Engineer.

In real-world environments, Data Engineers:

- Migrate and transform data between tables
- Clean and standardize string values
- Enforce NOT NULL and UNIQUE constraints to maintain data quality
- Modify data types to optimize storage and performance
- Apply casting to ensure consistent arithmetic operations
- Manage schema evolution safely in production systems

Understanding constraints and schema transformations is critical for:
- Data warehouse design
- Data validation pipelines
- Production database management
- Ensuring consistency and reliability in analytics systems