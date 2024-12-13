return {
  {
    "catppuccin",
    optional = true,
    opts = {
      integrations = { which_key = true },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      preset = "modern",
      notify = false,
      win = {
        no_overlap = false,
        border = BorderStyle,
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = function()
      local spec = {}

      local keymaps_dir = vim.fn.stdpath("config") .. "/lua/config/keymaps"
      for _, file in pairs(vim.fn.readdir(keymaps_dir)) do
        local file_new = {
          name = file:match("(.+)%."),
          extension = file:match(".+%.(%w+)$"),
        }
        if file_new.extension == "lua" and file_new.name ~= "init" then
          spec[#spec + 1] = require("config.keymaps." .. file_new.name)
        end
      end

      require("which-key").add(spec)
    end,
  },
}
