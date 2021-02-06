/*
 * determine the soldier gear (loadout) this player should have by default
 *
 * DO NOT use the in-editor Arsenal to modify loadout
 *
 * this function is called ie.
 *  - when a new player joins the campaign
 *  - when a dead player respawns
 *  - generally when anyone without a custom loadout joins, ie. after
 *    disconnect while dead
 *
 * return a setUnitLoadout-compatible array
 * - this is the same as ACE's arsenal EXPORT output
 */

/*
 * same loadout for everybody, for now - you can easily add another saved
 * field with some rank or specialization, pass it from loadPlayer and
 * respawnPlayer to this function and 'switch' based on it here, giving
 * different roles different default loadout
 */

[["rhs_weap_akm","rhs_acc_dtkakm","","",["rhs_30Rnd_762x39mm",30],[],""],[],[],["UK3CB_TKP_B_U_CombatUniform_TAN",[["ACE_fieldDressing",4],["ACE_tourniquet",2]]],["V_BandollierB_blk",[["rhs_30Rnd_762x39mm",5,30]]],[],"UK3CB_TKP_O_H_Patrolcap_Blk","",[],["ItemMap","","","ItemCompass","ItemWatch",""]];
