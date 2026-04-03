USE sql_invoicing;
TRUNCATE TABLE client_collection_summary;
INSERT INTO client_collection_summary (
    client_id,
    client_name,
    city,
    state,
    total_invoices,
    total_invoice_amount,
    total_paid_amount,
    total_outstanding_balance,
    paid_invoices,
    partially_paid_invoices,
    overdue_invoices,
    risk_level
)
SELECT
    c.client_id,
    iss.client_name,
    c.city,
    c.state,
    COUNT(iss.invoice_id) AS total_invoices,
    SUM(iss.invoice_total) AS total_invoice_amount,
    SUM(iss.total_payments) AS total_paid_amount,
    SUM(iss.debt_balance) AS total_outstanding_balance,
    SUM(
        CASE
            WHEN iss.invoice_status = 'Paid' THEN 1
            ELSE 0
        END
    ) AS paid_invoices,
    SUM(
        CASE
            WHEN iss.invoice_status = 'Partially Paid' THEN 1
            ELSE 0
        END
    ) AS partially_paid_invoices,
    SUM(
        CASE
            WHEN iss.invoice_status = 'Overdue' THEN 1
            ELSE 0
        END
    ) AS overdue_invoices,
    CASE
        WHEN SUM(iss.debt_balance) > 300 THEN 'High Risk'
        WHEN SUM(iss.debt_balance) BETWEEN 100 AND 300 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_level
FROM clients c
JOIN invoice_status_summary iss
    USING (client_id)
GROUP BY
    c.client_id,
    iss.client_name,
    c.city,
    c.state;