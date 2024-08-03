{ pkgs, ... }: {
  plugin = {
    scroller = {
      column_default_width = "floatling";
      focus_wrap = false;
      column_widths = "one twothirds onehalf onethird";
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
    "LANG=en_US.utf8 ags"
    ''
      mpvpaper -s -p HDMI-A-1 ~/.config/hypr/wallpapers/nahida.mp4 -o "--loop --no-audio --vo=libmpv" &''
    "fcitx5"
    "wl-paste --watch cliphist store"
    "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
    "hyprctl setcursor Bibata-Modern-Classic 24"
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

    touchpad = {
      natural_scroll = true;
      disable_while_typing = true;
      clickfinger_behavior = true;
      scroll_factor = 0.5;
    };

    # special_fallthrough = true   # only in new hyprland versions. but they're hella fucked
    follow_mouse = 0;
  };
  decoration = {
    rounding = 0;

    drop_shadow = false;
    shadow_ignore_window = true;
    shadow_range = 20;
    shadow_offset = "0 2";
    shadow_render_power = 2;
    "col.shadow" = "rgba(0000001A)";

    dim_inactive = false;
    dim_strength = 0.1;
    dim_special = 0;
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
    vfr = 1;
    vrr = 1;
    # layers_hog_mouse_focus = true;
    focus_on_activate = true;
    animate_manual_resizes = false;
    animate_mouse_windowdragging = false;
    enable_swallow = false;
    swallow_regex = "(foot|kitty|allacritty|Alacritty)";

    disable_hyprland_logo = true;
    new_window_takes_over_fullscreen = 2;
  };
  bind = let SLURP_COMMAND = "$(slurp -d -c eedcf5BB -b 4f425644 -s 00000000)";
  in with pkgs; [
    "Super, Return, exec, wezterm"
    "Super, E, exec, nautilus --new-window"
    "Super+Alt, E, exec, thunar"
    "Super, W, exec, firefox"
    "Super, D, exec, ags -t launcher"
    ''Super, I, exec, XDG_CURRENT_DESKTOP="gnome" gnome-control-center''
    "Control+Shift, Escape, exec, wezterm -e btm"
    # "Super, Period, exec, pkill fuzzel || ~/.local/bin/fuzzel-emoji"
    "Super, Q, killactive,"
    "Alt, F4, exec, hyprctl kill"
    # ''
    #   Super+Shift+Alt, S, exec, grim -g "${SLURP_COMMAND}" - | swappy -f -
    # ''
    # ''
    #   Super+Shift, S, exec, grim -g "${SLURP_COMMAND}" - | wl-copy
    # ''
    # "Super+Alt, R, exec, ~/.config/ags/scripts/record-script.sh"
    # "Control+Alt, R, exec, ~/.config/ags/scripts/record-script.sh --fullscreen"
    # "Super+Shift+Alt, R, exec, ~/.config/ags/scripts/record-script.sh --fullscreen-sound"
    # "Super+Shift, C, exec, hyprpicker -a"
    "Super, V, exec, ~/.config/rofi/clipmenu/script"
    # ''Control+Super+Shift,S,exec,grim -g "${SLURP_COMMAND}" "tmp.png" && tesseract "tmp.png" - | wl-copy && rm "tmp.png"''
    "Control+Super, T, exec, ~/.config/ags/scripts/color_generation/switchwall.sh"
    "Super, backslash, exec, pkill .ags-wrapped || LANG=en_US.utf8 ags"
    "Super, h, scroller:movefocus, l"
    "Super, j, workspace, +1"
    "Super, k, workspace, -1"
    "Super, l, scroller:movefocus, r"
    "Super+Shift, h, scroller:movewindow, l"
    "Super+Shift, j, movetoworkspace, +1"
    "Super+Shift, k, movetoworkspace, -1"
    "Super+Shift, l, scroller:movewindow, r"
    "Super, R, scroller:cyclesize, next"
    "Super, C, scroller:alignwindow, c"
    "Super+Alt, Q, exec, ags -t 'session'"
    "Super, F, fullscreen, 0"
    "Super+Shift, Escape, exec, ~/.config/hypr/scripts/other/transout"
    "Super, Escape, exec, ~/.config/hypr/scripts/other/transout -p"
    # "Super, S, togglespecialworkspace,"
  ];
  bindm = [ "Super, mouse:272, movewindow" "Super, mouse:273, resizewindow" ];
  bindl = [
    ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    "Super+Shift,M, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ",Print,exec,grim - | wl-copy"
    ''
      Super+Shift, N, exec, playerctl next || playerctl position `bc <<< "100 * $(playerctl metadata mpris:length) / 1000000 / 100"`''
    ''
      ,XF86AudioNext, exec, playerctl next || playerctl position `bc <<< "100 * $(playerctl metadata mpris:length) / 1000000 / 100"`''
    "Super+Shift, B, exec, playerctl previous"
    "Super+Shift, P, exec, playerctl play-pause"
    ",XF86AudioPlay, exec, playerctl play-pause"
  ];
  bindel = [
    ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%+"
    ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"
    "Super+Alt, X, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%+"
    "Super+Alt, Z, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"

    # ",XF86MonBrightnessUp, exec, ags run-js 'brightness.screen_value += 0.01; indicator.popup(1);'"
    # ",XF86MonBrightnessDown, exec, ags run-js 'brightness.screen_value -= 0.01; indicator.popup(1);'"
    # "Super+Control, X, exec, ags run-js 'brightness.screen_value += 0.01; indicator.popup(1);'"
    # "Super+Control, Z, exec, ags run-js 'brightness.screen_value -= 0.01; indicator.popup(1);'"
  ];
  binde = [
    "Super, Minus, splitratio, -0.1"
    "Super, Equal, splitratio, 0.1"
    "Super, Semicolon, splitratio, -0.1"
    "Super, Apostrophe, splitratio, 0.1"
  ];
  windowrule = [
    "noblur,.*" # Disables blur for windows. Substantially improves performance.
    "pin, ^(showmethekey-gtk)$"
  ];
  windowrulev2 = [ "tile,class:(wpsoffice)" ];
  layerrule = [
    "xray 1, .*"
    "noanim, selection"
    "noanim, overview"
    "noanim, anyrun"
    "blur, swaylock"
    "blur, eww"
    "ignorealpha 0.8, eww"
    "noanim, noanim"
    "blur, noanim"
    "blur, gtk-layer-shell"
    "ignorezero, gtk-layer-shell"
    "blur, launcher"
    "ignorealpha 0.5, launcher"
    "blur, notifications"
    "ignorealpha 0.69, notifications"
    "blur, session"
    "noanim, sideright"
    "noanim, sideleft"
  ];
}
