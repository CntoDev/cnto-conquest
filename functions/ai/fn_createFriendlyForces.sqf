/* Create friendly forces on friendly controlled locations. Meant to be run once on mission start. */
if (!isServer) exitWith {};

/* Read current location owners */
private _loc = call cnto_cq_fnc_getLocations;
private _friendlyGroups = call cnto_cq_fnc_getFriendlyForces;

{
	_y params ["_displayName", "_owner", "_threatLevel", "_minUnits", "_maxUnits", "_size"];

	/* Check if location controlled by friendly */
	if (_owner == 1) then {
		private _friendliesOnLocation = _friendlyGroups getOrDefault [_x, []];
		private _position = getMarkerPos _x;
		
		{
			private _group = [_position, _size, _x] call cnto_cq_fnc_createFriendlyGroup;
			[_group] call CBA_fnc_taskDefend;
			_group enableDynamicSimulation true;
		} forEach _friendliesOnLocation;
	};
} forEach _loc;
