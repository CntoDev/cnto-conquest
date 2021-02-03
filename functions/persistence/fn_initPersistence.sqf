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
        cnto_cq_saved_players params ["_keys", "_values"];
        private _index = _keys find _uid;
        if (_index != -1) then {
            _values set [
                _index,
                [_unit, _values select _index] call cnto_cq_fnc_savePlayer
            ];
        } else {
            _keys pushBack _uid;
            _values pushBack ([_unit, []] call cnto_cq_fnc_savePlayer);
        };
        publicVariable "cnto_cq_saved_players";
        false;
    }];
};

/* load player metadata on the client (set* tend to be local) */
0 = [] spawn {
    if (!hasInterface) exitWith {};
    waitUntil { !isNull player };
    waitUntil { !isNil "cnto_cq_saved_players" };
    cnto_cq_saved_players params ["_keys", "_values"];
    private _index = _keys find (getPlayerUID player);
    if (_index != -1) then {
        private _data = _values select _index;
        [player, _data] call cnto_cq_fnc_loadPlayer;
    } else {
        [player, []] call cnto_cq_fnc_loadPlayer;
    };

    player addEventHandler ["Respawn", {
        params ["_unit", "_corpse"];
        cnto_cq_saved_players params ["_keys", "_values"];
        private _index = _keys find (getPlayerUID _unit);
        if (_index != -1) then {
            private _data = _values select _index;
            [_unit, _data] call cnto_cq_fnc_respawnPlayer;
        } else {
            [_unit, []] call cnto_cq_fnc_respawnPlayer;
        };
    }];
};
