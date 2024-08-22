{ username, ... }: {
  services.gnome-keyring.enable = true;
  security.pam.services.${username}.enableGnomeKeyring = true;
}
