require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash", "c", "cmake", "cpp", "css", "csv", "diff", "dockerfile",
    "editorconfig", "git_config", "git_rebase", "gitattributes",
    "gitcommit", "gitignore", "go", "gomod", "gosum", "gowork",
    "html", "ini", "javascript", "jq", "json", "json5", "jsonc",
    "lua", "luadoc", "make", "markdown", "markdown_inline",
    "meson", "nginx", "passwd", "perl", "php", "phpdoc", "printf",
    "python", "regex", "ruby", "rust", "scala", "scss", "slim",
    "solidity", "sql", "terraform", "tmux", "toml", "tsv",
    "typescript", "vim", "vimdoc", "vue", "xml", "yaml"
  },
  sync_install = false,
  highlight = {
    enable = true,
    disable = {}
  },
  indent = {
    enable = true,
  },
}
