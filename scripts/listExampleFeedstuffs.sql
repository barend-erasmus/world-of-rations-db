DELIMITER //

CREATE PROCEDURE listExampleFeedstuffs()
BEGIN
CREATE TEMPORARY TABLE temp
(
    `id` CHAR(36), 
    `name` VARCHAR(255), 
    `searchText` VARCHAR(255), 
    `cost` DOUBLE,
	`minimum` INT,
	`maximum` INT
);


INSERT INTO temp
(
`id`,
`name`,
`searchText`,
`cost`,
`minimum`,
`maximum`
)
(
SELECT `id`, `name`, LOWER(`name`), 2300, 0, 1000
FROM worldofrations.feedstuffs WHERE `name` = 'Alfalfa hay, dehy 17% CP'
);


INSERT INTO temp
(
`id`,
`name`,
`searchText`,
`cost`,
`minimum`,
`maximum`
)
(
SELECT `id`, `name`, LOWER(`name`), 800, 0, 1000
FROM worldofrations.feedstuffs WHERE `name` = 'Sunflower seed hulls'
);

INSERT INTO temp
(
`id`,
`name`,
`searchText`,
`cost`,
`minimum`,
`maximum`
)
(
SELECT `id`, `name`, LOWER(`name`), 3800, 0, 1000
FROM worldofrations.feedstuffs WHERE `name` = 'Corn grain (maize),  yellow'
);

INSERT INTO temp
(
`id`,
`name`,
`searchText`,
`cost`,
`minimum`,
`maximum`
)
(
SELECT `id`, `name`, LOWER(`name`), 3000, 0, 1000
FROM worldofrations.feedstuffs WHERE `name` = 'Oats, grain'
);


INSERT INTO temp
(
`id`,
`name`,
`searchText`,
`cost`,
`minimum`,
`maximum`
)
(
SELECT `id`, `name`, LOWER(`name`), 4500, 0, 80
FROM worldofrations.feedstuffs WHERE `name` = 'Molasses, sugarcane (syrup)'
);

INSERT INTO temp
(
`id`,
`name`,
`searchText`,
`cost`,
`minimum`,
`maximum`
)
(
SELECT `id`, `name`, LOWER(`name`), 6000, 0, 1000
FROM worldofrations.feedstuffs WHERE `name` = 'Fish meal, herring'
);

INSERT INTO temp
(
`id`,
`name`,
`searchText`,
`cost`,
`minimum`,
`maximum`
)
(
SELECT `id`, `name`, LOWER(`name`), 7000, 0, 120
FROM worldofrations.feedstuffs WHERE `name` = 'Cottonseed o/c meal, mech extr'
);

INSERT INTO temp
(
`id`,
`name`,
`searchText`,
`cost`,
`minimum`,
`maximum`
)
(
SELECT `id`, `name`, LOWER(`name`), 6000, 0, 4
FROM worldofrations.feedstuffs WHERE `name` = 'Urea 46% Nitrogen'
);

INSERT INTO temp
(
`id`,
`name`,
`searchText`,
`cost`,
`minimum`,
`maximum`
)
(
SELECT `id`, `name`, LOWER(`name`), 7500, 0, 1000
FROM worldofrations.feedstuffs WHERE `name` = 'Canola (Rapeseed) oil'
);

INSERT INTO temp
(
`id`,
`name`,
`searchText`,
`cost`,
`minimum`,
`maximum`
)
(
SELECT `id`, `name`, LOWER(`name`), 1200, 0, 1000
FROM worldofrations.feedstuffs WHERE `name` = 'Ca, as ground Limestone'
);


INSERT INTO temp
(
`id`,
`name`,
`searchText`,
`cost`,
`minimum`,
`maximum`
)
(
SELECT `id`, `name`, LOWER(`name`), 900, 4, 4
FROM worldofrations.feedstuffs WHERE `name` = 'Na and Cl, as Salt'
);

INSERT INTO temp
(
`id`,
`name`,
`searchText`,
`cost`,
`minimum`,
`maximum`
)
(
SELECT `id`, `name`, LOWER(`name`), 2000, 0, 1000
FROM worldofrations.feedstuffs WHERE `name` = 'K, as Potassium Chloride (KCl)'
);

INSERT INTO temp
(
`id`,
`name`,
`searchText`,
`cost`,
`minimum`,
`maximum`
)
(
SELECT `id`, `name`, LOWER(`name`), 2500, 0, 1000
FROM worldofrations.feedstuffs WHERE `name` = 'Mg, as Magnesium oxide (MgO)'
);

INSERT INTO temp
(
`id`,
`name`,
`searchText`,
`cost`,
`minimum`,
`maximum`
)
(
SELECT `id`, `name`, LOWER(`name`), 2500, 0, 1000
FROM worldofrations.feedstuffs WHERE `name` = 'Ca and P, as Di-calcium phosphate'
);

INSERT INTO temp
(
`id`,
`name`,
`searchText`,
`cost`,
`minimum`,
`maximum`
)
(
SELECT `id`, `name`, LOWER(`name`), 5000, 0, 1000
FROM worldofrations.feedstuffs WHERE `name` = 'S, as Ammonium Sulphate ((NH4)2SO4)'
);


SELECT 
`id` AS `id`,
`name` AS `name`,
`searchText` AS `searchText`,
`cost` AS `cost`,
`minimum` AS `minimum`,
`maximum` AS `maximum`
FROM temp;


DROP TABLE temp;
END;
//

DELIMITER ;

