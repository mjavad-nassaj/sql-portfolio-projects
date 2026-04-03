USE sql_store;
SELECT
	cs.client_id,
	cs.client_name,
	cs.state,
	cs.manager_name,
	cs.overdue_invoices,
	cs.total_outstanding_balance,
	cs.payment_risk,
	cs.collection_priority
FROM client_360_summary cs
WHERE cs.overdue_invoices>=2 AND cs.total_outstanding_balance>100;