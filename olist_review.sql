-- step 1 inspecting my dataset
SELECT * FROM rdbms.olist_order_reviews_dataset;
-- step 2 description of my dataset
describe rdbms.olist_order_reviews_dataset;
-- show first 10 entries of the table
select*from rdbms.olist_order_reviews_dataset limit 10;
-- step2 checking null values/missing data
SELECT COUNT(*) - COUNT(review_id) AS missing_products FROM rdbms.olist_order_reviews_dataset ;
-- step 3 removing duplicates
SELECT review_id,order_id, COUNT(*) AS count
FROM rdbms.olist_order_reviews_dataset
GROUP BY review_id,order_id
HAVING COUNT(*) > 1;
-- step 4 sorting my dataset
SELECT * FROM rdbms.olist_order_reviews_dataset order by  review_id Desc;
select * from pizzahut.olist_order_items_dataset;

SELECT DISTINCT oi.product_id
FROM rdbms.olist_order_items_dataset oi
LEFT JOIN rdbms.olist_products_dataset as p
ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;
SELECT * 
FROM rdbms.olist_order_items_dataset
WHERE product_id NOT IN (
    SELECT product_id FROM rdbms.olist_products_dataset
);