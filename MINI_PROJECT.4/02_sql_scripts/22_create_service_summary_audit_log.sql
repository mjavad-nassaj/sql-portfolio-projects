USE gtfs_berlin;
DROP TABLE IF EXISTS service_summary_audit_log;
CREATE TABLE service_summary_audit_log(
	log_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	service_id VARCHAR(255) NOT NULL,
	old_service_stability_level VARCHAR(255),
	new_service_stability_level VARCHAR(255),
	change_type VARCHAR(255) NOT NULL,
	changed_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);