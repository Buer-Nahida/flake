{
  general = {
    grace = 5;
    hide_cursor = true;
    ignore_empty_input = true;
    text_trim = true;
  };
  background = {
    monitor = "";
    path = "~/.config/ags/assets/wallpapers/deer.jpg";
    color = "rgba(19, 19, 24, 1.0)";
    blur_passes = 3;
    blur_size = 1;
    noise = 1.0e-2;
    contrast = 0.8916;
    brightness = 0.7;
    vibrancy = 0.1696;
    vibrancy_darkness = 0.0;
  };
  input-field = {
    monitor = "";
    size = "200, 50";
    outline_thickness = 3;
    dots_size = 0.33;
    dots_spacing = 0.15;
    dots_center = true;
    dots_rounding = -1;
    outer_color = "rgb(42, 41, 47)";
    inner_color = "rgb(42, 41, 47)";
    font_color = "rgb(228, 225, 233)";
    fade_on_empty = false;
    fade_timeout = 1000;
    font_family = "Product Sans";
    placeholder_text = ''<span foreground="##c7c5d0">$USER</span>'';
    hide_input = false;
    rounding = 4;
    check_color = "rgb(42, 41, 47)";
    fail_color = "rgb(255, 218, 214)";
    fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
    fail_transition = 200;
    capslock_color = -1;
    numlock_color = -1;
    bothlock_color = -1;
    invert_numlock = false;
    swap_font_color = false;
    position = "0, 70";
    halign = "center";
    valign = "bottom";
  };

  label = [
    {
      monitor = "";
      text = ''cmd[update:1000] echo -e "$(date +"%d %b %A")"'';
      color = "rgba(224, 224, 255, 1.0)";
      font_size = 14;
      font_family = "JetBrains Mono Nerd Font Mono ExtraBold";
      position = "0, -130";
      halign = "center";
      valign = "center";
    }
    {
      monitor = "";
      text = ''cmd[update:1000] echo -e "$(date +"%H")"'';
      color = "rgba(224, 224, 255, 1.0)";
      shadow_pass = 2;
      shadow_size = 3;
      shadow_color = "rgb(0,0,0)";
      shadow_boost = 1.2;
      font_size = 150;
      font_family = "Product Sans Semibold";
      position = "0, -250";
      halign = "center";
      valign = "top";
    }
    {
      monitor = "";
      text = ''cmd[update:1000] echo -e "$(date +"%M")"'';
      color = "rgba(224, 224, 255, 1.0)";
      font_size = 150;
      font_family = "Product Sans Semibold";
      position = "0, -420";
      halign = "center";
      valign = "top";
    }
    {
      monitor = "";
      text = "$LAYOUT";
      color = "rgba(224, 224, 255, 1.0)";
      font_size = 10;
      font_family = "Product Sans Semibold";
      position = "0, 130";
      halign = "center";
      valign = "bottom";
      shadow_passes = 5;
      shadow_size = 10;
    }
  ];
}
