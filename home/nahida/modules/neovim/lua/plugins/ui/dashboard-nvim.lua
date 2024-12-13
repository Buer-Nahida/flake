return {
  {
    "catppuccin",
    optional = true,
    opts = {
      integrations = { dashboard = true },
    },
  },
  {
    "nvimdev/dashboard-nvim",
    lazy = true,
    event = "VimEnter",
    opts = function(_, opts)
      local icons = {
        "󰥺 ",
        "󱀺 ",
        " ",
        "󱀻 ",
        "󰧭 ",
        "󱙨 ",
        "󰷜 ",
        " ",
        "󰒲 ",
        " ",
      }
      local logo = {
        "",
        "",
        "",
        "",
        "",
        "",
        "              ██╗██╗  󰫢   󰫢   󰫢    ███████╗████████╗ █████╗ ██████╗   󰫢   󰫢   󰫢    ██╗██╗          󱝁",
        "              ██║██║   󰫢  󰫢  󰫢  󰫢  ██╔════╝╚══██╔══╝██╔══██╗██╔══██╗   󰫢  󰫢  󰫢  󰫢  ██║██║      󱝁    ",
        "              ╚═╝╚═╝ 󰫢   󰫢   󰫢     ███████╗   ██║   ███████║██████╔╝ 󰫢   󰫢   󰫢     ╚═╝╚═╝   󱝁       ",
        "                       󰫢  󰫢  󰫢  󰫢  ╚════██║   ██║   ██╔══██║██╔══██╗   󰫢  󰫢  󰫢  󰫢         󱝁         ",
        "                    ██████████████╗███████║   ██║   ██║  ██║██║  ██║███████████████╗                ",
        "                    ╚═════════════╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚══════════════╝                ",
        "",
        "",
      }
      opts.config.header = logo
      for i, button in ipairs(opts.config.center) do
        button.icon = icons[i]
      end
      table.insert(opts.config.center, #opts.config.center, {
        action = "Leet",
        desc = " Leetcode" .. string.rep(" ", 34),
        icon = " ",
        key = "e",
        key_format = "  %s",
      })
    end,
  },
}
