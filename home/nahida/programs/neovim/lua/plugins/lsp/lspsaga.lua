local ICONS = {}
for _, v in ipairs({
  "File",
  "Module",
  "Namespace",
  "Package",
  "Class",
  "Method",
  "Property",
  "Field",
  "Constructor",
  "Enum",
  "Interface",
  "Function",
  "Variable",
  "Constant",
  "String",
  "Number",
  "Boolean",
  "Array",
  "Object",
  "Key",
  "Null",
  "EnumMember",
  "Struct",
  "Event",
  "Operator",
  "TypeParameter",
  "TypeAlias",
  "Parameter",
  "StaticMethod",
  "Macro",
  "Text",
  "Snippet",
  "Folder",
  "Unit",
  "Value",
}) do
  ICONS[v] = { LazyVim.config.icons[v], "LspKind" .. v }
end
return {
  {
    "catppuccin",
    optional = true,
    opts = { integrations = { lsp_saga = true } },
  },
  {
    "nvimdev/lspsaga.nvim",
    cmd = "Lspsaga",
    event = "LspAttach",
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
    opts = {
      ui = {
        kind = ICONS,
        border = BorderStyle,
      },
      symbol_in_winbar = { enable = false },
      beacon = { enable = false },
      lightbulb = { enable = false },
      code_action = {
        show_server_name = true,
        extend_gitsigns = true,
      },
      diagnostic = {
        auto_preview = true,
        extend_relatedInformation = true,
        keys = {
          exec_action = "<CR>",
          quit = "q",
          toggle_or_jump = "<CR>",
          quit_in_show = "q",
        },
      },
      hover = {
        open_link = "",
        open_cmd = "!xdg-open",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      vim.list_extend(keys, {
        { "<leader>ca", "<cmd>Lspsaga code_action<cr>" },
        {
          "<M-n>",
          "<cmd>Lspsaga diagnostic_jump_next<cr>",
          desc = "Jump to next error/warn/tip",
        },
        {
          "<M-S-n>",
          "<cmd>Lspsaga diagnostic_jump_prev<cr>",
          desc = "Jump to prev error/warn/tip",
        },
        {
          "<M-S-k>",
          "<cmd>Lspsaga hover_doc ++keep<cr>",
          desc = "Keep show doc",
        },
      })
    end,
  },
}
