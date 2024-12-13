return {
  "Buer-Nahida/antonym.nvim",
  cmd = "Antonym",
  opts = {
    only_antonym = true,
    words = { ["true"] = "false" },
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
