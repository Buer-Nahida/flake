{ pkgs, ... }:
{
  systemd.user.services.mbsync.Unit.After = [ "sops-nix.service" ];
  home.packages = [ pkgs.go-2fa ];
  sops = {
    age.keyFile = "/nix/persist/etc/nixos/keys";
    defaultSopsFormat = "yaml";
    defaultSopsFile = ../../../secrets/user.yaml;
    secrets =
      {
        "2fa".path = ".2fa";
      }
      // builtins.listToAttrs (
        map
          (ai: {
            name = ai + "_key";
            value = {
              path = ".local/state/ags/user/ai/${ai}_key.txt";
            };
          })
          [
            "openai"
            "google"
            "oxygen"
            "zuki"
            "openrouter"
          ]
      );
  };
}
