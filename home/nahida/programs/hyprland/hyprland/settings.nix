{ pkgs, config, ... }: {
  plugin = {
    scroller = {
      column_default_width = "floatling";
      focus_wrap = false;
      column_widths = "one twothirds onehalf onethird";
    };
    dynamic-cursors = {
      mode = "stretch";
      threshold = 1;
      shake.enabled = false;
      stretch = {
        limit = 3000;
        # linear             - a linear function is used
        # quadratic          - a quadratic function is used
        # negative_quadratic - negative version of the quadratic one, feels more aggressive
        function = "negative_quadratic";
      };
    };
  };
  env = [
    "QT_IM_MODULE, fcitx"
    "XMODIFIERS, @im=fcitx"
    "QT_QPA_PLATFORM, wayland"
    "QT_QPA_PLATFORMTHEME, qt5ct"
    "QT_STYLE_OVERRIDE, kvantum"
    "WLR_NO_HARDWARE_CURSORS, 1"
    "WLR_NO_HARDWARE_CURSORS, 1"
    "_JAVA_AWT_WM_NONREPARENTING, 1"
  ];
  monitor = [ ", preferred, auto, 1" ];
  exec-once = [
    "ags"
    ''
      mpvpaper -s -p HDMI-A-1 ~/.config/hypr/wallpapers/nahida.mp4 -o "--loop --no-audio --vo=libmpv" &''
    "fcitx5"
    "wl-paste --watch cliphist store"
    "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
    "hyprctl setcursor catppuccin-mocha-${config.catppuccin.accent}-cursors 32"
  ];
  general = {
    gaps_in = 4;
    gaps_out = 5;
    gaps_workspaces = 50;
    border_size = 1;
    layout = "scroller";
    resize_on_border = true;
    "col.active_border" = "rgba(471868FF)";
    "col.inactive_border" = "rgba(4f4256CC)";
  };
  gestures = {
    workspace_swipe = true;
    workspace_swipe_distance = 700;
    workspace_swipe_fingers = 4;
    workspace_swipe_cancel_ratio = 0.2;
    workspace_swipe_min_speed_to_force = 5;
    workspace_swipe_direction_lock = true;
    workspace_swipe_direction_lock_threshold = 10;
    workspace_swipe_create_new = true;
  };
  binds.scroll_event_delay = 0;
  input = {
    kb_layout = "us";
    # kb_options = grp:win_space_toggle;
    numlock_by_default = true;
    repeat_delay = 250;
    repeat_rate = 50;
    follow_mouse = 0;
    touchpad = {
      natural_scroll = true;
      disable_while_typing = true;
      clickfinger_behavior = true;
      scroll_factor = 0.5;
    };
    # special_fallthrough = true   # only in new hyprland versions. but they're hella fucked
  };
  decoration = {
    rounding = 0;
    shadow.enabled = false;
    dim_inactive = false;
    dim_strength = 0.1;
    dim_special = 0;
    blur = {
      size = 1;
      passes = 4;
      new_optimizations = true;
      xray = true;
      ignore_opacity = true;
      # blurls = [ "bar-0" ];
    };
  };
  animations = {
    enabled = true;
    bezier = [
      "md3_decel, 0.05, 0.7, 0.1, 1"
      "md3_accel, 0.3, 0, 0.8, 0.15"
      "overshot, 0.05, 0.9, 0.1, 1.1"
      "crazyshot, 0.1, 1.5, 0.76, 0.92"
      "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
      "fluent_decel, 0.1, 1, 0, 1"
      "easeInOutCirc, 0.85, 0, 0.15, 1"
      "easeOutCirc, 0, 0.55, 0.45, 1"
      "easeOutExpo, 0.16, 1, 0.3, 1"
      "linear,0.0,0.0,1.0,1.0"
    ];
    animation = [
      "windows, 1, 3, md3_decel, popin 60%"
      "border, 1, 10, default"
      "fade, 1, 2.5, md3_decel"
      "workspaces,1,6,overshot,slidevert"
    ];
  };
  misc = {
    vfr = true;
    vrr = 1;
    animate_manual_resizes = false;
    animate_mouse_windowdragging = false;
    new_window_takes_over_fullscreen = 2;
  };
  bindm = [ "Super, mouse:272, movewindow" "Super, mouse:273, resizewindow" ];
  bindel = [
    ", XF86AudioRaiseVolume, exec, amixer -Mq set Master,0 1%+"
    ", XF86AudioLowerVolume, exec, amixer -Mq set Master,0 1%-"
    ", XF86AudioMute,        exec, amixer set Master toggle"
    "Super+Alt, X,           exec, amixer -Mq set Master,0 1%+"
    "Super+Alt, Z,           exec, amixer -Mq set Master,0 1%-"
    "Super+Alt, M,           exec, amixer set Master toggle"
  ];
  bind = [
    "Alt,         F4,        exec, hyprctl kill"
    "Super,       return,    exec, wezterm"
    "Super,       e,         exec, nautilus --new-window"
    "Super,       w,         exec, firefox-nightly"
    "Super,       d,         exec, rofi -show drun"
    "Super,       v,         exec, ~/.config/rofi/clipmenu/script"
    "Super,       backslash, exec, pkill .ags-wrapped || ags"
    "Super,       escape,    exec, ~/.config/hypr/scripts/other/transout -p"
    "Super,       q,         killactive,"
    "Super,       h,         scroller:movefocus, l"
    "Super,       j,         workspace, +1"
    "Super,       k,         workspace, -1"
    "Super,       l,         scroller:movefocus, r"
    "Super,       f,         fullscreen, 0"
    "Super,       r,         scroller:cyclesize, next"
    "Super,       c,         scroller:alignwindow, c"
    "Super+Alt,   q,         exec, ags -t 'session'"
    "Super+Shift, h,         scroller:movewindow, l"
    "Super+Shift, j,         movetoworkspace, +1"
    "Super+Shift, k,         movetoworkspace, -1"
    "Super+Shift, l,         scroller:movewindow, r"
    "Super+Shift, escape,    exec, ~/.config/hypr/scripts/other/transout"
    ",Print,                 exec, ~/.config/ags/services/snapshot.sh"
  ];
  windowrule = [ "noblur,.*" "pin, ^(showmethekey-gtk)$" ];
}
