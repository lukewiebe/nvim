-- Tree-Sitter Configuration --

-- Set those options
vim.o.foldmethod = "expr" -- overrides 'syntax' in init.lua
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

-- Borrowed formatting from:
-- https://github.com/nvim-treesitter/nvim-treesitter

require('nvim-treesitter.configs').setup {
  ensure_installed = {
    -- Add new languages here
    -- Source of language names: https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
    "markdown",
    "comment",
    "java",
    "python",
    "javascript",
    "css",
    "html",
    "lua",
    "dockerfile",
    "json",
    "nix",
    "bash",
    "git_rebase",
    "gitcommit",
    "gitignore",
    "jq",
    "regex",
    "sql",
    "vim",
  },

  auto_install = true,

  highlight = {
    enable = true,
    -- optimizations can be applied here if needed
  },

  indent = {
    enable = true,
  },

  -- Copied from https://github.com/andymass/vim-matchup#tree-sitter-integration
  matchup = {
    enable = true,
    disable = {},
  }

}
