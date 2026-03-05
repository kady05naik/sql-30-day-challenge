# Day 15 – Entity Design & Foreign Key Relationships

## 🎯 Objective
Practice:
- Designing an entity from business requirements
- Choosing correct data types
- Defining Primary Keys
- Creating Foreign Key relationships
- Enforcing referential integrity
- Migrating from text-based joins to relational IDs
- Cleaning up redundant columns

---

## 🧠 Business Scenario

We are designing a relational university database.

We must:

1. Create a new **student entity** based on strict business rules.
2. Strengthen relationships between:
   - professors
   - universities
   - organizations
   - affiliations
3. Replace name-based relationships with proper ID-based foreign keys.

---

## 📝 Problems

### Part 1 – Entity Creation

A student has:

- A **last name** consisting of up to 128 characters (required)
- A **unique social security number (SSN)** consisting only of integers
- A **phone number** of fixed length 12 (optional)

Tasks:

1. Create a `students` table with appropriate data types.
2. Make `ssn` the Primary Key.

---

### Part 2 – Strengthening Professor–University Relationship

3. Rename `university_shortname` to `university_id` in the `professors` table.

4. Add a Foreign Key on `university_id` in `professors` that references `id` in `universities`.
   - Name the constraint `professors_fkey`.

5. Attempt to insert:
   - firstname = Albert
   - lastname = Einstein
   - university_id = UZH

   Observe what happens depending on referential integrity.

---

### Part 3 – Building Proper Affiliations Relationships

6. Add a new column `professor_id` (INTEGER) to `affiliations`.
   - Make it a Foreign Key referencing `professors(id)`.

7. Rename the column `organization` to `organization_id` in `affiliations`.

8. Add a Foreign Key constraint on `organization_id` referencing `organizations(id)`.
   - Name it `affiliations_organization_fkey`.

---

### Part 4 – Data Migration from Names to IDs

9. Update `affiliations.professor_id` by matching:
   - firstname
   - lastname  
   with the corresponding rows in `professors`.

10. After successfully populating `professor_id`, drop:
   - firstname column
   - lastname column

This completes the migration from **text-based relationships** to **ID-based relational integrity**.

---

## 🏗 Why This Is Important for Data Engineers

This exercise reflects real-world production database evolution.

In real systems, Data Engineers:

- Convert loosely structured schemas into normalized relational models
- Replace string-based joins with foreign keys
- Enforce referential integrity
- Migrate legacy data safely
- Clean redundant columns after migration
- Design proper entity relationships

This is the transition from:
> “Data that works”  
to  
> “Data that scales safely.”

Understanding foreign keys and relational modeling is critical for:
- Data warehouse design
- OLTP systems
- Production database governance
- Avoiding orphan records
- Maintaining consistent analytical datasets

---

## 🚀 Key Learning Themes

- Entity modeling
- Primary vs Foreign Keys
- Referential Integrity
- Schema evolution
- Data migration strategy
- Database normalization

This is where you move from writing queries to engineering relational systems.