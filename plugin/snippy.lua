-- https://github.com/dcampos/nvim-snippy

require("snippy").setup({
	mappings = {
		is = {
			["<c-k>"] = "expand_or_advance",
			["<c-j>"] = "previous",
		},
	},
})

-- open the snippet directory in a split
vim.api.nvim_create_user_command("SnipEdit", "split | edit ~/.config/nvim/snippets", {})
