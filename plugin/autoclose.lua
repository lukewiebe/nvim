-- https://github.com/m4xshen/autoclose.nvim

require("autoclose").setup({
	keys = {
		[">"] = { escape = false, close = false, pair = "><" }, -- autoindent html tags
		["|"] = { escape = true, close = true, pair = "||", enabled_filetypes = { "zig" } },
		["`"] = { escape = false, close = true, pair = "``" },
		["$"] = { escape = true, close = true, pair = "$$", enabled_filetypes = { "typst" } },
	},

	options = {
		disable_when_touch = true,
		pair_spaces = true,
	},
})
