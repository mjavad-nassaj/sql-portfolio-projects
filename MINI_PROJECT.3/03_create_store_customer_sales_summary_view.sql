USE sql_store;
DROP VIEW IF EXISTS store_customer_sales_summary;
CREATE VIEW store_customer_sales_summary AS
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    c.city,
    c.state,
    COUNT(DISTINCT o.order_id) AS total_orders,
    MIN(o.order_date) AS first_order_date,
    MAX(o.order_date) AS last_order_date,
    SUM(oi.quantity * oi.unit_price) AS total_sales,
    SUM(oi.quantity * oi.unit_price) / COUNT(DISTINCT o.order_id) AS avg_order_value
FROM customers c
JOIN orders o
    USING (customer_id)
JOIN order_items oi
    USING (order_id)
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name,
    c.city,
    c.state;