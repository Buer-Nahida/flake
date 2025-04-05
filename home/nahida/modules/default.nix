{
  pkgs,
  dirContents,
  ...
}:
{
  imports = dirContents ./. [ ];
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    motrix
    hmcl
    modrinth-app
    audacity
    qq
    telegram-desktop
    ffmpeg
  ];
}
