let keys = "/nix/persist/etc/nixos/keys";
in {
  sops = {
    defaultSopsFile = ../secrets/system/default.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = keys;
    secrets = {
      password.neededForUsers = true;
      nix = { };
      "config.dae" = {
        format = "binary";
        sopsFile = ../secrets/system/config.dae;
      };
    };
  };
  environment.variables.SOPS_AGE_KEY_FILE = keys;
}
