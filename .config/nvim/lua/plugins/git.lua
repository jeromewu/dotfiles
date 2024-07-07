return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			-- display hunk in a window
			vim.keymap.set("n", "<LEADER>gp", ":Gitsigns preview_hunk<CR>", { silent = true })
			-- toggle blame
			vim.keymap.set("n", "<LEADER>gb", ":Gitsigns toggle_current_line_blame<CR>", { silent = true })
			-- display next hunk
			vim.keymap.set("n", "<LEADER>hn", ":Gitsigns next_hunk<CR>", { silent = true })
			-- display previous hunk
			vim.keymap.set("n", "<LEADER>hp", ":Gitsigns prev_hunk<CR>", { silent = true })
		end,
	},
	{
		"sindrets/diffview.nvim",
	},
}
