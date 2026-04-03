USE sql_store;
DROP VIEW IF EXISTS client_360_base_view;
CREATE VIEW client_360_base_view AS
SELECT
    sscss.customer_id,
    ccm.client_id,
    sscss.full_name AS client_name,
    sscss.state,
    sscss.city,
    sscss.total_orders,
    sscss.total_sales,
    sscss.avg_order_value,
    COUNT(siiss.invoice_id) AS total_invoices,
    SUM(siiss.invoice_total) AS total_invoice_amount,
    SUM(siiss.total_payments) AS total_paid_amount,
    SUM(siiss.debt_balance) AS total_outstanding_balance,
    SUM(
        CASE
            WHEN siiss.invoice_status = 'Overdue' THEN 1
            ELSE 0
        END
    ) AS overdue_invoices,
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS manager_name,
    o.office_id,
    o.city AS office_city,
    o.state AS office_state
FROM sql_store.store_customer_sales_summary sscss
JOIN sql_store.customer_client_map ccm
    USING (customer_id)
LEFT JOIN sql_invoicing.invoice_status_summary siiss
    ON ccm.client_id = siiss.client_id
LEFT JOIN sql_invoicing.client_manager_map cmm
    ON ccm.client_id = cmm.client_id
LEFT JOIN sql_hr.employees e
    ON cmm.employee_id = e.employee_id
LEFT JOIN sql_hr.offices o
    ON e.office_id = o.office_id
GROUP BY
    sscss.customer_id,
    ccm.client_id,
    sscss.full_name,
    sscss.state,
    sscss.city,
    sscss.total_orders,
    sscss.total_sales,
    sscss.avg_order_value,
    e.employee_id,
    e.first_name,
    e.last_name,
    o.office_id,
    o.city,
    o.state;