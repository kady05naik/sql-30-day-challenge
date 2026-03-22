# problem.md

## SQL Practice – Product Table Queries

Use database:

```sql
USE practice;
```

Assume we have a **product** table with columns:

* id
* product
* quantity
* color

---

## Problem 1: Get Unique Products Without Using DISTINCT

Write an SQL query to **fetch unique product names from the product table without using DISTINCT keyword**.

---

## Problem 2: Get Only Duplicate Products

Write an SQL query to **fetch only duplicate product names from the product table**.

### Requirement:

* Only products appearing more than once should be returned.

---

## Problem 3: Sum of Quantities Sold for Each Product

Write an SQL query to **calculate the total quantity sold for each product**.

### Requirement:

* Group results by product.

---

## Problem 4: Product and Their Respective Count

Write an SQL query to **fetch each product along with the number of times it appears in the table**.

### Requirement:

* Return product and count.

---

## Problem 5: Delete Duplicate Products

Write an SQL query to **delete duplicate product records from the product table**.

### Requirements:

* Duplicates are based on:

  * product
  * quantity
  * color
* Keep only one record and delete the remaining duplicates.

### Hint:

* Use **SELF JOIN** or **ROW_NUMBER()**
* Compare IDs and delete the higher ID.
