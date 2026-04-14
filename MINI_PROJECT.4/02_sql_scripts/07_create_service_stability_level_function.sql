USE gtfs_berlin;
DROP FUNCTION IF EXISTS fn_service_stability_level;
DELIMITER $$
CREATE FUNCTION fn_service_stability_level
(
    active_days_per_week INT,
    exception_count INT,
    start_date_input DATE,
    end_date_input DATE
)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE service_duration_days INT;
    DECLARE exception_penalty DECIMAL(10,2);
    DECLARE stability_score DECIMAL(10,2);

    SET service_duration_days = DATEDIFF(end_date_input, start_date_input);
    SET exception_penalty = exception_count * 0.50;
    SET stability_score = 
		active_days_per_weeK
		+(service_duration_days / 30)
		- exception_penalty;
    RETURN
        CASE
            WHEN service_duration_days <= 0 THEN 'Unstable'
            WHEN stability_score >= 20 THEN 'Robust'
            WHEN stability_score >= 10 THEN 'Stable'
            WHEN stability_score >= 5 THEN 'Limited'
            ELSE 'Unstable'
        END;
END $$
DELIMITER ;