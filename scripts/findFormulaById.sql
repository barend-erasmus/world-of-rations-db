DELIMITER //

CREATE PROCEDURE findFormulaById ( 
p_formulaId CHAR(36))
BEGIN
SELECT
`formula`.`id` AS `id`,
`formula`.`name` AS `name`,
`formulaGroup1`.`id` AS `groupId`,
CASE
	WHEN `formulaGroup3`.`name` IS NULL
	THEN
	CONCAT(`formulaGroup2`.`name`)
	WHEN `formulaGroup4`.`name` IS NULL
	THEN
	CONCAT(`formulaGroup3`.`name` , ' - ' , `formulaGroup2`.`name`)
	ELSE
	CONCAT(`formulaGroup4`.`name` , ' - ' , `formulaGroup3`.`name` , ' - ' , `formulaGroup2`.`name`)
END AS `groupName`,
`comparisonFormulas`.`formulaId` AS `comparisonFormulaId`
FROM worldofrations.formulas AS `formula`
INNER JOIN worldofrations.formulaGroups AS `formulaGroup1`
ON `formula`.`groupId` = `formulaGroup1`.`Id`
LEFT JOIN worldofrations.formulaGroups AS `formulaGroup2`
ON `formulaGroup2`.`id` = `formulaGroup1`.`parentGroupId`
LEFT JOIN worldofrations.formulaGroups AS `formulaGroup3`
ON `formulaGroup3`.`id` = `formulaGroup2`.`parentGroupId`
LEFT JOIN worldofrations.formulaGroups AS `formulaGroup4`
ON `formulaGroup4`.`id` = `formulaGroup3`.`parentGroupId`
LEFT JOIN worldofrations.formulaGroups AS `formulaGroup5`
ON `formulaGroup5`.`id` = `formulaGroup4`.`parentGroupId`
LEFT JOIN worldofrations.comparisonFormulas AS `comparisonFormulas`
ON `comparisonFormulas`.`id` = `formula`.`id`
WHERE `formula`.`Id` =  p_formulaId;
END;
//

DELIMITER ;