{ pkgs, ... }: {
  home.packages = [ pkgs.ueberzugpp ];
  programs.wezterm = {
    enable = true;
    extraConfig = builtins.readFile ./init.lua;
  };
}
