USE gtfs_berlin;
DROP TRIGGER IF EXISTS trg_after_update_service_operational_summary;
DELIMITER $$
CREATE TRIGGER trg_after_update_service_operational_summary
AFTER UPDATE
ON service_operational_summary
FOR EACH ROW
BEGIN
  IF OLD.service_stability_level <> NEW.service_stability_level THEN
    INSERT INTO service_summary_audit_log(
      service_id,
      old_service_stability_level,
      new_service_stability_level,
      change_type
    )
    VALUES(
      NEW.service_id,
      OLD.service_stability_level,
      NEW.service_stability_level,
      'UPDATE'
    );
  END IF;
END $$
DELIMITER ;