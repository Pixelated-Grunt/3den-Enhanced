/*
  Author: R3vo

  Description:
  Used by the ENH_TexturFinder GUI. Fills the GUI with all found textures. Spawned onLoad of the GUI.

  Parameter(s):
  -

  Returns:
  -
*/

#include "\3denEnhanced\defines\defineCommon.inc"

#define TINY [0, 512]
#define SMALL [513, 1024]
#define MEDIUM [1025, 8192]
#define LARGE [8193, 65536]
#define VERY_LARGE [65537, 10e37]
#define SIZES [TINY, SMALL, MEDIUM, LARGE, VERY_LARGE]

disableSerialization;
private _display = findDisplay IDD_TEXTUREFINDER;
private _ctrlTV = CTRL(IDC_TEXTUREFINDER_TEXTURELIST);
private _ctrlProgText = CTRL(IDC_TEXTUREFINDER_PROGRESSTEXT);
private _indexItem = 0;
private _indexType = 0;
private _pixelCount = 0;
private _indexSize = 0;
private _shortcutText = localize "STR_ENH_FUNCTIONS_FILLTEXTURELB_TOOLTIP";
private _listStatusText = localize "STR_ENH_TEXTUREFINDER_LISTSTATUS";
private _textureCountTotal = count (uiNamespace getVariable "ENH_TextureFinder_Textures");

_ctrlTV tvAdd [[], "JPG"];
_ctrlTV tvAdd [[], "PAA"];

[0, 1] apply
{
  _ctrlTV tvAdd [[_x], "XS"];
  _ctrlTV tvAdd [[_x], "S"];
  _ctrlTV tvAdd [[_x], "M"];
  _ctrlTV tvAdd [[_x], "L"];
  _ctrlTV tvAdd [[_x], "XL"];
};

{
  if (isNull _display) exitWith {endLoadingScreen};

  getTextureInfo _x params ["_w", "_h", "_rgb"];
  _pixelCount = _w * _h;
  _indexSize = SIZES findif {_pixelCount >= _x # 0 && _pixelCount <= _x # 1};

  _indexType = parseNumber (".paa" in _x);
  _indexItem = _ctrlTV tvAdd [[_indexType, _indexSize], format ["%1 [%2x%3]", _x, _w, _h]];
  _ctrlTV tvSetData [[_indexType, _indexSize, _indexItem], _x];

  _ctrlTV tvSetPictureRight [[_indexType, _indexSize, _indexItem], _x];//This is soo slow =(
  _ctrlTV tvSetTooltip [[_indexType, _indexSize, _indexItem], format ["%1\n%2 x %3\nR: %4\nG: %5\nB: %6\nA: %7\n\n%8", _x, _w, _h, _rgb#0, _rgb#1, _rgb#2, _rgb#3, _shortcutText]];

  progressLoadingScreen ((_forEachIndex + 1) / _textureCountTotal);

} forEach (uiNamespace getVariable ["ENH_TextureFinder_Textures", []]);

//Always show final result
_ctrlProgText ctrlSetStructuredText parseText format [_listStatusText, _textureCountTotal, _textureCountTotal];

_ctrlTV tvSortAll [[], false];

CTRL(IDC_TEXTUREFINDER_SEARCH) ctrlEnable true;
CTRL(IDC_TEXTUREFINDER_TEXTURELIST) ctrlEnable true;
CTRL(IDC_TEXTUREFINDER_COLLAPSEALL) ctrlEnable true;
CTRL(IDC_TEXTUREFINDER_EXPANDALL) ctrlEnable true;

//Handle search button
CTRL(IDC_TEXTUREFINDER_SEARCH) ctrlAddEventHandler ["EditChanged",
{
  params ["_ctrlEdit", "_newText"];

  private _image = [IMG_SEARCH_END, IMG_SEARCH_START] select (_newText == "");

  ctrlParent _ctrlEdit displayCtrl IDC_TEXTUREFINDER_BUTTONSEARCH ctrlSetText _image;
}];

//Handle search button
CTRL(IDC_TEXTUREFINDER_BUTTONSEARCH) ctrlAddEventHandler ["ButtonClick",
{
  params ["_ctrlButton"];

  //Change search button icon and clear edit control to reset tree view filter
  ctrlParent _ctrlButton displayCtrl IDC_TEXTUREFINDER_SEARCH ctrlSetText "";
  _ctrlButton ctrlSetText IMG_SEARCH_START;
}];

endLoadingScreen;