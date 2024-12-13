-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local function require_options(file)
  local file = {
    name = file:match("(.+)%."),
    extension = file:match(".+%.(%w+)$"),
  }
  if file.extension == "lua" and file.name ~= "init" then
    require("config.options." .. file.name)()
  end
end

for _, file in
  pairs(vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/config/options"))
do
  require_options(file)
end
