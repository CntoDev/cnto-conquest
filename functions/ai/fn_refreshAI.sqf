/* Cycles through all AI units and updates their state */
if (!isServer) exitWith {};

{
	private _destroyIf = _x get "destroyIf";
	private _createIf = _x get "createIf";

	[_x] call compile _createIf;
	[_x] call compile _destroyIf;
} forEach (cnto_cq_saved_friendly_forces + cnto_cq_enemy_forces);

cnto_cq_saved_friendly_forces = cnto_cq_saved_friendly_forces select { !(_x getOrDefault ["gc", false]) };
cnto_cq_enemy_forces = cnto_cq_enemy_forces select { !(_x getOrDefault ["gc", false]) };
