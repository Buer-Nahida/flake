return {
  { "catppuccin", optional = true, opts = { integrations = { noice = true } } },
  {
    "folke/noice.nvim",
    lazy = true,
    view = "cmdline_popup",
    opts = { presets = { bottom_search = false, lsp_doc_border = true } },
  },
}
