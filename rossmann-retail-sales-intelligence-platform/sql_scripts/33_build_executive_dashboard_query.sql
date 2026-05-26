USE rossmann_sales_mysql;
SELECT
    X.total_sales,
    X.total_customers,
    X.average_daily_sales,
    X.average_sales_per_store,
    X.promo_share,
    X.best_month,
    X.worst_month,
    X.best_store,
    X.weakest_store
FROM 
(
    SELECT
        SUM(sds.sales) AS total_sales,
        SUM(sds.customers) AS total_customers,
        ROUND(SUM(sds.sales) / NULLIF(COUNT(DISTINCT sds.date), 0), 2) AS average_daily_sales,
        ROUND(SUM(sds.sales) / NULLIF(COUNT(DISTINCT sds.store), 0), 2) AS average_sales_per_store,
        ROUND(
            SUM(CASE WHEN sds.promo = 1 THEN sds.sales ELSE 0 END) 
            / NULLIF(SUM(sds.sales), 0),
            4
        ) AS promo_share,
        (
            SELECT
                CONCAT(sms.sales_year, '-', LPAD(sms.sales_month, 2, '0'))
            FROM store_monthly_summary sms
            GROUP BY
                sms.sales_year,
                sms.sales_month
            ORDER BY
                SUM(sms.total_sales) DESC
            LIMIT 1
        ) AS best_month,
        (
            SELECT
                CONCAT(sms.sales_year, '-', LPAD(sms.sales_month, 2, '0'))
            FROM store_monthly_summary sms
            GROUP BY
                sms.sales_year,
                sms.sales_month
            ORDER BY
                SUM(sms.total_sales) ASC
            LIMIT 1
        ) AS worst_month,
        (
            SELECT
                sds2.store
            FROM store_daily_summary sds2
            GROUP BY
                sds2.store
            ORDER BY
                SUM(sds2.sales) DESC
            LIMIT 1
        ) AS best_store,
        (
            SELECT
                sds3.store
            FROM store_daily_summary sds3
            GROUP BY
                sds3.store
            ORDER BY
                SUM(sds3.sales) ASC
            LIMIT 1
        ) AS weakest_store
    FROM store_daily_summary sds
) AS X;