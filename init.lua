-- SETTINGS

vim.o.smarttab = true
vim.o.hlsearch = true
vim.o.number = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.mouse = "" -- disable mouse, hahaha
vim.o.mousescroll = "ver:1,hor:1" -- scrolling moves one line for smooth trackpad scrolling
vim.o.undofile = true
vim.o.splitright = true -- new vertical splits show up on the right side
vim.o.splitbelow = true -- new horizonal splits appear on the bottom
vim.o.scrolloff = 5 -- keep the cursor off the top or bottom of the window
vim.cmd.tnoremap("<Esc>", "<C-\\><C-n>") -- let esc exit insert mode in terminal buffer
vim.o.foldmethod = "syntax" -- overridden by treesitter when applicable
vim.o.foldlevel = 99 -- don't fold by default
vim.o.laststatus = 1 -- Remove the statusline if there's only one window
vim.o.completeopt = "longest,menu"
-- vim.opt.formatoptions:remove("o")
-- this option is overridden by many filetype plugins
-- there is no easy way to override them cleanly

-- unmap space to use as an alternate leader
vim.keymap.set("n", " ", "<Nop>", { silent = true })

-- TABS --
-- overridden by vim-sleuth or language configs in some cases
vim.o.tabstop = 2
vim.o.softtabstop = -1 -- when negative, value of tabstop is used
vim.o.shiftwidth = 0 -- when zero, value of tabstop is used

-- My own lua modules
require("diagnostics")
require("quickfix")
require("lsp")
require("finder")
require("cd")

-- trial
vim.o.autowrite = true
vim.o.cursorline = true
