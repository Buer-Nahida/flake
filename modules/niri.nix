{ pkgs, ... }: {
  programs.niri.enable = true;
  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
  ];
  security.pam.services.astal-auth = { };
}
