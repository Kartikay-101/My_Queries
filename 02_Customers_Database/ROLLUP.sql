	-- ROLLUP in MySQL
    -- ROLLUP is an extension of GROUP BY that automatically adds subtotal and grand total rows.

-- Using your CORP_DATA database, write a query to show:
-- department_name
-- total salary of each department
-- Grand total salary of all departments

SELECT
		ifnull(D.DEPARTMENT_NAME, 'GRAND TOTAL') AS 'DEPARTMENT NAME',
		SUM(E.SALARY) AS 'TOTAL SALARY'
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME WITH ROLLUP;

-- Your company wants a payroll report with:

-- Salary spent by each Country
-- Salary spent by each Department within a Country
-- Salary spent by each City within a Department
-- Subtotals at every level
-- One final Grand Total

-- Use the employees table.

SELECT
		IFNULL(COUNTRY,'TOTAL COUNTRES') AS 'Country',
		IFNULL(Department_ID,'Department') AS 'Department',
		IFNULL(City,'TOTAL City') AS 'City',
        COUNT(EMPLOYEE_ID) AS 'EMPLOYEE COUNT',
        sum(SALARY) AS ' TOTAL SALARY'
FROM EMPLOYEES
GROUP BY 
	country,
	department_id,
	city
WITH ROLLUP;
        