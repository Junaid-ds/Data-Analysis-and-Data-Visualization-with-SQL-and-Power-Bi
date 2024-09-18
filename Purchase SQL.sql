
CREATE TEMPORARY TABLE temp_unique_customer (
    unique_customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255));
INSERT INTO temp_unique_customer (customer_name)
SELECT DISTINCT customername
FROM customer_purchase_data;
ALTER TABLE customer_purchase_data
ADD COLUMN unique_customer_id INT;
set sql_safe_updates=0;
UPDATE customer_purchase_data p
JOIN temp_unique_customer uc ON p.customername = uc.customer_name
SET p.unique_customer_id = uc.unique_customer_id;
DROP TEMPORARY TABLE temp_unique_customer;

select * from customer_purchase_data;

CREATE TEMPORARY TABLE temp_unique_customer (
    unique_product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255));
INSERT INTO temp_unique_customer (product_name)
SELECT DISTINCT productname
FROM customer_purchase_data;
ALTER TABLE customer_purchase_data
ADD COLUMN unique_product_id INT;
set sql_safe_updates=0;
UPDATE customer_purchase_data p
JOIN temp_unique_customer uc ON p.productname = uc.product_name
SET p.unique_product_id = uc.unique_product_id;
DROP TEMPORARY TABLE temp_unique_customer;

select * from customer_purchase_data;

alter table customer_purchase_data drop column CustomerID;

alter table customer_purchase_data drop column ProductID;

select * from customer_purchase_data;

update customer_purchase_data
set unique_customer_id = unique_customer_id + 6000;

update customer_purchase_data
set unique_product_id = unique_product_id + 300;

select * from customer_purchase_data;

alter table customer_purchase_data
drop column sales;

alter table customer_purchase_data
add column sales integer default 0;


create temporary table temp(
unique_product_id integer primary key,
productname varchar(255),
price decimal(10, 2)
);

alter table temp 
add column sales integer default 0;

select * from temp;

drop temporary table temp;

select unique_customer_id, sum(purchaseprice*PurchaseQuantity) as total_purchases
from customer_purchase_data
group by unique_customer_id;






