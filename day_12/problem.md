# Day 12 – Database Metadata, Table Creation & Schema Modifications

## 🎯 Objective
Practice:
- Querying database metadata using `information_schema`
- Inspecting table structures
- Counting table columns
- Creating new tables
- Altering existing tables
- Renaming and dropping columns
- Inserting data using `INSERT INTO ... SELECT`
- Using `DISTINCT` to prevent duplicate inserts


## 🗂 Dataset / Schema Context

### Existing Tables
- university_professors
- affiliations

### System Metadata Tables
- information_schema.tables
- information_schema.columns


## 📝 Problems

1. Retrieve all table names from the current database limited to the `public` schema.

2. Retrieve column names and their data types for the table `university_professors` within the `public` schema.

3. Determine how many columns exist in the `university_professors` table.

4. Create a new table called `professors` with:
   - firstname (text)
   - lastname (text)  
   Then display all rows from the table.

5. Create a new table called `universities` with:
   - university_shortname (text)
   - university (text)
   - university_city (text)  
   Then display all rows from the table.

6. Modify the `professors` table by adding a new column:
   - university_shortname (text)  
   Then display all rows.

7. Rename the column `organisation` to `organization` in the `affiliations` table.

8. Remove the column `university_shortname` from the `affiliations` table.

9. Insert all distinct professors from `university_professors` into the `professors` table.  
   - Ensure duplicates are not inserted.  
   - Display all rows from `professors` after insertion.


## 💡 Why This Is Strong for a Data Engineer

This practice focuses on schema management and metadata exploration — core responsibilities of a Data Engineer.

In real-world environments, Data Engineers frequently:

- Inspect schemas before building pipelines
- Validate table structures using `information_schema`
- Create new tables for staging or transformation layers
- Modify schemas to meet evolving business requirements
- Perform controlled data migrations
- Deduplicate data during ingestion

Understanding schema operations and metadata querying is critical for:
- Database design
- Data warehouse modeling
- Production pipeline maintenance
- Migration and refactoring projects