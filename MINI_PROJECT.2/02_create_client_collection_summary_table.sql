USE sql_invoicing;

DROP TABLE IF EXISTS client_collection_summary;

CREATE TABLE client_collection_summary (
    client_id INT NOT NULL PRIMARY KEY,
    client_name VARCHAR(255) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state CHAR(2) NOT NULL,
    total_invoices INT NOT NULL,
    total_invoice_amount DECIMAL(10,2) NOT NULL,
    total_paid_amount DECIMAL(10,2) NOT NULL,
    total_outstanding_balance DECIMAL(10,2) NOT NULL,
    paid_invoices INT NOT NULL,
    partially_paid_invoices INT NOT NULL,
    overdue_invoices INT NOT NULL,
    risk_level VARCHAR(50) NOT NULL,
    last_refresh DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_client_collection_summary_client
        FOREIGN KEY (client_id) REFERENCES clients(client_id)
);