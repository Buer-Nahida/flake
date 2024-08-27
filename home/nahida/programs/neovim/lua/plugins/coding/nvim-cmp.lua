local cmp = require("cmp")
return {
  {
    "catppuccin",
    optional = true,
    opts = {
      integrations = { cmp = true },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "onsails/lspkind-nvim" },
    ---@type cmp.ConfigSchema
    opts = {
      window = {
        completion = { col_offset = -3, side_padding = 0, winblend = 0 },
        documentation = {
          winhighlight = "FloatBorder:FloatBorder",
          border = BorderStyle,
          winblend = 0,
        },
      },
      completion = { completeopt = "noselect" },
      preselect = cmp.PreselectMode.None,
      formatting = {
        expandable_indicator = true,
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          if vim.tbl_contains({ "path" }, entry.source.name) then
            local icon, hl_group = require("nvim-web-devicons").get_icon(
              entry:get_completion_item().label
            )
            if icon then
              vim_item.kind = " " .. icon .. " "
              vim_item.kind_hl_group = "Rev" .. hl_group
              return vim_item
            end
          end
          local kind = require("lspkind").cmp_format({
            mode = "symbol_text",
            maxwidth = 60,
            symbol_map = LazyVim.config.icons.raw_kinds,
          })(entry, vim_item)
          local strings = vim.split(kind.kind, "%s", { trimempty = true })
          kind.kind = " " .. (strings[1] or "") .. " "
          kind.menu = "    (" .. (strings[2] or "") .. ")"
          return kind
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<A-j>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { "i", "c" }),
        ["<A-k>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "c" }),
        ["<CR>"] = cmp.mapping(function(fallback)
          if cmp.visible() and cmp.get_active_entry() then
            cmp.confirm({ select = true })
          else
            fallback()
          end
        end, { "i", "c" }),
        ["<A-n>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.close()
          else
            cmp.complete()
          end
        end, { "i", "s" }),
      }),
    },
  },
}
