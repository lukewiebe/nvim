-- https://github.com/dcampos/nvim-snippy

require("snippy").setup({
	mappings = {
		is = {
			["<c-k>"] = "expand_or_advance",
			["<c-j>"] = "previous",
		},
	},
})
