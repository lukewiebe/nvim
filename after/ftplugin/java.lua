-- java.lua

-- Commands to run code
vim.keymap.set('n', '<Leader>r', "<cmd>w<CR>:!java %<CR>", { buffer = true })
vim.keymap.set('n', '<Leader>t', "<cmd>w<CR>:terminal java %<CR>", { buffer = true })
