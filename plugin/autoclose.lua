-- https://github.com/m4xshen/autoclose.nvim

require("autoclose").setup({
	keys = {
		[">"] = { escape = false, close = false, pair = "><" }, -- autoindent html tags
	},

	options = {
		pair_spaces = true,
	}
})
