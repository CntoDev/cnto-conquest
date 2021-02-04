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
 * the third argument (_disconnect below) is true when this function
 * is called for the last time for a current player unit, eg. when it
 * disconnects - when it's false, this function got called during manual
 * or automatic save, or similar
 *
 * whatever this function returns is stored persistently
 */

params ["_unit", "_saved", ["_disconnect",false]];
if (isNull _unit) exitWith {};
_saved params ["_loadout", "_traits"];

private _is_stable = { true };
if (!isNil "ace_medical_status_fnc_hasStableVitals") then {
    _is_stable = ace_medical_status_fnc_hasStableVitals;
};

_loadout = getUnitLoadout [_unit, false];

_traits = getAllUnitTraits _unit;

if (_disconnect) then {
    /*
     * if alive, keep loadout saved above and delete body,
     * if dead, save empty loadout and keep body
     */
    if (alive _unit && [_unit] call _is_stable) then {
        deleteVehicle _unit;
    } else {
        _loadout = nil;
    };
};

[_loadout, _traits];
