/* Subscribe to custom events on mission start. */
if (isServer) then {
	["cnto_purchaseFriendlyGroup", {
		_this call cnto_cq_fnc_purchaseFriendlyGroup;
	}] call CBA_fnc_addEventHandler;
};

/* Init enemy forces array */
cnto_cq_enemy_forces = [];

/* init locations */
cnto_cq_saved_locations = call cnto_cq_fnc_initLocations;
