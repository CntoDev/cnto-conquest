if (isServer) exitWith {};
/*
Basic first time setup of a location. WIP and untested!
*/

params [
    ["_locationType", "null", ""],
    ["_position", [-1, -1, -1], [[]], 3],
    ["_size", 200, [0]],
    ["_side", east, [east]],
    ["_threatLevel", 0, [0]]
];


private _location = createTrigger ["EmptyDetector", _position, true];
_location setTriggerActivation ["ANYPLAYER", "PRESENT", true];
_location setTriggerArea [2000, 2000, 0, false];
_location setTriggerStatements [
    "this", 
    "thisTrigger call cnto_cq_loadLocation",
    "thisTrigger call cnto_cq_unloadLocation"
];
// maybe more trigger stuff if we need it

_location setVariable ["cnto_cq_isLocation", true];
_location setVariable ["cnto_cq_locationType", _locationType];
_location setVariable ["cnto_cq_side", _side];
_location setVariable ["cnto_cq_threatLevel", _threatLevel];
_location setVariable ["cnto_cq_size", _size];
_location setVariable ["cnto_cq_loadedGroups", []];