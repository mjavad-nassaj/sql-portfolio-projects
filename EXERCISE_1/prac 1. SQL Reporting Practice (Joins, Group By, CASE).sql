USE sql_store;
SELECT
	o.order_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    o.order_date,
    os.name AS order_status,
    sh.name AS shipper_name,
    SUM(oi.quantity) AS total_items,
    SUM(oi.quantity*oi.unit_price) AS order_total,
    CASE
	WHEN shipped_date IS NULL THEN
		 'not shipped'
    ELSE
		 'shipped'
	END AS shipping_status
FROM orders o
JOIN customers c
	USING(customer_id)
LEFT JOIN shippers sh
	ON o.shipper_id=sh.shipper_id
JOIN order_statuses os
	ON o.status=os.order_status_id

JOIN order_items oi
	ON o.order_id = oi.order_id
GROUP BY
	o.order_id,
    c.first_name,
    c.last_name,
    o.order_date,
    os.name,
    sh.name,
    o.shipped_date
HAVING SUM(oi.quantity)>30
ORDER BY SUM(oi.quantity * oi.unit_price) > 30 DESC;	