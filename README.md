# Data Digger: E-Commerce SQL Project

A beginner friendly MySQL project that models a small e-commerce store and demonstrates relational design, CRUD operations, filtering, sorting, joins, and aggregate functions.

## Requirements

- MySQL 8.0 or later
- MySQL Workbench or the MySQL command line client

## Database schema

- `Customers` stores customer names, email addresses, and addresses.
- `Products` stores the product catalog, prices, and stock counts.
- `Orders` records each customer's orders.
- `OrderDetails` records products and quantities within each order.

`Orders.CustomerID` references `Customers.CustomerID`. `OrderDetails` references both `Orders` and `Products`. Primary keys auto-increment; foreign keys use cascading deletes and updates.

## Run the project

From a MySQL client, run these scripts in order:

```sql
SOURCE schema.sql;
SOURCE sample_data.sql;
```

Then run individual examples from `queries.sql`. The sample data uses `CURDATE()` so order dates are relative to the day the data is loaded.

## Files

| File | Description |
| --- | --- |
| `schema.sql` | Creates the `DataDigger` database and four related tables. |
| `sample_data.sql` | Inserts five fictional records per table. |
| `queries.sql` | Demonstrates CRUD, filters, ordering, joins, and aggregates. |

## Concepts demonstrated

- `INSERT`, `SELECT`, `UPDATE`, and `DELETE`
- Primary and foreign keys
- `WHERE`, `ORDER BY`, `BETWEEN`, `LIKE`, and `LIMIT`
- `INNER JOIN` and `LEFT JOIN`
- `MAX()`, `MIN()`, `AVG()`, `SUM()`, and `COUNT()`
- Date arithmetic with `CURDATE()` and `INTERVAL`

## Notes

The sample records are fictional and prices are in Indian Rupees (₹). The delete/update examples in `queries.sql` are commented out so the initial sample data remains intact until you choose to run them.

## Author

By Ved.
