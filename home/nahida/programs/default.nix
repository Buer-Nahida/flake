{ dirContents, ... }: {
  imports = dirContents ./. [ ];
  programs.home-manager.enable = true;
}
