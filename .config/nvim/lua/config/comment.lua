require('Comment').setup{
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
}

vim.keymap.set('v', '<leader>cc', '<Plug>(comment_toggle_linewise_visual)')
vim.keymap.set('v', '<leader>cb', '<Plug>(comment_toggle_blockwise_visual)')
vim.keymap.set('n', '<leader>cc', '<Plug>(comment_toggle_linewise_current)')
vim.keymap.set('n', '<leader>cb', '<Plug>(comment_toggle_blockwise_current)')
