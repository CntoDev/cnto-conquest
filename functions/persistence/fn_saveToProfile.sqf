/*
 * save runtime data to server's profileNamespace
 */

// TODO: this actually doesn't save players, because players are saved
//       to the global variable only on disconnect, this function only
//       saves global variables to disk -- this may be somewhat counter
//       to player expectations and could cause issues when server crashes
//        --> maybe make savePlayer compatible with this func & move corpse
//            deletion logic outside it somehow?

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
