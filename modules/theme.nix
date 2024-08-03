{ mypkgs, ... }: {
  catppuccin = {
    accent = "sky";
    flavor = "mocha";
  };
  boot.loader.grub = rec {
    theme = mypkgs.kawaiki-grub;
    gfxmodeEfi = "1920x1080,auto";
    gfxmodeBios = gfxmodeEfi;
  };
  console.catppuccin.enable = true;
}
