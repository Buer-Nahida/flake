{ pkgs, ... }:
{
  environment.variables.LIBVA_DRIVER_NAME = "iHD";
  hardware.graphics = {
    extraPackages = with pkgs; [
      intel-media-driver
      intel-ocl
      vpl-gpu-rt
      mesa
      libvdpau-va-gl
      libva-vdpau-driver
    ];
    extraPackages32 = with pkgs.driversi686Linux; [
      intel-media-driver
      mesa
      libvdpau-va-gl
      libva-vdpau-driver
    ];
  };
}
