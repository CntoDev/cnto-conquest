if (!isServer) exitWith {};

if (isNil "cnto_cq_saved_friendly_forces") then {
	/* We will hash everything by location marker name. */
	cnto_cq_saved_friendly_forces = createHashMap;
	private _locations = call cnto_cq_fnc_getLocations;

	{
		/* Default list of friendly forces to empty array */
		cnto_cq_saved_friendly_forces set [_x, []];
	} forEach keys _locations;
};

cnto_cq_saved_friendly_forces
