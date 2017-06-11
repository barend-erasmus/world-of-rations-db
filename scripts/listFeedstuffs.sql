DELIMITER //

CREATE PROCEDURE listFeedstuffs()
BEGIN
SELECT 
`feedstuff`.`id` AS `id`,
`feedstuff`.`name` AS `name`,
`feedstuffGroup1`.`id` AS `groupId`,
CASE
	WHEN `feedstuffGroup2`.`name` IS NULL
	THEN
	CONCAT(`feedstuffGroup1`.`name`)
	WHEN `feedstuffGroup3`.`name` IS NULL
	THEN
	CONCAT(`feedstuffGroup2`.`name` , ' - ' , `feedstuffGroup1`.`name`)
	ELSE
	CONCAT(`feedstuffGroup3`.`name` , ' - ' , `feedstuffGroup2`.`name` , ' - ' , `feedstuffGroup1`.`name`)
END AS `groupName`
FROM worldofrations.feedstuffs AS `feedstuff`
INNER JOIN worldofrations.feedstuffGroups AS `feedstuffGroup1`
ON `feedstuff`.`groupId` = `feedstuffGroup1`.`Id`
LEFT JOIN worldofrations.feedstuffGroups AS `feedstuffGroup2`
ON `feedstuffGroup2`.`id` = `feedstuffGroup1`.`parentGroupId`
LEFT JOIN worldofrations.feedstuffGroups AS `feedstuffGroup3`
ON `feedstuffGroup3`.`id` = `feedstuffGroup2`.`parentGroupId`
LEFT JOIN worldofrations.feedstuffGroups AS `feedstuffGroup4`
ON `feedstuffGroup4`.`id` = `feedstuffGroup3`.`parentGroupId`
LEFT JOIN worldofrations.feedstuffGroups AS `feedstuffGroup5`
ON `feedstuffGroup5`.`id` = `feedstuffGroup4`.`parentGroupId`
ORDER BY `name` ASC;
END;
//

DELIMITER ;

