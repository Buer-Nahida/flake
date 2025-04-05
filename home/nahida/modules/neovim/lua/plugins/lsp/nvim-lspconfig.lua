return {
  {
    "catppuccin",
    optional = true,
    opts = {
      integrations = {
        semantic_tokens = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
          inlay_hints = {
            background = true,
          },
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function()
      require("lspconfig.ui.windows").default_options.border = BorderStyle
    end,
  },
}
