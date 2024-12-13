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
        ["<A-k>"] = { "select_prev", "fallback" },
        ["<A-j>"] = { "select_next", "fallback" },
      },
      appearance = { nerd_font_variant = "normal" },
      completion = {
        menu = {
          draw = {
            padding = 0,
            columns = {
              { "kind_icon" },
              { "label" },
              { "label_description", "kind", gaps = 1 },
            },
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
                  return require("blink.cmp.completion.windows.render.tailwind").get_hl(
                    ctx
                  ) or ("RevBlinkCmpKind" .. ctx.kind)
                end,
              },
              label_description = {
                text = function(ctx)
                  return "     " .. ctx.label_description
                end,
                highlight = function(ctx)
                  return require("blink.cmp.completion.windows.render.tailwind").get_hl(
                    ctx
                  ) or ("RevBlinkCmpKind" .. ctx.kind)
                end,
              },
            },
          },
        },
      },
    },
  },
}
