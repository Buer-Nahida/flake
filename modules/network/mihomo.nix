{ config, lib, pkgs, ... }: {
  services.mihomo = {
    enable = true;
    tunMode = true;
    webui = pkgs.metacubexd;
    configFile = config.sops.secrets.mihomo.path;
  };
  networking.firewall.enable = lib.mkForce false;
}
