local wk = require("which-key")

return {
  "mg979/vim-visual-multi",
  lazy = false,
  branch = "master",
  init = function()
    vim.g.VM_default_mappings = 0
    vim.g.VM_mouse_mappings = 1
    vim.g.VM_maps = {
      ["Find Under"] = "<C-n>",
      ["Find Subword Under"] = "<C-n>",
      ["Select Cursor Down"] = "<M-C-S-j>",
      ["Select Cursor Up"] = "<M-C-S-k>",
      ["Select All"] = "<leader>vA",
      ["start Regex Search"] = "<leader>v/",
      ["Add Cursor Down"] = "<C-S-j>",
      ["Add Cursor Up"] = "<C-S-k>",
      ["Add Cursor At Pos"] = "<leader>va",
      ["Visual Regex"] = "<leader>v/",
      ["Visual All"] = "<leader>vA",
      ["Visual Add"] = "<leader>va",
      ["Visual Find"] = "<leader>vf",
      ["Visual Cursors"] = "<leader>vc",
    }
    vim.g.VM_Mono_hl = "FlashLabel"
    vim.g.VM_Extend_hl = "FlashCurrent"
    vim.g.VM_Cursor_hl = "FlashLabel"
    vim.g.VM_Insert_hl = "FlashCurrent"
    wk.add({ "<leader>v", group = "+visual-multi", mode = { "n", "x" } })
  end,
}
