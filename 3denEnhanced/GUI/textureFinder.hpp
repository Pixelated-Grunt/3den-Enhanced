class ENH_TextureFinder
{
  idd = IDD_TEXTUREFINDER;
  movingEnable = true;
  onLoad = "0 spawn ENH_fnc_textureFinder_findTextures";
  class ControlsBackground
  {
    DISABLE_BACKGROUND
    class Header: ctrlStaticTitle
    {
      text = "$STR_ENH_TEXTUREFINDER";
      x = CENTER_X - 0.5 * 140 * GRID_W;
      y = DIALOG_TOP;
      w = 140 * GRID_W;
      h = CTRL_DEFAULT_H;
    };
    class Background: ctrlStaticBackground
    {
      x = CENTER_X - 0.5 * 140 * GRID_W;
      y = DIALOG_TOP + CTRL_DEFAULT_H;
      w = 140 * GRID_W;
      h = safezoneH - (30 * GRID_H + CTRL_DEFAULT_H);
    };
    class BackgroundList: ctrlStaticFooter
    {
      x = CENTER_X - 0.5 * 140 * GRID_W;
      y = DIALOG_TOP + CTRL_DEFAULT_H;
      w = 140 * GRID_W;
      h = safezoneH - (100 * GRID_H + CTRL_DEFAULT_H);
    };
    class BackgroundPreview: ctrlStaticBackgroundDisableTiles
    {
      idc = IDC_TEXTUREFINDER_PREVIEWBACKGROUND;
      x = CENTER_X - 0.5 * 140 * GRID_W;
      y = safezoneY + safezoneH - (77 * GRID_H + CTRL_DEFAULT_H);
      w = 140 * GRID_W;
      h = 61 * GRID_H;
      tileH = 4 / (32 * pixelH) * 32;
      tileW = 8 / (32 * pixelW) * 32;
    };
    class Footer: BackgroundList
    {
      y = safezoneY + safezoneH - (15 * GRID_H + CTRL_DEFAULT_H);
      h = CTRL_DEFAULT_H + 2 * GRID_H;
    };
  };
  class Controls
  {
    class TextureList: ctrlTree
    {
      idc = IDC_TEXTUREFINDER_TEXTURELIST;
      idcSearch = IDC_TEXTUREFINDER_SEARCH;
      x = CENTER_X - 0.5 * 140 * GRID_W;
      y = DIALOG_TOP + CTRL_DEFAULT_H;
      w = 140 * GRID_W;
      h = safezoneH - (100 * GRID_H + CTRL_DEFAULT_H);
      colorBorder[] = {0, 0, 0, 0};
      colorLines[] = {1, 1, 1, 1};
    };
    class Preview: ctrlStaticPictureKeepAspect
    {
      idc = IDC_TEXTUREFINDER_PREVIEW;
      x = CENTER_X - 0.5 * 140 * GRID_W;
      y = safezoneY + safezoneH - (77 * GRID_H + CTRL_DEFAULT_H);
      w = 140 * GRID_W;
      h = 61 * GRID_H;
      colorBackground[] = {1, 1, 1, 1};
    };
    class Search: ctrlEdit
    {
      idc = IDC_TEXTUREFINDER_SEARCH;
      x = CENTER_X - 0.5 * 140 * GRID_W + 1 * GRID_W;
      y = safezoneY + safezoneH - (14 * GRID_H + CTRL_DEFAULT_H);
      w = 30 * GRID_W;
      h = CTRL_DEFAULT_H;
      tooltip = __EVAL(format ["%1+%2", toUpper localize "STR_DIK_CONTROL", "F"]);
    };
    class SearchIcon: ctrlStaticPictureKeepAspect
    {
      text = "\a3\3DEN\Data\Displays\Display3DEN\search_start_ca.paa";
      x = CENTER_X - 0.5 * 140 * GRID_W + 31 * GRID_W;
      y = safezoneY + safezoneH - (14 * GRID_H + CTRL_DEFAULT_H);
      w = 5 * GRID_W;
      h = 5 * GRID_H;
    };
    class CollapseAll: ctrlButtonCollapseAll
    {
      idc = IDC_TEXTUREFINDER_COLLAPSEALL;
      x = CENTER_X - 0.5 * 140 * GRID_W + 36 * GRID_W;
      y = safezoneY + safezoneH - (14 * GRID_H + CTRL_DEFAULT_H);
      w = 5 * GRID_W;
      h = 5 * GRID_H;
    };
    class ExpandAll: ctrlButtonExpandAll
    {
      idc = IDC_TEXTUREFINDER_EXPANDALL;
      x = CENTER_X - 0.5 * 140 * GRID_W + 41 * GRID_W;
      y = safezoneY + safezoneH - (14 * GRID_H + CTRL_DEFAULT_H);
      w = 5 * GRID_W;
      h = 5 * GRID_H;
    };
    class ProgessText: ctrlStructuredText
    {
      idc = IDC_TEXTUREFINDER_PROGRESSTEXT;
      style = ST_LEFT;
      x = CENTER_X - 0.5 * 140 * GRID_W + 46 * GRID_W;
      y = safezoneY + safezoneH - (14 * GRID_H + CTRL_DEFAULT_H);
      w = 80 * GRID_W;
      h = CTRL_DEFAULT_H;
    };
    class Close: ctrlButtonClose
    {
      x = CENTER_X - 0.5 * 140 * GRID_W + (140 - 25 - 1) * GRID_W;
      y = safezoneY + safezoneH - (14 * GRID_H + CTRL_DEFAULT_H);
      w = 25 * GRID_W;
      h = CTRL_DEFAULT_H;
    };
  };
};