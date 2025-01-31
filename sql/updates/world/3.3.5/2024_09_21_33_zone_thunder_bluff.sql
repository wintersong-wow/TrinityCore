-- Taim Ragetotem
DELETE FROM `creature` WHERE `id`=7427;
INSERT INTO `creature` (`id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`) VALUES (7427, 1, -1384.29, -98.6163, 159.018, 2.87979, 300);

-- Kergul Bloodaxe <Warsong Gulch Battlemaster>
DELETE FROM `creature` WHERE `id`=10360;
INSERT INTO `creature` (`id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`) VALUES (10360, 1, -1381.29, -75.9809, 160.602, 3.19395, 300);

-- Martin Lindsey <Arathi Basin Battlemaster>
DELETE FROM `creature` WHERE `id`=12198;
INSERT INTO `creature` (`id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`) VALUES (12198, 1, -995.143, 217.173, 104.729, 4.46804, 500);

-- Remove WotLK Battlemasters
DELETE FROM `creature` WHERE `id`=34978;
DELETE FROM `creature` WHERE `id`=34976;

-- Karn Stonehoof <Expert Blacksmith>
UPDATE `creature_template` SET `subname`='Expert Blacksmith' WHERE `entry`=2998;

-- Kurm Stonehoof <Mining Supplier>
UPDATE `creature_template` SET `subname`='Mining Supplier' WHERE `entry`=3002;

-- Tepa <Expert Tailor>
UPDATE `creature_template` SET `subname`='Expert Tailor' WHERE `entry`=3004;

-- Una <Artisan Leatherworker>
UPDATE `creature_template` SET `subname`='Artisan Leatherworker' WHERE `entry`=3007;

-- Mak <Journeyman Leatherworker>
UPDATE `creature_template` SET `subname`='Journeyman Leatherworker', `npcflag`=81 WHERE `entry`=3008;

-- Bena Winterhoof <Expert Alchemist>
UPDATE `creature_template` SET `subname`='Expert Alchemist' WHERE `entry`=3009;

-- Teg Dawnstrider <Expert Enchanter>
UPDATE `creature_template` SET `subname`='Expert Enchanter' WHERE `entry`=3011;

-- Kard Ragetotem <Sword and Dagger Merchant>
UPDATE `creature_template` SET `subname`='Sword and Dagger Merchant' WHERE `entry`=3021;

-- Naal Mistrunner <Cooking Supplier>
UPDATE `creature_template` SET `subname`='Cooking Supplier' WHERE `entry`=3027;

-- Sewa Mistrunner <Fishing Supplier>
UPDATE `creature_template` SET `subname`='Fishing Supplier' WHERE `entry`=3029;

-- Cairne Bloodhoof <High Chieftain>
UPDATE `creature_template` SET `minlevel`=63, `maxlevel`=63 WHERE `entry`=3057;

-- Honor Guard
UPDATE `creature_template` SET `minlevel`=60, `maxlevel`=60, `rank`=0 WHERE `entry`=3083;

-- Bluffwatcher
UPDATE `creature_template` SET `minlevel`=55, `maxlevel`=55, `faction`=105 WHERE `entry`=3084;

-- Chepi <Reagent Vendor>
UPDATE `creature_template` SET `subname`='Reagent Vendor' WHERE `entry`=8361;

-- Kuruk <General Goods Vendor>
UPDATE `creature_template` SET `subname`='General Goods Vendor' WHERE `entry`=8362;

-- Shadi Mistrunner <Trade Goods Supplier>
UPDATE `creature_template` SET `subname`='Trade Goods Supplier' WHERE `entry`=8363;

-- Thrag Stonehoof <Journeyman Blacksmith>
UPDATE `creature_template` SET `subname`='Journeyman Blacksmith', `npcflag`=81 WHERE `entry`=10278;

-- Kray <Journeyman Alchemist>
UPDATE `creature_template` SET `subname`='Journeyman Alchemist', `npcflag`=81 WHERE `entry`=11047;

