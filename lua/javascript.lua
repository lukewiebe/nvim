-- sourced in all javascript filetype plugins
require("web")

-- config modified from https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/ts_ls.lua
-- NOTE: there is currently no vue support
vim.lsp.start({
	name = "ts_ls",
	cmd = { "typescript-language-server", "--stdio" },
	root_dir = vim.env.PWD,
	single_file_support = true,
	init_options = { hostInfo = "neovim" },
})

vim.keymap.set("n", "<leader>r", "<cmd>w<cr>:!bun '%'<cr>", {})
