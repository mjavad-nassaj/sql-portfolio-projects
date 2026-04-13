USE gtfs_berlin;
SELECT
    sos.service_id,
	sos.start_date,
	sos.end_date,
	sos.active_days_per_week,
	sos.exception_count,
	sos.service_stability_level
FROM service_operational_summary sos
WHERE
	sos.active_days_per_week=0 or
    sos.exception_count<0
ORDER BY
	sos.service_id;