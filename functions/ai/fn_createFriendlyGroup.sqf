if (!isServer) exitWith {};

params ["_position", "_size", "_friendlyConfig", ["_condition", {true}]];

if ([_position, _size, _friendlyConfig] call _condition) then {
	private _randomPos = _position getPos [random _size, random 360];
	private _groupCfg = call compile getText (_friendlyConfig >> "cfgGroupsPath");
	private _initCode = getText (_groupCfg >> "init");

	private _group = [_randomPos, west, _groupCfg] call BIS_fnc_spawnGroup;

	if (_initCode != "") then {
		[_group] call compile _initCode;
	};

	_group
} else {
	grpNull
};
