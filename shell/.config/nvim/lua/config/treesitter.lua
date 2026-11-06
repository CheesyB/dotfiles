-- Treesitter
--
-- 0.12 reality:
--   Highlighting: built-in, on by default.
--   Folds: vim.treesitter.foldexpr() (set in options.lua).
--   Incremental selection: built-in (v → an/in/]n/[n).
--   Bundled parsers: c, lua, vim, vimdoc, query, markdown, markdown_inline.
--   Everything else needs installing → tree-sitter-manager.nvim handles it.
--
-- Requires: `tree-sitter` CLI installed (brew install tree-sitter)

require('tree-sitter-manager').setup({
  ensure_installed = {
    'rust',
    'cpp',
    'python',
    'json',
    'jsonc',
    'yaml',
    'toml',
    'bash',
    'regex',
    'diff',
    'gitcommit',
  },
  auto_install = true,
  -- Don't touch parsers bundled with nvim
  noauto_install = { 'c', 'lua', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
  highlight = true,
  border = 'rounded',
})
