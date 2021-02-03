/*
 * save to profile every X minutes
 */

private _sleep = "SaveInterval" call BIS_fnc_getParamValue;
if (_sleep > 1000000) exitWith {};

cnto_cq_saveloop = (_sleep*60) spawn {
    while {true} do {
        sleep _this;
        isNil {
            [] call cnto_cq_fnc_saveToProfile;
        };
        "Autosaved." remoteExec ["systemChat"];
    };
};
