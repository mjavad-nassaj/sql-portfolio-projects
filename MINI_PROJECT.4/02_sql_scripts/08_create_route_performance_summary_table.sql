USE gtfs_berlin;
DROP TABLE IF EXISTS route_performance_summary;
CREATE TABLE route_performance_summary (
    route_id VARCHAR(255) PRIMARY KEY NOT NULL,
    agency_id INT NOT NULL,
    route_short_name VARCHAR(50),
    route_long_name VARCHAR(255),
    route_type VARCHAR(50),
    trip_count INT,
    unique_service_count INT,
    unique_shape_count INT,
    route_intensity_level VARCHAR(50),
    last_refresh DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);