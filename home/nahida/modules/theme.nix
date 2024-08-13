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
      enable = false;
      icon.enable = true;
    };
    font = {
      package = mypkgs.fonts;
      name = "FZLanTingYuan-DB-GBK";
      size = 12;
    };
    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
  };
  dconf.settings."org/gnome/desktop/interface" = {
    color-scheme = "prefer-dark";
  };
}
