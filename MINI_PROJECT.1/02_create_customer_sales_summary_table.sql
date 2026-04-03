USE sql_store;
DROP TABLE IF EXISTS customer_sales_summary;
CREATE TABLE IF NOT EXISTS customer_sales_summary
(
	customer_id INT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    city VARCHAR(50) NOT NULL,
    total_orders INT NOT NULL,
    first_order_date DATE NOT NULL,
    last_order_date DATE NOT NULL,
    total_spent DECIMAL(10,2) NOT NULL,
    avg_order_value DECIMAL(10,2) NOT NULL,
    customer_level VARCHAR(50) NOT NULL,
    last_update DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_customer_sales_summary
		FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);