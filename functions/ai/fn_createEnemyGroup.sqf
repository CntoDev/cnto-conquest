/* Create enemy group of given threat level or weaker on given position. Groups are randomly selected from missionConfigFile >> "CNTOConquest" >> "Enemy". */
if (!isServer) exitWith {};

params ["_position", "_size", "_threatLevel"];

private _randomPos = _position getPos [random _size, random 360];
private _possibleGroups = format ["getNumber (_x >> 'threatLevel') <= %1 && getNumber (_x >> 'scope') > 0", _threatLevel] configClasses (missionConfigFile >> "CNTOConquest" >> "Enemy");
private _selectedGroup = selectRandom _possibleGroups;
private _groupCfg = call compile getText (_selectedGroup >> "cfgGroupsPath");
private _initCode = getText (_selectedGroup >> "init");

private _group = [_randomPos, east, _groupCfg] call BIS_fnc_spawnGroup;

if (_initCode != "") then {
	[_group] call compile _initCode;
};

_group
