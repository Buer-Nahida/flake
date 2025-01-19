{ config, pkgs, ... }: {
  services.mihomo = {
    enable = true;
    tunMode = true;
    package = with pkgs;
      (mihomo.overrideAttrs (_: {
        src = fetchFromGitHub {
          owner = "MetaCubeX";
          repo = "mihomo";
          rev = "Alpha";
          hash = "sha256-52JJrdh96X9eRoPXa6a8btuSIhy8glkoq51RLyOAO8g=";
        };
        vendorHash = "sha256-vOUC+nSII0ZZCx4v/klVHqLT+tgaqxCOwBDMNQSsrEo=";
      }));
    webui = pkgs.metacubexd;
    configFile = config.sops.secrets.mihomo.path;
  };
}
