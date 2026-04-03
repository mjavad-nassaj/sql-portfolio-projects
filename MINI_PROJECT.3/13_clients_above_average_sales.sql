USE sql_store;
SELECT
	cs.client_id,
	cs.customer_id,
	cs.client_name,
	cs.total_sales,
	cs.loyalty_level,
	cs.payment_risk,
	cs.collection_priority
FROM client_360_summary cs
WHERE total_sales>(
	SELECT
		AVG(cs.total_sales)
    FROM client_360_summary cs
);