-- remove artisan+ conditions to remove console warnings.
delete from conditions where ConditionValue1 >= 300 and ConditionTypeOrReference = 7;
delete from conditions where ConditionValue2 >= 300 and ConditionTypeOrReference = 7;
delete from conditions where ConditionValue3 >= 300 and ConditionTypeOrReference = 7;
-- update artisan+ quest requirements to remove console warnings.
update quest_template_addon set RequiredSkillPoints = 300 where RequiredSkillPoints > 300;