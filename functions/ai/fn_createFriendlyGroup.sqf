/* Poor man's Tna class constructor */
if (!isServer) exitWith {};

// TODO remove size in future, markers have area to select from
params ["_marker", "_size", "_friendlyConfig"];

private _randomPos = (getMarkerPos _marker) getPos [random _size, random 360];

/* Initialize AI group "object". Some properties are likely unneeded but what the hell. */
private _aiGroup = createHashMap;

_aiGroup set ["type", _friendlyConfig];
_aiGroup set ["position", _randomPos];
_aiGroup set ["side", west];
_aiGroup set ["attachedToMarker", _marker];
_aiGroup set ["createIf", getText (_friendlyConfig >> "createIf")];
_aiGroup set ["destroyIf", getText (_friendlyConfig >> "destroyIf")];
_aiGroup set ["displayName", getText (_friendlyConfig >> "displayName")];
_aiGroup set ["cfgGroupsPath", getText (_friendlyConfig >> "cfgGroupsPath")];
_aiGroup set ["supplyCost", getNumber (_friendlyConfig >> "supplyCost")];
_aiGroup set ["renownTier", getNumber (_friendlyConfig >> "renownTier")];
_aiGroup set ["init", getText (_friendlyConfig >> "init")];

if ((_aiGroup get "createIf") != "") then {
	[_aiGroup] call compile (_aiGroup get "createIf");
};

/* Store new Tna in array of all friendly groups */
cnto_cq_saved_friendly_forces pushBack _aiGroup;

_aiGroup
