-- https://nvim-mini.org/mini.nvim/readmes/mini-pick

local pick = require("mini.pick")
pick.setup()

vim.keymap.set("n", "<space>sf", pick.builtin.files)
vim.keymap.set("n", "<space>sg", pick.builtin.grep_live)
vim.keymap.set("n", "<space>sb", pick.builtin.buffers)
vim.keymap.set("n", "<space>sh", pick.builtin.help)
vim.keymap.set("n", "<space>sp", pick.builtin.resume)
