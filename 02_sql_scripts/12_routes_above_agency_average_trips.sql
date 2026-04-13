USE gtfs_berlin;
SELECT
	rps.route_id,
	rps.agency_id,
	rps.route_short_name,
	rps.route_long_name,
	rps.trip_count,
	rps.route_intensity_level
FROM route_performance_summary rps
WHERE rps.trip_count>(
	SELECT
		AVG(trip_count)
	FROM route_performance_summary
	WHERE agency_id=rps.agency_id
)    
ORDER BY
	rps.agency_id;	