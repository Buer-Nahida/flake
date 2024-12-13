local accent = "sky"
local opts = {
  compile_path = "/tmp/nvim/catppuccin",

  term_colors = true,
  transparent_background = true,
  integrations = {
    gitsigns = true,
    illuminate = true,
    notify = true,
    semantic_tokens = true,
    indent_blankline = {
      enabled = true,
      scope_color = accent,
      colored_indent_levels = false,
    },
    lsp_trouble = true,
    mini = {
      enabled = true,
      indentscope_color = accent,
    },
  },
}

function opts.custom_highlights(c)
  local h = {
    FloatBorder = { fg = c[accent], bg = c.none },

    RevMiniIconsAzure = { fg = c.base, bg = c.sapphire },
    RevMiniIconsBlue = { fg = c.base, bg = c.blue },
    RevMiniIconsCyan = { fg = c.base, bg = c.teal },
    RevMiniIconsGreen = { fg = c.base, bg = c.green },
    RevMiniIconsGrey = { fg = c.base, bg = c.text },
    RevMiniIconsOrange = { fg = c.base, bg = c.peach },
    RevMiniIconsPurple = { fg = c.base, bg = c.mauve },
    RevMiniIconsRed = { fg = c.base, bg = c.red },
    RevMiniIconsYellow = { fg = c.base, bg = c.yellow },

    FlashBackdrop = { fg = c.overlay0 },
    FlashCurrent = { fg = c.base, bg = c.peach },
    FlashMatch = { fg = c.base, bg = c.lavender },
    FlashLabel = { fg = c.base, bg = c.green, style = { "bold" } },

    TelescopePromptTitle = { fg = c.green, bg = c.none },
    TelescopePromptBorder = { fg = c.none, bg = c.green },
    TelescopeResultsBorder = { link = "TelescopePromptBorder" },
    TelescopeResultsTitle = { link = "TelescopePromptTitle" },
    TelescopeSelectionCaret = { fg = c.green },
    TelescopeMatching = { fg = c.none },
    TelescopeNormal = { bg = c.none },
    TelescopePromptPrefix = { fg = c.green, bg = c.none },
    TelescopePreviewBorder = { fg = c.none, bg = c.green },
    TelescopeSelection = { fg = c.green, bg = c.none, style = { "bold" } },

    DropBarIconUISeparator = { fg = c.overlay0 },
  }
  for k, v in pairs({
    Snippet = { fg = c.base, bg = c.mauve },
    Keyword = { fg = c.base, bg = c.red },
    Text = { fg = c.base, bg = c.teal },
    Method = { fg = c.base, bg = c.blue },
    Constructor = { fg = c.base, bg = c.blue },
    Function = { fg = c.base, bg = c.blue },
    Folder = { fg = c.base, bg = c.blue },
    Module = { fg = c.base, bg = c.blue },
    Constant = { fg = c.base, bg = c.peach },
    Field = { fg = c.base, bg = c.green },
    Property = { fg = c.base, bg = c.green },
    Enum = { fg = c.base, bg = c.green },
    Unit = { fg = c.base, bg = c.green },
    Class = { fg = c.base, bg = c.yellow },
    Variable = { fg = c.base, bg = c.flamingo },
    File = { fg = c.base, bg = c.blue },
    Interface = { fg = c.base, bg = c.yellow },
    Color = { fg = c.base, bg = c.red },
    Reference = { fg = c.base, bg = c.red },
    EnumMember = { fg = c.base, bg = c.red },
    Struct = { fg = c.base, bg = c.blue },
    Value = { fg = c.base, bg = c.peach },
    Event = { fg = c.base, bg = c.blue },
    Operator = { fg = c.base, bg = c.blue },
    TypeParameter = { fg = c.base, bg = c.blue },
    Copilot = { fg = c.base, bg = c.text },
    Fonts = { fg = c.base, bg = c.blue },
    Supermaven = { fg = c.base, bg = c.yellow },
    Declaration = { fg = c.base, bg = c.mauve },
    Identifier = { fg = c.base, bg = c.flamingo },
    Package = { fg = c.base, bg = c.blue },
    Type = { fg = c.base, bg = c.yellow },
  }) do
    h["BlinkCmpKind" .. k] = v
    local r_v = {
      fg = v.bg,
      bg = c.none,
    }
    h["RevBlinkCmpKind" .. k] = r_v
    h["DropBarIconKind" .. k] = r_v
  end
  return h
end

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    priority = 1000,
    opts = opts,
  },
}
