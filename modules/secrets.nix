let keys = "/nix/persist/etc/nixos/keys";
in {
  sops = {
    defaultSopsFile = ../secrets/system.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = keys;
    secrets = {
      password.neededForUsers = true;
      nix = { };
      mihomo = { };
    };
  };
  environment.variables.SOPS_AGE_KEY_FILE = keys;
}
