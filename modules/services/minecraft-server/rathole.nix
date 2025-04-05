{ config, ... }:
{
  services.rathole = {
    enable = false;
    role = "client";
    credentialsFile = config.sops.secrets.rathole.path;
  };
}
