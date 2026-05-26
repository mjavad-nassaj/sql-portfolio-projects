USE gtfs_berlin;
DROP PROCEDURE IF EXISTS sp_refresh_route_performance_summary;
DELIMITER $$
CREATE PROCEDURE sp_refresh_route_performance_summary()
BEGIN
    TRUNCATE TABLE route_performance_summary;

    INSERT INTO route_performance_summary(
        route_id,
        agency_id,
        route_short_name,
        route_long_name,
        route_type,
        trip_count,
        unique_service_count,
        unique_shape_count,
        route_intensity_level
    )
    SELECT
        rsv.route_id,
        rsv.agency_id,
        rsv.route_short_name,
        rsv.route_long_name,
        rsv.route_type,
        rsv.number_of_trips,
        rsv.number_of_unique_services,
        rsv.number_of_unique_shapes,
        fn_route_intensity_level(
            rsv.number_of_trips,
            rsv.number_of_unique_services
        ) AS route_intensity_level
    FROM route_service_activity_view rsv;
END $$
DELIMITER ;