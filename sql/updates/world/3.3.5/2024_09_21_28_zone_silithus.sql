-- Gate of Ahn'Qiraj
DELETE FROM `gameobject` WHERE `id`=176146;
INSERT INTO `gameobject` (`id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES (176146, 1, -8133.34, 1525.13, 17.1904, 6.28103, 0.00107995, -0.999999, 600, 100, 1);

-- Ahn'Qiraj Gate Roots
DELETE FROM `gameobject` WHERE `id`=176147;
INSERT INTO `gameobject` (`id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES (176147, 1, -8133.34, 1525.13, 17.1904, 6.28103, 0.00107995, -0.999999, 600, 100, 1);

-- Ahn'Qiraj Gate Runes
DELETE FROM `gameobject` WHERE `id`=176148;
INSERT INTO `gameobject` (`id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES (176148, 1, -8133.34, 1525.13, 17.1904, 6.28103, 0.00107995, -0.999999, 600, 100, 1);

-- Gate of Ahn'Qiraj
UPDATE `gameobject_template_addon` SET `flags`=4 WHERE `entry`=176146;

-- Ahn'Qiraj Gate Roots
UPDATE `gameobject_template_addon` SET `flags`=4 WHERE `entry`=176147;

-- Ahn'Qiraj Gate Runes
UPDATE `gameobject_template_addon` SET `flags`=4 WHERE `entry`=176148;

-- Scarab Gong
UPDATE `gameobject_template` SET `type` = 2 WHERE `entry` = 180717;

UPDATE `gameobject` SET `id` = 180717 WHERE `guid` = 49451;
DELETE FROM `gameobject_questender` WHERE `quest`=8743;
INSERT INTO `gameobject_questender` (`id`, `quest`) VALUES (180717, 8743);
DELETE FROM `gameobject_queststarter` WHERE `quest`=8743;
INSERT INTO `gameobject_queststarter` (`id`, `quest`) VALUES (180717, 8743);
