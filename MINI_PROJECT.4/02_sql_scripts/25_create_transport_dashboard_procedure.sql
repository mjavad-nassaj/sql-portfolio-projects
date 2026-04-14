USE gtfs_berlin;
DROP PROCEDURE IF EXISTS sp_generate_transport_dashboard;
DELIMITER $$
CREATE PROCEDURE sp_generate_transport_dashboard()
BEGIN
  SELECT
    rps.route_id,
    rps.agency_id,
    rps.route_short_name,
    rps.route_long_name,
    rps.trip_count,
    rps.route_intensity_level
  FROM route_performance_summary rps
  WHERE rps.trip_count > (
    SELECT
      AVG(rps_inner.trip_count)
    FROM route_performance_summary rps_inner
    WHERE rps_inner.agency_id = rps.agency_id
  )
  ORDER BY
    rps.agency_id;
  SELECT
    sos.service_id,
    sos.active_days_per_week,
    sos.start_date,
    sos.end_date,
    sos.exception_count,
    sos.service_stability_level
  FROM service_operational_summary sos
  WHERE sos.active_days_per_week > (
    SELECT
      AVG(sos_inner.active_days_per_week)
    FROM service_operational_summary sos_inner
  )
  ORDER BY
    sos.service_id,
    sos.active_days_per_week;
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
  SELECT
    sos.service_stability_level,
    COUNT(sos.service_id) AS total_services,
    SUM(sos.active_days_per_week) AS total_active_days_per_weeks,
    SUM(sos.exception_count) AS total_exception_count
  FROM service_operational_summary sos
  GROUP BY
    sos.service_stability_level WITH ROLLUP;
END $$
DELIMITER ;