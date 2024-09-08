-- syntax highlight
local parsers = {
  "lua",
  "norg",
  "bash",
}
-- language servers
local lang_server = {
  natives = {
    "lua_ls",
    "typos_lsp",
    "bashls",
  },
  native_config = function()
    -- add `capabilities` to each lspconfig.*.setup to perform autocompletion
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require("lspconfig")

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
    })
    lspconfig.typos_lsp.setup({
      capabilities = capabilities,
    })
    lspconfig.bashls.setup({
      capabilities = capabilities,
    })

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
      desc = "Display definition",
    })
    vim.keymap.set({ "n", "v" }, "<LEADER>ca", vim.lsp.buf.code_action, {
      desc = "Display code actions",
    })
  end,
  cli_tool_config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- @ref: https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
        null_ls.builtins.code_actions.gitsigns,
      },
    })

    vim.keymap.set("n", "<LEADER>cf", vim.lsp.buf.format, {
      desc = "Format current buffer",
    })
  end,
}

return {
  -- syntax highlight
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = parsers,
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  -- package manager for lsp, formatter and more
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = lang_server.natives,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = lang_server.native_config,
  },
  {
    -- wrap cli tools as lsp server, ex. eslint, rubocop
    "nvimtools/none-ls.nvim",
    config = lang_server.cli_tool_config,
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

      local luasnip = require("luasnip")
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
          ["<C-n>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.locally_jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<C-p>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "neorg" },
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
}
