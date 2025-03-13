if vim.env.GROK_API_KEY ~= nil then
  require('avante').setup({
    provider = "grok",
    auto_suggestions_provider = "grok",
    cursor_applying_provider = nil,
    behaviour = {
      auto_suggestions = false, -- Experimental stage
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = false,
      minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
      enable_token_counting = true, -- Whether to enable token counting. Default to true.
      enable_cursor_planning_mode = false, -- Whether to enable Cursor Planning Mode. Default to false.
    },
    vendors = {
      ["grok"] = {
        __inherited_from = "openai",
        endpoint = "https://api.x.ai/v1",
        api_key_name = "GROK_API_KEY",
        model = "grok-2-1212",
        disable_tools = true,
      },
    },
  })
end
