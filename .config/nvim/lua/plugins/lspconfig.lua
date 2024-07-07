-- lsp config
return {
	{
		-- package manager for lsp, formatter and more
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})

      -- display defnintion
			vim.keymap.set("n", "gd", vim.lsp.buf.definition)
      -- display code actions
			vim.keymap.set({ "n", "v" }, "<LEADER>ca", vim.lsp.buf.code_action)
		end,
	},
	{
		-- wrap cli tools as lsp server, ex. eslint, rubocop
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.completion.spell,
				},
			})

      -- format current buffer
			vim.keymap.set("n", "<LEADER>gf", vim.lsp.buf.format)
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = { "stylua" },
			})
		end,
	},
}
