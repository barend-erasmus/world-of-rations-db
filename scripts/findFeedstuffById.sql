DELIMITER //

CREATE PROCEDURE findFeedstuffById ( 
p_feedstuffId CHAR(36))
BEGIN

SELECT 
p_feedstuffId AS `id`,
`feedstuffs`.`name` AS `name`,
NULL AS `username`,
`feedstuffGroup1`.`id` AS `groupId`,
CASE
	WHEN `feedstuffGroup3`.`name` IS NULL
	THEN
	CONCAT(`feedstuffGroup2`.`name`)
	WHEN `feedstuffGroup4`.`name` IS NULL
	THEN
	CONCAT(`feedstuffGroup3`.`name` , ' - ' , `feedstuffGroup2`.`name`)
	ELSE
	CONCAT(`feedstuffGroup4`.`name` , ' - ' , `feedstuffGroup3`.`name` , ' - ' , `feedstuffGroup2`.`name`)
END AS `groupName`
FROM worldofrations.feedstuffs AS `feedstuffs`
INNER JOIN worldofrations.feedstuffGroups AS `feedstuffGroup1`
ON `feedstuffs`.`groupId` = `feedstuffGroup1`.`Id`
LEFT JOIN worldofrations.feedstuffGroups AS `feedstuffGroup2`
ON `feedstuffGroup2`.`id` = `feedstuffGroup1`.`parentGroupId`
LEFT JOIN worldofrations.feedstuffGroups AS `feedstuffGroup3`
ON `feedstuffGroup3`.`id` = `feedstuffGroup2`.`parentGroupId`
LEFT JOIN worldofrations.feedstuffGroups AS `feedstuffGroup4`
ON `feedstuffGroup4`.`id` = `feedstuffGroup3`.`parentGroupId`
LEFT JOIN worldofrations.feedstuffGroups AS `feedstuffGroup5`
ON `feedstuffGroup5`.`id` = `feedstuffGroup4`.`parentGroupId`
WHERE 
`feedstuffs`.`id` = p_feedstuffId
UNION
SELECT 
p_feedstuffId AS `id`,
`userFeedstuffs`.`name`,
`users`.`username` AS `username`,
NULL AS `groupId`,
NULL AS `groupName`
FROM worldofrations.userFeedstuffs AS `userFeedstuffs`
INNER JOIN worldofrations.users as `users`
ON `userFeedstuffs`.`userId` = `users`.`id` 
WHERE `userFeedstuffs`.`id` = p_feedstuffId;


END;
//

DELIMITER ;