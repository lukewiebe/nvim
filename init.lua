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
vim.o.foldmethod = "syntax" -- overridden by treesitter
vim.o.foldlevel = 99 -- don't fold by default
vim.o.laststatus = 1 -- Remove the statusline if there's only one window

vim.cmd.set("completeopt-=preview") -- disable additional info in split window
-- fixes two-line empty split appearing when using LSP hover

-- make netrw ignore anything in gitignore
vim.g.netrw_list_hide = '.DS_Store'

-- unmap space to use as a leader
vim.keymap.set('n', ' ', '<Nop>', { silent = true, remap = false })

-- TABS --

-- overridden by vim-sleuth or language configs in some cases
vim.o.tabstop = 2
vim.o.softtabstop = -1 -- when negative, value of tabstop is used
vim.o.shiftwidth = 0 -- when zero, value of tabstop is used
