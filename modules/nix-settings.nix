{
  config,
  lib,
  # pkgs,
  inputs,
  ...
}:
{
  nix = {
    registry.nixpkgs.flake = inputs.nixpkgs;
    channel.enable = false;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      nix-path = lib.mkForce "nixpkgs=/etc/nix/inputs/nixpkgs";
    };
    extraOptions = "!include ${config.sops.secrets.nix.path}";
    # package = pkgs.nixVersions.git;
  };
  environment.etc."nix/inputs/nixpkgs".source = inputs.nixpkgs;
}
