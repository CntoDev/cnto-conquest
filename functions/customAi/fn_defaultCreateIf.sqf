/* This is where unit itself should be spawned if players are around. */
if (!isServer) exitWith {};

params ["_unit"];

/* is unit already active? */
private _group = _unit getOrDefault ["group", grpNull];

/* unit is active, gtfo */
if (_group isNotEqualTo grpNull) exitWith {};

/* any players around? */
private _position = _unit get "position";
private _playersInArea = (allPlayers select {alive _x}) inAreaArray [_position, 1000, 1000];

if (count _playersInArea > 0) then {
	/* there are players in area */
	private _groupCfg = call compile (_unit get "cfgGroupsPath");
	private _initCode = _unit get "init";

	_group = [_position, _unit get "side", _groupCfg] call BIS_fnc_spawnGroup;
	_unit set ["group", _group];

	if (_initCode != "") then {
		[_group] call compile _initCode;
	};
};
