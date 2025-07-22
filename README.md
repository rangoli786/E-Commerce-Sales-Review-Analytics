# E-commerce Sales & Review Analytics Using SQL

Advanced SQL queries and insights from Olist E-commerce dataset.

##  Project Overview

- Deep insights using advanced SQL
- Multiple table joins (Orders, Products, Reviews, Sellers)
- KPIs and performance metrics
- Cleaned and preprocessed dataset
###  ER Diagram

[ER Model](https://github.com/rangoli786/E-Commerce-Sales-Review-Analytics/blob/main/ER_Model.png?raw=true)

##  Files

- olist_orders.sql
- olist_products.sql
- olist_order_items.sql
- olist_reviews.sql
- project.sql (final queries)

##  Key Insights

-  Joined 5 Olist tables to generate a complete view of order lifecycle.
-  Identified each seller's most frequent product category using RANK() and PARTITION BY.
-  Generated a full year calendar using RECURSIVE CTE, useful for tracking missing or delayed deliveries.
-  Found the *2nd most sold product* using subquery and LIMIT OFFSET.
-  Detected order(s) with highest freight cost using nested subquery filtering.

##  Techniques Used
- Advanced Joins (INNER, LEFT JOIN)
- Subqueries
- Window Functions (RANK(), PARTITION BY)
- Recursive CTE
- Aggregation (GROUP BY, COUNT(*))
- Filtering (HAVING, LIMIT, OFFSET)

##  Contributors

- **Rangoli Bakshi**  
  GitHub: [@rangoli786](https://github.com/rangoli786)  
  LinkedIn: [Rangoli Bakshi](https://www.linkedin.com/in/rangoli-bakshi-83b8b0320)  
  Email: rangolibakshi59@gmail.com  

- **Tashu Singla**  
  GitHub: [@Tashusingla2003](https://github.com/Tashusingla2003)  
  LinkedIn: [Tashuqy Singla](https://www.linkedin.com/in/tashuqy-singla)  
  Email: tashusingla03@gmail.com  
