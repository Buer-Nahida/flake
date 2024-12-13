{ pkgs, ... }:
let
  packages = with pkgs; [
    ollama
    pywal
    sass
    ddcutil
    grimblast
    brightnessctl
    gnome-usage
    (python311.withPackages (p: [ p.material-color-utilities p.pywayland ]))
    gtksourceview
    gtksourceview4
    webp-pixbuf-loader
    ydotool
  ];
in {
  home.packages = packages;

  programs.ags = {
    enable = true;
    configDir = ./config;
    extraPackages = with pkgs; packages ++ [ webkitgtk ];
  };
}
