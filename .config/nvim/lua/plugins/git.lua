return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

      -- display hunk in a window
			vim.keymap.set("n", "<LEADER>gp", ":Gitsigns preview_hunk<CR>")
		end,
	},
}
