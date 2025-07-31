-- https://github.com/nvim-treesitter/nvim-treesitter/tree/main

local ts = require("nvim-treesitter")

-- Set those options
vim.o.foldmethod = "expr" -- overrides 'syntax' in init.lua
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function()
    vim.treesitter.start()
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

-- left out matchup treesitter match words

--
--   -- from https://github.com/nvim-treesitter/nvim-treesitter-refactor
--   refactor = {
--     smart_rename = {
--       enable = true,
--       keymaps = {
--         smart_rename = "<leader>s", -- overridden by autocmd on LSP attach
--       },
--     },
--     navigation = {
--       enable = true,
--       keymaps = {
--         goto_definition_lsp_fallback = "gd",
--         list_definitions_toc = "gO",
--       },
--     },
--   },
-- })
