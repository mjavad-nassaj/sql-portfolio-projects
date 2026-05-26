USE rossmann_sales_mysql;
DELIMITER //
DROP FUNCTION IF EXISTS promo_effectiveness_band_function //
CREATE FUNCTION promo_effectiveness_band_function(p_promo_sales_difference DECIMAL(11,2))
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
	RETURN
		CASE
			WHEN p_promo_sales_difference<100000 THEN 'weak'
			WHEN p_promo_sales_difference>=100000 AND p_promo_sales_difference<500000 THEN 'moderate'
			ELSE
				'strong'
		END;
END //
DELIMITER ;