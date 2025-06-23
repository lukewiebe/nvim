-- modified from https://github.com/neovim/nvim-lspconfig/blob/master/lsp/ts_ls.lua

-- NOTE: currently no vue support
return {
	name = "ts_ls",
	cmd = { "typescript-language-server", "--stdio" },
	root_dir = vim.env.PWD,
	single_file_support = true,
	init_options = { hostInfo = "neovim" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.jsx",
	},
}
