{ inputs, config, lib, pkgs, ... }: {
  services.dae = {
    enable = true;
    package = inputs.daeuniverse.packages.x86_64-linux.dae-unstable;
    assets = with pkgs; [ v2ray-geoip v2ray-domain-list-community ];
    disableTxChecksumIpGeneric = false;
    configFile = config.sops.secrets."config.dae".path;
  };
  networking.firewall.enable = lib.mkForce false;
}
