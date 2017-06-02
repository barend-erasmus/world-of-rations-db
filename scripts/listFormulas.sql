DELIMITER //

CREATE PROCEDURE listFormulas()
BEGIN
SELECT
`formula`.`id` AS `id`,
`formula`.`name` AS `name`,
`formulaGroup1`.`id` AS `groupId1`,
`formulaGroup1`.`name` AS `groupName1`,
`formulaGroup2`.`id` AS `groupId2`,
`formulaGroup2`.`name` AS `groupName2`,
`formulaGroup3`.`id` AS `groupId3`,
`formulaGroup3`.`name` AS `groupName3`,
`formulaGroup4`.`id` AS `groupId4`,
`formulaGroup4`.`name` AS `groupName4`,
`comparisonFormulas`.`formulaId` AS `comparisonFormulaId`
FROM worldofrations.formulas AS `formula`
INNER JOIN worldofrations.formulaGroups AS `formulaGroup1`
ON `formula`.`groupId` = `formulaGroup1`.`id`
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
WHERE `formulaGroup1`.`name` = 'MNE'
ORDER BY `formula`.`sortOrder` ASC;
END;
//

DELIMITER ;

