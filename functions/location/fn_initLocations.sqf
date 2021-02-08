/* Initialize list of locations from mission config file. */
if (!isServer) exitWith {};

private _loc = createHashMap;

{
	_loc set [getText (_x >> "marker"), 
		[
			getText (_x >> "displayName"),
			getNumber (_x >> "owner"),
			getNumber (_x >> "threatLevel"),
			getNumber (_x >> "minUnits"),
			getNumber (_x >> "maxUnits"),
			getNumber (_x >> "size"),
			getText (_x >> "onCapture")
		]];
} forEach ("getNumber (_x >> 'scope') > 0" configClasses (missionConfigFile >> "CNTOConquest" >> "Locations"));

_loc
