USE gtfs_berlin;
DROP PROCEDURE IF EXISTS sp_generate_data_quality_dashboard;
DELIMITER $$
CREATE PROCEDURE sp_generate_data_quality_dashboard()
BEGIN
    SELECT
		(SUM(
				CASE
					WHEN rps.trip_count=0 THEN 1
					ELSE 0
				END 
        )) AS zero_trips,
		(SUM(
				CASE
					WHEN rps.trip_count< rps.unique_service_count THEN 1
					ELSE 0
				END 
        )) routes_with_trip_service_mismatch, 
        (SUM(
			CASE
				WHEN rps.trip_count< rps.unique_shape_count THEN 1
                ELSE 0
            END 
        )) routes_with_shape_service_mismatch
    FROM route_performance_summary rps;
    SELECT
		(SUM(
			CASE
				WHEN sos.active_days_per_week =0 THEN 1
                ELSE 0
            END 
        )) AS zero_active_days_per_week,
		(SUM(
			CASE
				WHEN sos.exception_count<0 THEN 1
                ELSE 0
            END 
        )) exception_mismatch
    FROM service_operational_summary sos;    
END $$
DELIMITER ;