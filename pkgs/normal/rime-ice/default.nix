{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  unstableGitUpdater,
}:
stdenvNoCC.mkDerivation rec {
  pname = "rime-ice";
  version = "main";

  src = fetchFromGitHub {
    owner = "iDvel";
    repo = "rime-ice";
    rev = version;
    hash = "sha256-s3r8cdEliiPnKWs64Wgi0rC9Ngl1mkIrLnr2tIcyXWw=";
  };

  installPhase = ''
    mkdir -p $out/share/rime-data
    rm -rf ./others
    rm -rf ./.github
    rm squirrel.yaml weasel.yaml
    cp -r ./* $out/share/rime-data
  '';

  passthru.updateScript = unstableGitUpdater {
    branch = "main";
    hardcodeZeroVersion = true;
  };

  meta = {
    description = "Rime 配置：雾凇拼音 | 长期维护的简体词库";
    homepage = "https://github.com/iDvel/rime-ice";
    license = lib.licenses.gpl3Only;
    platforms = lib.platforms.all;
    maintainers = with lib.maintainers; [
      xddxdd
      luochen1990
    ];
  };
}
