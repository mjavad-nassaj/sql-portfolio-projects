USE rossmann_sales_mysql;
DROP TABLE IF EXISTS audit_table;
CREATE TABLE audit_table
(
	audit_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	table_name VARCHAR(50) NOT NULL,
	operation_type VARCHAR(50) NOT NULL,
	store_id INT NOT NULL,
	old_total_sales DECIMAL(11,2) NULL,
	new_total_sales DECIMAL(11,2) NULL,
	change_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);