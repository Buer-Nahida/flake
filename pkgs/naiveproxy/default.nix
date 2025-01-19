{ stdenv, fetchurl, autoPatchelfHook, libgcc, ... }:
stdenv.mkDerivation rec {
  pname = "naiveproxy";
  version = "v131.0.6778.86-1";
  src = fetchurl {
    url =
      "https://github.com/klzgrad/naiveproxy/releases/download/v131.0.6778.86-1/naiveproxy-${version}-linux-x64.tar.xz";
    sha256 = "sha256-HF7m2jBtz1TMR2GTx7clGhJlTY/GhB0OtyufrSstxO8=";
  };
  nativeBuildInputs = [ autoPatchelfHook ];
  buildInputs = [ libgcc ];
  installPhase = ''
    mkdir -p $out/bin
    mv naive $out/bin
  '';
}
