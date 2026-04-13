USE gtfs_berlin;
SELECT
    rps.route_id,
    rps.agency_id,
    rps.route_short_name,
    rps.trip_count,
    rps.unique_service_count,
    rps.unique_shape_count,
    rps.route_intensity_level
FROM route_performance_summary rps
WHERE
	rps.unique_shape_count>rps.trip_count
ORDER BY
    rps.route_id;