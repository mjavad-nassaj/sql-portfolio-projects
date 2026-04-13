USE gtfs_berlin;
DROP TRIGGER IF EXISTS trg_after_insert_service_operational_summary;
DELIMITER $$
CREATE TRIGGER trg_after_insert_service_operational_summary
AFTER INSERT
ON service_operational_summary
FOR EACH ROW
BEGIN
	INSERT INTO service_summary_audit_log(
		service_id,
		old_service_stability_level,
		new_service_stability_level,
		change_type
	)
    VALUES(
		NEW.service_id,
		NULL,
        NEW.service_stability_level,
		'INSERT'
    );
END $$
DELIMITER ;