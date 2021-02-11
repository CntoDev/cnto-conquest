params ["_location"];
/*
Returns all useful data about a location. To be used for saving the missionConfigFile
*/

private _vars = (allVariables _location) apply {[_x, _location getVariable _x]};
private _pos = getPos _location;

private _locationData = [_pos, _vars];

_locationData