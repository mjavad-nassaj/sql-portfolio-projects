USE rossmann_sales_mysql;
SELECT
    X.store,
    X.total_sales,
    X.total_customers,
    X.sales_per_customer
FROM 
(
    SELECT
        sms.store,
        SUM(sms.total_sales) AS total_sales,
        SUM(sms.total_customers) AS total_customers,
        ROUND(SUM(sms.total_sales) / NULLIF(SUM(sms.total_customers), 0), 2) AS sales_per_customer
    FROM store_monthly_summary sms
    GROUP BY
        sms.store
) AS X
ORDER BY 
    X.total_sales DESC
LIMIT 10;

SELECT
    X.store,
    X.total_sales,
    X.total_customers,
    X.sales_per_customer
FROM 
(
    SELECT
        sms.store,
        SUM(sms.total_sales) AS total_sales,
        SUM(sms.total_customers) AS total_customers,
        ROUND(SUM(sms.total_sales) / NULLIF(SUM(sms.total_customers), 0), 2) AS sales_per_customer
    FROM store_monthly_summary sms
    GROUP BY
        sms.store
) AS X
ORDER BY 
    X.total_sales ASC
LIMIT 10;

SELECT
    X.store,
    X.total_sales,
    X.total_customers,
    X.sales_per_customer
FROM 
(
    SELECT
        sms.store,
        SUM(sms.total_sales) AS total_sales,
        SUM(sms.total_customers) AS total_customers,
        ROUND(SUM(sms.total_sales) / NULLIF(SUM(sms.total_customers), 0), 2) AS sales_per_customer
    FROM store_monthly_summary sms
    GROUP BY
        sms.store
) AS X
ORDER BY 
    X.sales_per_customer DESC
LIMIT 10;

SELECT
    X.store,
    X.total_sales,
    X.total_customers,
    X.sales_per_customer
FROM 
(
    SELECT
        sms.store,
        SUM(sms.total_sales) AS total_sales,
        SUM(sms.total_customers) AS total_customers,
        ROUND(SUM(sms.total_sales) / NULLIF(SUM(sms.total_customers), 0), 2) AS sales_per_customer
    FROM store_monthly_summary sms
    GROUP BY
        sms.store
) AS X
ORDER BY 
    X.sales_per_customer ASC
LIMIT 10;