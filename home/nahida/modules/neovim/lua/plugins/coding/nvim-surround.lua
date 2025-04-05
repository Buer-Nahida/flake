return {
  "kylechui/nvim-surround",
  lazy = true,
  opts = {
    keymaps = {
      insert = false,
      insert_line = false,
      normal = ";a",
      normal_cur = ";a<leader>",
      normal_line = ";;a",
      normal_cur_line = ";;a<leader>",
      visual = ";a",
      visual_line = ";;a",
      delete = ";d",
      change = ";c",
      change_line = ";;c",
    },
  },
  keys = function(_, keys)
    -- Populate the keys based on the user's options
    local plugin = require("lazy.core.config").spec.plugins["nvim-surround"]
    local k = require("lazy.core.plugin").values(plugin, "opts", false).keymaps
    return vim.list_extend(
      vim.tbl_filter(function(m)
        return m[1] and #m[1] > 0
      end, {
        -- stylua: ignore start
        { k.insert,          desc = "Add surrounding",             mode = "i" },
        { k.insert_line,     desc = "Add surrounding on new line", mode = "i" },
        { k.normal,          desc = "Add surrounding" },
        { k.normal_cur,      desc = "Current line" },
        { k.normal_line,     desc = "Add surrounding on new line" },
        { k.normal_cur_line, desc = "Current line" },
        { k.visual,          desc = "Add surrounding",             mode = "x" },
        { k.visual_line,     desc = "Add surrounding on new line", mode = "x" },
        { k.delete,          desc = "Delete surrounding" },
        { k.change,          desc = "Change surrounding" },
        { k.change_line,     desc = "Change surrounding on new line" },
        -- stylua: ignore end
      }),
      keys
    )
  end,
}
