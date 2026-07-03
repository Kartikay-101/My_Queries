USE CORP_DATA;

	-- Employees whose salary is above the average salary.
SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    (SELECT ROUND(AVG(salary),2) FROM employees) AS average_salary
FROM employees
WHERE salary > (
    SELECT AVG(salary) FROM employees
);

	-- Employees whose salary is greater than the salary of their manager
SELECT
		E1.EMPLOYEE_ID,
        E1.FIRST_NAME,
        E1.LAST_NAME,
        E1.SALARY,
        E2.FIRST_NAME AS 'MANAGER NAME',
        E2.SALARY AS 'MANAGER SALARY'
FROM EMPLOYEES E1
LEFT JOIN EMPLOYEES E2
ON E1.MANAGER_ID = E2.EMPLOYEE_ID
WHERE E1.SALARY >  E2.SALARY ;	

	-- Projects that have at least one employee assigned.
SELECT 
    P.PROJECT_ID,
    P.PROJECT_NAME,
    COUNT(EMPLOYEE_ID) AS 'NUMBERS OF EMPLOYEES'
FROM
    projects P
        LEFT JOIN
    employee_projects EP ON P.project_id = EP.project_id
GROUP BY PROJECT_ID , PROJECT_NAME
HAVING COUNT(EMPLOYEE_ID) >= 1;

	-- Departments whose average salary is above the company-wide average salary.
SELECT
		D.DEPARTMENT_ID,
        D.DEPARTMENT_NAME,
        AVG(SALARY) AS 'DEPARTMENT AVERAGE SALARY'
FROM employees E
LEFT JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_ID
HAVING AVG(SALARY) > (
	SELECT AVG(SALARY) FROM employees
);

	-- Find the total salary paid by each department.

create or replace view Total_salary as
select
        e.department_id,
        d.department_name,
        sum(e.salary) as 'Total Salary'
from employees e
left join departments d
on e.department_id = d.department_id
group by
		e.department_id,
        d.department_name
order by sum(e.salary);
        
select * from  Total_salary;

	-- Find departments having more than 5 employees.
select
        d.department_id,
        d.department_name,
        count(e.employee_id) as 'Total Employees'
from employees e
left join departments d
on e.department_id = d.department_id
group by
		d.department_id,
        d.department_name
having count(e.employee_id) > 5;

-- 	Find departments where:
-- 	employees earn more than 50,000
-- 	average salary is above 70,000
select
		d.department_id,
        d.department_name,
        AVG(e.salary) AS avg_salary

from employees e
left join departments d
on e.department_id = d.department_id
where e.salary > 50000
group by
		d.department_id,
        d.department_name
having avg(e.salary) > 70000;

	-- Find the number of unique departments.
select
        count(distinct department_id)
from departments;

	-- Find departments having:
-- 		- more than 2 employees
-- 		- average salary greater than 60000

SELECT
		d.department_id,
        d.department_name,
        COUNT(E.employee_ID) AS 'TOTAL NO OF EMPLOYEES',
        avg(E.SALARY) AS 'AVERAGE SALARY'
from employees e
left join departments d
on e.department_id = d.department_id
GROUP BY
		d.department_id,
        d.department_name
HAVING 
	COUNT(E.EMPLOYEE_ID) > 2
    AND avg(E.SALARY) > 60000
;
