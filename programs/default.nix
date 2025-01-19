{ dirContents, pkgs, mypkgs, ... }: {
  imports = dirContents ./. [ ];
  environment.systemPackages = with pkgs; [
    wget
    curl
    aria2
    gnumake
    mypkgs.naiveproxy
  ];
}
