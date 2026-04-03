USE sql_store;
CREATE OR REPLACE VIEW order_financial_summary AS
SELECT
	order_id,
    customer_id,
    order_date,
    SUM(oi.quantity) AS total_number_of_items,
    SUM(oi.quantity*oi.unit_price) AS total_order_amount
FROM orders o
JOIN order_items oi
	USING (order_id)
GROUP BY
	o.order_id,
    o.customer_id,
    o.order_date;