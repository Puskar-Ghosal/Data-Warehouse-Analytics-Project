-- Analyze the yearly performance of products by comparing each product's sales to both 
-- its average sales performance and the previous year's sales 

WITH yearly_sales_performance AS(
SELECT 
	YEAR(f.order_date) AS order_year ,
	p.product_name,
	SUM(f.sales_amount ) AS yearly_sales
FROM gold.fact_sales f
LEFT JOIN 
gold.dim_products p
ON f.product_key = p.product_key
WHERE order_date IS NOT NULL
GROUP BY YEAR(f.order_date), p.product_name
) ,

performance_analysis AS (
SELECT 
	product_name,
	order_year,
	yearly_sales AS current_sales,
	LAG(yearly_sales) OVER(PARTITION BY product_name ORDER BY order_year) AS previous_year_sales,
	yearly_sales - (LAG(yearly_sales) OVER(PARTITION BY product_name ORDER BY order_year) )AS performance_sales ,
	CASE 
		WHEN yearly_sales - (LAG(yearly_sales) OVER(PARTITION BY product_name ORDER BY order_year)) > 0 THEN 'Profit'
		WHEN yearly_sales - (LAG(yearly_sales) OVER(PARTITION BY product_name ORDER BY order_year)) < 0 THEN 'Loss'
		ELSE 'Neutral'  
	END AS Performance_Score, 
	AVG(yearly_sales) OVER(PARTITION BY product_name) aaverage_sales,
	yearly_sales - AVG(yearly_sales) OVER(PARTITION BY product_name) AS  diff_avg,
	CASE 
		WHEN yearly_sales - AVG(yearly_sales) OVER(PARTITION BY product_name) > 0 THEN 'Above Average'
		WHEN yearly_sales - AVG(yearly_sales) OVER(PARTITION BY product_name) < 0 THEN 'Bleow Average'
		ELSE 'Avg'
	END AS Average_Change
FROM yearly_sales_performance
)

SELECT 
	order_year,
	COUNT(*) Profit_Count 
FROM performance_analysis
WHERE Performance_Score = 'Profit'
GROUP BY order_year

--  in year 2013 , 62 different products gave us highest yearly sales record ( so currently we have to know what strategy we used in 2013 ) 

-- I;m very much interested in 2013 products 


SELECT 
	product_name
FROM performance_analysis
WHERE Performance_Score = 'Profit' AND order_year = 2013



-- Now to calculate how much we earn from that 62 products 

SELECT 
	SUM(current_sales) AS total_sales 
FROM performance_analysis
WHERE Performance_Score = 'Profit' AND order_year = 2013


