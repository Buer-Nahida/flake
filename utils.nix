{
  dirContents = dirPath: extraFilterList:
    let
      dir = builtins.readDir dirPath;
      filteredDir = removeAttrs dir (extraFilterList ++ [ "default.nix" ]);
      filesList = builtins.attrNames filteredDir;
      allFiles = map (filename: /${dirPath}/${filename}) filesList;
    in allFiles;
}
