-- java.lua

-- Commands to run code
vim.keymap.set('n', '<Leader>r', "<cmd>w<CR>:!java %<CR>", { buffer = true })
vim.keymap.set('n', '<Leader>t', "<cmd>w<CR>:terminal java %<CR>i", { buffer = true })

-- configure nvim-jdtls
local config = {
    cmd = {'/opt/homebrew/bin/jdtls'},
    root_dir = vim.fs.dirname(vim.fn.getcwd()),
}
require('jdtls').start_or_attach(config)
