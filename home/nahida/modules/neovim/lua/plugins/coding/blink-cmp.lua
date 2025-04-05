return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = { integrations = { blink_cmp = true } },
  },
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide", "fallback" },
        ["<CR>"] = { "accept", "fallback" },

        ["<A-k>"] = { "select_prev", "fallback" },
        ["<A-j>"] = { "select_next", "fallback" },

        ["<Tab>"] = { "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },

        ["<C-d>"] = { "scroll_documentation_up", "fallback" },
        ["<C-u>"] = { "scroll_documentation_down", "fallback" },
      },
      appearance = { nerd_font_variant = "normal" },
      completion = {
        list = { selection = { preselect = false, auto_insert = false } },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 50,
        },
        menu = {
          draw = {
            padding = 0,
            columns = { { "kind_icon" }, { "label" }, { "label_description", "kind", gaps = 1 } },
            components = {
              kind_icon = {
                text = function(ctx)
                  return " " .. ctx.kind_icon .. ctx.icon_gap
                end,
              },
              kind = {
                text = function(ctx)
                  return "(" .. ctx.kind .. ")  "
                end,
                highlight = function(ctx)
                  return "RevBlinkCmpKind" .. ctx.kind
                end,
              },
              label_description = {
                text = function(ctx)
                  return "     " .. ctx.label_description
                end,
                highlight = function(ctx)
                  return "RevBlinkCmpKind" .. ctx.kind
                end,
              },
            },
          },
        },
      },
    },
  },
}
