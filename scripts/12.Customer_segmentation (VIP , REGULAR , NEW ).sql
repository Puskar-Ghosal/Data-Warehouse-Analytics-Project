/* Group customers into three segments based on their spending beehavior :
 - VIP : Customers with at least 12 months of history and spending more that 5000 
 - Regular : Customers with at least 12 months of history and spending betwween 5000 or less 
 - New : Customers with a lifespace less than 12 months .
 And find the total numbers of customers in each group .
*/

WITH cte AS 
(
SELECT 
	f.customer_key , 
	MAX(order_date)  last_order,
	MIN(order_date)  first_order,
	DATEDIFF(MONTH , MIN(order_date) , MAX(order_date) ) AS life_span,
	SUM(f.sales_amount ) AS total_spending

FROM gold.fact_sales f
LEFT JOIN 
gold.dim_customers c 
ON f.customer_key = c.customer_key
GROUP BY f.customer_key
) ,
customer_segmentation AS (
SELECT 
	customer_key,
	CASE 
		WHEN life_span >= 12 AND total_spending > 5000  THEN 'VIP' 
		WHEN life_span >= 12 AND total_spending <= 5000 THEN 'Regular'
		ELSE 'New'
	END customer_segmentation 
FROM cte
)

SELECT 
	customer_segmentation ,
	COUNT(customer_key) AS total_customers 
FROM customer_segmentation
--WHERE customer_segmentation IS NOT NULL 
GROUP BY customer_segmentation
ORDER  BY COUNT(customer_key) DESC

-- hence we can say that new customers are much more than the other customers 
