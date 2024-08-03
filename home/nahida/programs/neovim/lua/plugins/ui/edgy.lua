return {
  {
    "folke/edgy.nvim",
    opts = {
      animate = { enabled = false },
    },
  },
  {
    "folke/edgy.nvim",
    opts = function(_, opts)
      for i, v in ipairs(opts.bottom) do
        if v.ft == "toggleterm" then
          table.remove(v, i)
        end
      end
    end,
  },
}
