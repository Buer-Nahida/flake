return function()
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "leetcode.nvim" },
    callback = function()
      vim.opt_local.wrap = true
    end,
  })
end
