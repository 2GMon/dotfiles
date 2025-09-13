require("CopilotChat").setup({
  language = "Japanese",
  show_help = "yes",
  prompts = {
    Explain = {
      mapping = '<leader>ce',
      description = "コードの説明をお願いする",
    },
    Review = {
      mapping = '<leader>cr',
      description = "コードのレビューをお願いする",
    },
    Fix = {
      mapping = '<leader>cf',
      description = "コードの修正をお願いする",
    },
    Optimize = {
      mapping = '<leader>co',
      description = "コードの最適化をお願いする",
    },
    Docs = {
      mapping = '<leader>cd',
      description = "コードのドキュメント作成をお願いする",
    },
    Tests = {
      mapping = '<leader>ct',
      description = "テストコード作成をお願いする",
    },
    Commit = {
      mapping = '<leader>cco',
      description = "コミットメッセージの作成をお願いする",
      selection = require('CopilotChat.select').gitdiff,
    },
    CommitStaged = {
      prompt =
      'ステージ済みの変更に対するコミットメッセージを日本語で記述してください。',
      mapping = '<leader>cs',
      description = "ステージ済みのコミットメッセージの作成をお願いする",
      selection = function(source)
        return require('CopilotChat.select').gitdiff(source, true)
      end,
    },
  },
})
vim.api.nvim_set_keymap("n", "<leader>cct", "<cmd>CopilotChatToggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ccp", "<cmd>CopilotChatPrompts<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ccm", "<cmd>CopilotChatModels<cr>", { noremap = true, silent = true })
