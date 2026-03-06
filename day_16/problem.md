# Day 16 – Cascading Deletes & Multi-Table Relational Analysis

## 🎯 Objective
Practice:
- Inspecting existing Foreign Key constraints
- Dropping and recreating constraints
- Implementing ON DELETE CASCADE
- Performing multi-table joins
- Grouping aggregated relational data
- Filtering grouped results

---

## 🧠 Business Context

Our university relational database now contains fully connected entities:

- professors
- affiliations
- organizations
- universities

We want to:
1. Strengthen referential integrity rules.
2. Implement cascading behavior.
3. Perform cross-entity relational analysis.

---

## 📝 Problems

### Part 1 – Inspect Existing Constraints

1. Query `information_schema.table_constraints` to:
   - Identify all FOREIGN KEY constraints
   - Retrieve:
     - constraint_name
     - table_name
     - constraint_type

---

### Part 2 – Modify Foreign Key Behavior

2. Drop the existing foreign key constraint:
   - `affiliations_organization_id_fkey`

3. Recreate the foreign key on:
   - `affiliations.organization_id`
   - Referencing `organizations(id)`
   - Add `ON DELETE CASCADE`
   - Name it `affiliations_organization_id_fkey`

This ensures:
If an organization is deleted → related affiliations are automatically deleted.

---

### Part 3 – Aggregation Across Relationships

4. Count the total number of affiliations per university.
   - Join `affiliations` with `professors`
   - Group by `professors.university_id`
   - Order results by count descending

---

### Part 4 – Join All Tables

5. Perform a full relational join between:
   - affiliations
   - professors
   - organizations
   - universities

This should return all combined relational data.

---

### Part 5 – Multi-Dimensional Grouping

6. Group the joined result by:
   - organization_sector
   - professor ID
   - university_city

   Count the resulting number of rows per combination.

---

### Part 6 – Filtered Aggregation

7. Modify the grouped query to:
   - Retain only rows where organization_sector = 'Media & communication'
   - Sort by count in descending order

---

## 🏗 Why This Matters for Data Engineers

This exercise simulates production-grade relational governance.

In real-world systems, Data Engineers:

- Audit constraints via information_schema
- Modify foreign key behaviors safely
- Implement ON DELETE CASCADE to maintain integrity
- Perform cross-table aggregations for analytics
- Build complex joins for reporting
- Group multi-dimensional business metrics

Understanding cascading rules prevents:
- Orphan records
- Broken references
- Inconsistent datasets

This is the bridge between:
> Database Design  
and  
> Analytical Data Modeling

---

## 🚀 Key Learning Themes

- Foreign Key lifecycle management
- Cascading deletes
- Relational joins
- Multi-table aggregation
- Business-level grouping analysis
- Production-grade data integrity

This is where relational databases start behaving like real business systems.