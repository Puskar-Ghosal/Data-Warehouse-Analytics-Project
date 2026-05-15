USE DataWarehouseAnalytics

-- Analyze Sales Performance Over Time 

SELECT 
	YEAR(order_date) order_year ,
	SUM(sales_amount) total_sales,
	COUNT(DISTINCT customer_key) AS total_customers ,-- How many unique customers purchase this year 
	SUM(quantity) AS total_quantity,
	RANK() OVER (ORDER BY SUM(sales_amount)DESC) flag
FROM gold.fact_sales
WHERE YEAR(order_date) IS NOT NULL
GROUP BY YEAR(order_date)
ORDER BY flag

-- Formatting 

SELECT 
	FORMAT(order_date,'yyyy-MMM') order_year ,
	SUM(sales_amount) total_sales,
	COUNT(DISTINCT customer_key) AS total_customers ,-- How many unique customers purchase this year 
	SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE FORMAT(order_date,'yyyy-MMM') IS NOT NULL
GROUP BY FORMAT(order_date,'yyyy-MMM')
ORDER BY FORMAT(order_date,'yyyy-MMM')

-- Using DATETRUNC

SELECT 
	DATETRUNC(MONTH , order_date) order_year ,
	SUM(sales_amount) total_sales,
	COUNT(DISTINCT customer_key) AS total_customers ,-- How many unique customers purchase this year 
	SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE DATETRUNC(MONTH , order_date) IS NOT NULL
GROUP BY DATETRUNC(MONTH , order_date)
ORDER BY DATETRUNC(MONTH , order_date)