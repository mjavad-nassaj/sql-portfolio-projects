USE sql_store;
DROP TABLE IF EXISTS customer_client_map;
CREATE TABLE IF NOT EXISTS customer_client_map (
    customer_id INT NOT NULL PRIMARY KEY,
    client_id INT NOT NULL UNIQUE,
    CONSTRAINT fk_sql_store_customers_customer_id
        FOREIGN KEY (customer_id)
        REFERENCES sql_store.customers(customer_id),
    CONSTRAINT fk_sql_invoicing_clients_client_id
        FOREIGN KEY (client_id)
        REFERENCES sql_invoicing.clients(client_id)
);
INSERT INTO customer_client_map (customer_id, client_id)
VALUES
    (1,1),
    (2,2),
    (3,3),
    (4,4),
    (5,5);