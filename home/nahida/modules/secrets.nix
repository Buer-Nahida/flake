{
  systemd.user.services.mbsync.Unit.After = [ "sops-nix.service" ];
  sops = {
    age.keyFile = "/nix/persist/etc/nixos/keys";
    defaultSopsFormat = "yaml";
    defaultSopsFile = ../../../secrets/user.yaml;
    secrets = {
      weather.path = ".secrets/weather.json";
      get-traffic.path = ".config/get-traffic/config.json";
    };
  };
}
