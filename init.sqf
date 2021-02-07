// acex fortify parameters
[west, 0, [

	["TK_GUE_WarfareBBarracks_Base_EP1", 100], 
	["Land_BagBunker_Large_F", 75], 
	["Land_BagBunker_Small_F", 25], 
	["Land_BagBunker_Tower_F", 50], 
	["Land_HBarrier_5_F", 10], 
	["Land_BagFence_Long_F", 5], 
	["Land_BagFence_Round_F", 5], 
	["Flag_TKA_B_Army", 100]

]] call acex_fortify_fnc_registerObjects;

acex_fortify_locations pushBack [constructionVic, 50, 50, 0, false];


// civilian loadouts to be applied to Engima's civilian script
civ1 = [[],[],[],["UK3CB_ADC_C_U_01_G",[]],["UK3CB_V_Pouch",[]],[],"","",[],["","","","","",""]];
civ2 = [[],[],[],["UK3CB_ADC_C_U_01",[]],["UK3CB_V_Pouch",[]],[],"","",[],["","","","","",""]];
civ3 = [[],[],[],["UK3CB_ADC_C_U_01_B",[]],["UK3CB_V_Pouch",[]],[],"","",[],["","","","","",""]];
civ4 = [[],[],[],["UK3CB_ADC_C_U_01_C",[]],["UK3CB_V_Pouch",[]],[],"","",[],["","","","","",""]];
civ5 = [[],[],[],["UK3CB_ADC_C_U_01_F",[]],["UK3CB_V_Pouch",[]],[],"","",[],["","","","","",""]];
civ6 = [[],[],[],["UK3CB_TKC_C_U_01",[]],["UK3CB_V_Pouch",[]],[],"","",[],["","","","","",""]];
civ7 = [[],[],[],["UK3CB_TKC_C_U_01_B",[]],["UK3CB_V_Pouch",[]],[],"","",[],["","","","","",""]];
civ8 = [[],[],[],["UK3CB_TKC_C_U_01_C",[]],["UK3CB_V_Pouch",[]],[],"","",[],["","","","","",""]];
civ9 = [[],[],[],["UK3CB_TKC_C_U_01_D",[]],["UK3CB_V_Pouch",[]],[],"","",[],["","","","","",""]];
civ10 = [[],[],[],["UK3CB_TKC_C_U_01_E",[]],["UK3CB_V_Pouch",[]],[],"","",[],["","","","","",""]];
civ11 = [[],[],[],["UK3CB_TKC_C_U_02",[]],["UK3CB_V_Pouch",[]],[],"","",[],["","","","","",""]];
civ12 = [[],[],[],["UK3CB_TKC_C_U_02_C",[]],["UK3CB_V_Pouch",[]],[],"UK3CB_TKM_I_H_Turban_05_1","",[],["","","","","",""]];
civ13 = [[],[],[],["UK3CB_TKC_C_U_03",[]],["UK3CB_V_Pouch",[]],[],"UK3CB_TKM_I_H_Turban_01_1","",[],["","","","","",""]];
civ14 = [[],[],[],["UK3CB_TKC_C_U_06",[]],["UK3CB_V_Pouch",[]],[],"UK3CB_TKM_I_H_Turban_02_1","",[],["","","","","",""]];
civ15 = [[],[],[],["UK3CB_TKC_C_U_06_E",[]],["UK3CB_V_Pouch",[]],[],"UK3CB_TKM_I_H_Turban_03_1","",[],["","","","","",""]];

call compile preprocessFileLineNumbers "Engima\Civilians\Init.sqf";
