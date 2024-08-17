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
			-- add `capabilities` to each lspconfig.*.setup to perform autocompletion
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
      lspconfig.typos_lsp.setup({
        capabilities = capabilities,
      })

			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
				desc = "Display definition",
			})
			vim.keymap.set({ "n", "v" }, "<LEADER>ca", vim.lsp.buf.code_action, {
				desc = "Display code actions",
			})
		end,
	},
	{
		-- wrap cli tools as lsp server, ex. eslint, rubocop
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					-- @ref: https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
					null_ls.builtins.completion.spell,
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.code_actions.gitsigns,
				},
			})

			vim.keymap.set("n", "<LEADER>cf", vim.lsp.buf.format, {
				desc = "Format current buffer",
			})
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
				ensure_installed = { "stylua", "typos-lsp" },
			})
		end,
	},
}
