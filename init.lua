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
vim.o.laststatus = 1 -- Remove the statusline if there's only one window
vim.o.autochdir = 1 -- switch active directory to current file

-- TABS --

-- overridden by vim-sleuth or language configs in some cases
vim.o.tabstop = 2
vim.o.softtabstop = -1 -- when negative, value of tabstop is used
vim.o.shiftwidth = 0 -- when zero, value of tabstop is used

--  COLORS --
vim.cmd.colorscheme("spaceduck")
-- tweak some color choices
-- nvim_set_hl() wipes out the color group, so I need to rebuild the parts I want to keep manually
-- TODO: redo this with vimscript commands, they're much better behaved
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { ctermbg = "none", ctermfg = 237 })
vim.api.nvim_set_hl(0, "LineNr", { ctermbg = "none", ctermfg = 237 })
