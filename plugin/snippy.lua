-- https://github.com/dcampos/nvim-snippy

local loaded, snippy = pcall(require, "snippy")
if not loaded then return end

snippy.setup({
	mappings = {
		is = {
			["<c-k>"] = "expand_or_advance",
			["<c-j>"] = "previous",
		},
	},
})

vim.api.nvim_create_user_command(
	"SnipEdit",
	"split | edit ~/.config/nvim/snippets",
	{ desc = "Open snippet directory in a split" }
)
