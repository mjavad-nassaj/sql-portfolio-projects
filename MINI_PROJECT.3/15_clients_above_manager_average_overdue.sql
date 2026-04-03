USE sql_store;
SELECT
	client_id,
	client_name,
	employee_id,
	manager_name,
	overdue_invoices,
	payment_risk,
	collection_priority
FROM client_360_summary cs
WHERE (cs.overdue_invoices)>(
  SELECT
    AVG(overdue_invoices)
  FROM client_360_summary
  WHERE employee_id=cs.employee_id
);