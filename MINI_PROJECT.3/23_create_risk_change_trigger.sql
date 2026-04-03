USE sql_store;
DROP TRIGGER IF EXISTS trg_after_update_payment_risk;
DELIMITER $$
CREATE TRIGGER trg_after_update_payment_risk
AFTER UPDATE
ON client_360_summary
FOR EACH ROW
BEGIN
	IF NEW.payment_risk <> OLD.payment_risk THEN
		INSERT INTO risk_change_audit_log(
			client_id,
            old_risk,
			new_risk
        )
        VALUES(
        NEW.client_id,
        OLD.payment_risk,
        NEW.payment_risk
		);
	END IF;
END $$
DELIMITER ;