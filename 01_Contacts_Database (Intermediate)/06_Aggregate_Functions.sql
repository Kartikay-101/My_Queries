USE EMPLOYEE_DATA;

CREATE TABLE EMP_INFO (
	EMP_ID INT UNIQUE,
    FIRST_NAME VARCHAR (30),
    LAST_NAME VARCHAR (30),
    DEPARTMENT VARCHAR (50) NOT NULL,
    CITY VARCHAR (50),
    COUNTRY VARCHAR (10) DEFAULT'India',
    SALARY DECIMAL (10,2) CHECK (SALARY > 0) NOT NULL,
    BONUS DECIMAL (10,2) CHECK (BONUS >= 0),
    JOINING_DATE DATE,
	
	FOREIGN KEY (EMP_ID)
    REFERENCES personal_info(EMP_ID)
);

DROP TABLE EMP_INFO;

INSERT INTO EMP_INFO
(EMP_ID, FIRST_NAME, LAST_NAME, DEPARTMENT, CITY, SALARY, BONUS, JOINING_DATE)
VALUES
(1000,'Kartikay','Nautiyal','IT','Noida', '75000',5000,'2024-01-15'),
(1001,'Nishant','Tomar','HR','Delhi',48000,3000,'2023-05-20'),
(1002,'Shubham','Suneel','IT','Noida',62000,7000,'2022-08-11'),
(1003,'Sambhav','Sharma','Finance','Gurgaon',58000,NULL,'2023-02-18'),
(1004,'Sarthak','Sharma','IT','Noida',60000,6000,'2022-11-10'),
(1005,'Aarav','Gupta','Sales', NULL,45000,2500,'2024-03-01'),
(1006,'Vivaan','Sharma','Marketing','Mumbai',52000,4000,'2023-07-15'),
(1007,'Aditya','Singh','Finance','Pune',65000,NULL,'2021-09-21'),
(1008,'Krishna','Verma','HR',NULL,47000,3500,'2024-02-14'),
(1009,'Rohan','Mehta','Sales','Jaipur',49000,3000,'2022-12-05'),
(1010,'Arjun','Kumar','IT','Bangalore',72000,9000,'2021-06-30'),
(1011,'Mohit','Yadav','Operations','Lucknow',51000,4000,'2023-04-08'),
(1012,'Ayush','Saxena','Marketing','Mumbai',56000,4500,'2022-10-17'),
(1013,'Harsh','Agarwal','Finance','Pune',68000,8500,'2021-11-22'),
(1014,'Karan','Malhotra','HR','Delhi',50000,3200,'2023-08-12'),
(1015,'Yash','Chauhan','Sales','Jaipur',53000,3800,'2022-05-28'),
(1016,'Dev','Bansal','IT','Bangalore',75000,10000,'2021-03-16'),
(1017,'Manav','Jain','Operations','Lucknow',54000,4200,'2023-01-09'),
(1018,'Dhruv','Arora','Marketing','Mumbai',59000,5000,'2022-07-13'),
(1019,'Aman','Tiwari','Sales','Delhi',47000,2800,'2024-04-25');

DELETE FROM EMP_INFO;



-- DISTINCT = Consider only unique values and ignore duplicates

/*  COUNT() AGGREGATION FUNCTIONS*/

SELECT COUNT(*) AS 'TOTAL EMPLOYEES'     -- Returns the total number of orders.
FROM EMP_INFO;

UPDATE EMP_INFO
SET BONUS = NULL
WHERE EMP_ID = 1001;

SELECT COUNT(BONUS)						-- Counts only rows where BONUS is NOT NULL.
FROM EMP_INFO;

SELECT COUNT(DISTINCT DEPARTMENT) AS ' TOTAL NUMBERS OF DEPARTMENT'	-- Count the number of unique (non-NULL) values in a column.
FROM EMP_INFO;

/*  SUM() AGGREGATION FUNCTIONS*/

SELECT SUM(SALARY) AS 'TOTAL EMPLOYEE SALARY'
FROM EMP_INFO;

SELECT SUM(DISTINCT SALARY) AS 'TOTAL EMPLOYEE SALARY'
FROM EMP_INFO;

SELECT SUM(SALARY) AS 'SALARY',
		DEPARTMENT
FROM EMP_INFO
GROUP BY DEPARTMENT;

SELECT SUM(SALARY) AS '$'
FROM EMP_INFO WHERE CITY = 'NOIDA'
AND DEPARTMENT = 'it';

/*  AVG() AGGREGATION FUNCTIONS*/

	-- AVG() returns the arithmetic mean (average) of a numeric column.
    
    -- AVG() = SUM(column) / COUNT(column)
    
SELECT department,
		count(BONUS) AS ' TOTAL NO. OF BONUS',
		count(distinct BONUS) AS ' distinct BONUS',
		sum(BONUS)  AS ' TOTAL BONUS',
		sum(distinct BONUS)  AS ' distinct BONUS',
        AVG(BONUS),
        AVG(distinct BONUS)
from emp_info
group by department;

/*  MIN() AGGREGATION FUNCTIONS*/

SELECT FIRST_NAME,
       LAST_NAME,
       SALARY AS ' MINIMUM SALARY EMP'
FROM EMP_INFO
WHERE SALARY = (
	SELECT MIN(SALARY) 
    FROM EMP_INFO);


SELECT COUNT(*)
FROM EMP_INFO
WHERE BONUS = (
    SELECT MIN(BONUS) 
    FROM EMP_INFO
);

/*  MAX() AGGREGATION FUNCTIONS*/

SELECT COUNT(*)
FROM EMP_INFO
WHERE BONUS = (
    SELECT MAX(BONUS) 
    FROM EMP_INFO
);

SELECT DEPARTMENT,
       MIN(SALARY),
       MAX(SALARY)
FROM EMP_INFO
GROUP BY DEPARTMENT;

SELECT FIRST_NAME,
       LAST_NAME,
       SALARY,
       CASE
           WHEN SALARY = (SELECT MIN(SALARY) FROM EMP_INFO)
           THEN 'MIN SALARY'

           WHEN SALARY = (SELECT MAX(SALARY) FROM EMP_INFO)
           THEN 'MAX SALARY'
       END AS SALARY_TYPE
FROM EMP_INFO
WHERE SALARY IN (
      (SELECT MIN(SALARY) FROM EMP_INFO),
      (SELECT MAX(SALARY) FROM EMP_INFO)
)
ORDER BY SALARY DESC;




