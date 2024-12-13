return {
  "echasnovski/mini.pairs",
  event = "VeryLazy",
  config = function(_, opts)
    require("mini.pairs").setup(opts)
    require("mini.pairs").unmap("i", "'", "")
  end,
}
