local opts = {
  shade_terminals = false,
  direction = "float",
  float_opts = { winblend = 0, border = BorderStyle },
}
return {
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    version = "*",
    opts = opts,
    keys = function(_, keys)
      local terminal = require("toggleterm.terminal").Terminal:new(
        vim.tbl_extend("force", opts, {
          dir = LazyVim.root(),
          hidden = true,
        })
      )
      table.insert(keys, {
        "<C-CR>",
        function()
          terminal:toggle()
        end,
        desc = "Terminal (root dir)",
        mode = { "n", "t" },
      })
    end,
  },
  { "stevearc/overseer.nvim", opts = { strategy = { "toggleterm" } } },
}
