-- Formatting via conform.nvim

require('conform').setup({
  formatters_by_ft = {
    rust = { 'rustfmt' },
    c = { 'clang-format' },
    cpp = { 'clang-format' },
    python = { 'ruff_format' },
    lua = { 'stylua' },
    json = { 'prettier' },
    jsonc = { 'prettier' },
    yaml = { 'prettier' },
    markdown = { 'prettier' },
  },
  format_on_save = {
    timeout_ms = 2000,
    lsp_format = 'fallback',
  },
})

vim.keymap.set({ 'n', 'v' }, '<leader>cf', function()
  require('conform').format({ async = true, lsp_format = 'fallback' })
end, { desc = 'Format' })
