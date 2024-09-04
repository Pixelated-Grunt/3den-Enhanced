/*
    Author: R3vo

    Date: 2022-12-31

    Description:
    Centers the map and camera on last selected context menu position

    Parameter(s):
    -

    Returns:
    -
*/

//Get the context menu position
(uiNamespace getVariable "BIS_fnc_3DENEntityMenu_data") params ["_position3D"];

//Check if map is open
if (get3DENActionState "toggleMap" > 0) then
{
    //Get the map in Eden Editor
    private _ctrlmap = findDisplay 313 displayCtrl 51;

    //Animate the map
    _ctrlmap ctrlMapAnimAdd [0.1, ctrlMapScale _ctrlmap, _position3D];
    ctrlMapAnimCommit _ctrlmap;
};

move3DENCamera [_position3D, true];