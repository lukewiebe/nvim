-- https://github.com/nvim-treesitter/nvim-treesitter/tree/main

local ts = require("nvim-treesitter")

-- Set those options
vim.o.foldmethod = "expr" -- overrides 'syntax' in init.lua
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    if not vim.tbl_contains(ts.get_installed(), vim.bo[0].filetype) then return end
    vim.treesitter.start()
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
