USE sql_invoicing;
DROP TABLE IF EXISTS payment_audit_log;
CREATE TABLE IF NOT EXISTS payment_audit_log 
(
	log_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    payment_id INT  NOT NULL,
    CONSTRAINT fk_payment_audit_log_payment
		FOREIGN KEY (payment_id) REFERENCES payments(payment_id),
	invoice_id INT  NOT NULL,
	CONSTRAINT fk_payment_audit_log_invoice
		FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id),
	client_id INT  NOT NULL,
	CONSTRAINT fk_payment_audit_log_client
		FOREIGN KEY (client_id) REFERENCES clients(client_id),
	payment_date DATE NOT NULL,
    payment_amount DECIMAL(10,2) NOT NULL,
    payment_method TINYINT  NOT NULL,
	CONSTRAINT fk_payment_audit_log_payment_method
		FOREIGN KEY (payment_method) REFERENCES payment_methods(payment_method_id),
    logged_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);