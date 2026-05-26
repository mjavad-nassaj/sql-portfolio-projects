USE rossmann_sales_mysql;
DROP VIEW IF EXISTS store_total_sales_summary_view;
CREATE VIEW store_total_sales_summary_view AS
SELECT
    tv.Store AS store,
    tv.StoreType AS store_type,
    SUM(tv.Sales) AS total_sales
FROM train_store_enriched_view tv
GROUP BY
    tv.Store,
    tv.StoreType;