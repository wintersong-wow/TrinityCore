#ifndef DEF_TRANSMOGRIFICATION_H
#define DEF_TRANSMOGRIFICATION_H

#include <vector>
#include "Define.h"
#include "ObjectGuid.h"

#define PRESETS // comment this line to disable preset feature totally
#define MAX_OPTIONS 25 // do not alter

enum AppearanceType : uint32
{
    TRANSMOG_TYPE_ITEM,
    TRANSMOG_TYPE_ENCHANT,
    TRANSMOG_TYPE_COUNT,
};
enum TransmogResult
{
    TransmogResult_Ok = 0, // expected to be 0 while others are expected not to be 0
    TransmogResult_InvalidItemType,
    TransmogResult_ItemBlocked,
    TransmogResult_FishingPoleBlocked,
    TransmogResult_InvalidItemQuality,
    TransmogResult_RequiredEventNotActive,
    TransmogResult_ItemMustHaveStats,
    TransmogResult_InvalidFaction,
    TransmogResult_InvalidClass,
    TransmogResult_InvalidRace,
    TransmogResult_MissingProfiency,
    TransmogResult_MissingSkill,
    TransmogResult_TooLowSkill,
    TransmogResult_MissingSpell,
    TransmogResult_TooLowLevelPlayer,
    TransmogResult_TooLowLevelItem,
    TransmogResult_TooHighLevelItem,
    TransmogResult_ItemTypesDontMatch,
    TransmogResult_ArmorTypesDontMatch,
    TransmogResult_WeaponTypesDontMatch,
    TransmogResult_EquipSlotsDontMatch,
    TransmogResult_InvalidSlot,
    TransmogResult_NonexistantTransmog,
    TransmogResult_EmptySlot,
    TransmogResult_NoPendingTarnsmogs,
    TransmogResult_CostChangedDuringTransaction,
    TransmogResult_NotEnoughMoney,
    TransmogResult_TooLongSetName,
    TransmogResult_NoTransmogrifications,
    TransmogResult_AtMaxSets,
    TransmogResult_NonexistantSet,
    TransmogResult_ItemNotFitForEnchantRequirements,
};
inline const char* CanTransmogrifyResultMessage(TransmogResult result)
{
    switch (result)
    {
        case TransmogResult_Ok:
            return "Item transmogrified";
        case TransmogResult_InvalidItemType:
            return "This type of item cannot be transmogrified";
        case TransmogResult_ItemBlocked:
            return "This item cannot be transmogrified";
        case TransmogResult_FishingPoleBlocked:
            return "Fishing poles cannot be transmogrified";
        case TransmogResult_InvalidItemQuality:
            return "This item quality cannot be transmogrified";
        case TransmogResult_RequiredEventNotActive:
            return "Required event to use this item is not active";
        case TransmogResult_ItemMustHaveStats:
            return "Transmogrifiable item must have stat effects";
        case TransmogResult_InvalidFaction:
            return "Your faction cannot use that item";
        case TransmogResult_InvalidClass:
            return "Your class cannot use that item";
        case TransmogResult_InvalidRace:
            return "Your race cannot use that item";
        case TransmogResult_MissingProfiency:
            return "You do not have the profiency to use that item";
        case TransmogResult_MissingSkill:
            return "You do not have the required skill to use that item";
        case TransmogResult_TooLowSkill:
            return "You do not have the required skill level to use that item";
        case TransmogResult_MissingSpell:
            return "You do not have the required spell to use that item";
        case TransmogResult_TooLowLevelPlayer:
            return "Your level is too low to use that item";
        case TransmogResult_TooLowLevelItem:
            return "The item is too low level";
        case TransmogResult_TooHighLevelItem:
            return "The item is too high level";
        case TransmogResult_ItemTypesDontMatch:
            return "The item types do not match";
        case TransmogResult_ArmorTypesDontMatch:
            return "The armor types do not match";
        case TransmogResult_WeaponTypesDontMatch:
            return "The weapon types do not match";
        case TransmogResult_EquipSlotsDontMatch:
            return "The item equip slots do not allow transmogrifying";
        case TransmogResult_InvalidSlot:
            return "Items equipped in this slot cannot be transmogrified";
        case TransmogResult_NonexistantTransmog:
            return "The selected transmogrification does not exist";
        case TransmogResult_EmptySlot:
            return "You do not have an item equipped in that slot";
        case TransmogResult_NoPendingTarnsmogs:
            return "You have no pending transmogrifications";
        case TransmogResult_CostChangedDuringTransaction:
            return "Cost changed during transaction";
        case TransmogResult_NotEnoughMoney:
            return "Not enough money";
        case TransmogResult_TooLongSetName:
            return "The set name is too long or too short";
        case TransmogResult_NoTransmogrifications:
            return "You have no items equipped with pending or non-pending transmogrifications";
        case TransmogResult_AtMaxSets:
            return "You cannot save more sets";
        case TransmogResult_NonexistantSet:
            return "The set does not exist";
        case TransmogResult_ItemNotFitForEnchantRequirements:
            return "The item is not fit for the enchant";
    }
    return nullptr;
};
const char* const TransmogResult_Ok_PendingMessage = "Pending transmog added";
const char* const AddToCollectionMessageFmt        = "%s has been added to your appearance collection.";
const uint32 InvisibleEntry                        = std::numeric_limits<uint32>::max();
const uint32 NormalEntry                           = InvisibleEntry - 1;
const uint32 RemovePending                         = NormalEntry - 1;
const uint32 AbsoluteMaxSets                       = 25;
class Item;
typedef std::vector<std::tuple<Item* /*item*/, uint32 /*transmog*/, AppearanceType /*transmog type*/>> PendingTransmogs;
typedef std::vector<std::tuple<uint8 /*slot*/, uint32 /*transmog*/, AppearanceType /*transmog type*/>> SetTransmogs;
class Player;
class WorldSession;
class SpellInfo;
struct ItemTemplate;

