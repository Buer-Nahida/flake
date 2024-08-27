return {
  "luozhiya/fittencode.nvim",
  opts = {
    chat = { highlight_conversation_at_cursor = true },
    use_default_keymaps = false,
    keymaps = {
      inline = {
        ["<A-TAB>"] = "accept_all_suggestions",
        ["<A-S-j>"] = "accept_line",
        ["<A-S-l>"] = "accept_word",
        ["<A-S-k>"] = "revoke_line",
        ["<A-S-h>"] = "revoke_word",
        ["<A-\\>"] = "triggering_completion",
      },
    },
  },
}
