require("blink.cmp").setup({
  keymap = {
    preset = "enter",
    ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
    ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
  },
  completion = {
    documentation = { auto_show = true },
  },
  cmdline = {
    keymap = {
      ["<CR>"] = { "hide", "fallback" },
    },
  },
  sources = {
    default = { "copilot", "lsp", "buffer", "snippets", "path"  },
    providers = {
      copilot = {
        name = "copilot",
        module = "blink-copilot",
        score_offset = 100,
        async = true,
      },
    },
  },
})
