USE rossmann_sales_mysql;
SELECT
	tv.Store,
	SUM(tv.Sales) AS total_sales,
	SUM(tv.Customers) AS total_customers,
	AVG(tv.Sales) AS average_sales,
	AVG(tv.Customers) AS average_customers
FROM train_store_enriched_view tv
GROUP BY
	Store;