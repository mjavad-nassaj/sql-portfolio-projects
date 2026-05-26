USE rossmann_sales_mysql;
SELECT
	tv.Store,
    tv.Date,
    week(Date,1) AS week_number_in_year,
    year(Date) AS year,
    month(Date) AS month,
    quarter(Date) AS quarter
FROM train_store_enriched_view tv;