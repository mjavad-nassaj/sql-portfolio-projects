USE gtfs_berlin;
DROP TABLE IF EXISTS route_summary_audit_log;
CREATE TABLE route_summary_audit_log(
	log_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	route_id VARCHAR(255) NOT NULL,
	old_route_intensity_level VARCHAR(50),
	new_route_intensity_level VARCHAR(50),
	change_type VARCHAR(50) NOT NULL,
	changed_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);