{ pkgs, ... }: {
  home.packages = with pkgs; [
    python3
    gpustat
    bun
    bluez
    bluez-tools
    grimblast
    gpu-screen-recorder
    hyprpicker
    dart-sass
    brightnessctl
    gnome-bluetooth
  ];
  programs.ags = {
    enable = true;
    configDir = ./config;
  };
}
