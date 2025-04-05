{ dirContents, lib, ... }:
{
  imports = dirContents ./. [ ];
  networking.firewall.enable = lib.mkForce false;
}
