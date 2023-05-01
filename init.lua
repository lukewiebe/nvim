-- SETTINGS
vim.o.smarttab = true
vim.o.hlsearch = false
vim.o.number = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.mouse = '' -- disable mouse, hahaha
vim.o.undofile = true
vim.o.splitright = true -- new vertical splits show up on the right side
vim.o.splitbelow = true -- new horizonal splits appear on the bottom
vim.o.scrolloff = 5 -- show context, matches defaults.vim
vim.cmd([[tnoremap <Esc> <C-\><C-n>]]) -- let esc exit insert mode in terminal buffer
vim.o.foldmethod = "syntax"
vim.o.foldlevel = 99 -- don't fold by default
vim.o.laststatus = 1 -- Remove the statusline, just show the command line

-- Tabs
-- overridden by vim-sleuth in some cases
vim.o.tabstop = 4
vim.o.softtabstop = -1 -- when negative, value of tabstop is used
vim.o.shiftwidth = 0 -- when zero, value of tabstop is used

-- Fix default colours for comments
vim.cmd([[highlight Comment ctermfg=darkgrey]])

-- [[ NEOVIDE ]]

if vim.g.neovide then
  vim.o.guifont = "JetBrains Mono:h13"
  vim.g.neovide_transparency = 0.0
  vim.g.neovide_background_color = 'FFFFFF'
  vim.cmd.colorscheme('delek') -- light mode
end

-- [[ PLUGINS ]]

require('packer').startup(function(use)
  -- let packer manage itself
  use 'wbthomason/packer.nvim'

  -- editor modifications
  use 'cohama/lexima.vim'
  use 'https://tpope.io/vim/abolish.git'
  use 'https://tpope.io/vim/sleuth.git'
  use 'https://tpope.io/vim/surround.git'
  use 'https://tpope.io/vim/repeat.git'
  use 'https://tpope.io/vim/commentary.git'
  use 'https://tpope.io/vim/fugitive.git'

  -- IDE features
  use 'https://github.com/neovim/nvim-lspconfig'
  use 'https://github.com/mfussenegger/nvim-jdtls'
end)
