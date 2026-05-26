USE gtfs_berlin;
SELECT
	rs.route_id,
	rs.route_type,
	rs.route_short_name,
	rs.trip_count,
	rs.unique_shape_count,
	rs.route_intensity_level
FROM route_performance_summary rs
WHERE rs.unique_shape_count>(
	SELECT
		AVG(unique_shape_count)
    FROM route_performance_summary
    WHERE route_type=rs.route_type
)
ORDER BY
	rs.route_id,
	rs.route_type;