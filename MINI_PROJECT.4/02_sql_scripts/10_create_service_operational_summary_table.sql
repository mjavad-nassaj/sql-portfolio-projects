USE gtfs_berlin;
DROP TABLE IF EXISTS service_operational_summary;
CREATE TABLE service_operational_summary(
	service_id VARCHAR(255) PRIMARY KEY NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	active_days_per_week INT NOT NULL,
	exception_count INT NOT NULL,
	service_stability_level VARCHAR(50) NOT NULL,
	last_refresh DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);