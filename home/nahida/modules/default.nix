{ inputs, dirContents, pkgs, ... }: {
  imports = dirContents ./. [ ];
  home.packages = with pkgs; [
    go-2fa
    google-cloud-sdk
    inputs.get-traffic.packages.${system}.default
  ];
}
