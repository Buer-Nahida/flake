return {
  "kawre/leetcode.nvim",
  cmd = "Leet",
  build = ":TSUpdate html",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim", -- telescope requires
    "MunifTanjim/nui.nvim",
    -- optional
    "nvim-treesitter/nvim-treesitter",
    "rcarriga/nvim-notify",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    arg = "",
    cn = { enabled = true },
    image_support = true,
    lang = "cpp",
    keys = {
      toggle = "q",
      confirm = { "<CR>", "o" },

      reset_testcases = "r",
      use_testcase = "U",
      focus_testcases = "H",
      focus_result = "L",
    },
    injector = {
      cpp = {
        before = { "#include <bits/stdc++.h>", "using namespace std;" },
        after = "int main() {}",
      },
    },
  },
}
