# Corporate Data SQL Practice

This repository contains my MySQL practice files for learning SQL from basics toward advanced topics using a corporate-style sample database.

## Database

Database name: `CORP_DATA`

The schema includes common business tables:

- `LOCATIONS`
- `JOBS`
- `DEPARTMENTS`
- `EMPLOYEES`
- `PROJECTS`
- `EMPLOYEE_PROJECTS`
- `CUSTOMERS`
- `ORDERS`
- `PRODUCTS`
- `ORDER_ITEMS`

## Topics Covered

- Creating databases and tables
- Inserting sample corporate data
- Reading data with `SELECT`
- Delete operations
- Subqueries
- Views
- Indexes
- Triggers
- Stored procedures
- `UNION` and `UNION ALL`
- `ROLLUP`
- Window functions

## Current Learning Topic

I am currently learning MySQL window functions, starting with `ROW_NUMBER()`.

Example:

```sql
SELECT 
    E.EMPLOYEE_ID,
    E.FIRST_NAME,
    E.LAST_NAME,
    D.DEPARTMENT_NAME,
    E.SALARY,
    ROW_NUMBER() OVER(
        PARTITION BY D.DEPARTMENT_NAME
        ORDER BY E.SALARY DESC
    ) AS SALARY_ROW_NUMBER
FROM EMPLOYEES E
JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;
```

This query assigns a unique row number to each employee inside each department, ordered by highest salary first.

## File Guide

| File | Purpose |
| --- | --- |
| `Creating Table.sql` | Creates the `CORP_DATA` database and all tables |
| `INSERTING DATA INTO TABLE.sql` | Inserts sample data into the tables |
| `READING FROM TABLE.sql` | Basic reading/query practice |
| `DELETE OPERATION.sql` | Delete query practice |
| `SUBQUERIES.sql` | Subquery practice |
| `VIEWS.sql` | View creation and usage |
| `INDEXES.sql` | Index practice |
| `TRIGGERS.sql` | Trigger practice |
| `STORED PROCEDURE.sql` | Stored procedure practice |
| `UNION and UNION ALL.sql` | Combining query results |
| `ROLLUP.sql` | Summary rows with `ROLLUP` |
| `WINDOW FUNCTIONS.sql` | Window function practice |
| `AUDIT TABLES.sql` | Audit table related practice |

## How To Use

1. Run `Creating Table.sql` to create the database and tables.
2. Run `INSERTING DATA INTO TABLE.sql` to insert sample records.
3. Practice each topic using the related `.sql` file.
4. Continue adding examples and notes as new SQL concepts are learned.