-- Vhan <Journeyman Tailor>
UPDATE `creature_template` SET `subname`='Journeyman Tailor', `npcflag`=81 WHERE `entry`=11051;

-- Mot Dawnstrider <Journeyman Enchanter>
UPDATE `creature_template` SET `subname`='Journeyman Enchanter', `npcflag`=81 WHERE `entry`=11071;

-- Tarn <Expert Leatherworker>
UPDATE `creature_template` SET `subname`='Expert Leatherworker', `npcflag`=81 WHERE `entry`=11084;

-- Hunter Sagewind
UPDATE `creature_template` SET `minlevel`=60, `maxlevel`=60 WHERE `entry`=14440;

-- Hunter Ragetotem
UPDATE `creature_template` SET `minlevel`=60, `maxlevel`=60 WHERE `entry`=14441;

-- Bena Winterhoof <Expert Alchemist>
DELETE FROM `gossip_menu_option` WHERE `MenuID`=4128;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`) VALUES (4128, 0, 3, 'Train me.', 3266, 5, 16);

-- Teg Dawnstrider <Expert Enchanter>
DELETE FROM `gossip_menu_option` WHERE `MenuID`=4165;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`) VALUES (4165, 0, 3, 'Train me.', 3266, 5, 16);

-- Tarn <Expert Leatherworker>
DELETE FROM `gossip_menu_option` WHERE `MenuID`=4207;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`) VALUES (4207, 0, 3, 'Train me.', 3266, 5, 16);

-- Una <Artisan Leatherworker>
DELETE FROM `gossip_menu_option` WHERE `MenuID`=4242;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`) VALUES (4242, 0, 3, 'Train me.', 3266, 5, 16);

-- Tepa <Expert Tailor>
DELETE FROM `gossip_menu_option` WHERE `MenuID`=4351;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`) VALUES (4351, 0, 3, 'Train me.', 3266, 5, 16);

-- Kurm Stonehoof <Mining Supplier>
DELETE FROM `npc_vendor` WHERE `entry`=3002 AND `item` IN (20815, 20824);

-- Fyr Mistrunner <Bread Vendor>
DELETE FROM `npc_vendor` WHERE `entry`=3003 AND `item` IN (27855, 33449, 35950);

-- Mahu <Leatherworking & Tailoring Supplies>
DELETE FROM `npc_vendor` WHERE `entry`=3005 AND `item`=38426;

-- Nida Winterhoof <Herbalism Supplier>
DELETE FROM `npc_vendor` WHERE `entry`=3014 AND `item`=40411;

-- Kuna Thunderhorn <Bowyer & Fletching Goods>
DELETE FROM `npc_vendor` WHERE `entry`=3015 AND `item`=28053;

-- Nata Dawnstrider <Enchanting Supplies>
DELETE FROM `npc_vendor` WHERE `entry`=3012 AND `item`=6342;
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (3012, 6342, 1, 7200);

-- Kaga Mistrunner <Meat Vendor>
DELETE FROM `npc_vendor` WHERE `entry`=3025 AND `item` IN (27854, 33454, 35953);

-- Naal Mistrunner <Cooking Supplier>
DELETE FROM `npc_vendor` WHERE `entry`=3027 AND `item`=30817;

-- Thrumn <Tabard Vendor>
DELETE FROM `npc_vendor` WHERE `entry`=5189 AND `item` IN (15197, 15199, 19031, 19505, 24004, 31773, 31775, 31776, 31777, 31778, 31779, 31780, 31781, 31804, 32445, 32828, 35221);

-- Innkeeper Pala <Innkeeper>
DELETE FROM `npc_vendor` WHERE `entry`=6746 AND `item` IN (27857, 28399, 33443, 33444, 33445, 35952, 35954);

-- Chepi <Reagent Vendor>
DELETE FROM `npc_vendor` WHERE `entry`=8361 AND `item` IN (22147, 22148, 37201, 44605, 44614, 44615);

