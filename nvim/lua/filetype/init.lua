local M = {}

M.lua = function()
  vim.bo.expandtab = true
  vim.bo.shiftwidth = 2
  vim.bo.softtabstop = 2
  vim.bo.tabstop = 2
end

M.typescript = function()
  vim.bo.expandtab = true
  vim.bo.shiftwidth = 2
  vim.bo.softtabstop = 2
  vim.bo.tabstop = 2
end

return setmetatable(M, {
  __index = function()
    return function()
      print('Unexpected filetype!')
    end
  end
})
