{ pkgs, ... }: {
  programs.yazi = {
    enable = true;
    initLua = ./init.lua;
    settings = import ./yazi.nix;
    keymap = import ./keymap.nix;
    theme = import ./theme.nix;
  };
}
