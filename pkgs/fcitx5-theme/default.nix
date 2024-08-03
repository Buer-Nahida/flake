{ stdenvNoCC }:
stdenvNoCC.mkDerivation {
  pname = "my-fcitx5-theme";
  version = "1.0.0";
  src = ./src;
  installPhase = ''
    mkdir -p $out/share/fcitx5/themes/my-fcitx5-theme
    cp -r * $out/share/fcitx5/themes/my-fcitx5-theme
  '';
  doCheck = false;
  dontBuild = true;
  dontFixup = true;
  dontPatch = true;
  dontConfigure = true;
}
