{ mypkgs, pkgs, ... }: {
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        (fcitx5-rime.override { rimeDataPkgs = [ mypkgs.rime-ice ]; })
        librime
        librime-lua
        fcitx5-gtk
        mypkgs.fcitx5-theme
      ];
    };
  };
}
