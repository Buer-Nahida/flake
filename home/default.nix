{ config, username, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users.${username} = ./${username};
    extraSpecialArgs = config._module.args;
  };
}
