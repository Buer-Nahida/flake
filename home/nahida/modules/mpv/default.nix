{
  programs.mpv = {
    enable = true;
    bindings = import ./input.nix;
    config = import ./mpv.nix;
  };
  xdg.configFile = {
    "mpv/scripts".source = ./config/scripts;
    "mpv/shaders".source = ./config/shaders;
    "mpv/script-opts".source = ./config/script-opts;
  };
}
