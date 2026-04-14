USE gtfs_berlin;
SELECT
	rps.agency_id,
	rps.route_type,
    COUNT(rps.route_id) AS number_of_routes,
    SUM(rps.trip_count) AS total_trip_counts,
    SUM(rps.unique_shape_count) AS total_unique_shape_counts
FROM route_performance_summary rps
GROUP BY 
	rps.agency_id,
	rps.route_type WITH ROLLUP;