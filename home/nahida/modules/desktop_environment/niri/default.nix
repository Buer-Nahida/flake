{ pkgs, ... }: {
  xdg.configFile = {
    "niri/scripts/startup" = {
      executable = true;
      text = ''
        #!/usr/bin/env sh

        dbus-update-activation-environment --systemd --all &
        ags &
        mpvpaper -s -p HDMI-A-1 ~/.config/niri/wallpapers/nahida.mp4 -o "--loop --no-audio --vo=libmpv" &
        fcitx5 -d &
        wl-paste --watch cliphist store &
        ${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1 &
        ${pkgs.xwayland-satellite}/bin/xwayland-satellite &
      '';
    };
    "niri" = {
      recursive = true;
      source = ./config;
    };
  };
}
