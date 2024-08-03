{ stdenvNoCC }:
stdenvNoCC.mkDerivation {
  pname = "catppuccin-gtk-theme";
  version = "1.0.0";
  src = ./src;
  installPhase = ''
    mkdir -p $out/share/themes
    cp -r * $out/share/themes
  '';
  dontConfigure = true;
  dontFixup = true;
  dontBuild = true;
  doCheck = false;
}
