vim.keymap.set("n", "<leader>r", ":w<cr>:!zig run %<cr>", { silent = true })

vim.lsp.start({
	name = "zls",
	cmd = { "zls" },
	root_dir = vim.env.PWD,
})
