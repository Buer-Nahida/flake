{
  general = {
    ignore_dbus_inhibit = false;
    lock_cmd = "pidof hyprlock || hyprlock";
    before_sleep_cmd = "loginctl lock-session";
    after_sleep_cmd = "hyprctl dispatch dpms on";
  };
  listener = [
    {
      timeout = 600;
      on-timeout = "loginctl lock-session";
    }
    {
      timeout = 0;
      # on-timeout = "hyprctl dispatch dpms off";
      # on-resume = "hyprctl dispatch dpms on";
    }
    { timeout = 0; }
  ];
}
