require("image").setup()

vim.g.molten_image_provider = "image.nvim"
vim.g.molten_output_win_max_height = 500

require("jupytext").setup({
  jupytext = 'jupytext',
  format = "markdown",
  update = true,
  filetype = require("jupytext").get_filetype,
  sync_patterns = { '*.md', '*.py', '*.jl', '*.R', '*.Rmd', '*.qmd' },
  autosync = true,
  handle_url_schemes = true,
})

function FindNextLineWithText(pattern)
  local currentLine = vim.fn.line('.')
  local totalLines = vim.fn.line('$')

  for line = currentLine + 1, totalLines do
    local lineText = vim.api.nvim_buf_get_lines(0, line - 1, line, false)[1]
    if lineText:find(pattern) then
      return line
    end
  end

  return nil
end

function FindPrevLineWithText(pattern, start_buffer)
  start_buffer = start_buffer or 0
  local currentLine = vim.fn.line('.')

  for line = currentLine + start_buffer , 1, -1 do
    local lineText = vim.api.nvim_buf_get_lines(0, line - 1, line, false)[1]
    if lineText:find(pattern) then
      return line
    end
  end

  return nil
end

function MoltenEvaluateCell()
  local pattern = "```"
  local startLine = FindPrevLineWithText(pattern)
  if startLine == nil then
    startLine = 0
  else
    startLine = startLine + 1
  end
  local endLine = FindNextLineWithText(pattern)
  if endLine == nil then
    endLine = vim.fn.line('$')
  else
    endLine = endLine - 1
  end


  vim.fn.MoltenEvaluateRange(startLine, endLine)
end

function MoveNextCell()
  local pattern = "```.+"
  local line = FindNextLineWithText(pattern)
  if line == nil then
    line = vim.fn.line('$')
  elseif lien ~= vim.fn.line('$') then
    line = line + 1
  end
  vim.api.nvim_win_set_cursor(0, { line, 0 })
end

function MovePrevCell()
  local pattern = "```.+"
  local line = FindPrevLineWithText(pattern, -2)
  if line == nil then
    line = 1
  end

  if line > 0 then
    vim.api.nvim_win_set_cursor(0, { line + 1, 0 })
  end
end

vim.keymap.set("n", "]h", function() MoveNextCell() end, { noremap = true, silent = true })
vim.keymap.set("n", "[h", function() MovePrevCell() end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>jr", function() MoltenEvaluateCell() end, { noremap = true, silent = true })
