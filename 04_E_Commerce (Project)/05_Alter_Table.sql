
	-- ADD A NEW COLUMN
ALTER TABLE product_price_audit
ADD COLUMN PRODUCT_ID INT AFTER PRODUCT_AUDIT_ID;

ALTER TABLE customers_entry_exit
auto_increment = 100;

ALTER TABLE customers_entry_exit
ADD COLUMN MESSAGE VARCHAR (200);