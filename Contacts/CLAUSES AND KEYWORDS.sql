/* Clause		Purpose
SELECT		What columns to display
FROM		Which table to read from
WHERE		Which rows to filter
GROUP BY	How to group rows
HAVING		How to filter groups
ORDER BY	How to sort results
LIMIT		How many rows to return   */
 
 -- HAVING CLAUSE
 
	-- HAVING is a clause used to filter groups after GROUP BY has been applied.
        
/* Simple Definition

WHERE filters rows.

HAVING filters groups.  */

/*				WHERE vs HAVING
	WHERE							HAVING
Filters rows					Filters groups
Runs before GROUP BY			Runs after GROUP BY
Cannot use aggregate functions	Can use aggregate functions
WHERE CITY='Noida'				HAVING AVG(SALARY)>60000		*/


-- EXAMPLE

USE EMPLOYEE_DATA;

SELECT DEPARTMENT,
      round( AVG(SALARY),3)
FROM EMP_INFO
GROUP BY DEPARTMENT
HAVING AVG(SALARY) > 60000;


SELECT DEPARTMENT,
		COUNT(*) AS 'TOTAL EMP'
FROM EMP_INFO
GROUP BY DEPARTMENT
HAVING COUNT(*) >=3;

SELECT DEPARTMENT,
		COUNT(*)AS 'Employee Count',
		AVG(SALARY) AS 'TOTAL SALARY'
FROM EMP_INFO
GROUP BY DEPARTMENT
HAVING AVG(SALARY) > 55000
AND COUNT(*) >= 3;


SELECT AVG(SALARY)
FROM EMP_INFO
HAVING avg(SALARY) > 10000 ;


		-- JOIN CLAUSE
        
	-- IT IS USED TO JOIN 2 OR MORE TABLES USUALLY FROM PRIMARY KEY AND FOREIGN KEY RELATIONSHIP
    
    -- INNER JOIN = ITS IS UDED TO COMBINE THE ROWS THAT HAVE THE MATCHING VALUES
    
    
 SELECT P.EMP_ID,
		E.FIRST_NAME,
		E.LAST_NAME
        FROM personal_info P
        INNER JOIN emp_info E
        ON P.EMP_ID = E.EMP_ID
        ORDER BY NAME ASC;
    
		-- LEFT JOIN - KEEL ALL THE VALUE OF LEFT TABLE EXCEPT NULL values
	
    SELECT P.EMP_ID,
		E.FIRST_NAME,
		E.LAST_NAME
        FROM personal_info P
        LEFT JOIN emp_info E
        ON P.EMP_ID = E.EMP_ID
        ORDER BY NAME ASC;
        
        -- RIGHT JOIN
        
 SELECT P.EMP_ID,
		E.FIRST_NAME,
		E.LAST_NAME
        FROM personal_info P
        RIGHT JOIN emp_info E
        ON P.EMP_ID = E.EMP_ID
        ORDER BY NAME ASC;
        
    DELETE FROM emp_info
    WHERE EMP_ID = 1002;
--     
    SELECT * FROM emp_info
    ORDER BY FIRST_NAME ASC;
    
    
    -- SELF JOIN
    
CREATE TABLE EMP_HIERARCHY(
		EMP_ID INT PRIMARY KEY,
    MANAGER_ID INT,
    
    FOREIGN KEY (EMP_ID)
    REFERENCES personal_info(EMP_ID)        
);

INSERT INTO EMP_HIERARCHY
(EMP_ID, MANAGER_ID)
VALUES
(1000, NULL),   -- Kartikay
(1001, 1000),   -- Nishant reports to Kartikay
(1002, 1000),   -- Shubham reports to Kartikay
(1003, 1001),   -- Sambhav reports to Nishant
(1004, 1001);   -- Sarthak reports to Nishant

SELECT
	P1.EMP_ID,
    P1.NAME AS EMPLOYEE,
    P2.NAME AS MANAGER
FROM EMP_HIERARCHY EH
LEFT JOIN personal_info P1
    ON EH.EMP_ID = P1.EMP_ID
LEFT JOIN personal_info P2
    ON EH.MANAGER_ID = P2.EMP_ID;
    
    
SELECT P1.EMP_ID,
		P1.NAME,
        P2.NAME
FROM EMP_HIERARCHY EH
LEFT JOIN personal_info P1
ON EH.EMP_ID = P1.EMP_ID
LEFT JOIN personal_info P2
ON EH.MANAGER_ID = P2.EMP_ID