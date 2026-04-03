USE sql_invoicing;
DROP TRIGGER IF EXISTS trg_before_insert_payment_validation;
DELIMITER $$
CREATE TRIGGER trg_before_insert_payment_validation
BEFORE INSERT
ON payments
FOR EACH ROW
BEGIN
    DECLARE remaining_balance DECIMAL(10,2);
    SELECT
        i.invoice_total - COALESCE(SUM(p.amount), 0)
    INTO remaining_balance
    FROM invoices i
    LEFT JOIN payments p
        ON i.invoice_id = p.invoice_id
    WHERE i.invoice_id = NEW.invoice_id
    GROUP BY
        i.invoice_id,
        i.invoice_total;

    IF NEW.amount > remaining_balance THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Payment exceeds remaining invoice balance';
    END IF;
END $$
DELIMITER ;