-- Linting via nvim-lint

local lint = require('lint')

lint.linters_by_ft = {
  python = { 'ruff' },
  c = { 'clangtidy' },
  cpp = { 'clangtidy' },
  markdown = { 'markdownlint' },
  yaml = { 'yamllint' },
  json = { 'jsonlint' },
  -- rust: clippy via rust-analyzer
  -- lua: lua_ls handles it
}

vim.api.nvim_create_autocmd({ 'BufWritePost', 'InsertLeave', 'BufReadPost' }, {
  group = vim.api.nvim_create_augroup('nvim-lint', { clear = true }),
  callback = function()
    lint.try_lint()
  end,
})
