params ["_location"];
/*
Unload location when players have left area and save the new state of location
*/
private _units = [];
{
    private _grp = _x;
    _units append (units _x);
} forEach (_location getVariable ["cnto_cq_loadedGroups"]);

// need to add vehicle handling etc, this just assumes 1 unit = 1 threat for proof of concept
_threatLevel = count _units;
{
    deleteVehicle _x;
} forEach _units;

_location setVariable ["cnto_cq_threatLevel", _threatLevel];
_location setVariable ["cnto_cq_loadedGroups", []];