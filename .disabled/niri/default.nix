{ pkgs, ... }: {
  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
    QT_AUTO_SCREEN_SCALE_FACTOR = 1;
    GDK_BACKEND = "wayland";
    OZONE_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    _JAVA_AWT_WM_NONREPARENTING = 1;
    WLR_NO_HARDWARE_CURSORS = 1;
    MOZ_DISABLE_RDD_SANDBOX = 1;
    MOZ_ENABLE_WAYLAND = 1;
  };
  home.packages = with pkgs; [
    niri
    crow-translate
    mpvpaper
    gvfs
    cinnamon.nemo-with-extensions
    cage
    hmcl
  ];
  xdg.configFile = {
    "niri/scripts/startup" = {
      executable = true;
      text = ''
        #!/usr/bin/env sh

        dbus-update-activation-environment --systemd --all &
        waybar &
        dunst &
        fcitx5 -d &
        # swayidle -w timeout 601 "niri msg action power-off-monitors" timeout 600 "swaylock -f" before-sleep "swaylock -f" &
        wl-paste --type text --watch cliphist store &
        wl-paste --type image --watch cliphist store &
        ${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1 &
        # swaybg -i ~/.config/niri/wallpaper/nahida.png &
        mpvpaper -s -p HDMI-A-1 ~/.config/niri/wallpaper/nahida.mp4 -o "--loop --no-audio --vo=libmpv" &
      '';
    };
    "niri" = {
      recursive = true;
      source = ./config;
    };
  };
}
