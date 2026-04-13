USE gtfs_berlin;
SELECT
    SUM(
        CASE
            WHEN rs.trip_count = 0 THEN 1
            ELSE 0
        END
    ) AS routes_with_zero_trips,
    SUM(
        CASE
            WHEN rs.trip_count < rs.unique_service_count THEN 1
            ELSE 0
        END
    ) AS routes_with_trip_service_mismatch ,
    SUM(
        CASE
            WHEN rs.unique_shape_count > rs.trip_count THEN 1
            ELSE 0
        END
    ) AS routes_with_shape_trip_mismatch
FROM route_performance_summary rs;