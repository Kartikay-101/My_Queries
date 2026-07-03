	-- STORED PROCEDURE IN SQL
    -- STORED PROCEDURE IS A SAVED BLOCKS OF SELECT STATEMENTS OF SQL THAT RUN A SINGLE UNIT. 
    -- IT HELP IN REUSE LOGIC, REDUCE REPETITION, AND KEEPS BUSINESS LOGIC INSIDE DATABASE.
	-- A function that contains SQL statements and can be executed whenever needed.
    
-- Q. Create a procedure: get_high_salary_employees
use corp_data;
DELIMITER //
CREATE PROCEDURE GET_HIGH_SALARY_EMPLOYEES(IN SALARY_AMOUNT INT)
BEGIN
		SELECT employee_id, first_name, last_name, SALARY, SALARY_AMOUNT AS 'GREATER THEN'
        FROM employees
        WHERE SALARY > SALARY_AMOUNT;
END //

DELIMITER ;

CALL GET_HIGH_SALARY_EMPLOYEES(55000);

DROP PROCEDURE GET_HIGH_SALARY_EMPLOYEES;	-- WILL DELETE STORE PROCEDURE.

	-- Q. GET get_department_stats
DELIMITER //
CREATE PROCEDURE get_department_stats(IN DPT_ID INT, OUT TOTAL_EMP INT, OUT AVG_SALARY DECIMAL(10,2))
BEGIN
		SELECT  count(EMPLOYEE_ID) AS 'TOTAL EMPLOYEES', AVG(SALARY) AS 'AVERAGE SALARY' INTO TOTAL_EMP, AVG_SALARY
        FROM EMPLOYEES
        WHERE DEPARTMENT_ID = DPT_ID;
END //
DELIMITER ;
DROP PROCEDURE get_department_stats;
CALL get_department_stats(3, @CNT ,@AVG);

SELECT @CNT,@AVG;

SHOW CREATE PROCEDURE get_department_stats;		-- This is very useful when you forget what you wrote inside the procedure.

	-- Q. Create a procedure named get_customer_order_summary:
DELIMITER //
CREATE PROCEDURE GET_CUSTOMERS_ORDER_SUMMARY(IN P_CUSTOMER_ID INT, OUT TOTAL_ORDERS INT, OUT TOTAL_REVENUE DECIMAL(10,2), OUT LATEST_ORDERED_DATE DATE)
BEGIN
		SELECT
				COALESCE(COUNT(O.ORDER_ID),0) AS 'TOTAL ORDERS',
                COALESCE(SUM(O.order_amount),0) AS 'TOTAL REVENUE',
                COALESCE(MAX(O.ORDER_DATE),NULL) AS 'LATEST ORDER DATE'
                INTO
					TOTAL_ORDERS,
                    TOTAL_REVENUE,
                    LATEST_ORDERED_DATE
				FROM ORDERS O
                LEFT JOIN CUSTOMERS C
                ON O.customer_id = C.customer_id
                WHERE C.Customer_ID = P_CUSTOMER_ID;                
END //
DELIMITER ;
DROP procedure GET_CUSTOMERS_ORDER_SUMMARY;
CALL GET_CUSTOMERS_ORDER_SUMMARY(4,@CNT,@SUM,@MAX);

SELECT @CNT,@SUM,@MAX;

	-- Q. get_department_project_stats
--     Return:
-- 1. total_employees
-- 2. average_salary
-- 3. total_projects

DELIMITER //
CREATE PROCEDURE get_department_project_stats(
			IN P_DEPARTMENT_ID INT,
            OUT TOTAL_EMP INT,
            OUT AVERAGE_SALARY DECIMAL(10,2),
            OUT TOTAL_PROJECTS INT)
BEGIN
		SELECT
				count(DISTINCT E.EMPLOYEE_ID) AS 'TOTAL EMPLOYEES',
				AVG(E.SALARY) AS 'AVERAGE SALARY',
				COUNT(DISTINCT P.PROJECT_ID) AS 'TOTAL PROJECTS'
                INTO
					TOTAL_EMP,
					AVERAGE_SALARY,
                    TOTAL_PROJECTS
                FROM EMPLOYEES E
                JOIN employee_projects P
                ON E.EMPLOYEE_ID = P.EMPLOYEE_ID
                WHERE E.DEPARTMENT_ID = P_DEPARTMENT_ID;
END //
DELIMITER ;
DROP PROCEDURE get_department_project_stats;
CALL get_department_project_stats(1,@CTN, @AVV,@CTT);
SELECT @CTN, @AVV,@CTT;