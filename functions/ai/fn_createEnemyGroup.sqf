/* Create enemy group of given threat level or weaker on given position. Groups are randomly selected from missionConfigFile >> "CNTOConquest" >> "Enemy". */
if (!isServer) exitWith {};

params ["_marker", "_size", "_threatLevel"];

private _randomPos = (getMarkerPos _marker) getPos [random _size, random 360];
private _possibleGroups = format ["getNumber (_x >> 'threatLevel') <= %1 && getNumber (_x >> 'scope') > 0", _threatLevel] configClasses (missionConfigFile >> "CNTOConquest" >> "Enemy");
private _selectedGroup = selectRandom _possibleGroups;
private _groupCfg = call compile getText (_selectedGroup >> "cfgGroupsPath");
private _initCode = getText (_selectedGroup >> "init");

private _aiGroup = createHashMap;

_aiGroup set ["type", configName _selectedGroup];
_aiGroup set ["position", _randomPos];
_aiGroup set ["side", east];
_aiGroup set ["attachedToMarker", _marker];
_aiGroup set ["createIf", getText (_selectedGroup >> "createIf")];
_aiGroup set ["destroyIf", getText (_selectedGroup >> "destroyIf")];
_aiGroup set ["displayName", getText (_selectedGroup >> "displayName")];
_aiGroup set ["cfgGroupsPath", getText (_selectedGroup >> "cfgGroupsPath")];
_aiGroup set ["threatLevel", getNumber (_selectedGroup >> "threatLevel")];
_aiGroup set ["init", getText (_selectedGroup >> "init")];

cnto_cq_enemy_forces pushBack _aiGroup;
_aiGroup
