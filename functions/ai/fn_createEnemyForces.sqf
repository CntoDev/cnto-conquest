/* Create enemy forces on enemy controlled locations. Meant to be run once on mission start. */
if (!isServer) exitWith {};

/* Read current location owners */
private _loc = call cnto_cq_fnc_getLocations;

{
	_y params ["_displayName", "_owner", "_threatLevel", "_minUnits", "_maxUnits", "_size"];

	/* Check if location controlled by enemy */
	if (_owner == 0) then {
		private _numberOfUnits = round random [_minUnits, (_minUnits+_maxUnits)/2, _maxUnits];
		
		for "_i" from 1 to _numberOfUnits do {
			[_x, _size, _threatLevel] call cnto_cq_fnc_createEnemyGroup;
		};
	};
} forEach _loc;
