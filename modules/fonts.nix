{ mypkgs, pkgs, ... }:
{
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      wqy_zenhei
      noto-fonts
      noto-fonts-emoji
      noto-fonts-cjk-sans
      twemoji-color-font
      mypkgs.fonts
      mypkgs.misans-fonts
      google-fonts
      font-awesome
      open-sans
      roboto
      material-design-icons
      meslo-lgs-nf
      material-symbols
      material-icons
      lexend
      dejavu_fonts

      nerd-fonts.jetbrains-mono
      nerd-fonts.space-mono
    ];
    fontconfig = {
      cache32Bit = true;
      useEmbeddedBitmaps = true;
      defaultFonts.emoji = [
        "Noto Color Emoji"
        "Twemoji Color Emoji"
      ];
    };
  };
}
