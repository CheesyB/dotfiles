-- Autocommands

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight on yank
autocmd('TextYankPost', {
  group = augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank({ timeout = 200 })
  end,
})

-- Restore cursor position
autocmd('BufReadPost', {
  group = augroup('restore-cursor', { clear = true }),
  callback = function(ev)
    local mark = vim.api.nvim_buf_get_mark(ev.buf, '"')
    local lines = vim.api.nvim_buf_line_count(ev.buf)
    if mark[1] > 0 and mark[1] <= lines then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Auto-resize splits
autocmd('VimResized', {
  group = augroup('auto-resize', { clear = true }),
  command = 'tabdo wincmd =',
})

-- Strip trailing whitespace
autocmd('BufWritePre', {
  group = augroup('strip-ws', { clear = true }),
  callback = function()
    local save = vim.fn.winsaveview()
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.winrestview(save)
  end,
})

-- Close certain filetypes with q
autocmd('FileType', {
  group = augroup('close-with-q', { clear = true }),
  pattern = { 'help', 'man', 'qf', 'checkhealth', 'notify', 'diff' },
  callback = function(ev)
    vim.keymap.set('n', 'q', '<cmd>close<CR>', { buffer = ev.buf, silent = true })
  end,
})

-- Markdown settings
autocmd('FileType', {
  group = augroup('markdown-opts', { clear = true }),
  pattern = 'markdown',
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
    vim.opt_local.conceallevel = 2
  end,
})
