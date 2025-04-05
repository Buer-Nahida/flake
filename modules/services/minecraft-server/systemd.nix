{
  lib,
  pkgs,
  homeDirectory,
  ...
}:
{
  systemd.services.minecraft =
    let
      screen = lib.getExe' pkgs.screen "screen";
    in
    {
      description = "Irminsul Minecraft Server";
      enable = false;
      after = [ "network-online.target" ];
      requires = [ "network-online.target" ];
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        User = "nahida";
        Group = "wheel";
        WorkingDirectory = "${homeDirectory}/Private/minecraft/irminsul";
        Restart = "always";
        RestartSec = 5;
        ExecStart = ''${screen} -DmS minecraft ${pkgs.jdk21}/bin/java -Xmx3G -Xms3G -jar --add-modules=jdk.incubator.vector luminol.jar --nogui'';
      };
    };
}
