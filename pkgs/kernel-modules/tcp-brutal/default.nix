{
  stdenv,
  fetchFromGitHub,
  kernel,
}:
stdenv.mkDerivation rec {
  pname = "tcp-brutal";
  version = "1.0.3";
  src = fetchFromGitHub {
    owner = "apernet";
    repo = "tcp-brutal";
    rev = "v${version}";
    hash = "sha256-rx8JgQtelssslJhFAEKq73LsiHGPoML9Gxvw0lsLacI=";
  };
  setSourceRoot = "	export sourceRoot=$(pwd)/source\n";
  nativeBuildInputs = kernel.moduleBuildDependencies;
  makeFlags = kernel.makeFlags ++ [
    "-C"
    "${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
    "M=$(sourceRoot)"
  ];
  buildFlags = [ "modules" ];
  installTargets = [ "modules_install" ];
}
