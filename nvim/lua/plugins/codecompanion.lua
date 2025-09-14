local fmt = string.format

local constants = {
  LLM_ROLE = "llm",
  USER_ROLE = "user",
  SYSTEM_ROLE = "system",
}

require("codecompanion").setup({
  language = "Japanese",
  display = {
    chat = {
      window = {
        position = "right",
      },
      child_window = {
        width = vim.o.columns - 10,
        height = vim.o.lines - 10,
        opts = {
          wrap = false,
          number = false,
          relativenumber = false,
        },
      },
      auto_scroll = false,
      show_settings = true,
    },
    diff = {
      provider = "split",
    },
  },
  strategies = {
    chat = {
      adapter = "gemini_cli",
    },
    inline = {
      name = "copilot",
      model = "gpt-4.1",
      keymaps = {
        accept_change = {
          modes = { n = "<leader>da" },
        },
        reject_change = {
          modes = { n = "<leader>dr" },
        },
        always_accept = {
          modes = { n = "<leader>dy" },
        },
      },
    },
  },
  extensions = {
    mcphub = {
      callback = "mcphub.extensions.codecompanion",
      opts = {
        make_vars = true,
        make_slash_commands = true,
        show_result_in_chat = true
      }
    }
  }
})
vim.keymap.set({ "n", "v" }, "<leader>cca", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<leader>ccc", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>cga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
