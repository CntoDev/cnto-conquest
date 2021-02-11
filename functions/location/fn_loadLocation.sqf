params ["_location"];
/*
Load location into mission from trigger if players are close
*/

private _locationType = _location getVariable ["cnto_cq_locationType"];
private _side = _location getVariable ["cnto_cq_side"];
private _pos = getPos _location;
private _threatLevel = _location getVariable ["cnto_cq_threatLevel"];
private _size = _location getVariable ["cnto_cq_size"];



// specific location type stuff?
if (_locationType in ["village", "FOB"]) then {
    _loadedGroups = [];
    while {_threatLevel > 0} do {
        _groupThreat = round(random(_threatLevel));
        _grp = [_pos, _size, _groupThreat] call cnto_cq_fnc_createEnemyForces;
        _loadedGroups append _grp;
        _threatLevel - _groupThreat;
    };

    _location setVariable ["cnto_cq_loadedGroups", _loadedGroups];
}
