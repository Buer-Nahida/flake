{
  programs.wezterm = {
    enable = true;
    extraConfig = builtins.readFile ./init.lua;
  };
}
