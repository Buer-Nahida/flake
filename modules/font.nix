{ mypkgs, pkgs, ... }: {
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      wqy_zenhei
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      twemoji-color-font
      mypkgs.fonts
      mypkgs.misans-fonts
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      google-fonts
      font-awesome
      open-sans
      roboto
      material-design-icons
      meslo-lgs-nf
    ];
    fontconfig = {
      cache32Bit = true;
      useEmbeddedBitmaps = true;
      defaultFonts.emoji = [ "Noto Color Emoji" "Twemoji Color Emoji" ];
    };
  };
}
