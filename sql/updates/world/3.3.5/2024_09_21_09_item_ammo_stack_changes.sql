/* Revert ammo stack size to 200 across all ammo item templates, as it was in classic. */
UPDATE `item_template` SET `stackable` = 200 WHERE `stackable` = 1000 AND `InventoryType` = 24;