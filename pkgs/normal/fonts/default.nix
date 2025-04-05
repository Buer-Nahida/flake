{ stdenvNoCC }:
stdenvNoCC.mkDerivation {
  pname = "fonts";
  version = "1.0.0";
  src = ./src;
  installPhase = ''
    mkdir -p $out/share/fonts
    cp -r * $out/share/fonts
  '';
  doCheck = false;
  dontBuild = true;
  dontFixup = true;
  dontPatch = true;
  dontConfigure = true;
}
