-- step 1 inspecting  my data
-- show step 1 all entries of the table
SELECT * FROM rdbms.olist_order_items_dataset;
-- show step 2 structure of the table
describe rdbms.olist_order_items_dataset;
--  step 3 show first 10 entries of the table
select*from rdbms.olist_order_items_dataset limit 10;
-- step 4 checking null values/missing data
SELECT COUNT(*) - COUNT(product_id) AS missing_products FROM rdbms.olist_order_items_dataset;
-- step 5 removing duplicates
SELECT seller_id, COUNT(*) 
FROM rdbms.olist_order_items_dataset
GROUP BY seller_id
HAVING COUNT(*) > 1;
-- step 6 sorting my dataset
SELECT * FROM rdbms.olist_order_items_dataset order by  seller_id Desc;

