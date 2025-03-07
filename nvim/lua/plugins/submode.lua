local function movetab(n)
  local current_tab = vim.fn.tabpagenr()
  local new_position = current_tab - 1 + n
  local number_of_tabs = vim.fn.tabpagenr("$")

  if new_position < 0 then
    vim.cmd("tabmove $")
  elseif new_position >= number_of_tabs then
    vim.cmd("tabmove 0")
  elseif n == 1 then
    vim.cmd("+tabmove")
  else
    vim.cmd("-tabmove")
  end
end

local submode = require("submode")

submode.create("TabChange1", {
    mode = "n",
    enter = "gt",
    leave = { "q", "<ESC>", },
    default = function(register)
        register("t", "gt")
        register("T", "gT")
    end,
})

submode.create("TabChange2", {
    mode = "n",
    enter = "gT",
    leave = { "q", "<ESC>", },
    default = function(register)
        register("t", "gt")
        register("T", "gT")
    end,
})

submode.create("TabMove1", {
    mode = "n",
    enter = "gl",
    leave = { "q", "<ESC>", },
    default = function(register)
        register("l", function() movetab(1) end)
        register("L", function() movetab(-1) end)
    end,
})

submode.create("TabMove2", {
    mode = "n",
    enter = "gL",
    leave = { "q", "<ESC>", },
    default = function(register)
        register("l", function() movetab(1) end)
        register("L", function() movetab(-1) end)
    end,
})
