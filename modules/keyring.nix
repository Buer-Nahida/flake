{ username, ... }:
{
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.${username}.enableGnomeKeyring = true;
}
