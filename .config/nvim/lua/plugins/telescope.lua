-- fuzzy finder
return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<LEADER>ff', builtin.find_files, {})
    vim.keymap.set('n', '<LEADER>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<LEADER>fb', builtin.buffers, {})
    vim.keymap.set('n', '<LEADER>fh', builtin.help_tags, {})
  end
}
