USE sql_invoicing;
DROP TRIGGER IF EXISTS trg_after_insert_payment;
DELIMITER $$
CREATE TRIGGER trg_after_insert_payment
AFTER INSERT
ON payments
FOR EACH ROW
BEGIN
	INSERT INTO payment_audit_log
    (
		payment_id,
		invoice_id,
		client_id,
		payment_date,
		payment_amount,
		payment_method
    )
    VALUES
    (
		NEW.payment_id,
		NEW.invoice_id,
		NEW.client_id,
		NEW.date,
		NEW.amount,
		NEW.payment_method
    );
END$$

DELIMITER ;