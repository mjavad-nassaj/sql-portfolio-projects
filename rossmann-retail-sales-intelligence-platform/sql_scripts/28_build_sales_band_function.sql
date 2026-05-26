USE rossmann_sales_mysql;
DELIMITER //
DROP FUNCTION IF EXISTS sales_band_function //
CREATE FUNCTION sales_band_function(p_total_sales DECIMAL(11,2))
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
	RETURN
		CASE
			WHEN p_total_sales<=500000 THEN 'low'
			WHEN p_total_sales>500000 AND p_total_sales<=1000000 THEN 'medium'
			WHEN p_total_sales>1000000 AND p_total_sales<=5000000 THEN 'high'
			ELSE
				'top'
		END;
END //
DELIMITER ;