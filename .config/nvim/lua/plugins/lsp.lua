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
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		-- snippet engine written in lua
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			-- a collection of snippets
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()

			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}