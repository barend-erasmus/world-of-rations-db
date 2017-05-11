DELIMITER //

CREATE PROCEDURE listFeedstuffElementsById (
p_feedstuffId CHAR(36))
Begin
SELECT 
`measurement`.`elementId` AS `id`,
`element`.`name` AS `name`,
`element`.`unit` AS `unit`,
`element`.`code` AS `code`,
`measurement`.`value` AS `value`,
`element`.`sortOrder` AS `sortOrder`
FROM worldofrations.feedstuffMeasurements AS `measurement`
INNER JOIN worldofrations.elements AS `element`
ON `element`.`id` = `measurement`.`elementId`
AND
`feedstuffId` = p_feedstuffId
UNION
SELECT 
`measurement`.`elementId` AS `id`,
`element`.`name` AS `name`,
`element`.`unit` AS `unit`,
`element`.`code` AS `code`,
`measurement`.`value` AS `value`,
`element`.`sortOrder` AS `sortOrder`
FROM worldofrations.userFeedstuffMeasurements AS `measurement`
INNER JOIN worldofrations.elements AS `element`
ON `element`.`id` = `measurement`.`elementId`
AND
`feedstuffId` = p_feedstuffId
ORDER BY `sortOrder`;
END;
//

DELIMITER ;