vim.keymap.set("n", "<leader>r", "<cmd>w<CR>:!clang -Wall % -o %:r && %:r<CR>", { buffer = true })
