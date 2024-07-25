-- fuzzy finder
return {
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
}
