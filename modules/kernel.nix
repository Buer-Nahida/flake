{ pkgs, ... }: {
  boot = {
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    kernelParams =
      [ "splash" "systemd.journald.forward_to_console=1" "console=tty12" ];
    extraModulePackages = with pkgs.linuxKernel.packages.linux_xanmod_latest;
      [ ];
  };
  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };
}
