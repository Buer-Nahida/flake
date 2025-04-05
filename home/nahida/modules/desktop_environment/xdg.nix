{ pkgs, ... }:
{
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    };
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
        xdg-desktop-portal-gnome
        gnome-keyring
      ];
      config.common = {
        default = "*";
        "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
      };
    };
  };
}
