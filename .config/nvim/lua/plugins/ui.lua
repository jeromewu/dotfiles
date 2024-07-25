return {
  -- color theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        integrations = {
          neotree = true,
          noice = true,
          diffview = true,
          mason = true,
          notify = true,
          harpoon = true,
          nvim_surround = true,
          which_key = true,
        },
      })

      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup({
        scope = {
          show_start = false,
          show_end = false,
        },
      })
    end,
  },
}
