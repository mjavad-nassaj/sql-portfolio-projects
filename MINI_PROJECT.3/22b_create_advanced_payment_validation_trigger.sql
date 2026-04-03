USE sql_invoicing;
DROP TRIGGER IF EXISTS trg_before_insert_payment_advanced_validation;
DELIMITER $$
CREATE TRIGGER trg_before_insert_payment_advanced_validation
BEFORE INSERT
ON payments
FOR EACH ROW
BEGIN
    DECLARE invoice_date_value DATE;
    DECLARE invoice_client_id INT;
    DECLARE remaining_balance DECIMAL(10,2);

    IF NEW.amount <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Payment amount must be greater than zero';
    END IF;

    SELECT
        i.invoice_date,
        i.client_id
    INTO
        invoice_date_value,
        invoice_client_id
    FROM invoices i
    WHERE i.invoice_id = NEW.invoice_id;
    IF NEW.date < invoice_date_value THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Payment date cannot be earlier than invoice date';
    END IF;
    IF NEW.client_id <> invoice_client_id THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Payment client does not match invoice client';
    END IF;
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