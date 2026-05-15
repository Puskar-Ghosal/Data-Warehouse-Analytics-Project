-- Which 5 products generate the highest revenue 

SELECT TOP 5
	p.product_name,
	p.product_key,
	SUM(f.sales_amount) AS Total_sales
FROM gold.dim_products p
LEFT JOIN 
gold.fact_sales f
ON p.product_key = f.product_key
GROUP BY p.product_name , p.product_key
ORDER BY Total_sales DESC

-- using RANK() function 

SELECT 
	product_name ,
	Total_sales
FROM
(
SELECT
	p.product_name,
	SUM(f.sales_amount) AS Total_sales,
	ROW_NUMBER() OVER (ORDER BY SUM(f.sales_amount) DESC) AS rank_products 
FROM gold.dim_products p
LEFT JOIN 
gold.fact_sales f
ON p.product_key = f.product_key
GROUP BY p.product_name 
) t 
WHERE rank_products <= 5

-- What are the 5 worst performing products in terms of sales ?

SELECT TOP 5
	p.product_name,
	p.product_key,
	SUM(f.sales_amount) AS Total_sales
FROM gold.dim_products p
INNER JOIN 
gold.fact_sales f
ON p.product_key = f.product_key
GROUP BY p.product_name , p.product_key
ORDER BY Total_sales 

-- Which 5 Categories generate the highest revenue 

SELECT TOP 5
	p.subcategory,
	SUM(f.sales_amount) AS Total_sales
FROM gold.fact_sales f
LEFT JOIN 
gold.dim_products p
ON p.product_key = f.product_key
GROUP BY p.subcategory
ORDER BY Total_sales DESC

-- find the top 10 customers who have generated the highest revenue 
-- and 3 customers with the fewest orders placed 

SELECT TOP 10 
	c.customer_key,
	c.first_name,
	c.last_name,
	SUM(f.sales_amount) AS total_sales
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers	c
ON c.customer_key = f.customer_key
GROUP BY 
	c.customer_key,
	c.first_name,
	c.last_name
ORDER BY total_sales DESC


SELECT TOP 3 
	c.customer_key,
	c.first_name,
	c.last_name,
	COUNT(DISTINCT order_number) AS Nr_of_Orders
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers	c
ON c.customer_key = f.customer_key
GROUP BY 
	c.customer_key,
	c.first_name,
	c.last_name
ORDER BY Nr_of_Orders 

