{
  programs.kitty = {
    enable = true;
    settings = import ./settings.nix;
    keybindings = import ./keybindings.nix;
  };
  catppuccin.kitty.enable = true;
}
