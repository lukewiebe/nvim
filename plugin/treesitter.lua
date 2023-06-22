-- Tree-Sitter Configuration --

-- Borrowed formatting from:
-- https://github.com/nvim-treesitter/nvim-treesitter

require('nvim-treesitter.configs').setup {
  ensure_installed = {
    -- Add new languages here
    -- Source of language names: https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
    "java",
    "python",
    "javascript",
    "css",
    "html",
    "lua",
    "dockerfile",
    "json",
    "nix",
  },

  highlight = {
    enable = true,
    -- optimizations can be applied here if needed
  }

}

-- Set those options
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
