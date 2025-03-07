-- vim-jetpackの自動インストール
local jetpackfile = vim.fn.stdpath('data') .. '/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
local jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"
if vim.fn.filereadable(jetpackfile) == 0 then
  vim.fn.system(string.format('curl -fsSLo %s --create-dirs %s', jetpackfile, jetpackurl))
end

-- プラグイン一覧
vim.cmd('packadd vim-jetpack')
require('jetpack.paq') {
  {'tani/vim-jetpack'},
  {'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim'},
  {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
  {'pogyomo/submode.nvim'},
  {"neovim/nvim-lspconfig"},
  {"williamboman/mason.nvim"},
  {"williamboman/mason-lspconfig.nvim"},

  {"hrsh7th/nvim-cmp"},
  {"hrsh7th/cmp-nvim-lsp"},
  {"hrsh7th/cmp-buffer"},
  {"hrsh7th/cmp-path"},
  {"hrsh7th/cmp-cmdline"},
  {"hrsh7th/cmp-vsnip"},
  {"hrsh7th/vim-vsnip"},
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end
  },
  {
    "zbirenbaum/copilot-cmp",
    requires = "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = function () require("copilot_cmp").setup() end
  },
}

-- プラグイン自動インストール
local jetpack = require('jetpack')
for _, name in ipairs(jetpack.names()) do
  if not jetpack.tap(name) then
    jetpack.sync()
    break
  end
end

require('base')
require('appearance')
require('plugins')
require('lsp')
