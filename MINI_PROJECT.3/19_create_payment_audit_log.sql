USE sql_store;
DROP TABLE IF EXISTS payment_audit_log;
CREATE TABLE payment_audit_log (
    log_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    payment_id INT NOT NULL,
    invoice_id INT NOT NULL,
    client_id INT NOT NULL,
    payment_date DATE NOT NULL,
    payment_amount DECIMAL(10,2) NOT NULL,
    payment_method TINYINT NOT NULL,
    logged_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_payment_audit_payment
        FOREIGN KEY (payment_id) REFERENCES sql_invoicing.payments(payment_id),
    CONSTRAINT fk_payment_audit_invoice
        FOREIGN KEY (invoice_id) REFERENCES sql_invoicing.invoices(invoice_id),
    CONSTRAINT fk_payment_audit_client
        FOREIGN KEY (client_id) REFERENCES sql_invoicing.clients(client_id),
    CONSTRAINT fk_payment_audit_payment_method
        FOREIGN KEY (payment_method) REFERENCES sql_invoicing.payment_methods(payment_method_id)
);