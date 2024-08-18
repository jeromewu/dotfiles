return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()

      vim.keymap.set("n", "<LEADER>gb", ":Gitsigns toggle_current_line_blame<CR>", {
        silent = true,
        desc = "Toggle blame",
      })
      vim.keymap.set("n", "<LEADER>hh", ":Gitsigns preview_hunk<CR>", {
        silent = true,
        desc = "Display hunk in a window",
      })
      vim.keymap.set("n", "<LEADER>hn", ":Gitsigns next_hunk<CR>", {
        silent = true,
        desc = "Display next hunk",
      })
      vim.keymap.set("n", "<LEADER>hp", ":Gitsigns prev_hunk<CR>", {
        silent = true,
        desc = "Display previous hunk",
      })
    end,
  },
  {
    "sindrets/diffview.nvim",
    config = function()
      vim.keymap.set("n", "<LEADER>do", ":DiffviewOpen<CR>", {
        silent = true,
        desc = "Open Diffview",
      })
      vim.keymap.set("n", "<LEADER>dc", ":DiffviewClose<CR>", {
        silent = true,
        desc = "Close Diffview",
      })
    end,
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("neogit").setup()

      vim.keymap.set("n", "<LEADER>gg", ":Neogit<CR>", {
        silent = true,
        desc = "Open Neogit",
      })
    end,
  },
}
