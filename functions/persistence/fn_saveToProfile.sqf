/*
 * save runtime data to server's profileNamespace
 */

/* save players to cnto_cq_saved_players */
{
    private _uid = getPlayerUID _x;
    if (_uid isNotEqualTo "") then {
        private _old = cnto_cq_saved_players getOrDefault [_uid, []];
        private _new = [_unit, _old] call cnto_cq_fnc_savePlayer;
        cnto_cq_saved_players set [_uid, _new];
    };
} forEach allPlayers;

/* see loadFromProfile */
private _data = [
    cnto_cq_saved_players,
    cnto_cq_saved_renown,
    cnto_cq_saved_fortify_credits,
    cnto_cq_saved_fortify_objects,
    cnto_cq_saved_locations,
    cnto_cq_saved_bases
];

/* maintain a circular buffer of 10 saves */
cnto_cq_save_version = cnto_cq_save_version + 1;
profileNamespace setVariable [
    format ["cnto_cq_save_data_%1", cnto_cq_save_version % 10],
    _data
];
profileNamespace setVariable ["cnto_cq_save_version", cnto_cq_save_version];
saveProfileNamespace;
