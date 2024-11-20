-- https://github.com/neovim/nvim-lspconfig

-- mason requires setup before lspconfig fires

-- https://github.com/williamboman/mason.nvim
require("mason").setup()

-- https://github.com/williamboman/mason-lspconfig.nvim
require("mason-lspconfig").setup()

require("lspconfig").ts_ls.setup()
require("lspconfig").tailwindcss.setup()
require("lspconfig").mdx_analyzer.setup()
require("lspconfig").zls.setup()
require("lspconfig").pyright.setup()

require("lspconfig").lua_ls.setup({
	autostart = true,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})
