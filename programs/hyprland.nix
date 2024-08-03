{
  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
      systemd.setPath.enable = true;
    };
    hyprlock.enable = true;
  };
  services.hypridle.enable = true;
}
