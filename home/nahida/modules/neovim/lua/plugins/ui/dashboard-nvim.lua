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
    end,
  },
}
