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
  {"akinsho/toggleterm.nvim", config = function() require("toggleterm").setup() end},
  {'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim'},
  {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
  {"nvim-telescope/telescope-ui-select.nvim"},
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
  -- {"nvim-treesitter/nvim-treesitter-context",}, -- コンテキストを上部に表示

  {"cohama/agit.vim"},

  {"MeanderingProgrammer/render-markdown.nvim",
    config = function()
      require("render-markdown").setup({
        file_types = { "markdown", "codecompanion" },
        completions = { lsp = { enabled = true } },
      })
    end,
  },
  {"HakonHarnes/img-clip.nvim",
    config = function()
      require("img-clip").setup({
        filetypes = {
          codecompanion = {
            prompt_for_file_name = false,
            template = "[Image]($FILE_PATH)",
            use_absolute_path = true,
          },
        },
      })
    end,
  },
  {"nvim-mini/mini.diff",
    config = function()
      require("mini.diff").setup()
    end,
  },

  -- statusline
  {
    'nvim-lualine/lualine.nvim',
    requires = {'nvim-tree/nvim-web-devicons'}
  },

  -- 補完
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require('plugins.copilot')
    end
  },
  {"saghen/blink.cmp",
    tag = "v1.6.0",
    requires = {
      "rafamadriz/friendly-snippets",
      "fang2hou/blink-copilot",
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    requires = {"nvim-lua/plenary.nvim", "zbirenbaum/copilot.lua",},
    build = "make tiktoken",
  },

  {"shellRaining/hlchunk.nvim",
    config = function()
      require("hlchunk").setup({
        chunk = { enable = true },
        indent = { enable = true },
      })
    end,
  }, -- コードブロックのハイライト
  {"Bekaboo/dropbar.nvim",}, -- パンくずリスト
  {"brianhuster/unnest.nvim"},

  -- AI
  {"ravitemer/mcphub.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    build = "npm install -g mcp-hub@latest"
  },
  {"olimorris/codecompanion.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "ravitemer/mcphub.nvim",
      "MeanderingProgrammer/render-markdown.nvim",
      "nvim-mini/mini.diff",
      "HakonHarnes/img-clip.nvim",
    }
  }
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
require('autocmd')
