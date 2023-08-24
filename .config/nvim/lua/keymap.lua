-- map leader to comma
vim.g.mapleader = ","

-- treat long lines as break lines
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- use ii as ESC
vim.keymap.set('i', 'ii', '<ESC>')

-- use ii to back to normal mode in terminal
vim.keymap.set('t', 'ii', '<C-\\><C-n>')

-- ,<cr> to remove highlighting
vim.keymap.set('n', '<leader><cr>', ':nohlsearch<cr>')

-- ,pp to toggle and untoggle paste mode on and off"
vim.keymap.set('n', '<leader>pp', ':setlocal paste!<cr>')

-- ,x to view in hex mode ,xx to return
vim.keymap.set('n', '<leader>x', ':%!xxd<cr>')
vim.keymap.set('n', '<leader>xx', ':%!xxd -r<cr>')

-- ,jq to format json file
vim.keymap.set('n', '<leader>jq', ':%!jq .<cr>')

-- ,qc to close quickfix window
vim.keymap.set('n', '<leader>qc', ':cclose<cr>')

-- tab shortcuts
vim.keymap.set('n', '<leader>tt', ':tabnew<cr>')
vim.keymap.set('n', '<leader>tc', ':tabclose<cr>')
vim.keymap.set('n', '<leader>tn', ':tabnext<cr>')
vim.keymap.set('n', '<leader>tp', ':tabprevious<cr>')
