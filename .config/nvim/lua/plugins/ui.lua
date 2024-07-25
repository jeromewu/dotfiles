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
        },
      })

      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup()
    end,
  },
}
