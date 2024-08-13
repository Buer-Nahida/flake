# { settings, ... }:
{
  systemd.user.services.mbsync.Unit.After = [ "sops-nix.service" ];
  sops = {
    age.keyFile = "/nix/persist/etc/nixos/keys";
    defaultSopsFile = ../../../secrets/user.yaml;
    secrets.weather.path = ".secrets/weather.json";
  };
}
