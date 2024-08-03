if vim.fn.has("nvim-0.10") == 0 then
  return {}
end

local function confirm()
  local menu = require("dropbar.utils.menu").get_current()
  if not menu then
    return
  end
  local cursor = vim.api.nvim_win_get_cursor(menu.win)
  local component = menu.entries[cursor[1]]:first_clickable(cursor[2])
  if component then
    menu:click_on(component)
  end
end

local function quit_curr()
  local menu = require("dropbar.utils.menu").get_current()
  if menu then
    menu:close()
  end
end

return {
  {
    "catppuccin",
    optional = true,
    opts = {
      integrations = {
        dropbar = {
          enabled = true,
          color_mode = true,
        },
      },
    },
  },
  {
    "Bekaboo/dropbar.nvim",
    opts = {
      general = {
        enable = function(buf, win)
          return not vim.api.nvim_win_get_config(win).zindex
            and vim.bo[buf].buftype == ""
            and vim.api.nvim_buf_get_name(buf) ~= ""
            and not vim.wo[win].diff
        end,
      },
      bar = {
        pick = {
          pivots = "jkl;asdfgh'iowequytrq",
        },
      },
      menu = {
        win_configs = { border = BorderStyle },
        -- When on, automatically set the cursor to the closest previous/next
        -- clickable component in the direction of cursor movement on CursorMoved
        quick_navigation = true,
        ---@type table<string, string|function|table<string, string|function>>
        keymaps = {
          ["<LeftMouse>"] = function()
            local menu = require("dropbar.utils.menu").get_current()
            if not menu then
              return
            end
            local mouse = vim.fn.getmousepos()
            if mouse.winid ~= menu.win then
              local parent_menu = require("dropbar.utils.menu").get({
                win = mouse.winid,
              })
              if parent_menu and parent_menu.sub_menu then
                parent_menu.sub_menu:close()
              end
              if vim.api.nvim_win_is_valid(mouse.winid) then
                vim.api.nvim_set_current_win(mouse.winid)
              end
              return
            end
            menu:click_at({ mouse.line, mouse.column }, nil, 1, "l")
          end,
          ["o"] = confirm,
          ["<esc>"] = quit_curr,
          ["q"] = quit_curr,
          ["h"] = quit_curr,
          ["<MouseMove>"] = function()
            local menu = require("dropbar.utils.menu").get_current()
            if not menu then
              return
            end
            local mouse = vim.fn.getmousepos()
            if mouse.winid ~= menu.win then
              return
            end
            menu:update_hover_hl({ mouse.line, mouse.column - 1 })
          end,
        },
      },
      icons = {
        kinds = {
          symbols = LazyVim.config.icons.kinds,
        },
        ui = {
          bar = {
            separator = " › ",
            extends = "…",
          },
          menu = {
            separator = " ",
            indicator = " › ",
          },
        },
      },
    },
  },
  keys = {
    {
      "<Leader>k",
      function()
        require("dropbar.api").pick()
      end,
      desc = "Pick a component (dropbar)",
    },
  },
}
