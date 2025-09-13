require("blink.cmp").setup({
  keymap = {
    preset = "enter",
    ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
    ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
  },
  completion = {
    documentation = {
      auto_show = true,
      treesitter_highlighting = true,
      window = { border = "rounded" },
    },
    menu = {
      border = "rounded",
      draw = {
        columns = {
          { "kind_icon", "label", gap = 1 },
          { "kind", gap = 1 },
          {"source_name" },
        },
        treesitter = { "lsp" },
        components = {
          kind_icon = {
            highlight = "CmpItemKind",
          },
          label = {
            text = function(item)
              return item.label
            end,
          },
          kind = {
            text = function(item)
              return item.kind
            end,
            highlight = "CmpItemKind",
          },
          source_name = {
            text = function(item)
              return "[" .. item.source_name .. "]"
            end,
            highlight = "Comment",
          },
        },
      }
    },
    ghost_text = {
      enabled = true,
    },

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
