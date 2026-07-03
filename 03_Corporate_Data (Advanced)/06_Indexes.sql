USE CORP_DATA;

	-- INDEXES IN SQL
    -- An index is a data structure that helps MySQL find rows faster without scanning the entire table.
    
-- A query filtering employees by department and salary has become slow.
CREATE INDEX IDX_DPRT_SLR
ON employees(department_id,salary);
ALTER TABLE EMPLOYEES DROP FOREIGN KEY fk_emp_dept;

ALTER TABLE employees
ADD CONSTRAINT fk_emp_dept
FOREIGN KEY (department_id)
REFERENCES departments(department_id);

DROP INDEX IDX_DPRT_SLR
ON employees;


SELECT
		employee_id,
        department_id,
        first_name,
        last_name,
        SALARY
FROM employees
WHERE SALARY < (
	SELECT AVG(SALARY) FROM employees
);