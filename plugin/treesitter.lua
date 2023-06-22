-- Tree-Sitter Configuration --

-- Borrowed formatting from:
-- https://github.com/nvim-treesitter/nvim-treesitter

require('nvim-treesitter.configs').setup {
  ensure_installed = {
    -- Add new languages here
    -- Source of language names: <needed>
    "java",
    "python",
    "javascript",
    "css",
    "html",
    "lua",
  },

  highlight = {
    enable = true,
    -- optimizations can be applied here if needed
  }

}
