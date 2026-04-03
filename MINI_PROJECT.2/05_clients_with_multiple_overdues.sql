USE sql_invoicing;
SELECT
    iss.client_id,
    iss.client_name,
    COUNT(*) AS overdue_invoices,
    SUM(iss.debt_balance) AS total_outstanding_balance
FROM invoice_status_summary iss
WHERE iss.invoice_status = 'Overdue'
GROUP BY
    iss.client_id,
    iss.client_name
HAVING
    COUNT(*) >= 2
    AND SUM(iss.debt_balance) > 100
ORDER BY
    iss.client_id DESC;