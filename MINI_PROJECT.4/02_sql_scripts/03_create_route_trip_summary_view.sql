USE gtfs_berlin;
DROP VIEW IF EXISTS route_trip_summary_view;
CREATE VIEW route_trip_summary_view AS
SELECT
    rs.route_id,
    rs.agency_id,
    rs.route_short_name,
    rs.route_long_name,
    rs.route_type,
    COUNT(ts.trip_id) AS trip_count
FROM routes rs
LEFT JOIN trips ts
    USING(route_id)
GROUP BY
    rs.route_id,
    rs.agency_id,
    rs.route_short_name,
    rs.route_long_name,
    rs.route_type;