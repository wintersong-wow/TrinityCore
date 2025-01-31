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