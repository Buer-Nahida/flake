{ pkgs, ... }:
{
  programs.ssh = {
    enable = true;
    package = pkgs.openssh;
    compression = false;
    addKeysToAgent = "yes";
    controlPersist = "yes";
    matchBlocks."github.com" = {
      user = "git";
      hostname = "ssh.github.com";
      port = 443;
      forwardAgent = true;
    };
  };
  services.ssh-agent.enable = true;
}
