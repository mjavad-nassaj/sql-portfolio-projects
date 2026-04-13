USE gtfs_berlin;
SELECT
	SUM(
		CASE 
			WHEN active_days_per_week = 0 THEN 1 
            ELSE 0
        END 
    ) AS services_with_zero_active_days,
    SUM(
		CASE
			WHEN exception_count < 0 THEN 1
            ELSE 0
        END
    ) AS services_with_negative_exception_count
FROM service_operational_summary sos