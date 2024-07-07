-- treat long lines as break lines
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- use ii as ESC
vim.keymap.set('i', 'ii', '<ESC>')

-- use ii to back to normal mode in terminal
vim.keymap.set('t', 'ii', '<C-\\><C-n>')

-- use ,<CR> to disable hlsearch
vim.keymap.set('n', '<LEADER><CR>', ':nohlsearch<CR>', { silent = true })
