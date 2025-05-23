-- https://github.com/m4xshen/autoclose.nvim

require("autoclose").setup({
	keys = {
		[">"] = { escape = false, close = false, pair = "><" }, -- autoindent html tags
		["|"] = { escape = true, close = true, pair = "||", enabled_filetypes = { "zig" } },
	},

	options = {
		pair_spaces = true,
	},
})
