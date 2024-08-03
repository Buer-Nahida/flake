{ pkgs, ... }: {
  home.packages = with pkgs; [ libnotify ];
  services.dunst = {
    enable = true;
    settings = import ./config.nix;
  };
}
