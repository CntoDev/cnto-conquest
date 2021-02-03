/*
 * runs on the SERVER when a player disconnects
 * - the unit likely isn't local at this point
 *
 * the second argument (_saved below) contains an array from a previous
 * savePlayer call, in case you want to only slightly modify it and re-save
 * most of the original contents
 * - HOWEVER if there's no previous save, _saved will be [], meaning any
 *   'params' call on it will give you nil local variables !
 *
 * whatever this function returns is stored persistently
 */

params ["_unit", "_saved"];
_saved params ["_loadout", "_traits"];

private _is_stable = { true };
if (!isNil "ace_medical_status_fnc_hasStableVitals") then {
    _is_stable = ace_medical_status_fnc_hasStableVitals;
};


_traits = getAllUnitTraits _unit;

/*
 * if alive, save current loadout and delete body,
 * if dead, save empty loadout and keep body
 */
if (alive _unit && [_unit] call _is_stable) then {
    _loadout = getUnitLoadout [_unit, false];
    deleteVehicle _unit;
} else {
    _loadout = nil;
};


[_loadout, _traits];
