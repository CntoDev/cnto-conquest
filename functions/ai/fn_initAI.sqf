/* Subscribe to custom events on mission start. */
if (isServer) then {
	["cnto_purchaseFriendlyGroup", {
		_this call cnto_cq_fnc_purchaseFriendlyGroup;
	}] call CBA_fnc_addEventHandler;
};
