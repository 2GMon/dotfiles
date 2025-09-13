require("copilot").setup {
  suggestion = { enabled = false },
  panel = { enabled = false },
  should_attach = function(_, bufname)
    -- ファイル名に"env"という文字列が含まれていれば対象外にする
    if string.match(bufname, "env") then
      return false
    end

    return true
  end
}
