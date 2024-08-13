{ inputs, dirContents, username, homeDirectory, ... }: {
  imports = with inputs;
    dirContents ./. [ ] ++ [
      ags.homeManagerModules.default
      sops-nix.homeManagerModules.sops
      hyprland.homeManagerModules.default
      catppuccin.homeManagerModules.catppuccin
    ];
  home = {
    inherit username homeDirectory;
    stateVersion = "24.05";
  };
}
