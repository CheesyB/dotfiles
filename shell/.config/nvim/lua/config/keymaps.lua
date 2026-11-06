-- Keymaps

local map = vim.keymap.set

-- Better defaults
map('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search' })
map('n', 'Q', '<nop>')

-- Window navigation
map('n', '<C-h>', '<C-w>h', { desc = 'Window left' })
map('n', '<C-j>', '<C-w>j', { desc = 'Window down' })
map('n', '<C-k>', '<C-w>k', { desc = 'Window up' })
map('n', '<C-l>', '<C-w>l', { desc = 'Window right' })

-- Resize
map('n', '<C-Up>', '<cmd>resize +2<CR>')
map('n', '<C-Down>', '<cmd>resize -2<CR>')
map('n', '<C-Left>', '<cmd>vertical resize -2<CR>')
map('n', '<C-Right>', '<cmd>vertical resize +2<CR>')

-- Move lines in visual mode
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move down' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move up' })

-- Stay in visual after indent
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Centered scroll
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Quickfix
map('n', ']q', '<cmd>cnext<CR>zz', { desc = 'Next quickfix' })
map('n', '[q', '<cmd>cprev<CR>zz', { desc = 'Prev quickfix' })

-- Diagnostics
map('n', ']d', function() vim.diagnostic.goto_next() end, { desc = 'Next diagnostic' })
map('n', '[d', function() vim.diagnostic.goto_prev() end, { desc = 'Prev diagnostic' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Diagnostic float' })

-- Buffers
map('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = 'Delete buffer' })
map('n', '[b', '<cmd>bprevious<CR>', { desc = 'Prev buffer' })
map('n', ']b', '<cmd>bnext<CR>', { desc = 'Next buffer' })

-- Built-in 0.12 LSP keymaps (just here for reference, they work by default):
-- gra  → code actions
-- grn  → rename
-- grr  → references
-- gri  → implementations
-- grt  → type definition
-- grx  → run codelens
-- gO   → document symbols
-- K    → hover
-- C-s  → signature help (insert)
