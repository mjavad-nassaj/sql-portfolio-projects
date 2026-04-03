USE sql_store;
DROP TABLE IF EXISTS collection_alert_queue;
CREATE TABLE collection_alert_queue(
	alert_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    client_id INT NOT NULL,
    client_name VARCHAR(255) NOT NULL,
    employee_id INT NOT NULL,
    manager_name VARCHAR(255) NOT NULL,
    payment_risk VARCHAR(50) NOT NULL,
	collection_priority VARCHAR(50) NOT NULL,
	total_outstanding_balance DECIMAL(10,2) NOT NULL,
	overdue_invoices INT NOT NULL,
    alert_status VARCHAR(50) NOT NULL,
    queued_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_collection_alert_queue_client
		FOREIGN KEY (client_id) REFERENCES sql_invoicing.clients(client_id),
    CONSTRAINT fk_collection_alert_queue_employee
		FOREIGN KEY (employee_id) REFERENCES sql_hr.employees(employee_id)
);