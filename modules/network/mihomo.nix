{ config, mypkgs, ... }:
{
  services.mihomo = {
    enable = true;
    tunMode = true;
    webui = mypkgs.zashboard;
    configFile = config.sops.secrets.mihomo.path;
  };
}
