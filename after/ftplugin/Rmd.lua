require("prose")()
vim.keymap.set("n", "<leader>r", "<cmd>w<CR>:!~/sd/r/render2pdf %<CR>", { buffer = true })
vim.keymap.set("n", "<leader>t", "<cmd>w<CR>:!~/sd/r/render2html %<CR>", { buffer = true })
