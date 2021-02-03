/*
 * runs in unscheduled environment on the CLIENT that owns the player unit
 * when the player respawns
 *
 * do note that this is different to loadPlayer - we don't need to set
 * per-client variables here (some score, whatever), we *only* need to
 * set any attributes related to the player unit, ie. loadout, traits,
 * rank of the unit, etc.
 *
 * passed arguments identical to loadPlayer, see header there
 */

params ["_unit", "_saved"];
_saved params ["_loadout", "_traits"];


/*
 * always choose default loadout, don't load anything from saved state
 * as we leave the corpse behind when player dies and respawns
 */
_unit setUnitLoadout [call cnto_cq_fnc_getDefaultGear, false];

/* use saved traits */
if (!isNil "_traits") then {
    { _unit setUnitTrait _x } forEach _traits;
};
