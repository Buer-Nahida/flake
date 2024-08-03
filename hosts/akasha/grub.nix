{
  boot = {
    modprobeConfig.enable = true;
    loader = {
      grub = {
        enable = true;
        efiSupport = true;
        useOSProber = true;
        efiInstallAsRemovable = true;
        device =
          "/dev/disk/by-id/usb-Samsung_PSSD_T7_Shield_S6SKNS0TB04674L-0:0";
      };
      efi.efiSysMountPoint = "/boot/efi";
    };
  };
}
