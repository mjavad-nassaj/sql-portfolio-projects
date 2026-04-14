USE gtfs_berlin;
DROP function IF EXISTS fn_route_intensity_level;
DELIMITER $$
CREATE FUNCTION fn_route_intensity_level (
	number_of_trips INT,number_of_unique_services INT
)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    RETURN
        CASE
            WHEN number_of_trips >=500 OR Number_of_unique_services>=5 THEN 'Critical'
            WHEN number_of_trips >= 200 OR Number_of_unique_services>=3 THEN 'High'
            WHEN number_of_trips >= 50 OR Number_of_unique_services>=2 THEN 'Medium'
            ELSE 'Low'
        END;
END $$
DELIMITER ;