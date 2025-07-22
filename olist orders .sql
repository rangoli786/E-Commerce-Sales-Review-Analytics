-- step 1 inpecting my dataset
SELECT * FROM rdbms.olist_orders_dataset;
-- step 2 description of my dataset
describe rdbms.olist_orders_dataset;
-- show first 10 entries of the table
select*from rdbms.olist_orders_dataset limit 10;
-- step2 checking null values/missing data
SELECT COUNT(*) - COUNT(customer_id) AS missing_products FROM rdbms.olist_orders_dataset;
-- step 3 removing duplicates
SELECT customer_id,order_id, COUNT(*) AS count
FROM rdbms.olist_orders_dataset
GROUP BY customer_id,order_id
HAVING COUNT(*) > 1;
-- step 4 sorting my dataset
SELECT * FROM rdbms.olist_orders_dataset order by  order_id Desc;