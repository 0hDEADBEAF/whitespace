{ pkgs, ...}:
{
  programs.btop = {
    enable = true;
    package = pkgs.btop;
    settings = {
      color_theme = "gruvbox_dark_v2";
    };
  };
}
