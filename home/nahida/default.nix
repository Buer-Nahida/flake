{
  inputs,
  dirContents,
  username,
  homeDirectory,
  ...
}:
{
  imports =
    with inputs;
    dirContents ./. [ ]
    ++ [
      sops-nix.homeManagerModules.sops
      catppuccin.homeModules.catppuccin
    ];
  home = {
    inherit username homeDirectory;
    stateVersion = "24.05";
  };
}
