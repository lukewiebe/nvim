-- sourced in all javascript filetype plugins

vim.lsp.start({
	name = "ts_ls",
	cmd = "typescript-language-server",
	root_dir = vim.env.PWD,
	single_file_support = true,
})
