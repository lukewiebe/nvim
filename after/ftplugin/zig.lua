require("lspconfig").zls.setup({})

vim.keymap.set("n", "<leader>r", ":w<cr>:!zig run %<cr>", { silent = true })
