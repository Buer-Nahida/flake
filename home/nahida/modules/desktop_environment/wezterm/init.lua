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
local function make_keymaps(keys_list)
  local keymaps = {}
  for i, key in ipairs(keys_list) do
    keymaps[i] = { key = key[1], mods = key[2], action = key[3] }
  end
  return keymaps
end

return {
  -- OpenGL for GPU acceleration, Software for CPU
  front_end = "OpenGL",
  color_scheme = "Catppuccin Mocha",
  -- Font config
  font = font_with_fallback(font_name),
  font_rules = {
    { italic = true, font = font_with_fallback(font_name, { italic = true }) },
    { italic = false, font = font_with_fallback(font_name, { bold = true }) },
    { intensity = "Bold", font = font_with_fallback(font_name, { bold = true }) },
  },
  warn_about_missing_glyphs = false,
  font_size = 12.5,
  line_height = 1.0,
  dpi = 96.0,
  -- Cursor style
  default_cursor_style = "BlinkingUnderline",
  use_ime = true,
  -- Keybinds
  disable_default_key_bindings = true,
  keys = make_keymaps({
    { "_", "CTRL|SHIFT", action.SplitVertical({ domain = "CurrentPaneDomain" }) },
    { "|", "CTRL|SHIFT", action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { "t", "CTRL", action.SpawnTab("CurrentPaneDomain") },

    { "w", "CTRL", action.CloseCurrentPane({ confirm = false }) },

    { "Tab", "ALT", action.ActivateTabRelative(1) },
    { "Tab", "ALT|SHIFT", action.ActivateTabRelative(-1) },

    { "h", "CTRL|ALT", action.ActivatePaneDirection("Left") },
    { "l", "CTRL|ALT", action.ActivatePaneDirection("Right") },
    { "k", "CTRL|ALT", action.ActivatePaneDirection("Up") },
    { "j", "CTRL|ALT", action.ActivatePaneDirection("Down") },

    { "h", "CTRL|SHIFT|ALT", action.AdjustPaneSize({ "Left", 1 }) },
    { "l", "CTRL|SHIFT|ALT", action.AdjustPaneSize({ "Right", 1 }) },
    { "k", "CTRL|SHIFT|ALT", action.AdjustPaneSize({ "Up", 1 }) },
    { "j", "CTRL|SHIFT|ALT", action.AdjustPaneSize({ "Down", 1 }) },

    { "v", "CTRL|ALT", action.ActivateCopyMode },
    { "v", "CTRL|SHIFT", action.PasteFrom("Clipboard") },
    { "c", "CTRL|SHIFT", action.CopyTo("ClipboardAndPrimarySelection") },
    { "=", "CTRL", action.IncreaseFontSize },
    { "-", "CTRL", action.DecreaseFontSize },
    { ")", "CTRL|SHIFT", action.ResetFontSize },
  }),
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
