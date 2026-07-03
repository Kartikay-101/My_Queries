
		-- Recursive CTE = A recursive CTE is a CTE that references itself. It repeatedly executes until a stopping condition is reached.
        
	-- Recursive CTEs are used for:

	-- Employee → Manager hierarchies
	-- Organization charts
	-- Folder and directory structures
	-- Category/subcategory trees
	-- Bill of materials
	-- Family trees
	-- Generating number sequences
	-- Generating date ranges
        
/* Write a recursive CTE that generates numbers from 1 to 20. */
WITH RECURSIVE NUMBERS AS 
(	SELECT 1 AS NUM
		UNION
	SELECT NUM + 1
    FROM NUMBERS
    WHERE NUM < 20
)
SELECT NUM FROM NUMBERS;

-- Employee → Manager hierarchies
WITH RECURSIVE employee_hierarchy AS
(
    -- Anchor Query (Top-level managers)
    SELECT
        employee_id,
        first_name,
        manager_id,
        1 AS level
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    -- Recursive Query (Employees reporting to previous level)
    SELECT
        e.employee_id,
        e.first_name,
        e.manager_id,
        eh.level + 1
    FROM employees e
    JOIN employee_hierarchy eh
        ON e.manager_id = eh.employee_id
)

SELECT *
FROM employee_hierarchy
ORDER BY level, employee_id;

