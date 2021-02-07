/* Gets list of locations. If mission has just started, it reads mission config for initial values. */
private _loc = missionNamespace getVariable ["cnto_cq_saved_locations", []];

if (_loc isEqualTo []) then {
	_loc = createHashMap;

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
};

missionNamespace setVariable ["cnto_cq_saved_locations", _loc];
_loc