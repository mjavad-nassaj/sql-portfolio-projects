USE sql_store;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    c.city,
    COUNT(DISTINCT o.order_id) AS total_number_of_orders,
    MIN(o.order_date) AS first_order,
    MAX(o.order_date) AS last_order,
    SUM(oi.quantity * oi.unit_price) AS total_orders,
    SUM(oi.quantity * oi.unit_price) / COUNT(DISTINCT o.order_id) AS average_of_order,
    CASE
        WHEN SUM(oi.quantity * oi.unit_price) > 100 THEN 
			'Valuable'
        WHEN SUM(oi.quantity * oi.unit_price) > 50 THEN 
			'Regular'
        ELSE 
			'Low Activity'
    END AS customer_status
FROM customers c
JOIN orders o
    USING (customer_id)
JOIN order_items oi
    USING (order_id)
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name,
    c.city
HAVING SUM(oi.quantity * oi.unit_price) > 50
ORDER BY total_orders DESC;