local Layout = require("nui.layout")
local TSLayout = require("telescope.pickers.layout")

local function make_popup(options)
  local popup = require("nui.popup")(options)
  ---@diagnostic disable-next-line: inject-field
  function popup.border:change_title(title)
    popup.border.set_text(popup.border, "top", title)
  end
  ---@diagnostic disable-next-line: param-type-mismatch
  return TSLayout.Window(popup)
end

return {
  {
    "catppuccin",
    optional = true,
    opts = {
      integrations = { telescope = true },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    cmd = "Telescope",
    opts = {
      defaults = {
        layout_strategy = "flex",
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = { size = { width = "100%", height = "100%" } },
          vertical = { size = { width = "100%", height = "100%" } },
        },
        prompt_prefix = "  ",
        border = true,
        results_title = false,
        create_layout = function(picker)
          local border = {
            results = { "", "", "", "│", "┘", "─", "─", "" },
            prompt = { "─", "─", "┐", "│", "", "", "", "" },
            preview = {
              "┌",
              "─",
              "",
              "",
              "",
              "─",
              "└",
              "│",
            },
          }
          local results = make_popup({
            focusable = false,
            border = { style = border.results },
          })
          local prompt = make_popup({
            enter = true,
            border = { style = border.prompt },
          })
          local preview = make_popup({
            focusable = false,
            border = {
              style = border.preview,
              text = {
                top = picker.prompt_title,
                top_align = "left",
              },
            },
          })
          local layout = Layout(
            { relative = "editor", position = "50%", size = "85%" },
            Layout.Box({
              Layout.Box(preview, { size = "41%" }),
              Layout.Box({
                Layout.Box(prompt, { size = 2 }),
                Layout.Box(results, { grow = 1 }),
              }, {
                dir = "col",
                size = "60%",
              }),
            }, { dir = "row" })
          )
          ---@diagnostic disable-next-line: inject-field
          layout.results = results
          ---@diagnostic disable-next-line: inject-field
          layout.prompt = prompt
          ---@diagnostic disable-next-line: inject-field
          layout.preview = preview
          ---@diagnostic disable-next-line: param-type-mismatch
          return TSLayout(layout)
        end,
      },
    },
    keys = {
      {
        "<leader>fi",
        function()
          require("telescope.builtin").builtin()
        end,
        desc = "Find Builtin",
      },
      { "<leader>i", "<leader>fi", desc = "Find Builtin", remap = true },
    },
  },
}
