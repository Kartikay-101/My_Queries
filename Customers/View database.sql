
select * from customers;

delete from customers
where rating is null;

ALTER TABLE customers
DROP COLUMN product,
DROP COLUMN payment_mode;
ROLLBACK;

delete from customers;

select * from customers
where price_per_unit > (
select avg(price_per_unit) 
from customers
);


select *
from customers;

SELECT *
FROM customers
WHERE city IN (
    SELECT city
    FROM customers
    WHERE category = 'Electronics'
);