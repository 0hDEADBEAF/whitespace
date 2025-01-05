{ pkgs, config, ... }:
{
  home.pointerCursor = {
    gtk.enable = true;
    x11 = {
      enable = true;
      defaultCursor = "left_ptr";
    };
    hyprcursor = {
      enable = true;
      size = config.cursorSize;
    };
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = config.cursorSize;
  };
  gtk.enable = true;
}
