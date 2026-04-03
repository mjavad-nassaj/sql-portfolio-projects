USE sql_invoicing;
DROP TABLE IF EXISTS client_manager_map;
CREATE TABLE IF NOT EXISTS client_manager_map (
    client_id INT NOT NULL PRIMARY KEY,
    employee_id INT NOT NULL,
    CONSTRAINT fk_sql_invoicing_clients_client_id
        FOREIGN KEY (client_id)
        REFERENCES sql_invoicing.clients(client_id),
    CONSTRAINT fk_sql_hr_employees_employee_id
        FOREIGN KEY (employee_id)
        REFERENCES sql_hr.employees(employee_id)
);
INSERT INTO client_manager_map (client_id, employee_id)
VALUES
    (1, 67009),
    (2, 67009),
    (3, 98374),
    (4, 84791),
    (5, 98374);