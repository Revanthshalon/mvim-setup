return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function() 
    local config = require("nvim-treesitter.configs")

    config.setup({
      ensure_installed = {
        "rust",
        "lua",
      },
      sync_install = false,
      highlight = { enable = true },
      autopairs = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
    })

    vim.wo.foldmethod = "expr"
    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

  end
}
