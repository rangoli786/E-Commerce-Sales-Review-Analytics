-- step 1 inpecting my dataset
SELECT * FROM rdbms.olist_products_dataset;
-- step 2 description of my dataset
describe rdbms.olist_products_dataset;
-- show first 10 entries of the table
select*from rdbms.olist_products_dataset limit 10;
-- step2 checking null values/missing data
SELECT COUNT(*) - COUNT(product_id) AS missing_products FROM rdbms.olist_products_dataset;
-- step 3 removing duplicates
SELECT product_id, COUNT(*) AS count
FROM rdbms.olist_products_dataset
GROUP BY product_id
HAVING COUNT(*) > 1;
-- step 4 sorting my dataset
SELECT * FROM rdbms.olist_products_dataset order by  product_id Desc;
