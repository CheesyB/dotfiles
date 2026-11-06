-- AI Code Agents via codecompanion.nvim
--
-- Supports: Anthropic, OpenAI, Copilot, Gemini, Ollama, and more.
-- Set env: ANTHROPIC_API_KEY or OPENAI_API_KEY

require('codecompanion').setup({
  adapters = {
    anthropic = function()
      return require('codecompanion.adapters').extend('anthropic', {
        schema = {
          model = { default = 'claude-sonnet-4-20250514' },
        },
      })
    end,
  },
  strategies = {
    chat = { adapter = 'anthropic' },
    inline = { adapter = 'anthropic' },
    agent = { adapter = 'anthropic' },
  },
  display = {
    chat = {
      window = { layout = 'vertical', width = 0.4 },
    },
  },
})

local map = vim.keymap.set
map('n', '<leader>aa', '<cmd>CodeCompanionChat Toggle<CR>', { desc = 'AI: Chat' })
map('v', '<leader>aa', '<cmd>CodeCompanionChat Toggle<CR>', { desc = 'AI: Chat' })
map('v', '<leader>ap', '<cmd>CodeCompanionChat Add<CR>', { desc = 'AI: Add to chat' })
map('n', '<leader>ac', '<cmd>CodeCompanionActions<CR>', { desc = 'AI: Actions' })
map('v', '<leader>ac', '<cmd>CodeCompanionActions<CR>', { desc = 'AI: Actions' })
map('v', 'ga', '<cmd>CodeCompanionChat Add<CR>', { desc = 'AI: Add selection' })

vim.cmd.cabbrev('cc', 'CodeCompanion')
