-- modified recommended settings from https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls

vim.lsp.start({
	name = "lua_ls",
	cmd = { "lua-language-server" },
	root_dir = vim.env.PWD,
	single_file_support = true,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			runtime = {
				version = "LuaJIT",
			},
			workspace = {
				checkThirdParty = false,
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})