class TC_GAME_API Transmogrification
{
private:
    Transmogrification() = default;
public:
    Transmogrification(Transmogrification const&) = delete;
    void operator=(Transmogrification const& x)   = delete;
    
    static Transmogrification& instance();
#ifdef PRESETS

    bool EnableSetInfo;
    uint32 SetNpcText;

    bool EnableSets;
    uint8 MaxSets;
    float SetCostModifier;
    int32 SetCopperCost;

    void LoadPlayerSets(Player* player);

    void PresetTransmog(Player* player, Item* itemTransmogrified, uint32 fakeEntry, uint8 slot);
#endif

    bool EnableTransmogInfo;
    uint32 TransmogNpcText;

    // Use IsAllowed() and IsNotAllowed()
    // these are thread unsafe, but assumed to be static data so it should be safe
    std::set<uint32> Allowed;
    std::set<uint32> NotAllowed;

    float ScaledCostModifier;
    int32 CopperCost;

    bool RequireToken;
    uint32 TokenEntry;
    uint32 TokenAmount;

    bool AllowPoor;
    bool AllowCommon;
    bool AllowUncommon;
    bool AllowRare;
    bool AllowEpic;
    bool AllowLegendary;
    bool AllowArtifact;
    bool AllowHeirloom;

    bool AllowMixedArmorTypes;
    bool AllowMixedWeaponTypes;
    bool AllowMixedInventoryTypes;
    bool AllowFishingPoles;

    bool IgnoreReqRace;
    bool IgnoreReqClass;
    bool IgnoreReqSkill;
    bool IgnoreReqSpell;
    bool IgnoreReqLevel;
    bool IgnoreReqEvent;
    bool IgnoreReqStats;
    bool IgnorePlayerMissingProfiency;
    bool IgnoreReqFaction;
    int IgnoreReqBound;

    static const std::unordered_map<uint32, std::string> enchant_visual_to_name; // contains all enchant visuals (not enchants) that should be viewable in menus

    bool IsAllowed(uint32 entry) const;
    bool IsNotAllowed(uint32 entry) const;
    bool IsAllowedQuality(uint32 quality) const;
    bool IsBowOrGunOrCrossbow(ItemTemplate const* itemTemplate);
    bool IsMeleeWeapon(ItemTemplate const* itemTemplate);

