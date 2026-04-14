USE gtfs_berlin;
DROP TRIGGER IF EXISTS trg_after_update_route_performance_summary;
DELIMITER $$
CREATE TRIGGER trg_after_update_route_performance_summary
AFTER UPDATE
ON route_performance_summary
FOR EACH ROW
BEGIN
  IF NEW.route_intensity_level <> OLD.route_intensity_level THEN
    INSERT INTO route_summary_audit_log(
      route_id,
      old_route_intensity_level,
      new_route_intensity_level,
      change_type
    )
    VALUES(
      NEW.route_id,
      OLD.route_intensity_level,
      NEW.route_intensity_level,
      'UPDATE'
    );
  END IF;
END $$
DELIMITER ;