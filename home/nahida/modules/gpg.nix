{ pkgs, ... }: {
  programs.gpg = {
    enable = true;
    mutableKeys = true;
    mutableTrust = true;
  };
  services.gpg-agent = {
    enable = true;
    verbose = true;
    enableScDaemon = true;
    enableSshSupport = true;
    enableExtraSocket = true;
    enableZshIntegration = true;
    grabKeyboardAndMouse = true;
    pinentryPackage = pkgs.pinentry-gnome3;
  };
}
