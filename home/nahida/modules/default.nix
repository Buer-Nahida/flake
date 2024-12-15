{ pkgs, dirContents, ... }: {
  imports = dirContents ./. [ ];
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    motrix
    hmcl
    audacity
    kdenlive
    telegram-desktop
    qq
  ];
}
