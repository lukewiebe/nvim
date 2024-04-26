-- https://github.com/NvChad/nvim-colorizer.lua

local loaded, colorizer = pcall(require, "colorizer")
if not loaded then return end

colorizer.setup({
	user_default_options = {
		tailwind = true,
		rgb_fn = true,
		hsl_fn = true,
		names = false,
	},
})
