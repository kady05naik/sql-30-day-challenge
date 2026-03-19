# Snowflake SQL Practice Problems – Pizza Sales Dataset

Assume we have the following tables:

## pizzas
| Column Name | Description |
|-------------|------------|
| pizza_id | Unique Pizza ID |
| pizza_type_id | Pizza Type ID |
| pizza_size | Size of Pizza |
| price | Price of Pizza |

## pizza_type
| Column Name | Description |
|-------------|------------|
| pizza_type_id | Pizza Type ID |
| name | Pizza Name |
| category | Category (Classic, Veggie, etc.) |

## orders
| Column Name | Description |
|-------------|------------|
| order_id | Order ID |
| order_date | Date of Order |

## order_details
| Column Name | Description |
|-------------|------------|
| order_id | Order ID |
| pizza_id | Pizza ID |
| quantity | Quantity Ordered |

---

## Problem 1: Select Required Columns

Write a Snowflake SQL query to **select pizza_type_id, pizza_size, and price from the pizzas table**.

---

## Problem 2: Count Classic Category Pizzas

Write a query to **count the number of pizzas that belong to the 'Classic' category**.

Expected Output:
- Total count of Classic pizzas

---

## Problem 3: Convert Data Type Using CAST

Write a query to:
- Convert `order_id` to **VARCHAR**
- Alias it as `order_id_string`

---

## Problem 4: Convert Data Type Using :: Operator

Write a query to:
- Convert the `price` column to **NUMBER**
- Alias it as `price_dollars`

---

## Problem 5: Concatenate Columns

Write a query to:
- Combine `name` and `category` columns into a single column
- Separate values using `' - '`

Expected Output:
- `name - category`

---

## Problem 6: Capitalize Values

Write a query to:
- Capitalize each word in the `pizza_type_id` column

---

## Problem 7: Describe Table Structure

Write a query to:
- Display metadata/details of the `orders` table

---

## Problem 8: Orders Count by Day of Week

Write a query to:
- Count total orders
- Extract **day of the week** from `order_date`
- Group results by day of the week
- Sort results by order count in descending order

Expected Output:
- `order_day`
- `orders_per_day`

---

## Problem 9: Current Date and Time

Write a query to:
- Fetch the current date
- Fetch the current time

---

## Problem 10: Monthly Revenue Analysis

Write a query to:
- Extract the **month** from `order_date`
- Calculate total revenue using: