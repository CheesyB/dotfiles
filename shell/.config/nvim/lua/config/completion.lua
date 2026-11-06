-- Native completion (0.12 built-in)
-- No nvim-cmp needed. Neovim handles it.

vim.o.autocomplete = true

local map = vim.keymap.set

map('i', '<C-Space>', '<C-x><C-o>', { desc = 'Trigger omni completion' })

map('i', '<CR>', function()
  return vim.fn.pumvisible() ~= 0 and '<C-y>' or '<CR>'
end, { expr = true, desc = 'Accept completion' })

map('i', '<C-e>', function()
  return vim.fn.pumvisible() ~= 0 and '<C-e>' or '<End>'
end, { expr = true, desc = 'Dismiss completion' })

map('i', '<Tab>', function()
  if vim.fn.pumvisible() ~= 0 then
    return '<C-n>'
  elseif vim.snippet and vim.snippet.active({ direction = 1 }) then
    return '<cmd>lua vim.snippet.jump(1)<CR>'
  else
    return '<Tab>'
  end
end, { expr = true, desc = 'Next item / snippet jump' })

map('i', '<S-Tab>', function()
  if vim.fn.pumvisible() ~= 0 then
    return '<C-p>'
  elseif vim.snippet and vim.snippet.active({ direction = -1 }) then
    return '<cmd>lua vim.snippet.jump(-1)<CR>'
  else
    return '<S-Tab>'
  end
end, { expr = true, desc = 'Prev item / snippet back' })
