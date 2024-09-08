return {
  {
    'mrjones2014/smart-splits.nvim',
    config = function()
      require("smart-splits").setup({
        mux = {
          type = "wezterm",
        }
      })
      vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
      vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
      vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
      vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)
      -- moving between splits
      vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
      vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
      vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
      vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
      vim.keymap.set('n', '<C-\\>', require('smart-splits').move_cursor_previous)
      -- swapping buffers between windows
      vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
      vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
      vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
      vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)
    end
  },
  -- keymap documentation
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.add({
        {
          "<LEADER>?",
          function()
            require("which-key").show({ global = false })
          end,
          desc = "Buffer Local Keymaps (which-key)",
        },
        { "<LEADER>c", group = "Code" },
        { "<LEADER>d", group = "Diffview" },
        { "<LEADER>f", group = "Find" },
        { "<LEADER>g", group = "Git" },
        { "<LEADER>h", group = "Hunk/Harpoon" },
        { "<LEADER>n", group = "NeoTree/Neorg" },
        { "<LEADER>t", group = "Tab" },
        { "<LEADER>x", group = "Diagnostics" },
        { "<LEADER>j", group = "Journal" },
      })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<LEADER>ff", builtin.find_files, {
        desc = "Find by file names",
      })
      vim.keymap.set("n", "<LEADER>fg", builtin.live_grep, {
        desc = "Find in files",
      })
      vim.keymap.set("n", "<LEADER>fb", builtin.buffers, {
        desc = "Find in buffers",
      })
      vim.keymap.set("n", "<LEADER>fh", builtin.help_tags, {
        desc = "Find in help docs",
      })
    end,
  },
  -- return to the last edit position when re-opening the file
  {
    "farmergreg/vim-lastplace",
  },
}
