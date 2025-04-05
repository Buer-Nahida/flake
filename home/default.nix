{ config, username, ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bkp";
    users.${username} = ./${username};
    extraSpecialArgs = config._module.args;
  };
}
