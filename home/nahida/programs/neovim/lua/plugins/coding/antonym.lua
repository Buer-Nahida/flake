return {
  "Buer-Nahida/antonym.nvim",
  lazy = true,
  cmd = "Antonym",
  opts = {
    only_antonym = true,
    words = {
      ["true"] = "false",
    },
  },
  keys = {
    {
      "<leader>a",
      function()
        require("antonym").change()
      end,
      desc = "Antonym",
    },
  },
}
