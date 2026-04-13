USE gtfs_berlin;
DROP VIEW IF EXISTS route_service_activity_view;
CREATE VIEW route_service_activity_view AS
SELECT
    rs.route_id,
    rs.agency_id,
    rs.route_short_name,
    rs.route_long_name,
    rs.route_type,
    COALESCE(x.number_of_trips, 0) AS number_of_trips,
    COALESCE(x.number_of_unique_services, 0) AS number_of_unique_services,
    COALESCE(x.number_of_unique_shapes, 0) AS number_of_unique_shapes
FROM routes rs
LEFT JOIN (
    SELECT
        t.route_id,
        COUNT(t.trip_id) AS number_of_trips,
        COUNT(DISTINCT t.service_id) AS number_of_unique_services,
        COUNT(DISTINCT t.shape_id) AS number_of_unique_shapes
    FROM trips t
    GROUP BY
        t.route_id
) x
USING(route_id);