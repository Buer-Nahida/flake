---@diagnostic disable: undefined-field
return {
  "nvim-lualine/lualine.nvim",
  optional = true,
  opts = function()
    local lualine_require = require("lualine_require")
    lualine_require.require = require

    local icons = LazyVim.config.icons

    vim.o.laststatus = vim.g.lualine_laststatus

    return {
      options = {
        theme = "auto",
        globalstatus = vim.o.laststatus == 3,
        disabled_filetypes = {
          statusline = { "dashboard", "alpha", "ministarter" },
        },
      },
      sections = {
        lualine_a = {
          "mode",
        },
        lualine_b = {
          "branch",
          {
            function()
              return require("noice").api.status.command.get()
            end,
            cond = function()
              return package.loaded["noice"] and require("noice").api.status.command.has()
            end,
            color = function()
              return { fg = Snacks.util.color("Statement") }
            end,
          },
          {
            function()
              return require("noice").api.status.mode.get()
            end,
            cond = function()
              return package.loaded["noice"] and require("noice").api.status.mode.has()
            end,
            color = function()
              return { fg = Snacks.util.color("Constant") }
            end,
          },
          {
            function()
              return "  " .. require("dap").status()
            end,
            cond = function()
              return package.loaded["dap"] and require("dap").status() ~= ""
            end,
            color = function()
              return { fg = Snacks.util.color("Debug") }
            end,
          },
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = function()
              return { fg = Snacks.util.color("Special") }
            end,
          },
        },
        lualine_c = {
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
        },
        lualine_x = {
          LazyVim.lualine.root_dir(),
          LazyVim.lualine.cmp_source("codeium"),
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
        },
        lualine_y = {
          {
            function()
              return string.format(" %d", vim.fn.line("$"))
            end,
          },
        },
        lualine_z = {
          {
            function()
              local line = vim.fn.line(".")
              local column = vim.fn.virtcol(".")
              return string.format(" %d:%-2d", line, column)
            end,
            padding = { left = 1, right = 1 },
          },
        },
      },
      extensions = { "lazy" },
    }
  end,
}
