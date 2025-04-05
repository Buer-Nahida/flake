{ pkgs, inputs, ... }:
{
  home.packages = [ inputs.bi2o3.packages.${pkgs.system}.default ];
  xdg.configFile = {
    "niri/scripts/startup" = {
      executable = true;
      text = ''
        #!/usr/bin/env sh

        dbus-update-activation-environment --systemd --all &
        ags &
        mpvpaper -s -p "*" ~/.config/niri/wallpapers/nahida.mp4 -o "--loop --no-audio --vo=libmpv" &
        wl-paste --watch cliphist store &
        ${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1 &
        ${pkgs.xwayland-satellite}/bin/xwayland-satellite &
        Bi2O3 &
        ${inputs.life-tip.packages.${pkgs.system}.default}/bin/life-tip &
      '';
    };
    "niri" = {
      recursive = true;
      source = ./config;
    };
  };
}
