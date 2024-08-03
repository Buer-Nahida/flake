return {
  "Wansmer/treesj",
  lazy = true,
  dependencies = "nvim-treesitter/nvim-treesitter",
  cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
  opts = { use_default_keymaps = false },
  keys = {
    {
      "<leader>j",
      function()
        require("treesj").toggle()
      end,
      desc = "Treesj join/split",
    },
  },
}
