DELIMITER //

CREATE FUNCTION fnGetElementValue ( 
p_feedstuffId CHAR(36),
p_elementCode CHAR(36))
RETURNS DECIMAL(20, 5)
BEGIN
    
    DECLARE vle DECIMAL(20, 5);
    
    SET vle = (SELECT `feedstuffMeasurements`.`value` 
    FROM worldofrations.feedstuffMeasurements AS `feedstuffMeasurements`
    INNER JOIN worldofrations.elements AS `elements`
    ON `elements`.`id` = `feedstuffMeasurements`.`elementId`
    AND `elements`.`code` = p_elementCode
	AND `feedstuffMeasurements`.`feedstuffId` = p_feedstuffId
    LIMIT 1);

    
	RETURN (IF(vle IS NULL,0,vle));
END;
//

DELIMITER ;