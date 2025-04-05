{
  services.postgresql = {
    enable = true;
    dataDir = "/postgres";
    enableTCPIP = true;
  };
}
