USE rossmann_sales_mysql;
SELECT
	SUM(tv.Sales) AS total_sales,
	SUM(tv.Customers) AS total_customers,
	SUM(tv.Sales)/COUNT(DISTINCT Date) AS average_daily_sales,
	SUM(tv.Sales)/COUNT(DISTINCT Store) AS average_sales_per_store
FROM train_store_enriched_view tv