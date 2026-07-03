alter table orders     /* table changes from orders to customers*/ 
rename to customers;


truncate table customers;  -- to delete the rows of table customers

update customers			-- Updating a Single Row
set order_status = 'Delivered'
where order_id=10;

set sql_safe_updates = 0;	-- it will remove the safety of data duplicay in database

UPDATE customers  			-- Updating Multiple Columns
SET discount_percent = 10,
    rating = 4
WHERE customer_name = 'Neha Verma';

update customers				-- Updating Multiple Rows
set discount_percent = 1
where discount_percent < 6;



update customers
set customer_name = null where order_status = 'delivered';
ROLLBACK;