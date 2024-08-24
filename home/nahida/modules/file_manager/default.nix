{ pkgs, ... }: {
  home.packages = with pkgs; [ nautilus nemo-with-extensions ];
  programs.yazi = {
    enable = true;
    initLua = ./init.lua;
    settings = import ./yazi.nix;
    keymap = import ./keymap.nix;
    catppuccin.enable = true;
  };
}
