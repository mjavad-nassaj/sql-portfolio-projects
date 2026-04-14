USE gtfs_berlin;
DROP PROCEDURE IF EXISTS sp_refresh_service_operational_summary;
DELIMITER $$
CREATE PROCEDURE sp_refresh_service_operational_summary()
BEGIN
	TRUNCATE TABLE service_operational_summary;
    INSERT INTO service_operational_summary (
			service_id,
			start_date,
			end_date,
			active_days_per_week,
			exception_count,
			service_stability_level
    )
	SELECT
		scv.service_id,
		scv.start_date,
		scv.end_date,
		scv.active_days_per_week,
		scv.exception_count,
		fn_service_stability_level(
			scv.active_days_per_week,
			scv.exception_count,
			scv.start_date,
			scv.end_date
        ) AS service_stability_level
	FROM service_calendar_summary_view scv;
END $$
DELIMITER ;