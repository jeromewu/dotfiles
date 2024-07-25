return {
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	-- key map documentation
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
				{ "<LEADER>t", group = "Tab" },
				{ "<LEADER>h", group = "Hunk" },
				{ "<LEADER>c", group = "Code" },
				{ "<LEADER>f", group = "Find" },
				{ "<LEADER>n", group = "NeoTree/Neorg" },
				{ "<LEADER>g", group = "Git" },
				{ "<LEADER>d", group = "Diffview" },
				{ "<LEADER>x", group = "Diagnostics" },
			})
		end,
	},
	-- split & join
	{
		"Wansmer/treesj",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesj").setup({
				use_default_keymaps = false,
			})

			vim.keymap.set("n", "<LEADER>m", ":TSJToggle<CR>", {
				silent = true,
				desc = "Toggle node under cursor",
			})
			vim.keymap.set("n", "<LEADER>s", ":TSJSplit<CR>", {
				silent = true,
				desc = "Split node under cursor",
			})
			vim.keymap.set("n", "<LEADER>j", ":TSJJoin<CR>", {
				silent = true,
				desc = "Join node under cursor",
			})
		end,
	},
	-- surround selections
	-- The three "core" operations of add/delete/change can be done with
  -- the keymaps ys{motion}{char}, ds{char}, and cs{target}{replacement}
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
}
