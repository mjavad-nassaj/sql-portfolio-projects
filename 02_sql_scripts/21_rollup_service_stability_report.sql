USE gtfs_berlin;
SELECT
	sos.service_stability_level,
    COUNT(sos.service_id) AS total_services,
    SUM(sos.active_days_per_week) AS total_active_days_per_weeks,
    SUM(sos.exception_count) AS total_exception_count
FROM service_operational_summary sos
GROUP BY
	sos.service_stability_level WITH ROLLUP;