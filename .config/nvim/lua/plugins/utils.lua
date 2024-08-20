return {
  {
    "alexghergh/nvim-tmux-navigation",
    config = function()
      local nvim_tmux_nav = require("nvim-tmux-navigation")

      nvim_tmux_nav.setup({
        disable_when_zoomed = true, -- defaults to false
      })

      vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
      vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
      vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
      vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
      vim.keymap.set("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
      vim.keymap.set("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
    end,
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
