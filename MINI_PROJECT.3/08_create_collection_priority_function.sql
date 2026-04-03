USE sql_store;
DROP FUNCTION IF EXISTS fn_collection_priority;
DELIMITER $$
CREATE FUNCTION fn_collection_priority(
    payment_risk VARCHAR(50),
    outstanding_balance DECIMAL(10,2),
    overdue_invoices INT
)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    RETURN
        CASE
            WHEN outstanding_balance >= 700 
                 OR overdue_invoices >= 3 
                 OR payment_risk = 'Critical' THEN 'Urgent'
            WHEN outstanding_balance >= 300 
                 OR overdue_invoices = 2 
                 OR payment_risk = 'High Risk' THEN 'High'
            WHEN outstanding_balance >= 100 
                 OR overdue_invoices = 1 
                 OR payment_risk = 'Medium Risk' THEN 'Normal'
            ELSE 'Low'
        END;
END $$

DELIMITER ;