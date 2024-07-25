return {
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
}
