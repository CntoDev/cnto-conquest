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

    /* global renown value shared by everyone */
    cnto_cq_saved_renown = _data select 1;

    /* global ACEX fortify credits (assuming players share one side) */
    cnto_cq_saved_fortify_credits = _data select 2;

    /* saved ACEX fortify placed objects as [classname,PositionASL] */
    cnto_cq_saved_fortify_objects = _data select 3;

    /* map locations and their metadata, indexed by 'text <loc>' */
    cnto_cq_saved_locations = _data select 4;

    /* player bases, indexed by their name (given by players) */
    cnto_cq_saved_bases = _data select 5;

} else {

    /* defaults on new game */
    cnto_cq_saved_players = createHashMap;
    cnto_cq_saved_renown = 0;
    cnto_cq_saved_fortify_credits = 0;
    cnto_cq_saved_fortify_objects = [];
    cnto_cq_saved_locations = createHashMap;
    cnto_cq_saved_bases = createHashMap;

};

publicVariable "cnto_cq_saved_players";
publicVariable "cnto_cq_saved_renown";
publicVariable "cnto_cq_saved_fortify_credits";
publicVariable "cnto_cq_saved_fortify_objects";
publicVariable "cnto_cq_saved_locations";
publicVariable "cnto_cq_saved_bases";
