return {
  {
    "catppuccin",
    optional = true,
    opts = {
      integrations = { flash = true },
    },
  },
  {
    "folke/flash.nvim",
    lazy = true,
    vscode = true,
    ---@type Flash.Config
    opts = {
      label = { uppercase = false },
      highlight = { backdrop = false },
    },
    modes = { char = { jump_labels = true } },
    keys = {
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter({
            label = {
              rainbow = { enabled = true },
            },
          })
        end,
        desc = "Flash Treesitter",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search({
            label = {
              rainbow = { enabled = true },
            },
          })
        end,
        desc = "Treesitter Search",
      },
    },
  },
}
