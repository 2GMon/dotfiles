require("toggleterm").setup{
  size = 100,
  open_mapping = [[<leader>t]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = false,
  persist_size = false,
  direction = 'float',
  close_on_exit = true,
}
local trim_spaces = true
vim.keymap.set("v", "<space>sl", function()
    require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
end)
vim.keymap.set("v", "<space>svl", function()
    require("toggleterm").send_lines_to_terminal("visual_lines", trim_spaces, { args = vim.v.count })
end)
vim.keymap.set("v", "<space>svs", function()
    require("toggleterm").send_lines_to_terminal("visual_selection", trim_spaces, { args = vim.v.count })
end)

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', 'JK', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-w>h', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-w>j', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-w>k', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-w>l', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w><C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal  = require('toggleterm.terminal').Terminal

-- lazygit の起動
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  count = 99,
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd("startinsert!")
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

-- gemini-cliの起動
local gemini = Terminal:new({
  cmd = "gemini",
  dir = "git_dir",
  count = 100,
  direction="vertical",
})

function _gemini_toggle()
  gemini:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>gc", "<cmd>lua _gemini_toggle()<CR>", {noremap = true, silent = true})
