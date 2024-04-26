-- https://github.com/chrishrb/gx.nvim

require("gx").setup({
	handlers = {
		search = false,
	},
})

vim.keymap.set({ "n", "v" }, "gx", "<cmd>Browse<cr>", { silent = true })
