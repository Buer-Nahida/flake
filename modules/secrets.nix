let
  keys = "/nix/persist/etc/nixos/keys";
in
{
  sops = {
    defaultSopsFile = ../secrets/system/default.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = keys;
    secrets = {
      password.neededForUsers = true;
      nix = { };
      mihomo = {
        format = "binary";
        sopsFile = ../secrets/system/mihomo;
      };
      "config.dae" = {
        format = "binary";
        sopsFile = ../secrets/system/config.dae;
      };
      rathole = {
        format = "binary";
        sopsFile = ../secrets/system/rathole.toml;
      };
    };
  };
  environment.variables.SOPS_AGE_KEY_FILE = keys;
}
