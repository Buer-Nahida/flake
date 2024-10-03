{ inputs, dirContents, pkgs, ... }: {
  imports = dirContents ./. [ ];
  home.packages = with pkgs;
    [ inputs.get-traffic.packages.${pkgs.system}.default ];
}
