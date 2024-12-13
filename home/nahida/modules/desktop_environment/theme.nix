{ config, mypkgs, ... }: {
  catppuccin = {
    accent = "sky";
    flavor = "mocha";
    pointerCursor.enable = true;
  };
  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style = {
      name = "kvantum";
      catppuccin.enable = true;
    };
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
    catppuccin = {
      enable = true;
      icon.enable = true;
      gnomeShellTheme = true;
      tweaks = [ "normal" "float" ];
    };
    font = {
      package = mypkgs.fonts;
      name = "FZLanTingYuan-DB-GBK";
      size = 12;
    };
    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
  };
}
