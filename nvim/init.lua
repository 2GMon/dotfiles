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

  {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  },

  {"akinsho/toggleterm.nvim", config = function() require("toggleterm").setup() end},
  {"cohama/agit.vim"},

  -- statusline
  {
    'nvim-lualine/lualine.nvim',
    requires = {'nvim-tree/nvim-web-devicons'}
  },

  -- 補完
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
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    requires = {"nvim-lua/plenary.nvim", "zbirenbaum/copilot.lua",},
    build = "make tiktoken",
  },

  -- AI
  {
    "yetone/avante.nvim",
    requires = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "MeanderingProgrammer/render-markdown.nvim",
      "hrsh7th/nvim-cmp",
      "zbirenbaum/copilot.lua",
    },
    run = "make",
  },

  -- Jupyter
  {"3rd/image.nvim"},
  {
    "benlubas/molten-nvim",
    requires = "3rd/image.nvim",
    run = ":UpdateRemotePlugins<CR>",
  },
  {"goerz/jupytext.nvim",},
}

-- プラグイン自動インストール
local jetpack = require('jetpack')
for _, name in ipairs(jetpack.names()) do
  if not jetpack.tap(name) then
    jetpack.sync()
    break
  end
end

-- configuring Neovim to load user-installed Lua rocks:
local path = require "plenary.path"
local luarocks_path = path:new(vim.fn.expand(vim.fn.expand("$HOME") .. "/.luarocks"))
if luarocks_path and luarocks_path.exists then
  package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
  package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"
end

require('base')
require('appearance')
require('plugins')
require('lsp')

local my_filetype = require('filetype')
vim.api.nvim_create_augroup('vimrc_augroup', {})
vim.api.nvim_create_autocmd('FileType', {
  group = 'vimrc_augroup',
  pattern = '*',
  callback = function(args) my_filetype[args.match]() end
})
