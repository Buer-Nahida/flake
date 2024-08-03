[{
  layer = "top";
  position = "top";
  modules-left = [ "temperature" "memory" "cpu" ];
  modules-center = [ "clock" ];
  modules-right = [ "mpd" "pulseaudio" "backlight" "battery" "tray" ];
  cava = {
    framerate = 60;
    autosens = 1;
    bars = 15;
    method = "pipewire";
    source = "auto";
    bar_delimiter = 0;
    format-icons = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
  };
  backlight = {
    device = "intel_backlight";
    on-scroll-up = "light -A 5";
    on-scroll-down = "light -U 5";
    format = "{icon} {percent}%";
    format-icons = [ "󰃝" "󰃞" "󰃟" "󰃠" ];
  };
  pulseaudio = {
    scroll-step = 1;
    format = "{icon} {volume}%";
    format-muted = "󰖁 Muted";
    format-icons = { "default" = [ "" "" " " ]; };
    on-click = "pavucontrol";
    on-click-right = "~/.config/hypr/scripts/control/volume --toggle";
    tooltip = false;
  };
  # battery = {
  #   interval = 10;
  #   states = {
  #     warning = 20;
  #     critical = 10;
  #   };
  #   format = "{icon} {capacity}%";
  #   format-icons = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
  #   format-full = "{icon} {capacity}%";
  #   format-charging = "󰂄 {capacity}%";
  #   tooltip = false;
  # };
  clock = {
    interval = 1;
    on-click = "~/.config/hypr/scripts/waybar/cycle";
    format = "<b>{:%Y年%m月%d日 %H:%M:%S %A}</b>";
    tooltip = true;
    tooltip-format = ''
      <big>{:%Y年%b%d日}</big>
      <tt><small>{calendar}</small></tt>'';
  };
  memory = {
    interval = 1;
    format = " {percentage}%";
    on-click = "wezterm start btm -e --default_widget_type proc";
    states = { "warning" = 85; };
  };
  cpu = {
    interval = 1;
    on-click = "wezterm start btm -e --default_widget_type cpu";
    format = " {usage}%";
  };
  mpd = {
    max-length = 25;
    format = " {title}";
    format-paused = " {title}";
    format-stopped = "";
    format-disconnected = "";
    on-click = "wezterm start ncmpcpp ";
    on-scroll-up = "mpc --quiet prev";
    on-scroll-down = "mpc --quiet next";
    smooth-scrolling-threshold = 5;
    tooltip-format =
      "{title} - {artist} ({elapsedTime:%M:%S}/{totalTime:%H:%M:%S})";
  };
  network = {
    format-disconnected = "󰯡 Disconnected";
    format-ethernet = "󰀂 {ifname} ({ipaddr})";
    format-linked = "󰖪 {essid} (No IP)";
    format-wifi = "󰖩 {essid}";
    interval = 1;
    on-click = "wezterm start btm -e --default_widget_type net";
    tooltip = false;
  };
  temperature = {
    interval = 1;
    hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
    critical-threshold = 80;
    on-click = "wezterm start btm -e --default_widget_type temp";
    tooltip = true;
    format = " {temperatureC}°C";
  };
  tray = {
    icon-size = 15;
    spacing = 5;
  };
}]
