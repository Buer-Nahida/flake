{ config, mypkgs, ... }:
{
  catppuccin = {
    accent = "sky";
    flavor = "mocha";
    cursors.enable = true;
    kvantum.enable = true;
    gtk = {
      icon.enable = true;
      tweaks = [
        "normal"
        "float"
      ];
    };
  };
  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };
  home.pointerCursor = {
    gtk.enable = true;
    x11 = {
      enable = true;
      defaultCursor = "left_ptr";
    };
  };
  gtk = {
    enable = true;
    font = {
      package = mypkgs.fonts;
      name = "FZLanTingYuan-DB-GBK";
      size = 12;
    };
    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
  };
}
