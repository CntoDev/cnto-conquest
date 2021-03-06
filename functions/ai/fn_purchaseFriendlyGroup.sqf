/* Purchase and create friendly unit if enough Supply available */
if (!isServer) exitWith {};

params ["_transactionId", "_locationMarker", "_selectedFriendlyClass"];

/* Lock supply for transaction */
if (!isNil "cnto_cq_supplyTransactionOngoing") exitWith { 
	["cnto_friendlyGroupPurchaseFailed", [_transactionId, "Armory can handle only one transaction at the time."]] call CBA_fnc_globalEvent;
};

cnto_cq_supplyTransactionOngoing = true;

/* Check if enough Supply available */
private _class = missionConfigFile >> "CNTOConquest" >> "Friendly" >> _selectedFriendlyClass;

/* Check if class */
if (!isClass _class) exitWith {
	["cnto_friendlyGroupPurchaseFailed", [_transactionId]] call CBA_fnc_globalEvent;
};

private _cost = getNumber (_class >> "supplyCost");

/* If not enough funds, publish event and exit */
if (cnto_cq_saved_supply - _cost < 0) exitWith {
	["cnto_friendlyGroupPurchaseFailed", [_transactionId, "Not enough supply."]] call CBA_fnc_globalEvent;
};

/* Deduce cost from team supply */
private _newSupply = cnto_cq_saved_supply - _cost;

/* Create friendly group */
private _location = (call cnto_cq_fnc_getLocations) get _locationMarker;
private _group = [_locationMarker, _location select 5, _class] call cnto_cq_fnc_createFriendlyGroup;

/* Store new new Supply */
cnto_cq_saved_supply = _newSupply;

// Publish success event
// Transaction ID, marker, location name, unit name, remaining supply
["cnto_friendlyGroupPurchased", [_transactionId, _locationMarker, _location select 0, getText (_class >> "displayName"), cnto_cq_saved_supply]] call CBA_fnc_globalEvent;

/* Release transaction */
cnto_cq_supplyTransactionOngoing = nil;
