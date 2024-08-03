{ mypkgs, pkgs, ... }: {
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [ fcitx5-chinese-addons mypkgs.fcitx5-theme ];
    };
  };
}
