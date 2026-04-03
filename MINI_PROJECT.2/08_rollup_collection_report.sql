USE sql_invoicing;
SELECT
	ccs.state,
	ccs.risk_level,
	COUNT(*) AS number_of_clients,
	SUM(ccs.total_outstanding_balance) AS total_outstanding_balance,
	SUM(ccs.total_invoice_amount) AS total_invoice_amount
FROM 
	client_collection_summary ccs
GROUP BY
	ccs.state,
	ccs.risk_level WITH ROLLUP;