return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  build = ":TSUpdate",
  config = function () 
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "bash", "cpp", "dockerfile", "go", "java", "json", "json5", "python", "vue", "yaml", "tsx", "typescript", "scss", "css", "markdown", "terraform", "rust", "clojure" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },  
      context_commentstring = {
        enable = true,
	enable_autocmd = false,
      }
   })
  end
}
