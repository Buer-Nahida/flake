return {
  { "<leader>l", group = "lazy/yazi" },
  { "<leader>ll", "<cmd>Lazy<cr>", desc = "Lazy" },
  {
    "<leader>lL",
    function()
      LazyVim.news.changelog()
    end,
    desc = "LazyVim Changelog",
  },
}
