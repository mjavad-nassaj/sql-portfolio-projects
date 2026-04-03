USE sql_store;
DROP TABLE IF EXISTS risk_change_audit_log;
CREATE TABLE risk_change_audit_log(
    log_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    client_id INT NOT NULL,
    old_risk VARCHAR(50) NOT NULL,
    new_risk VARCHAR(50) NOT NULL,
    changed_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_risk_change_audit_log_client
        FOREIGN KEY (client_id) REFERENCES sql_invoicing.clients(client_id)
);