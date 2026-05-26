USE gtfs_berlin;
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
	rs.route_id,
	rs.agency_id,
	rs.route_short_name,
	rs.route_long_name,
	rs.route_type,
    rav.number_of_trips,
    rav.number_of_unique_services,
    rav.number_of_unique_shapes,
    fn_route_intensity_level(
    rav.number_of_trips,
    rav.number_of_unique_services
    ) AS route_intensity_level
FROM routes rs
LEFT JOIN route_service_activity_view rav
	USING(route_id);