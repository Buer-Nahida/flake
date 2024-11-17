{ pkgs, dirContents, ... }: {
  imports = dirContents ./. [ ];
  home.packages = with pkgs;
    with nodePackages_latest;
    with gnome;
    with libsForQt5; [
      crow-translate
      mpvpaper
      icon-library
      pkgs.dconf-editor
      pkgs.gnome-tweaks
      grim
      wf-recorder
      libnotify
    ];

  xdg.desktopEntries."org.gnome.Settings" = {
    name = "Settings";
    comment = "Gnome Control Center";
    icon = "org.gnome.Settings";
    exec =
      "env XDG_CURRENT_DESKTOP=gnome ${pkgs.gnome-control-center}/bin/gnome-control-center";
    categories = [ "X-Preferences" ];
    terminal = false;
  };
}
