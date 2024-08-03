{ stdenvNoCC, fetchurl, unzip }:
stdenvNoCC.mkDerivation {
  pname = "misans-fonts";
  version = "1.0.0";
  src = fetchurl {
    url = "https://hyperos.mi.com/font-download/MiSans_Global_ALL.zip";
    hash = "sha256-IyKgHjE4Zho9dpgM/YFn9wS76mBEXflKAMedPWroW1c=";
  };
  nativeBuildInputs = [ unzip ];
  unpackCmd = "unzip $src && rm -r __MACOSX";
  installPhase = ''
    unzip MiSans.zip
    unzip "MiSana Arabic.zip"
    unzip "MiSans Devanagari.zip"
    unzip "MiSans Gujarati.zip"
    unzip "MiSans Gurmukhi.zip"
    unzip "MiSans Khmer.zip"
    unzip "MiSans L3.zip"
    unzip " MiSans Lao.zip"
    unzip "MiSans Latin.zip"
    unzip "MiSans Myanmar.zip"
    unzip "MiSans TC.zip"
    unzip "MiSans Thai .zip"
    unzip "MiSans Tibetan.zip"
    mkdir -p $out/share/fonts
    cp -r MiSans $out/share/fonts
    cp -r "MiSana Arabic" $out/share/fonts/Arabic
    cp -r "MiSans Devanagari" $out/share/fonts/Devanagari
    cp -r "MiSans Gujarati" $out/share/fonts/Gujarati
    cp -r "MiSans Gurmukhi" $out/share/fonts/Gurmukhi
    cp -r "MiSans Khmer" $out/share/fonts/Khmer
    cp -r "MiSans L3" $out/share/fonts/L3
    cp -r " MiSans Lao" $out/share/fonts/Lao
    cp -r "MiSans Latin" $out/share/fonts/Latin
    cp -r "MiSans Myanmar" $out/share/fonts/Myanmar
    cp -r "MiSans TC" $out/share/fonts/TC
    cp -r "MiSans Thai " $out/share/fonts/Thai
    cp -r "MiSans Tibetan" $out/share/fonts/Tibetan
  '';
  FixupPhase = "find $out/share/fonts -name .DS_Store -delete";
  doCheck = false;
  dontBuild = true;
  dontPatch = true;
  dontConfigure = true;
}
