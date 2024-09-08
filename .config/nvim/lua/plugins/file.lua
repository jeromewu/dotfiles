return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({})

      vim.keymap.set("n", "<LEADER>nt", ":Neotree toggle=true<CR>", {
        silent = true,
        desc = "Toggle Neotree",
      })
    end,
  },
  {
    "ThePrimeagen/harpoon",
    config = function()
      vim.keymap.set("n", "<LEADER>ha", ':lua require("harpoon.mark").add_file()<CR>', {
        silent = true,
        desc = "Add file",
      })
      vim.keymap.set("n", "<LEADER>hm", ':lua require("harpoon.ui").toggle_quick_menu()<CR>', {
        silent = true,
        desc = "Display added files",
      })
    end,
  },
}
