BorderStyle = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }
vim.g.pkg_path = {
  ["@astro/ts-plugin"] = vim.env.HOME .. "node_modules/@astrojs/ts-plugin",
}
local function gen_extra(prefix)
  return setmetatable({}, {
    __index = function(_, k)
      return { import = "lazyvim.plugins.extras." .. prefix .. "." .. k }
    end,
  })
end
local ai = gen_extra("ai")
local lang = gen_extra("lang")
local coding = gen_extra("coding")
local editor = gen_extra("editor")
local formatting = gen_extra("formatting")
local lsp = gen_extra("lsp")
local test = gen_extra("test")
local ui = gen_extra("ui")
local util = gen_extra("util")
return {
  rocks = { hererocks = false },
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { "nvim-telescope/telescope-fzf-native.nvim", enabled = true },
    { "williamboman/mason-lspconfig.nvim", enabled = false },
    ai.copilot,
    ai["copilot-chat"],
    coding.blink,
    coding.neogen,
    coding.yanky,
    editor["mini-move"],
    editor.overseer,
    editor.refactoring,
    editor.snacks_picker,
    formatting.prettier,
    lang.sql,
    lang.python,
    lang.git,
    lang.json,
    lang.markdown,
    lang.nix,
    lang.rust,
    lang.toml,
    lang.yaml,
    lang.astro,
    lang.tailwind,
    lang.typescript,
    lsp.neoconf,
    test.core,
    ui["dashboard-nvim"],
    ui.edgy,
    ui["indent-blankline"],
    ui["mini-indentscope"],
    ui["treesitter-context"],
    util["mini-hipatterns"],
    util.octo,
    util.project,
    { import = "plugins.coding" },
    { import = "plugins.editor" },
    { import = "plugins.lsp" },
    { import = "plugins.treesitter" },
    { import = "plugins.ui" },
    {
      "williamboman/mason.nvim",
      opts = function(_, opts)
        opts.ensure_installed = { "vtsls" }
      end,
    },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "catppuccin" } },
  ui = { backdrop = 100 },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
}
