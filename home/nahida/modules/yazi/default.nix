{ pkgs, ... }: {
  home.packages = with pkgs; [ nautilus ];
  programs.yazi = {
    enable = true;
    initLua = ./init.lua;
    settings = import ./yazi.nix;
    keymap = import ./keymap.nix;
  };
  catppuccin.yazi.enable = true;
}
