USE sql_store;
TRUNCATE TABLE customer_sales_summary;
INSERT INTO customer_sales_summary (
    customer_id,
    full_name,
    city,
    total_orders,
    first_order_date,
    last_order_date,
    total_spent,
    avg_order_value,
    customer_level
)
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    c.city,
    COUNT(ofs.order_id) AS total_orders,
    MIN(ofs.order_date) AS first_order_date,
    MAX(ofs.order_date) AS last_order_date,
    ROUND(SUM(ofs.total_order_amount), 2) AS total_spent,
    ROUND(AVG(ofs.total_order_amount), 2) AS avg_order_value,
    CASE
        WHEN SUM(ofs.total_order_amount) > 150 THEN 
			'Gold'
        WHEN SUM(ofs.total_order_amount) BETWEEN 80 AND 150 THEN
			'Silver'
        ELSE 
			'Bronze'
    END AS customer_level
FROM customers c
JOIN order_financial_summary ofs
    USING (customer_id)
WHERE c.customer_id IN (
    SELECT DISTINCT customer_id
    FROM orders
)
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name,
    c.city
ORDER BY
    c.customer_id DESC;