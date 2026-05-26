USE gtfs_berlin;
SELECT
	sos.service_id,
    sos.active_days_per_week,
	sos.start_date,
	sos.end_date,
	sos.exception_count,
	sos.service_stability_level
FROM service_operational_summary sos
WHERE sos.active_days_per_week>(
	SELECT
		AVG(sos.active_days_per_week)
    FROM service_operational_summary
)
ORDER BY
	sos.service_id,
    sos.active_days_per_week;