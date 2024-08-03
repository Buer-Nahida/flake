{ config, lib, ... }: {
  services.mihomo = {
    enable = true;
    tunMode = true;
    configFile = config.sops.secrets.mihomo.path;
  };
  networking.firewall.enable = lib.mkForce false;
}
