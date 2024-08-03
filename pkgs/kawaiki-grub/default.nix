{ stdenvNoCC, fetchFromGitHub }:
let
  screen = "1080p";
  icon = "white";
  screen_fallback = if screen == "ultrawide" then
    "1080p"
  else if screen == "ultrawide2k" then
    "2k"
  else
    screen;
in stdenvNoCC.mkDerivation rec {
  pname = "kawaiki-grub";
  version = "48ecdab39dc3174fb507770b794de8b1b823ca39";
  src = fetchFromGitHub {
    owner = "lucidtanooki";
    repo = "kawaiki-grub2-themes";
    rev = version;
    hash = "sha256-w9lr8ptMVkocNiVc6YBnz7ht7uFwP70RXz5rsK5n9TY=";
  };
  installPhase = ''
    mkdir -p $out
    cp -a --no-preserve=ownership common/{*.png,*.pf2} $out
    cp -a --no-preserve=ownership config/theme-${screen}.txt $out/theme.txt
    cp -a --no-preserve=ownership backgrounds/${screen}/background-kawaiki.png $out/background.png
    cp -a --no-preserve=ownership assets/assets-${icon}/icons-${screen_fallback} $out/icons
    cp -a --no-preserve=ownership assets/assets-select/select-${screen_fallback}/*.png $out
    cp -a --no-preserve=ownership assets/info-${screen_fallback}.png $out/info.png
  '';
  doCheck = false;
  dontBuild = true;
  dontFixup = true;
  dontPatch = true;
  dontConfigure = true;
}
