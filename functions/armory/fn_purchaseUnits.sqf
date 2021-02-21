params ["_marker"];

private _allConfigs = "getNumber (_x >> 'scope') > 0" configClasses (missionConfigFile >> "CNTOConquest" >> "Friendly");

private _uiBuilder = ["Purchase units"] call cnto_ui_fnc_initBuilder;
[_uiBuilder, "Unit", _allConfigs apply { configName _x }, _allConfigs apply { format ["%1 (%2 supply)", getText (_x >> "displayName"), getNumber (_x >> "supplyCost")] }] call cnto_ui_fnc_hasCombo;
[_uiBuilder, _marker] call cnto_ui_fnc_withArgument;
[
	_uiBuilder,
	{
		params ["_values", "_args"];
		["cnto_purchaseFriendlyGroup", [floor random 1000000, _args#0, _values#0]] call CBA_fnc_serverEvent;
	}
] call cnto_ui_fnc_onSuccess;
[_uiBuilder] call cnto_ui_fnc_showDialog;