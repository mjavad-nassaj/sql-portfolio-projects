USE rossmann_sales_mysql;
DROP VIEW IF EXISTS store_total_sales_by_assortment_summary_view;
CREATE VIEW store_total_sales_by_assortment_summary_view AS
SELECT
	tv.store,
	tv.assortment,
	SUM(tv.Sales) AS total_sales
FROM train_store_enriched_view tv
GROUP BY
	tv.store,
	tv.assortment;