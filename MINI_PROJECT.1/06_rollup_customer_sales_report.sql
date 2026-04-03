USE sql_store;
SELECT
	city,
    customer_level,
    SUM(total_spent) AS total_spent,
    COUNT(*) AS number_of_customer
FROM customer_sales_summary
GROUP BY 
    city,
    customer_level WITH ROLLUP;