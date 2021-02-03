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

[["SMG_03C_TR_camo","","acc_pointer_IR","optic_Hamr",["50Rnd_570x28_SMG_03",50],[],""],["launch_MRAWS_sand_F","","","",[],[],""],["hgun_Pistol_heavy_01_F","","","",["11Rnd_45ACP_Mag",11],[],""],["U_OrestesBody",[["FirstAidKit",1],["Chemlight_green",1,1],["11Rnd_45ACP_Mag",1,11]]],["V_PlateCarrier1_tna_F",[["HandGrenade",2,1],["SmokeShell",1,1],["SmokeShellGreen",1,1],["Chemlight_green",1,1],["50Rnd_570x28_SMG_03",2,50],["11Rnd_45ACP_Mag",2,11]]],["O_GMG_01_weapon_F",[]],"H_Cap_red","G_Bandanna_aviator",["Laserdesignator","","","",[],[],""],["","I_UavTerminal","ItemRadio","","","O_NVGoggles_ghex_F"]];
