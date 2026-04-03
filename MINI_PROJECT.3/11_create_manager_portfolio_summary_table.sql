USE sql_hr;
DROP TABLE IF EXISTS manager_portfolio_summary;
CREATE TABLE manager_portfolio_summary(
	employee_id INT PRIMARY KEY NOT NULL,
	manager_name VARCHAR(255) NOT NULL,
	office_id INT NOT NULL,
	office_city VARCHAR(50) NOT NULL,
	office_state CHAR(2) NOT NULL,
	number_of_clients INT NOT NULL,
	total_sales DECIMAL(10,2) NOT NULL,
	total_invoice_amount DECIMAL(10,2) NOT NULL,
	total_outstanding_balance DECIMAL(10,2) NOT NULL,
	high_risk_clients INT NOT NULL,
	critical_clients INT NOT NULL,
	avg_client_balance DECIMAL(10,2) NOT NULL,
	last_refresh DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT fk_manager_portfolio_summary_employee
		FOREIGN KEY(employee_id) REFERENCES sql_hr.employees(employee_id),
	CONSTRAINT fk_manager_portfolio_summary_office
		FOREIGN KEY(office_id) REFERENCES sql_hr.offices(office_id)
);