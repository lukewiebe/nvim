-- java.lua

-- Commands to run code
vim.keymap.set('n', '<Leader>r', "<cmd>w<CR>:!java %<CR>", { buffer = true })
vim.keymap.set('n', '<Leader>t', "<cmd>w<CR>:terminal java %<CR>i", { buffer = true })
vim.o.tabstop = 4

-- configure nvim-jdtls
require('jdtls').start_or_attach({
    cmd = {'/opt/homebrew/bin/jdtls'},
    root_dir = vim.fs.dirname(vim.fn.getcwd()),
})
