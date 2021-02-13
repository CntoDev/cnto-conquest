["Initialize"] call BIS_fnc_dynamicGroups;

/* create enemy forces */
call cnto_cq_fnc_createEnemyForces;

/* Game loop */
while {true} do {
	sleep 10;
	call cnto_cq_fnc_refreshAI;
};
