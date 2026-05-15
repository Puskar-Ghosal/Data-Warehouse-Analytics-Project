-- find the dates of the first and last order of evry product 

SELECT 
	product_key ,
	MAX(order_date) AS Last_Order,
	Min(order_date) AS first_order
FROM gold.fact_sales
GROUP BY product_key
ORDER BY product_key

-- find the dates of first and last order 
-- How many years of sales are available 
SELECT 
	MIN(order_date) AS first_order ,
	MAX(order_date) AS lasst_order ,
	DATEDIFF( YEAR , MIN(order_date), MAX(order_date)) year_sales
FROM gold.fact_sales

-- Find the youngest and oldest customer

SELECT 
	MIN(birthdate) AS oldest,
	DATEDIFF(YEAR , MIN(birthdate) , GETDATE()) AS oldest_age,
	MAX(birthdate) AS youngest,
	DATEDIFF(YEAR , MAX(birthdate) , GETDATE()) AS youngest_age
FROM gold.dim_customers