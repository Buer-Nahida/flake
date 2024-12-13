{ pkgs, dirContents, ... }: {
  imports = dirContents ./. [ ];
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    motrix
    hmcl
    obs-studio
    audacity
    kdenlive
    telegram-desktop
    qq
  ];
}
