USE sql_store;
DROP FUNCTION IF EXISTS fn_loyalty_level;
DELIMITER $$
CREATE FUNCTION fn_loyalty_level(total_sales DECIMAL(10,2))
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    RETURN
        CASE
            WHEN total_sales < 100 THEN 'Bronze'
            WHEN total_sales >= 100 AND total_sales < 300 THEN 'Silver'
            WHEN total_sales >= 300 AND total_sales < 600 THEN 'Gold'
            ELSE 'Platinum'
        END;
END $$
DELIMITER ;