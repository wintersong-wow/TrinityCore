-- Re-enable Summon Felsteed (Warlock)
DELETE FROM `disables` WHERE `sourceType`=1 AND `entry` IN (3631, 4487, 4488, 4489, 4490);

-- Remove incorrect mail about riding which doesn't match Vanilla levels
DELETE FROM `mail_level_reward` WHERE `level` <= 60;


-- Riding Skills
UPDATE trainer_spell SET ReqLevel=40 WHERE SpellID=33388;
UPDATE trainer_spell SET MoneyCost=800000 WHERE SpellID=33388;
UPDATE trainer_spell SET ReqLevel=60 WHERE SpellID=33391;
UPDATE trainer_spell SET MoneyCost=10000000 WHERE SpellID=33391;
UPDATE trainer_spell SET ReqLevel=70 WHERE SpellID=34090;
UPDATE trainer_spell SET MoneyCost=6000000 WHERE SpellID=34090;
DELETE FROM trainer_spell WHERE SpellID=23214;
DELETE FROM trainer_spell WHERE SpellID=34767;
DELETE FROM trainer_spell WHERE SpellID=23161;
UPDATE trainer_spell SET ReqLevel=40 WHERE SpellID=13820;
UPDATE trainer_spell SET ReqLevel=40 WHERE SpellID=34768;
UPDATE trainer_spell SET ReqLevel=40 WHERE SpellID=1710;
UPDATE trainer_spell SET ReqLevel=68 WHERE SpellID=33950;
