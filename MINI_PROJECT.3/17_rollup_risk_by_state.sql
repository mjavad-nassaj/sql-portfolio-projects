USE sql_store;
SELECT
	cs.state,
	cs.payment_risk,
	COUNT(cs.client_id) AS number_of_clients,
	SUM(cs.total_sales) AS total_sales,
	SUM(cs.total_outstanding_balance) AS total_outstanding_balance
FROM client_360_summary cs
GROUP BY
	cs.state,
	cs.payment_risk WITH ROLLUP;