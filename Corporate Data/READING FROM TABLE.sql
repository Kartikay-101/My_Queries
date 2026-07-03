USE CORP_DATA;

-- SELECT * FROM LOCATIONS;
-- SELECT * FROM customers;
-- SELECT * FROM departments;
-- SELECT * FROM employee_projects;
SELECT * FROM employees;
-- SELECT * FROM JOBS;
-- SELECT * FROM ORDER_ITEMS;
-- SELECT * FROM ORDERS;
-- SELECT * FROM PRODUCTS;
-- SELECT * FROM PROJECTS;
SELECT * FROM orders;

SELECT *
FROM EMPLOYEES EMP
LEFT JOIN departments DEP
ON EMP.department_id = DEP.department_id
LEFT JOIN LOCATIONS LOC
ON DEP.location_id = LOC.location_id
LEFT JOIN JOBS JB
ON EMP.JOB_ID = JB.JOB_ID
LEFT JOIN employee_projects EMP_PJ
ON EMP.employee_id = EMP_PJ.employee_id
LEFT JOIN PROJECTS PJ
ON EMP_PJ.project_id = PJ.project_id
LEFT JOIN ORDERS ord
ON EMP.employee_id = ORD.employee_id
LEFT JOIN CUSTOMERS CTM
ON ORD.customer_id = CTM.customer_id
LEFT JOIN order_items ORD_ITM
ON ORD_ITM.order_id = ORD.order_id
LEFT JOIN products PRD
ON PRD.product_id = ORD_ITM.product_id;