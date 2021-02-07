/*
 * save to profile every X minutes
 */

private _sleep = "SaveInterval" call BIS_fnc_getParamValue;
if (_sleep > 1000000) exitWith {};

/*
 * this uses next-wakeup-time with 'sleep 1' instead of one big sleep
 * so that it can be re-set back to SaveInterval by a manual save
 */
cnto_cq_save_interval = _sleep*60;
cnto_cq_save_interval_wakeup = cnto_cq_save_interval;
0 = [] spawn {
    while {true} do {
        waitUntil {
            sleep 1;
            time > cnto_cq_save_interval_wakeup;
        };
        isNil {
            [] call cnto_cq_fnc_saveToProfile;
        };
        "Autosaved." remoteExec ["systemChat"];
        cnto_cq_save_interval_wakeup = time + cnto_cq_save_interval;
    };
};
