-- joining tables for deep insights
SELECT 
    o.order_id,
    o.customer_id,
    o.order_status,
    o.order_purchase_timestamp,
    o.order_delivered_customer_date,
    
    i.product_id,
    i.seller_id,
    i.price,
    i.freight_value,
    
    r.review_score,
    r.review_comment_title,
    r.review_comment_message,
    
    p.product_category_name,
    p.product_name_lenght,
    p.product_description_lenght,
    p.product_photos_qty,
    
    s.seller_city,
    s.seller_state

FROM rdbms.olist_orders_dataset o
JOIN rdbms.olist_order_items_dataset i 
    ON o.order_id = i.order_id

LEFT JOIN rdbms.olist_order_reviews_dataset r 
    ON o.order_id = r.order_id

LEFT JOIN rdbms.olist_products_dataset p 
    ON i.product_id = p.product_id

LEFT JOIN rdbms.olist_sellers_dataset s 
    ON i.seller_id = s.seller_id;
    
-- most common product category per seller
-- used advanced sql 
-- used rank(),partition() present in window functions
WITH seller_products AS (
  SELECT 
    i.seller_id,
    p.product_category_name,
    COUNT(*) AS cnt
  FROM rdbms.olist_order_items_dataset as i
  JOIN rdbms.olist_products_dataset p ON i.product_id = p.product_id
  GROUP BY i.seller_id, p.product_category_name
),
ranked_products AS (
  SELECT *,
         RANK() OVER (PARTITION BY seller_id ORDER BY cnt DESC) AS rnk
  FROM seller_products
)
SELECT * 
FROM ranked_products
WHERE rnk = 1;


-- used recursive  cte to generate a calendar
WITH RECURSIVE calendar AS (
  SELECT DATE('2017-01-01') AS dt
  UNION ALL
  SELECT DATE_ADD(dt, INTERVAL 1 DAY)
  FROM calendar
  WHERE dt < '2017-12-31'
)
SELECT * FROM calendar;

-- find the second most selling product in the market
SELECT 
    p.product_id,
    p.product_category_name,
    COUNT(*) AS total_units_sold
FROM rdbms.olist_order_items_dataset i
JOIN rdbms.olist_products_dataset p ON i.product_id = p.product_id
GROUP BY p.product_id, p.product_category_name
ORDER BY total_units_sold DESC
LIMIT 1 OFFSET 1;
-- using sql subquery for deeper insight
-- orders with the highest frieght charges
SELECT 
    o.order_id,
    o.customer_id,
    i.freight_value
FROM rdbms.olist_orders_dataset as  o
JOIN rdbms.olist_order_items_dataset i ON o.order_id = i.order_id
WHERE i.freight_value = (
    SELECT MAX(freight_value)
    FROM rdbms.olist_order_items_dataset
);
-- result shows that no entry has highest fright charges



