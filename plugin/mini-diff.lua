-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-diff.md

require("mini.diff").setup()

vim.keymap.set("n", "<leader>do", MiniDiff.toggle_overlay, {})
