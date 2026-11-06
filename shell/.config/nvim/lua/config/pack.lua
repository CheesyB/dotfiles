-- Plugin management via vim.pack (native 0.12)
--
-- 6 plugins total. That's it.
--   snacks.nvim     → picker, git signs, notifications, terminal, indent, dashboard
--   conform.nvim    → formatting via external tools
--   nvim-lint       → async linting where LSPs fall short
--   codecompanion   → AI code agents (Claude, GPT, Copilot, Ollama)
--   tree-sitter-manager → treesitter parser installer (standalone, no nvim-treesitter dep)
--   gruvbox-material → colorscheme

vim.pack.add({
  'https://github.com/sainnhe/gruvbox-material',
  'https://github.com/folke/snacks.nvim',
  'https://github.com/stevearc/conform.nvim',
  'https://github.com/mfussenegger/nvim-lint',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/olimorris/codecompanion.nvim',
  'https://github.com/romus204/tree-sitter-manager.nvim',
})

vim.cmd.colorscheme('gruvbox-material')
