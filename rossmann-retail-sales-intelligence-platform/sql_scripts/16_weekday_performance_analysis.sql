USE rossmann_sales_mysql;
SELECT
	tv.DayOfWeek AS day_of_week,
    SUM(tv.sales) AS total_sales,
	SUM(tv.customers) AS total_customers,
	AVG(tv.sales) AS average_sales,
	AVG(tv.customers) AS average_customers
FROM train_store_enriched_view tv
GROUP BY
	tv.DayOfWeek
ORDER BY
	total_sales DESC;