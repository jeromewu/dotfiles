-- note taking plugin
return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim" },
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.journal"] = {
            config = {
              workspace = "notes",
            }
          },
          ["core.completion"] = {
            config = {
              engine = "nvim-cmp",
            },
          },
          ["core.integrations.nvim-cmp"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/notes",
              },
            },
          },
        },
      })

      vim.keymap.set("n", "<LEADER>no", ":Neorg workspace notes<CR>", {
        silent = true,
        desc = "Open note",
      })
      vim.keymap.set("n", "<LEADER>jj", ":Neorg journal today<CR>", {
        silent = true,
        desc = "Open journal (today)",
      })
      vim.keymap.set("n", "<LEADER>jy", ":Neorg journal yesterday<CR>", {
        silent = true,
        desc = "Open journal (yesterday)",
      })
      vim.keymap.set("n", "<LEADER>jt", ":Neorg journal tomorrow<CR>", {
        silent = true,
        desc = "Open journal (tomorrow)",
      })
    end,
  },
}
