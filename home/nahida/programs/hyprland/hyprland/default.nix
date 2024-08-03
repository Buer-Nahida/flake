{ inputs, pkgs, ... }@args: {
  wayland.windowManager.hyprland = {
    enable = true;
    plugins = [ inputs.hyprscroller.packages.${pkgs.system}.hyprscroller ];
    settings = import ./settings.nix args;
  };
  xdg.configFile = {
    "hypr/scripts".source = ./scripts;
    "hypr/wallpapers".source = ./wallpapers;
  };
}
