USE sql_invoicing;

CREATE OR REPLACE VIEW invoice_status_summary AS
SELECT
    i.invoice_id,
    i.client_id,
    c.name AS client_name,
    i.invoice_date,
    i.due_date,
    i.invoice_total AS invoice_total,
    COALESCE(SUM(p.amount), 0) AS total_payments,
    i.invoice_total - COALESCE(SUM(p.amount), 0) AS debt_balance,
    COUNT(p.payment_id) AS payment_count,
    CASE
        WHEN i.invoice_total - COALESCE(SUM(p.amount), 0) = 0 THEN 'Paid'
        WHEN i.invoice_total - COALESCE(SUM(p.amount), 0) > 0
             AND i.invoice_total - COALESCE(SUM(p.amount), 0) < i.invoice_total THEN 'Partially Paid'
        WHEN i.invoice_total - COALESCE(SUM(p.amount), 0) = i.invoice_total
             AND CURDATE() <= i.due_date THEN 'Unpaid'
        ELSE 'Overdue'
    END AS invoice_status
FROM invoices i
JOIN clients c
    ON i.client_id = c.client_id
LEFT JOIN payments p
    ON i.invoice_id = p.invoice_id
GROUP BY
    i.invoice_id,
    i.client_id,
    c.name,
    i.invoice_date,
    i.due_date,
    i.invoice_total
ORDER BY
    i.invoice_id;