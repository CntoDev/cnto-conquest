/*
 * runs in scheduled environment on the CLIENT that owns the player unit
 * when it joins the game (mission start of JIP) - if the mission hasn't
 * started yet, then it runs during the briefing screen
 *
 * the second argument (_saved below) contains an array from a previous
 * savePlayer call
 * - HOWEVER if there's no previous save, _saved will be [], meaning any
 *   'params' call on it will give you nil local variables !
 */

params ["_unit", "_saved"];
_saved params ["_loadout", "_traits"];


/* if no loadout was saved, choose a default one */
if (isNil "_loadout") then {
    _loadout = call cnto_cq_fnc_getDefaultGear;
};
_unit setUnitLoadout [_loadout, false];

if (!isNil "_traits") then {
    { _unit setUnitTrait _x } forEach _traits;
};
