{ pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    kernelParams = [
      "splash"
      "systemd.journald.forward_to_console=1"
      "console=tty12"
    ];
    extraModulePackages = with pkgs.linuxKernel.packages.linux_zen; [ v4l2loopback ];
    kernelModules = [ "i2c-dev" ];
  };
  boot.kernel.sysctl = {
    "fs.aio-max-nr" = 1048576;
    "net.core.rmem_max" = 16777216;
    "net.core.wmem_max" = 16777216;
    "net.core.default_qdisc" = "fq_pie";
  };
  zramSwap = {
    enable = true;
    memoryPercent = 50;
  };
}
