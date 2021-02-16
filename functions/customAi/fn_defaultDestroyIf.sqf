/* This is where unit itself should be cached if players are not around. */
if (!isServer) exitWith {};

params ["_unit"];

/* is unit already active? */
private _group = _unit getOrDefault ["group", grpNull];

/* unit is not active, gtfo */
if (_group isEqualTo grpNull) exitWith {};

/* is group alive? */
private _liveSoldiers = { alive _x } count  units _group;

if (_liveSoldiers == 0) then {
	/* unit is wiped out, completely destroy it */
	deleteGroup _group;
	_unit set ["gc", true];
};

/* any players around? */
private _position = getPos leader _group;
private _playersInArea = (allPlayers select {alive _x}) inAreaArray [_position, 1000, 1000];

if (count _playersInArea == 0) then {
	/* there are no players in area, despawn */
	_unit set ["position", _position];
	
	private _vehicles = [];

	{
		if (_x == vehicle _x) then {
			deleteVehicle _x;
		} else {
			_vehicles pushBackUnique vehicle _x;
			vehicle _x deleteVehicleCrew _x;
		};
	} forEach units _group;

	{ deleteVehicle _x; } forEach _vehicles;
	deleteGroup _group;
	_unit set ["group", grpNull];
};
