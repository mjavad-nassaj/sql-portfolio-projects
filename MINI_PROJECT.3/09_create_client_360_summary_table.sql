USE sql_store;
DROP TABLE IF EXISTS client_360_summary;
CREATE TABLE client_360_summary (
    client_id INT NOT NULL PRIMARY KEY,
    customer_id INT NOT NULL,
    employee_id INT NOT NULL,
    office_id INT NOT NULL,
    client_name VARCHAR(255) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state CHAR(2) NOT NULL,
    manager_name VARCHAR(255) NOT NULL,
    office_city VARCHAR(50) NOT NULL,
    office_state CHAR(2) NOT NULL,
    loyalty_level VARCHAR(50) NOT NULL,
    payment_risk VARCHAR(50) NOT NULL,
    collection_priority VARCHAR(50) NOT NULL,
    total_sales DECIMAL(10,2) NOT NULL,
    avg_order_value DECIMAL(10,2) NOT NULL,
    total_invoice_amount DECIMAL(10,2) NOT NULL,
    total_paid_amount DECIMAL(10,2) NOT NULL,
    total_outstanding_balance DECIMAL(10,2) NOT NULL,
    total_orders INT NOT NULL,
    total_invoices INT NOT NULL,
    overdue_invoices INT NOT NULL,
    last_refresh DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_client_360_summary_client
        FOREIGN KEY (client_id) REFERENCES sql_invoicing.clients(client_id),
    CONSTRAINT fk_client_360_summary_customer
        FOREIGN KEY (customer_id) REFERENCES sql_store.customers(customer_id),
    CONSTRAINT fk_client_360_summary_employee
        FOREIGN KEY (employee_id) REFERENCES sql_hr.employees(employee_id),
    CONSTRAINT fk_client_360_summary_office
        FOREIGN KEY (office_id) REFERENCES sql_hr.offices(office_id)
);