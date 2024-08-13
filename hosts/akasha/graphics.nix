{ pkgs, ... }: {
  environment.variables.LIBVA_DRIVER_NAME = "iHD";
  hardware.graphics = {
    extraPackages = with pkgs; [ intel-media-driver intel-ocl vpl-gpu-rt ];
    extraPackages32 = with pkgs.driversi686Linux; [ intel-media-driver mesa ];
  };
}
