USE sql_store;
TRUNCATE TABLE client_360_summary;
INSERT INTO client_360_summary (
    client_id,
    customer_id,
    employee_id,
    office_id,
    client_name,
    city,
    state,
    manager_name,
    office_city,
    office_state,
    loyalty_level,
    payment_risk,
    collection_priority,
    total_sales,
    avg_order_value,
    total_invoice_amount,
    total_paid_amount,
    total_outstanding_balance,
    total_orders,
    total_invoices,
    overdue_invoices
)
SELECT
    x.client_id,
    x.customer_id,
    x.employee_id,
    x.office_id,
    x.client_name,
    x.city,
    x.state,
    x.manager_name,
    x.office_city,
    x.office_state,
    fn_loyalty_level(x.total_sales) AS loyalty_level,
    fn_payment_risk(
        x.total_outstanding_balance,
        x.overdue_invoices,
        x.payment_ratio
    ) AS payment_risk,
    fn_collection_priority(
        fn_payment_risk(
            x.total_outstanding_balance,
            x.overdue_invoices,
            x.payment_ratio
        ),
        x.total_outstanding_balance,
        x.overdue_invoices
    ) AS collection_priority,
    ROUND(x.total_sales, 2) AS total_sales,
    ROUND(x.avg_order_value, 2) AS avg_order_value,
    ROUND(x.total_invoice_amount, 2) AS total_invoice_amount,
    ROUND(x.total_paid_amount, 2) AS total_paid_amount,
    ROUND(x.total_outstanding_balance, 2) AS total_outstanding_balance,
    x.total_orders,
    x.total_invoices,
    x.overdue_invoices
FROM (
    SELECT
        cbv.client_id,
        cbv.customer_id,
        cbv.employee_id,
        cbv.office_id,
        cbv.client_name,
        cbv.city,
        cbv.state,
        cbv.manager_name,
        cbv.office_city,
        cbv.office_state,
        cbv.total_sales,
        cbv.avg_order_value,
        cbv.total_invoice_amount,
        cbv.total_paid_amount,
        cbv.total_outstanding_balance,
        cbv.total_orders,
        cbv.total_invoices,
        cbv.overdue_invoices,
        ROUND(
            CASE
                WHEN cbv.total_invoice_amount = 0 THEN 0
                ELSE cbv.total_paid_amount / cbv.total_invoice_amount
            END,
            4
        ) AS payment_ratio
    FROM client_360_base_view cbv
) x;