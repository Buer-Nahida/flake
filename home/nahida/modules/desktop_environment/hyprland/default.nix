{ pkgs, ... }@args: {
  wayland.windowManager.hyprland = {
    enable = true;
    plugins = with pkgs.hyprlandPlugins; [ hyprscroller ];
    settings = import ./settings.nix args;
  };
  xdg.configFile = {
    "hypr/scripts".source = ./scripts;
    "hypr/shaders".source = ./shaders;
    "hypr/wallpapers".source = ./wallpapers;
  };
}
