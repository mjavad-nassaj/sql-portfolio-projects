USE rossmann_sales_mysql;
SELECT
	tv.StoreType,
	SUM(tv.Sales) AS total_sales,
	SUM(tv.Customers) AS total_customers,
	AVG(Sales) AS average_sales,
	AVG(Customers) AS average_customers
FROM train_store_enriched_view tv
GROUP BY
	StoreType
ORDER BY
	total_sales DESC;