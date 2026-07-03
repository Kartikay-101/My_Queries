	-- UNION and UNION ALL in MySQL
    -- UNION combines the results of two or more SELECT statements and removes duplicates.
    -- UNION ALL combines results but keeps duplicates.

-- Suppose you want a list of all people:
-- Employees
-- Customers
SELECT CONCAT('EMP : ',first_name) AS 'NAME                 '
FROM employees

UNION ALL

SELECT CONCAT('CTM : ',customer_name) AS name
FROM customers;