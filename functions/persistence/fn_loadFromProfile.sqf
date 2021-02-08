/*
 * load saved data from server's profileNamespace
 *
 * we use individual global variables instead of one easy big array
 * to limit the amount of network traffic on every publicVariable call
 * - we need to publicVariable stuff way more often than we actually need
 *   to save it to the profile
 */

cnto_cq_save_version = profileNamespace getVariable ["cnto_cq_save_version", 0];
private _data = profileNamespace getVariable
                    format ["cnto_cq_save_data_%1", cnto_cq_save_version % 10];

if (!isNil "_data") then {

    /* metadata for players, one array for idx, another for values */
    cnto_cq_saved_players = _data select 0;

    /* global ACEX fortify credits (assuming players share one side) */
    cnto_cq_saved_fortify_credits = _data select 1;

    /* saved ACEX fortify placed objects */
    cnto_cq_saved_fortify_objects = _data select 2;

    /* global renown value shared by everyone */
    cnto_cq_saved_renown = _data select 3;
    
    /* ownership of locations */
    cnto_cq_saved_locations = _data select 4;
    
    /* purchased friendly forces */
    cnto_cq_saved_friendly_forces = _data select 5;

} else {

    /* defaults on new game */
    cnto_cq_saved_players = createHashMap;
    cnto_cq_saved_fortify_credits = 0;
    cnto_cq_saved_fortify_objects = [];
    cnto_cq_saved_renown = 0;
    cnto_cq_saved_locations = call cnto_cq_fnc_initLocations; // locations must be initialized before forces
    cnto_cq_saved_friendly_forces = call cnto_cq_fnc_initFriendlyForces;

};

/* don't broadcast variables not directly used by mission scripts */
publicVariable "cnto_cq_saved_players";
//publicVariable "cnto_cq_saved_fortify_credits";
//publicVariable "cnto_cq_saved_fortify_objects";
publicVariable "cnto_cq_saved_renown";

/*
 * set up a helper variable for tracking ACEX Fortify placed objects
 * since ACEX doesn't keep this list itself and there's no easy way
 * of getting these dynamically, other than iterating over thousands
 * of nearObjects
 */
cnto_cq_acex_fortify_objects_transient = [];
["acex_fortify_objectPlaced", {
    params ["_player", "_side", "_obj"];
    cnto_cq_acex_fortify_objects_transient pushBack _obj;
}] call CBA_fnc_addEventHandler;
["acex_fortify_objectDeleted", {
    private _idx = cnto_cq_acex_fortify_objects_transient find _obj;
    cnto_cq_acex_fortify_objects_transient deleteAt _idx;
}] call CBA_fnc_addEventHandler;

0 = [] spawn {
    waitUntil { !isNil "BIS_fnc_init" };

    /* load ACEX budget */
    [west, cnto_cq_saved_fortify_credits, false] call acex_fortify_fnc_updateBudget;

    /* spawn ACEX fortify buildings */
    {
        _x params ["_classname", "_pos", "_vectordir", "_vectorup"];
        private _obj = createVehicle [_classname, _pos, [], 0, "CAN_COLLIDE"];
        _obj setVectorDirAndUp [_vectordir, _vectorup];
        ["acex_fortify_objectPlaced", [objNull, west, _obj]] call CBA_fnc_globalEvent; 
    } forEach cnto_cq_saved_fortify_objects;
};
