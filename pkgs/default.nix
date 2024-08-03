callPackage:
let
  dir = builtins.readDir ./.;
  filteredDir = removeAttrs dir [ "default.nix" ];
  filesList = builtins.attrNames filteredDir;
  genPackage = name: {
    inherit name;
    value = callPackage ./${name} { };
  };
in builtins.listToAttrs (map genPackage filesList)
