return {
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  {
    "mikavilpas/yazi.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    init = function()
      if vim.fn.argc(-1) == 1 then
        local argv0 = vim.fn.argv(0)
        local stat = type(argv0) == "string" and vim.uv.fs_stat(argv0)
        if stat and stat.type == "directory" then
          require("yazi")
        end
      end
    end,
    ---@type YaziConfig
    opts = {
      open_for_directories = true,
      yazi_floating_window_border = "none",
      floating_window_scaling_factor = 1,
      set_keymappings_function = function(yazi_buffer_id)
        for _, key in ipairs({
          "<esc>",
          "<c-h>",
          "<c-j>",
          "<c-k>",
          "<c-l>",
        }) do
          vim.keymap.set(
            "t",
            key,
            key,
            { buffer = yazi_buffer_id, nowait = true }
          )
        end
      end,
    },
    -- stylua: ignore
    keys = {
      { "<leader>fe", function() require("yazi").yazi() end, desc = "Explorer Yazi" },
      { "<leader>e", "<leader>fe", desc = "Explorer Yazi", remap = true },
    },
  },
}