    std::unordered_map<uint32, std::vector<SpellInfo const*>> enchant_to_spells; // contains all enchants. Some spell lists can be empty
    std::unordered_map<uint32, std::vector<uint32>> spell_to_enchants;        // does not contain all enchants as all of them dont come from spells
    void LoadConfig(bool reload); // thread unsafe
    void LoadEnchants();          // thread unsafe
    std::string GetItemIcon(uint32 entry, uint32 width, uint32 height, int x, int y);
    std::string GetSlotIcon(uint8 slot, uint32 width, uint32 height, int x, int y);
    const char* GetSlotName(uint8 slot, WorldSession* session);
    std::string GetItemName(ItemTemplate const* itemTemplate, WorldSession* session);
    std::string GetItemName(Item const* itemTemplate, WorldSession* session);
    std::string GetItemLink(Item* item, WorldSession* session);
    std::string GetItemLink(uint32 entry, WorldSession* session);
    Item* GetEquippedItem(Player* player, uint8 slot);
    void UpdateItem(Player* player, Item* item);
    TransmogResult CannotTransmogrifyItemWithItem(Player* player, ItemTemplate const* destination,
                                                  ItemTemplate const* source, bool ever);
    TransmogResult CannotTransmogrifyItemWithEnchant(Player* player, ItemTemplate const* destination, uint32 enchant,
                                                     bool ever);
    TransmogResult CannotTransmogrifyItem(Player* player, ItemTemplate const* proto, bool ever);
    TransmogResult CannotEquip(Player* player, ItemTemplate const* proto);
    TransmogResult CannotEverEquip(Player* player, ItemTemplate const* proto);
    TransmogResult CannotTransmogrify(ItemTemplate const* proto);
    bool HasPendingTransmog(Player* player, uint8 slot, Item** retItem = nullptr, uint32* retPending = nullptr,
                            uint32* retCurrent = nullptr);
    bool HasPendingEnchant(Player* player, uint8 slot, Item** retItem = nullptr, uint32* retPending = nullptr,
                           uint32* retCurrent = nullptr);
    // Call these from core to add visuals to player's collection
    void AddToCollection(Player* player, Item* item);
    void AddToCollection(Player* player, const ItemTemplate* itemtemplate);
    void AddToCollectionEnchant(Player* player, uint32 enchant_id);
    uint32 AddItemVisualToCollection(Player* player, Item* item);
    uint32 AddItemVisualToCollection(Player* player, const ItemTemplate* itemtemplate);
    uint32 AddEnchantVisualToCollection(Player* player, uint32 enchant_id);
    bool CanAddToCollection(Player* player, Item* item);
    bool CanAddToCollection(Player* player, ItemTemplate const* itemTemplate);
    bool CanAddEnchantToCollection(Player* player, Item* item);
    uint32 Save(Player* player, AppearanceType transmogtype, uint32 visual);
    void SaveToDB(Player* player, AppearanceType transmogtype, uint32 visual);
    bool HasVisual(Player* player, AppearanceType transmogtype, uint32 visual);
    std::vector<ObjectGuid> GetItemList(const Player* player);
    std::vector<Item*> GetEquippedItems(Player* player);
    PendingTransmogs GetPendingTransmogs(Player* player);
    uint32 GetCurrentVisual(Item* item);
    uint32 GetCurrentVisualEnchant(Item* item);
    uint32 GetSpecialPrice(ItemTemplate const* proto);
    int32 CalculateTransmogCost(uint32 entry);
    int32 CalculateTransmogCost(PendingTransmogs& items);
    TransmogResult TrySetPendingTransmog(Player* player, uint32 slot, uint32 entry);
    TransmogResult TrySetPendingEnchant(Player* player, uint32 slot, uint32 entry);
    TransmogResult TransmogrifyPending(Player* player, int32 expectedCost = -1);
    void Transmogrify(Player* player, Item* transmogrified, AppearanceType type, uint32 entry);
    void RemoveAllTransmogrifications(Player* player);
    void RevertAllTransmogrifications(Player* player);
    bool RevertTransmogrification(Player* player, uint8 slot);
    bool RevertEnchant(Player* player, uint8 slot);
};

#endif
