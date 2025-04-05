{ pkgs, config, ... }:
{
  _module.args.mypkgs = import ../pkgs pkgs.callPackage config.boot.kernelPackages.callPackage;
  nixpkgs.config = {
    packageOverrides = pkgs: { nur = config.nur; };
    allowUnfree = true;
  };
}
