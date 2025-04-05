{
  inputs,
  config,
  pkgs,
  ...
}:
{
  services.dae = {
    enable = false;
    package = inputs.daeuniverse.packages.${pkgs.system}.dae-unstable;
    assets = with pkgs; [
      v2ray-geoip
      v2ray-domain-list-community
    ];
    disableTxChecksumIpGeneric = false;
    configFile = config.sops.secrets."config.dae".path;
  };
}
