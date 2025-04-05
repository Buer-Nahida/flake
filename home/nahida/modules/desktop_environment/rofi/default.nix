{ pkgs, ... }:
{
  xdg.configFile."rofi".source = ./config;
  programs.rofi = {
    enable = true;
    package =
      with pkgs;
      rofi-wayland.overrideAttrs (_: rec {
        version = "93ad86da10b1747f4e584bc6bfbfbc3eddb280a3";
        src = fetchFromGitHub {
          owner = "lbonn";
          repo = "rofi";
          rev = version;
          fetchSubmodules = true;
          sha256 = "sha256-ipvG75snR39dziidFOb8wwgW2vL4ZIlcP1EWvYEqpP0=";
        };
      });
  };
}
