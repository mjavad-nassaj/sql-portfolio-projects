USE sql_store;
SELECT*
FROM client_360_summary cs
WHERE total_outstanding_balance>(
	SELECT
		AVG(total_outstanding_balance)
	FROM client_360_summary
	WHERE state=cs.state
);