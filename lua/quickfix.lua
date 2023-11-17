-- some useful bindings for the quickfix list

-- bindings to move to next and previous quickfix entries
-- stolen from https://github.com/tpope/vim-unimpaired
vim.keymap.set("n", "]q", "<cmd>cnext<CR>", { silent = true })
vim.keymap.set("n", "[q", "<cmd>cprevious<CR>", { silent = true })
