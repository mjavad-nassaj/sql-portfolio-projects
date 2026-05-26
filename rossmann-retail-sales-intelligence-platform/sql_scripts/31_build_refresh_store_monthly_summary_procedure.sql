USE rossmann_sales_mysql;
DELIMITER $$
DROP PROCEDURE IF EXISTS refresh_store_monthly_summary $$
CREATE PROCEDURE refresh_store_monthly_summary()
BEGIN
	DELETE FROM store_monthly_summary;
    INSERT INTO store_monthly_summary
    (
		store,
		store_type,
		assortment,
		sales_year,
		sales_month,
		total_sales,
		total_customers,
		average_sales,
		average_customers,
		open_days,
		promo_days
    )
    SELECT
		sds.store,
        sds.store_type,
        sds.assortment,
        sds.sales_year,
		sds.sales_month,
        SUM(sds.sales) AS total_sales,
        SUM(sds.customers) AS total_customers,
        AVG(sds.sales) AS average_sales,
        AVG(sds.customers) AS average_customers,
        SUM(sds.open) AS open_days,
        SUM(sds.promo) AS promo_days
    FROM store_daily_summary sds
    GROUP BY
		sds.store,
        sds.store_type,
        sds.assortment,
        sds.sales_year,
        sds.sales_month;
END $$
DELIMITER ;