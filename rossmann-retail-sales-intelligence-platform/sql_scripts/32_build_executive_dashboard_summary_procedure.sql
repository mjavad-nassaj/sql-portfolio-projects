USE rossmann_sales_mysql;
DELIMITER $$
DROP PROCEDURE IF EXISTS executive_dashboard_summary_procedure $$
CREATE PROCEDURE executive_dashboard_summary_procedure()
BEGIN
    SELECT
        SUM(sds.sales) AS total_sales,
        SUM(sds.customers) AS total_customers,
        ROUND(SUM(sds.sales) / NULLIF(COUNT(DISTINCT sds.date), 0), 2) AS average_daily_sales,
        ROUND(SUM(sds.sales) / NULLIF(COUNT(DISTINCT sds.store), 0), 2) AS average_sales_per_store
    FROM store_daily_summary sds;
    SELECT
        sms.sales_year,
        sms.sales_month,
        SUM(sms.total_sales) AS monthly_total_sales
    FROM store_monthly_summary sms
    GROUP BY
        sms.sales_year,
        sms.sales_month
    ORDER BY
        monthly_total_sales DESC
    LIMIT 1;
    SELECT
        sms.sales_year,
        sms.sales_month,
        SUM(sms.total_sales) AS monthly_total_sales
    FROM store_monthly_summary sms
    GROUP BY
        sms.sales_year,
        sms.sales_month
    ORDER BY
        monthly_total_sales ASC
    LIMIT 1;
    SELECT
        sms.store,
        SUM(sms.total_sales) AS store_total_sales
    FROM store_monthly_summary sms
    GROUP BY
        sms.store
    ORDER BY
        store_total_sales DESC
    LIMIT 1;
    SELECT
        sms.store,
        SUM(sms.total_sales) AS store_total_sales
    FROM store_monthly_summary sms
    GROUP BY
        sms.store
    ORDER BY
        store_total_sales ASC
    LIMIT 1;
END $$
DELIMITER ;