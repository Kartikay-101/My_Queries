
		-- DELETE OPERATION

drop database if exists Employee_Data;		-- THIS WILL DELETE DATABASE IF EXISTS.

truncate personal_info; -- this help to remove data from row but structure remain same.

truncate family_info; -- this help to remove data from row but structure remain same.

drop table personal_info;			-- THIS WILL DELETE TABLE.

drop table family_info;				-- THIS WILL DELETE TABLE.

delete from family_info;			-- THIS WILL DELETE DATA FROM RAW NOT THE STRUCTURE
delete from personal_info;			-- THIS WILL DELETE DATA FROM RAW NOT THE STRUCTURE

DELETE FROM family_info
WHERE Name IN ('Aditya Singh', 'shubham suneel');
DELETE FROM PERSONAL_INFO
WHERE Name IN ('Aditya Singh', 'shubham suneel');

alter table personal_info		-- THIS WILL REMOVE ENTIRE COLUMN
drop Blood_group;

ALTER TABLE personal_info
DROP COLUMN SERIAL_NO;
