if (isServer) then {
    [] call cnto_cq_fnc_loadFromProfile;
    [] call cnto_cq_fnc_saveToProfileLoop;

    // maybe save on #missions? .. not sure if this works reliably
    //addMissionEventHandler ["MPEnded", {
    //    [] call cnto_cq_fnc_saveToProfile;
    //}];

    /* save player metadata on disconnect */
    addMissionEventHandler ["HandleDisconnect", {
        params ["_unit", "_id", "_uid", "_name"];
        if (isNull _unit) exitWith {};
        private _old = cnto_cq_saved_players getOrDefault [_uid, []];
        private _new = [_unit, _old, true] call cnto_cq_fnc_savePlayer;
        cnto_cq_saved_players set [_uid, _new];
        publicVariable "cnto_cq_saved_players";
        false;
    }];
};

/* load player metadata on the client (set* tend to be local) */
0 = [] spawn {
    if (!hasInterface) exitWith {};
    waitUntil { !isNull player };
    waitUntil { !isNil "cnto_cq_saved_players" };
    private _data = cnto_cq_saved_players getOrDefault [getPlayerUID player, []];
    [player, _data] call cnto_cq_fnc_loadPlayer;

    player addEventHandler ["Respawn", {
        params ["_unit", "_corpse"];
        private _data = cnto_cq_saved_players getOrDefault [getPlayerUID _unit, []];
        [_unit, _data] call cnto_cq_fnc_respawnPlayer;
    }];
};
