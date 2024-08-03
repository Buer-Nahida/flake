{
  programs.waybar = {
    enable = true;
    systemd.enable = false;
    style = builtins.readFile ./style.css;
    settings = import ./config.nix;
  };
}
