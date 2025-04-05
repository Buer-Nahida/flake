callPackage: callKernelModule:
let
  genPackages =
    dir: callPackage:
    builtins.listToAttrs (
      map (name: {
        inherit name;
        value = callPackage (./${dir}/${name}) { };
      }) (builtins.attrNames (builtins.readDir ./${dir}))
    );

  normal = "normal";
  kernelModules = "kernel-modules";
in
(genPackages normal callPackage) // (genPackages kernelModules callKernelModule)
