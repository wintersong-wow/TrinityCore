-- Add "Poisons" training spell to the quests.
UPDATE `quest_template` SET `RewardSpell` = 2995, `RewardDisplaySpell` = 2842 WHERE `ID` IN (2480, 2359);

-- Restore the loot table of the undead drone near the tower.
delete from creature_loot_template where Entry = 7051;
INSERT INTO creature_loot_template (Entry,Item,Reference,Chance,QuestRequired,LootMode,GroupId,MinCount,MaxCount,Comment) VALUES
	 (7051,1179,0,7.06,0,1,0,1,1,'Malformed Defias Drone - Ice Cold Milk'),
	 (7051,2287,0,2.36,0,1,0,1,1,'Malformed Defias Drone - Haunch of Meat'),
	 (7051,2447,0,11.76,0,1,0,1,1,'Malformed Defias Drone - Peacebloom'),
	 (7051,2450,0,21.18,0,1,0,1,1,'Malformed Defias Drone - Briarthorn'),
	 (7051,2452,0,9.42,0,1,0,1,1,'Malformed Defias Drone - Swiftthistle'),
	 (7051,2835,0,2.36,0,1,0,1,1,'Malformed Defias Drone - Rough Stone'),
	 (7051,2836,0,3.12,0,1,0,1,1,'Malformed Defias Drone - Coarse Stone'),
	 (7051,4592,0,4.7,0,1,0,1,1,'Malformed Defias Drone - Longjaw Mud Snapper'),
	 (7051,7923,0,100.0,1,1,0,1,1,'Malformed Defias Drone - Defias Tower Key');
update creature_template set lootid = 7051 where entry = 7051;

UPDATE `item_template` SET `spellppmRate_1` = -1 WHERE `entry` = 3776;
UPDATE `item_template` SET `spellid_1` = 8693, `spellcharges_1` = -1 WHERE `entry` = 6951;
UPDATE `item_template` SET `Flags` = 2097216, `spellid_1` = 11399, `spellcharges_1` = -1 WHERE `entry` = 9186;
UPDATE `item_template` SET `class` = 0, `subclass` = 0 WHERE `entry` IN (3775, 3776, 10918, 10920, 10921, 10922, 22055, 2892, 2893, 8984, 8985, 20844, 22053, 22054, 6947, 6949, 6950, 8926, 8927, 8928, 21927, 5237, 6951, 9186, 21835);

/* Blinding Powder */

UPDATE `item_template` SET `name` = 'Blinding Powder', `class` = 5, `subclass` = 0, `Quality` = 1, description = 'Very helpful for fighting dirty.' WHERE `entry` = 5530;

DELETE FROM `npc_vendor` WHERE `item` IN (3775, 2892, 2893, 5237, 6947, 6949, 6950, 6951, 8926, 8927, 8928, 8984, 8985, 3776, 9186, 10918, 10920, 10921, 10922, 20844, 21835, 21927, 22053, 22054, 22055);

DELETE FROM `trainer_spell` WHERE `ReqSkillLine` = 40;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellID`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`, `ReqAbility1`) VALUES
(9, 2835, 10000, 40, 130, 30, 0),
(9, 2837, 18000, 40, 170, 38, 2835),
(9, 3420, 3000, 40, 1, 20, 0),
(9, 3421, 35000, 40, 230, 50, 3420),
(9, 5763, 5000, 40, 100, 24, 0),
(9, 6510, 14000, 40, 150, 34, 0),
(9, 8687, 8000, 40, 120, 28, 8681),
(9, 8691, 16000, 40, 160, 36, 8687),
(9, 8694, 18000, 40, 170, 38, 5763),
(9, 11341, 29000, 40, 200, 44, 8691),
(9, 11342, 46000, 40, 240, 52, 11341),
(9, 11343, 54000, 40, 280, 60, 11342),
(9, 11357, 31000, 40, 210, 46, 2837),
(9, 11358, 48000, 40, 250, 54, 11357),
(9, 13220, 12000, 40, 140, 32, 0),
(9, 13228, 20000, 40, 180, 40, 13220),
(9, 13229, 33000, 40, 220, 48, 13228),
(9, 13230, 50000, 40, 260, 56, 13229),
(9, 26786, 110000, 40, 320, 68, 0),
(9, 26892, 110000, 40, 320, 68, 11343),
(9, 26969, 65000, 40, 290, 62, 25347),
(9, 27282, 140000, 40, 330, 70, 26969),
(9, 27283, 80000, 40, 300, 64, 13230);


DELETE FROM `reference_loot_template` WHERE `Entry`=34024 AND `Item`=21302;
INSERT INTO `reference_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES (34024, 21302, 0, 0, 0, 1, 3, 1, 1, 'Handbook of Deadly Poison V');

DELETE FROM `spell_ranks` WHERE `first_spell_id` IN (2835, 3420, 13220, 8681, 5763);
INSERT INTO `spell_ranks` (`first_spell_id`, `spell_id`, `rank`) VALUES
(2835, 2835, 1),
(2835, 2837, 2),
(2835, 11357, 3),
(2835, 11358, 4),
(2835, 25347, 5),
(2835, 26969, 6),
(2835, 27282, 7),
(3420, 3420, 1),
(3420, 3421, 2),
(13220, 13220, 1),
(13220, 13228, 2),
(13220, 13229, 3),
(13220, 13230, 4),
(13220, 27283, 5),
(8681, 8681, 1),
(8681, 8687, 2),
(8681, 8691, 3),
(8681, 11341, 4),
(8681, 11342, 5),
(8681, 11343, 6),
(8681, 26892, 7),
(5763, 5763, 1),
(5763, 8694, 2),
(5763, 11400, 3);