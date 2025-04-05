-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local del = vim.keymap.del

-- I don't need better up/down, because `vim.opt.wrap = false`, and it will lead stack overflow
del({ "n", "x" }, "k")
del({ "n", "x" }, "<Up>")
del({ "n", "x" }, "j")
del({ "n", "x" }, "<Down>")

del("n", "<leader>l")

del({ "n", "x" }, ";")
