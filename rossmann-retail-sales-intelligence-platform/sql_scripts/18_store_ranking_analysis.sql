USE rossmann_sales_mysql;
SELECT
    s.store,
    s.total_sales,
    s.total_customers,
    s.sales_per_customer,
    RANK() OVER (ORDER BY total_sales DESC) AS sales_rank,
    RANK() OVER (ORDER BY total_customers DESC) AS customer_rank,
    RANK() OVER (ORDER BY sales_per_customer DESC) AS sales_per_customer_rank
FROM
(
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
) AS s;