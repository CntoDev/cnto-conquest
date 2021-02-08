if (!isServer) exitWith {};

private _friendlyForces = missionNamespace getVariable ["cnto_cq_saved_friendly_forces", []];

if (_friendlyForces isEqualTo []) then {
	/* We will hash everything by location marker name. */
	_friendlyForces = createHashMap;
	private _locations = call cnto_cq_fnc_getLocations;

	{
		/* Default list of friendly forces to empty array */
		_friendlyForces set [_x, []];
	} forEach keys _locations;
};

cnto_cq_saved_friendly_forces = _friendlyForces;
_friendlyForces
