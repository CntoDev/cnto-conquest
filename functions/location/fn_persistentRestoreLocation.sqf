params ["_position", "_locationVars"];
/*
Used to restore a location upon mission load.
*/

private _location = createTrigger ["EmptyDetector", _position, true];
_location setTriggerActivation ["ANYPLAYER", "PRESENT", true];
_location setTriggerArea [2000, 2000, 0, false];
_location setTriggerStatements [
    "this", 
    "thisTrigger call cnto_cq_loadLocation",
    "thisTrigger call cnto_cq_unloadLocation"
];
// maybe more trigger stuff if we need it

{
    _location setVariable _x;
} forEach _locationVars;