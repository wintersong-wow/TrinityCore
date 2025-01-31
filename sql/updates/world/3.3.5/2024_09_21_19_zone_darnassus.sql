
-- Fix a very minor subname inconsistency with a Darnassus Trainer.
update creature_template set subname = 'Darnassian Quartermaster' where entry = 4203;

-- Delete the Wintergrasp Arcanist Dulial.
delete from creature WHERE id = 35599;

-- Remove Emissary Valustraa from the Temple of the Moon in Darnassus for being a Draenei.
delete from creature WHERE id = 17105;

-- Remove Rukua from the Temple of the Moon in Darnassus for being a Draenei.
delete from creature WHERE id = 35281;
