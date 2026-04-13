USE gtfs_berlin;
DROP TRIGGER IF EXISTS trg_after_insert_route_performance_summary;
DELIMITER $$
CREATE TRIGGER trg_after_insert_route_performance_summary
AFTER INSERT
ON route_performance_summary
FOR EACH ROW
BEGIN
    INSERT INTO route_summary_audit_log
    (
        route_id,
        old_route_intensity_level,
        new_route_intensity_level,
        change_type
    )
    VALUES
    (
        NEW.route_id,
        NULL,
        NEW.route_intensity_level,
        'INSERT'
    );
END $$
DELIMITER ;