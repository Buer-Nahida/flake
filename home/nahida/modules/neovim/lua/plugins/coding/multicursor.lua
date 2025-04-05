return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  lazy = true,
  config = true,
  keys = function()
    local multicursor = require("multicursor-nvim")
    return { -- Add or skip cursor above/below the main cursor.
      {
        "<C-S-j>",
        function()
          multicursor.lineAddCursor(1)
        end,
        mode = { "n", "v" },
      },
      {
        "<C-S-k>",
        function()
          multicursor.lineAddCursor(-1)
        end,
        mode = { "n", "v" },
      },
      {
        "<down>",
        function()
          multicursor.lineSkipCursor(1)
        end,
        mode = { "n", "v" },
      },
      {
        "<up>",
        function()
          multicursor.lineSkipCursor(-1)
        end,
        mode = { "n", "v" },
      },

      -- Add or skip adding a new cursor by matching word/selection
      {
        "<C-S-n>",
        function()
          multicursor.matchAddCursor(-1)
        end,
        mode = { "n", "v" },
      },
      {
        "<C-n>",
        function()
          multicursor.matchAddCursor(1)
        end,
        mode = { "n", "v" },
      },
      {
        "<C-S-a>",
        function()
          multicursor.matchSkipCursor(-1)
        end,
        mode = { "n", "v" },
      },
      {
        "<C-a>",
        function()
          multicursor.matchSkipCursor(1)
        end,
        mode = { "n", "v" },
      },

      -- Add all matches in the document
      { mode = { "n", "v" }, "<leader>la", multicursor.matchAllAddCursors },

      -- Rotate the main cursor.
      { mode = { "n", "v" }, "<left>", multicursor.prevCursor },
      { mode = { "n", "v" }, "<right>", multicursor.nextCursor },

      -- Easy way to add and remove cursors using the main cursor.
      { mode = { "n", "v" }, "<C-Q>", multicursor.toggleCursor },

      {
        mode = "n",
        "<esc>",
        function()
          if not multicursor.cursorsEnabled() then
            multicursor.enableCursors()
          elseif multicursor.hasCursors() then
            multicursor.clearCursors()
          else
            vim.cmd("noh")
            LazyVim.cmp.actions.snippet_stop()
            return "<esc>"
          end
        end,
      },

      -- bring back cursors if you accidentally clear them
      { mode = "n", "<leader>lr", multicursor.restoreCursors, desc = "Restore cursors" },

      -- Align cursor columns.
      { mode = "n", "<leader>la", multicursor.alignCursors, desc = "Align cursors" },

      -- Rotate visual selection contents.
      -- {
      --   mode = "v",
      --   "<S-down>",
      --   function()
      --     multicursor.transposeCursors(1)
      --   end,
      -- },
      -- {
      --   mode = "v",
      --   "<S-up>",
      --   function()
      --     multicursor.transposeCursors(-1)
      --   end,
      -- },
    }
  end,
}
