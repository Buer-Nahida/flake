{ inputs, pkgs, ... }@args: {
  wayland.windowManager.hyprland = {
    enable = true;
    plugins = with inputs;
      [
        hyprscroller.packages.${pkgs.system}.hyprscroller
        # hypr-dynamic-cursors.packages.${pkgs.system}.hypr-dynamic-cursors
      ];
    settings = import ./settings.nix args;
  };
  xdg.configFile = {
    "hypr/scripts".source = ./scripts;
    "hypr/wallpapers".source = ./wallpapers;
  };
}
