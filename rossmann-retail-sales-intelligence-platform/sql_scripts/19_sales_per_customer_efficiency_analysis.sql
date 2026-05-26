USE rossmann_sales_mysql;
SELECT
	tv.Store AS store,
	SUM(tv.Sales) AS total_sales,
	SUM(tv.Customers) AS total_customers,
	CASE
		WHEN SUM(tv.Customers) = 0 THEN 0
		ELSE SUM(tv.Sales) / SUM(tv.Customers)
	END AS sales_per_customer
FROM train_store_enriched_view tv
GROUP BY tv.Store
ORDER BY
	sales_per_customer DESC;