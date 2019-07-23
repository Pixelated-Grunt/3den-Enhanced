/*
   Author: Revo

   Description:
   Used by the Enh_FunctionViewer GUI. Called on load.

   Parameter(s):
   0: DISPLAY - Display

   Returns:
   BOOLEAN: true
*/

disableSerialization;

params ["_disp"];

private _ctrlTV = _disp displayCtrl 1500;

Enh_FunctionsData = call Enh_fnc_functionsViewer_getFunctionsData;

if (round (ctrlfade (findDisplay 313 displayctrl 1023)) < 1) then
{
	"showinterface" call BIS_fnc_3DENInterface
};

if (isNil "Enh_FunctionsViewer_LastViewed") then {Enh_FunctionsViewer_LastViewed = ""};

//if (isnil "BIS_fnc_init") then {4 call (uinamespace getvariable "BIS_fnc_recompile")};

//Disable recompile buttons if recompiling isn't allowed
if (getNumber (missionConfigfile >> "allowFunctionsRecompile") == 0) then
{
	(_disp displayCtrl 1600) ctrlEnable false;
	(_disp displayCtrl 1601) ctrlEnable false;
};

_disp displayAddEventHandler ["keyDown",//Focus Search
{
	params ["_disp", "_key", "_shift", "_ctrl"];
	if (_key isEqualTo 33 && _ctrl) then
	{
		ctrlSetFocus (_disp displayCtrl 1400);
	}
}];

_disp displayAddEventHandler ["keyDown",//Copy
{
	params ["_disp", "_key", "_shift", "_ctrl"];
	if (_key isEqualTo 45 && _ctrl) then
	{
		call Enh_fnc_functionsViewer_copy;
	}
}];

//Set number of functions
(_disp displayCtrl 1405) ctrlSetText str count Enh_FunctionsData;

//Set filters to last used or default value
(_disp displayCtrl 1700) lbSetCurSel (profileNamespace getVariable ["Enh_FunctionsViewer_ConfigIndex",0]);
(_disp displayCtrl 1800) lbSetCurSel (profileNamespace getVariable ["Enh_FunctionsViewer_ModeIndex",0]);

//Set up tree view
_ctrlTV call Enh_fnc_FunctionsViewer_fillCtrlTV;

true