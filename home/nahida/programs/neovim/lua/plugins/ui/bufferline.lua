local mocha = require("catppuccin.palettes").get_palette("mocha")

return {
  "akinsho/bufferline.nvim",
  dependencies = "catppuccin",
  opts = function(_, opts)
    opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
    opts.options.separator_style = "slant"
  end,
}
