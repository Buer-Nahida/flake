local wezterm = require("wezterm")
local action = require("wezterm").action
local function font_with_fallback(name, params)
  local names = {
    name,
    "Noto Color Emoji",
    "DFHannotateW7-A",
  }
  return wezterm.font_with_fallback(names, params)
end
local font_name = "JetBrainsMono Nerd Font"

return {
  -- OpenGL for GPU acceleration, Software for CPU
  front_end = "OpenGL",
  color_scheme = "Catppuccin Mocha",
  -- Font config
  font = font_with_fallback(font_name),
  font_rules = {
    {
      italic = true,
      font = font_with_fallback(font_name, { italic = true }),
    },
    {
      italic = false,
      font = font_with_fallback(font_name, { bold = true }),
    },
    {
      intensity = "Bold",
      font = font_with_fallback(font_name, { bold = true }),
    },
  },
  warn_about_missing_glyphs = false,
  font_size = 12.5,
  line_height = 1.0,
  dpi = 96.0,
  -- Cursor style
  default_cursor_style = "BlinkingUnderline",
  -- enable_wayland = false,
  use_ime = true,
  -- Keybinds
  disable_default_key_bindings = true,
  keys = {
    {
      key = "_",
      mods = "CTRL|SHIFT",
      action = action.SplitVertical({ domain = "CurrentPaneDomain" }),
    },
    {
      key = "|",
      mods = "CTRL|SHIFT",
      action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
    },
    {
      key = "t",
      mods = "CTRL",
      action = action.SpawnTab("CurrentPaneDomain"),
    },

    {
      key = "w",
      mods = "CTRL",
      action = action.CloseCurrentPane({ confirm = false }),
    },

    { key = "Tab", mods = "ALT", action = action.ActivateTabRelative(1) },
    {
      key = "Tab",
      mods = "ALT|SHIFT",
      action = action.ActivateTabRelative(-1),
    },

    {
      key = "h",
      mods = "CTRL|ALT",
      action = action.ActivatePaneDirection("Left"),
    },
    {
      key = "l",
      mods = "CTRL|ALT",
      action = action.ActivatePaneDirection("Right"),
    },
    {
      key = "k",
      mods = "CTRL|ALT",
      action = action.ActivatePaneDirection("Up"),
    },
    {
      key = "j",
      mods = "CTRL|ALT",
      action = action.ActivatePaneDirection("Down"),
    },

    {
      key = "h",
      mods = "CTRL|SHIFT|ALT",
      action = action.AdjustPaneSize({ "Left", 1 }),
    },
    {
      key = "l",
      mods = "CTRL|SHIFT|ALT",
      action = action.AdjustPaneSize({ "Right", 1 }),
    },
    {
      key = "k",
      mods = "CTRL|SHIFT|ALT",
      action = action.AdjustPaneSize({ "Up", 1 }),
    },
    {
      key = "j",
      mods = "CTRL|SHIFT|ALT",
      action = action.AdjustPaneSize({ "Down", 1 }),
    },

    { key = "v", mods = "CTRL|ALT", action = action.ActivateCopyMode },
    {
      key = "v",
      mods = "CTRL|SHIFT",
      action = action.PasteFrom("Clipboard"),
    },
    {
      key = "c",
      mods = "CTRL|SHIFT",
      action = action.CopyTo("ClipboardAndPrimarySelection"),
    },
    { key = "=", mods = "CTRL", action = action.IncreaseFontSize },
    { key = "-", mods = "CTRL", action = action.DecreaseFontSize },
    { key = ")", mods = "CTRL|SHIFT", action = action.ResetFontSize },
  },
  -- Aesthetic Night Colorscheme
  bold_brightens_ansi_colors = true,
  -- Padding
  window_padding = { left = 25, right = 25, top = 25, bottom = 25 },
  -- Tab Bar
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,
  show_tab_index_in_tab_bar = false,
  tab_bar_at_bottom = false,
  -- General
  automatically_reload_config = false,
  adjust_window_size_when_changing_font_size = false,
  inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },
  window_background_opacity = 0.9,
  window_close_confirmation = "NeverPrompt",
  window_frame = { font = font_with_fallback(font_name, { bold = true }) },
}
