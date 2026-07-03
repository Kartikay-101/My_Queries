	-- Views in MySQL
    
   /* A View is a virtual table created from the result of a SQL query.
	  A view does not store data itself (except materialized views in some DBMS, but not standard MySQL views).
      Restrict access to sensitive columns
	*/
	
-- Create a view that shows:
-- employee_id
-- first_name
-- last_name
-- department_name
-- salary
-- Only include employees with salary greater than 60,000.
CREATE INDEX IDX_SALARY
ON EMPLOYEES(SALARY);
USE CORP_DATA;
CREATE VIEW SALARY_G_60 AS
SELECT
		E.employee_id,
        E.first_name,
        E.last_name,
        D.department_name,
        E.salary
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D
ON E.department_id = D.department_id
WHERE SALARY > 60000;

CREATE OR REPLACE VIEW SALARY_G_60 AS			-- 
SELECT
		E.employee_id,
        E.first_name,
        E.last_name,
        D.department_name,
        D.department_id,
        E.salary
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D
ON E.department_id = D.department_id
WHERE SALARY > 60000;

SELECT * FROM SALARY_G_60;

	-- WITH CHECK OPTION = Any row inserted or updated through the view must satisfy the view's WHERE condition.
    
CREATE VIEW active_employees AS
SELECT *
FROM employees
WHERE status = 'Active'
WITH CHECK OPTION;

SELECT * FROM ACTIVE_EMPLOYEES;