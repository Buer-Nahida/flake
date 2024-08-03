-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function require_autocmds(file)
  local file = {
    name = file:match("(.+)%."),
    extension = file:match(".+%.(%w+)$"),
  }
  if file.extension == "lua" and file.name ~= "init" then
    require("config.autocmds." .. file.name)()
  end
end

for _, file in
  pairs(vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/config/autocmds"))
do
  require_autocmds(file)
end
