/* Initialize friendly forces */
private _friendlyForces = createHashMap;
private _locations = call cnto_cq_fnc_getLocations;

{
	/* Default list of friendly forces to empty array */
	_friendlyForces set [_x, []];
} forEach keys _locations;

_friendlyForces
