-- sourced in all javascript filetype plugins
require("web")

vim.keymap.set("n", "<leader>r", "<cmd>w<cr>:!bun '%'<cr>", {})
