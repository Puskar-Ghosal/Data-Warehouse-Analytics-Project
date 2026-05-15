-- Segment product into costs ranges and 
-- count how many products fall into each segment 



WITH product_segment AS 
(
SELECT 
	product_key,
	product_name,
	cost,
	CASE 
		WHEN cost <= 100 THEN 'Below 100'
		WHEN cost BETWEEN 100 AND 500 THEN '100-500'
		WHEN cost BETWEEN 500 AND 1000 THEN '500-1000'
		ELSE 'Above 1000'
	END cost_category
FROM gold.dim_products
)
SELECT 
	cost_category,
	COUNT(product_key) AS total_products
FROM product_segment
GROUP BY cost_category
ORDER BY COUNT(product_key)DESC
--  It means the maximum products are in range of 100 to 500 

/* Group customers into three segments based on their spending beehavior :
 - VIP : Customers with at least 12 months of history and spending more that 5000 
 - Regular : Customers with at least 12 months of history and spending betwween 5000 or less 
 - New : Customers with a lifespace less than 12 months .
 And find the total numbers of customers in each group .
*/
