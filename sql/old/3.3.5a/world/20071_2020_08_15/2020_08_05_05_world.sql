-- Add missing Scarab Coffers and update loot templates
UPDATE `gameobject_loot_template` SET `QuestRequired` = 0 WHERE `Entry` IN (17532,17533) AND `Item` = 21156 AND `Reference` = 0;
UPDATE `gameobject_loot_template` SET `MaxCount` = 3 WHERE `Entry` IN (17532,17533) AND `Reference` IN (14502,14001);
UPDATE `reference_loot_template` SET `Chance` = 7 WHERE `Entry` IN (14502,14001);

SET @OGUID := 92308;
DELETE FROM `gameobject` WHERE `guid` BETWEEN @OGUID+0 AND @OGUID+20;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES
-- Aq 40 Coffer Locations
(@OGUID+0, 180690, 531, 3428, 3428, 1, 1, -8561.12, 1989.54, -3.091515, 4.188792, 0, 0, -0.866025, 0.5000008, 7200, 255, 1, 28153),
(@OGUID+1, 180690, 531, 3428, 3428, 1, 1, -8134.142, 1125.443, -86.26643, 2.513274, 0, 0, 0.9510565, 0.3090171, 7200, 255, 1, 28153),
(@OGUID+2, 180690, 531, 3428, 3428, 1, 1, -8583.558, 1287.909, -68.88995, 1.605702, 0, 0, 0.7193394, 0.6946588, 7200, 255, 1, 28153),
(@OGUID+3, 180690, 531, 3428, 3428, 1, 1, -8674.741, 1594.589, -86.13927, 3.57793, 0, 0, -0.9762955, 0.2164421, 7200, 255, 1, 28153),
(@OGUID+4, 180690, 531, 3428, 3428, 1, 1, -8882.011, 1347.217, -92.58246, 1.134463, 0, 0, 0.5372992, 0.8433917, 7200, 255, 1, 28153),
(@OGUID+5, 180690, 531, 3428, 3428, 1, 1, -8928.15, 1823.571, -18.932, 1.099556, 0, 0, 0.5224981, 0.8526405, 7200, 255, 1, 28153),
(@OGUID+6, 180690, 531, 3428, 3428, 1, 1, -9106.087, 1502.935, -100.0013, 5.078908, 0, 0, -0.5664063, 0.8241262, 7200, 255, 1, 28153),
(@OGUID+7, 180690, 531, 3428, 3428, 1, 1, -9161.575, 1579.325, -79.93993, 1.884953, 0, 0, 0.8090162, 0.5877863, 7200, 255, 1, 28153),
(@OGUID+8, 180690, 531, 3428, 3428, 1, 1, -9201.085, 1486.463, -95.17252, 2.007128, 0, 0, 0.8433914, 0.5372996, 7200, 255, 1, 28153),
(@OGUID+9, 180690, 531, 3428, 3428, 1, 1, -9242.85, 1567.696, -77.35221, 0.4886912, 0, 0, 0.2419214, 0.9702958, 7200, 255, 1, 28153),
(@OGUID+10, 180690, 531, 3428, 3428, 1, 1, -9203.896, 1961.314, -50.16774, 1.553341, 0, 0, 0.7009087, 0.7132511, 7200, 255, 1, 28153),
-- Aq 20 Coffer Locations
(@OGUID+11, 180691, 509, 3429, 0, 1, 1,  -8938.357, 1860.113, 3.230413, 3.752462, 0, 0, -0.9537163, 0.3007079, 7200, 255, 1, 28153),
(@OGUID+12, 180691, 509, 3429, 0, 1, 1,  -9090.657, 1500.959, 24.43414, 0.9773831, 0, 0, 0.469471, 0.8829479, 7200, 255, 1, 28153),
(@OGUID+13, 180691, 509, 3429, 3449, 1, 1,  -8713.438, 1543.339, 32.20343, 0.7679439, 0, 0, 0.3746061, 0.927184, 7200, 255, 1, 28153),
(@OGUID+14, 180691, 509, 3429, 0, 1, 1, -9344.263, 1191.306, 22.02172, 1.308995, 0, 0, 0.6087608, 0.7933538, 7200, 255, 1, 28153),
(@OGUID+15, 180691, 509, 3429, 3451, 1, 1, -9541.153, 1585.01, 26.55809, 4.049168, 0, 0, -0.8987932, 0.4383728, 7200, 255, 1, 28153),
(@OGUID+16, 180691, 509, 3429, 3451, 1, 1, -9694.639, 1653.436, 22.49914, 5.864307, 0, 0, -0.2079115, 0.9781476, 7200, 255, 1, 28153),
(@OGUID+17, 180691, 509, 3429, 0, 1, 1, -9519.043, 2003.008, 109.0341, 2.426008, 0, 0, 0.9366722, 0.3502074, 7200, 255, 1, 28153),
(@OGUID+18, 180691, 509, 3429, 3453, 1, 1, -9006.972, 1988.604, 32.23689, 6.161013, 0, 0, -0.06104851, 0.9981348, 7200, 255, 1, 28153),
(@OGUID+19, 180691, 509, 3429, 3453, 1, 1, -9121.046, 2180.517, 24.86209, 0.9075702, 0, 0, 0.4383707, 0.8987942, 7200, 255, 1, 28153),
(@OGUID+20, 180691, 509, 3429, 3450, 1, 1, -8772.138, 2003.604, 21.90698, 2.91469, 0, 0, 0.9935713, 0.1132084, 7200, 255, 1, 28153);