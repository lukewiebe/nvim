-- https://github.com/NvChad/nvim-colorizer.lua

require("colorizer").setup({
	filetypes = {
		"css",
		"javascript",
		"html",
		"liquid",
	},
	user_default_options = {
		tailwind = true,
		rgb_fn = true,
		hsl_fn = true,
	},
})
