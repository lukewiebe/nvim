-- config modified from https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/tailwindcss.lua
vim.lsp.start({
	name = "tailwindcss",
	cmd = { "tailwindcss-language-server", "--stdio" },
	root_dir = vim.env.PWD,
	single_file_support = false, -- tailwind is a bad citizen, no single file support
	settings = {
		tailwindCSS = {
			validate = true,
			lint = {
				cssConflict = "warning",
				invalidApply = "error",
				invalidScreen = "error",
				invalidVariant = "error",
				invalidConfigPath = "error",
				invalidTailwindDirective = "error",
				recommendedVariantOrder = "warning",
			},
			classAttributes = {
				"class",
				"className",
				"class:list",
				"classList",
				"ngClass",
			},
		},
	},
})
