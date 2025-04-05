{ mypkgs, ... }:
{
  catppuccin = {
    accent = "sky";
    flavor = "mocha";
  };
  boot.loader.grub = rec {
    theme = mypkgs.kawaiki-grub;
    gfxmodeEfi = "2560x1440,auto";
    gfxmodeBios = gfxmodeEfi;
  };
  catppuccin.tty.enable = true;
}
