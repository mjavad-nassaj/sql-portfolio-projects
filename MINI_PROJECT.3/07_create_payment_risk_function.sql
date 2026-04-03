USE sql_store;
DROP FUNCTION IF EXISTS fn_payment_risk;
DELIMITER $$
CREATE FUNCTION fn_payment_risk(
    outstanding_balance DECIMAL(10,2),
    overdue_invoices INT,
    payment_ratio DECIMAL(5,4)
)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    RETURN
        CASE
            WHEN outstanding_balance >= 500 OR overdue_invoices >= 3 OR payment_ratio < 0.25 THEN 'Critical'
            WHEN outstanding_balance >= 300 OR overdue_invoices = 2 OR payment_ratio < 0.50 THEN 'High Risk'
            WHEN outstanding_balance >= 100 OR overdue_invoices = 1 OR payment_ratio < 0.75 THEN 'Medium Risk'
            ELSE 'Low Risk'
        END;
END $$
DELIMITER ;