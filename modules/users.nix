{
  config,
  username,
  homeDirectory,
  ...
}:
{
  users = {
    mutableUsers = false;
    users = {
      ${username} = {
        useDefaultShell = true;
        uid = 1000;
        isNormalUser = true;
        createHome = true;
        home = homeDirectory;
        group = "wheel";
        extraGroups = [
          "root"
          "adm"
          "pipewire"
          "audio"
          "video"
          "input"
          "log"
          "systemd-journal"
          "uucp"
        ];
        hashedPasswordFile = config.sops.secrets.password.path;
      };
      root.hashedPasswordFile = config.sops.secrets.password.path;
    };
  };
}
