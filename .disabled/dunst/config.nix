{
  global = {
    monitor = 0;
    follow = "mouse";
    width = 400;
    height = 460;
    origin = "bottom-right";
    offset = "24x24";
    progress_bar = true;
    progress_bar_height = 14;
    progress_bar_frame_width = 1;
    progress_bar_min_width = 150;
    progress_bar_max_width = 400;
    indicate_hidden = "yes";
    shrink = "no";
    transparency = 1;
    separator_height = 6;
    separator_color = "#00000000";
    padding = 16;
    horizontal_padding = 16;
    frame_width = 0;
    sort = "no";
    idle_threshold = 0;
    font = "FZLanTingYuan-DB-GBK 11";
    line_height = 0;
    markup = "full";
    format = ''
      <b>%a</b>
      %s'';
    alignment = "left";
    vertical_alignment = "center";
    show_age_threshold = 120;
    word_wrap = "yes";
    ignore_newline = "no";
    stack_duplicates = false;
    show_indicators = "yes";
    icon_position = "left";
    min_icon_size = 50;
    max_icon_size = 60;
    sticky_history = "yes";
    history_length = 100;
    # dmenu = "/usr/bin/dmenu -p dunst:";
    browser = "firefox -new-tab";
    always_run_script = false;
    title = "Dunst";
    class = "Dunst";
    corner_radius = 0;
    ignore_dbusclose = false;
    force_xinerama = false;
    mouse_left_click = "close_current";
    mouse_middle_click = "do_action, close_current";
    mouse_right_click = "close_all";
  };
  experimental.per_monitor_dpi = false;
  urgency_low = {
    background = "#141929fe";
    highlight = "#6fa6e7";
    frame_color = "#272f57";
    foreground = "#dae1f2";
    timeout = 8;
  };
  urgency_normal = {
    background = "#141929fe";
    highlight = "#5ca1ff";
    frame_color = "#272f57";
    foreground = "#dae1f2";
    timeout = 8;
  };
  urgency_critical = {
    background = "#5ca1ffff";
    highlight = "#fe6c5a";
    foreground = "#1c2138";
    frame_color = "#52426e";
    timeout = 0;
  };
  backlight = {
    appname = "Backlight";
    highlight = "#f1cf8a";
    set_stack_tag = "backlight";
  };
  music.appname = "Music";
  volume = {
    summary = "Volume*";
    highlight = "#70a5eb";
    set_stack_tag = "volume";
  };
  battery.appname = "Power Warning";
  logger.summary = "*";
}
