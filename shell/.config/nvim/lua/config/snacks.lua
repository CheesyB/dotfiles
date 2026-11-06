-- snacks.nvim — replaces telescope, gitsigns, nvim-notify, toggleterm, indent-blankline

require('snacks').setup({
  picker = { enabled = true },
  git = { enabled = true },
  notifier = { enabled = true },
  lazygit = { enabled = true },
  dashboard = { enabled = false },
  indent = { enabled = true },
  scroll = { enabled = true },
  statuscolumn = { enabled = true },
  words = { enabled = true },
})

local map = vim.keymap.set

-- Picker
map('n', '<leader>ff', function() Snacks.picker.files() end, { desc = 'Find files' })
map('n', '<leader>fg', function() Snacks.picker.grep() end, { desc = 'Live grep' })
map('n', '<leader>fb', function() Snacks.picker.buffers() end, { desc = 'Buffers' })
map('n', '<leader>fh', function() Snacks.picker.help() end, { desc = 'Help' })
map('n', '<leader>fr', function() Snacks.picker.recent() end, { desc = 'Recent files' })
map('n', '<leader>fs', function() Snacks.picker.lsp_symbols() end, { desc = 'Symbols' })
map('n', '<leader>fd', function() Snacks.picker.diagnostics() end, { desc = 'Diagnostics' })
map('n', '<leader>fc', function() Snacks.picker.commands() end, { desc = 'Commands' })
map('n', '<leader>fk', function() Snacks.picker.keymaps() end, { desc = 'Keymaps' })
map('n', '<leader>f/', function() Snacks.picker.grep_buffers() end, { desc = 'Grep buffers' })

-- Git
map('n', '<leader>gg', function() Snacks.lazygit() end, { desc = 'Lazygit' })
map('n', '<leader>gl', function() Snacks.git.log() end, { desc = 'Git log' })
map('n', '<leader>gb', function() Snacks.git.blame_line() end, { desc = 'Blame line' })

-- Notifications
map('n', '<leader>nn', function() Snacks.notifier.show_history() end, { desc = 'Notifications' })
