USE rossmann_sales_mysql;
SELECT
	tv.SchoolHoliday,
    SUM(tv.sales) AS total_sales,
	SUM(tv.customers) AS total_customers,
	AVG(tv.sales) AS average_sales,
	AVG(tv.customers) AS average_customers
FROM train_store_enriched_view tv
GROUP BY
	tv.SchoolHoliday
ORDER BY
	total_sales DESC;