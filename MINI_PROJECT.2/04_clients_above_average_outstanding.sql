USE sql_invoicing;

SELECT
    ccs.client_id,
    ccs.client_name,
    ccs.total_outstanding_balance,
    ccs.risk_level
FROM client_collection_summary ccs
WHERE ccs.total_outstanding_balance > (
    SELECT 
		AVG(total_outstanding_balance)
    FROM client_collection_summary
)
ORDER BY
    ccs.client_id;