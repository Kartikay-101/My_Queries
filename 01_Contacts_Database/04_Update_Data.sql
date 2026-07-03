-- ==========================
-- UPDATE OPERATIONS (DML)
-- ==========================

-- Update a single record
UPDATE personal_info
SET phone_no = 1234567890
WHERE name = 'Ayush Saxena';

-- Update multiple records using IN
UPDATE personal_info
SET blood_group = 'NA'
WHERE blood_group IN ('B-', 'AB+', 'B+');

-- Update multiple columns using CASE
UPDATE personal_info
SET
    phone_no = CASE
        WHEN serial_no = 1 THEN NULL
        ELSE phone_no
    END,
    gmail = CASE
        WHEN name = 'Shubham Suneel' THEN 'error'
        ELSE gmail
    END
WHERE name = 'Shubham Suneel'
   OR serial_no = 1;

-- Update a single column
UPDATE family_info
SET bhabhi_maa = 'Shubhangi Nautiyal'
WHERE name = 'Kartikay Nautiyal';

-- Set all values in a column to NULL
UPDATE family_info
SET bhabhi_maa = NULL;

-- Update using CASE (single condition)
UPDATE personal_info
SET phone_no = CASE
    WHEN name = 'Shubham Suneel' THEN 101
    ELSE phone_no
END
WHERE name = 'Shubham Suneel';

alter table family_info
add column Bhabhi_Maa varchar(20);



ALTER TABLE PERSONAL_INFO
MODIFY COLUMN PHONE_NO varchar(20) NOT NULL;		-- HERE I HAVE NULL CONSTRAINTS


ALTER TABLE PERSONAL_INFO
MODIFY COLUMN DOB DATE DEFAULT (current_date);

ALTER TABLE personal_info
AUTO_INCREMENT = 1000;

ALTER TABLE EMP_INFO
MODIFY COLUMN DEPARTMENT VARCHAR(30);

UPDATE EMP_INFO
SET DEPARTMENT = null
WHERE CITY IN ('PUNE','DELHI');

ALTER TABLE PERSONAL_INFO
ADD COLUMN MANAGER_ID INT;

UPDATE PERSONAL_INFO
SET MANAGER_ID = CASE EMP_ID
    WHEN 1000 THEN NULL
    WHEN 1001 THEN 1000
    WHEN 1002 THEN 1000
    WHEN 1003 THEN 1001
    WHEN 1004 THEN 1001
    WHEN 1005 THEN 1002
    WHEN 1006 THEN 1002
    WHEN 1007 THEN 1003
    WHEN 1008 THEN 1003
    WHEN 1009 THEN 1004
    WHEN 1010 THEN 1004
    WHEN 1011 THEN 1000
    WHEN 1012 THEN 1000
    WHEN 1013 THEN 1011
    WHEN 1014 THEN 1011
    WHEN 1015 THEN 1012
    WHEN 1016 THEN 1012
    WHEN 1017 THEN 1000
    WHEN 1018 THEN 1000
    WHEN 1019 THEN 1017
END;