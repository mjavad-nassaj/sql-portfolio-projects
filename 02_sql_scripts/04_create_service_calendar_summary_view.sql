USE gtfs_berlin;
DROP VIEW IF EXISTS service_calendar_summary_view;
CREATE VIEW service_calendar_summary_view AS
SELECT
	c.service_id,
    c.start_date,
    c.end_date,
    COUNT(cd.service_id) AS exception_count,
    MAX(
		c.monday+
        c.thursday+
        c.wednesday+
        c.friday+
        c.saturday+
        c.sunday+
        c.tuesday
	) AS active_days_per_week
FROM calendar c
LEFT JOIN calendar_dates cd
	USING(service_id)
GROUP BY
	c.service_id,
    c.start_date,
    c.end_date;